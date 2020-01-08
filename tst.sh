#!/bin/bash

######################################################################
# Functions
######################################################################
info() {
	printf "\x1b[1;96m\n$1\x1b[0m"
}

ask() {
	printf "\x1b[1;95m\n$1\x1b[0m"
}

warn() {
	printf "\x1b[1;31m\n$1\x1b[0m"
}

prompt() {

	ask "\n$1 [yN]"
	while true; do
		read -n1 yn
		case $yn in
		[Yy]*)
			eval $2=y
			break
			;;
		[Nn]*)
			eval "$2=n"
			break
			;;
		*) warn "Please answer yes or no..." ;;
		esac
	done

}

brew_install() {
	# pass array in by name
	local arr_ref=$1[@]
	# destructure array into all refs
	arr=("${!arr_ref}")
	if [[ $2 == "0" ]]; then
		for i in "${arr[@]}"; do
			if brew ls --versions "$i" >/dev/null; then
				# brew resource is already installed
				info "Formula "$i" already installed, skipping..."
			else
				# brew resource is not installed yet
				brew install "$i"
			fi
		done
	else
		for i in "${arr[@]}"; do
			if brew cask ls --versions "$i" >/dev/null; then
				# brew resource is already installed
				info "Cask "$i" already installed, skipping..."
			else
				# brew resource is not installed yet
				brew cask install "$i"
			fi
		done
	fi

	if [[ $UPDATE == y ]]; then
		info "Updating casks"
		brew cask upgrade
		info "Updating formulae"
		brew upgrade
	fi
}

######################################################################
# Initialize
######################################################################
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

prompt "Is this your personal computer?" "PERSONAL"
prompt "Would you like to update installed homebrew casks & formulae?" "UPDATE"

######################################################################
# Terminal developer tools
######################################################################
info "Installing xcode developer tools"
if which xcode-select >/dev/null; then
	info "xcode tools already installed, skipping..."
else
	xcode-select --install
fi

######################################################################
# Install homebrew
######################################################################
info "Installing homebrew"
if which brew >/dev/null; then
	if [[ $UPDATE == y ]]; then
		info "Homebrew already installed, updating..."
		brew update
	fi
	info "Homebrew already installed, skipping update..."
else
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

######################################################################
# Install homebrew formulae
######################################################################
info "Installing homebrew basics"
formulae=(cask wget python node lastpass-cli shfmt p7zip mas dockutil)
brew_install formulae "0"

######################################################################
# Install homebrew casks
######################################################################
info "Installing casks"
casks=(spotify tidal vivaldi brave-browser iterm2 docker postman visual-studio-code homebrew/cask-fonts/font-fira-code flux slack gimp caffeine mysides)
brew_install casks "1"

######################################################################
# Request personal rsa keys for ssh access to github
# This will be necessary for the script to pull from secret gists
######################################################################
prompt "Download private keys from LastPass?" LPKEYS
if [[ $LPKEYS == y ]]; then
	# Add folders and files
	mkdir $HOME/.ssh
	touch $HOME/.ssh/personal.pub
	touch $HOME/.ssh/personal
	# Start ssh agent
	eval "$(ssh-agent -s)"
	# Get keys
	lpass login --trust zbauer91@gmail.com # Sign in to LastPass CLI
	info "Retrieving public key"
	lpass show -c --field="Public Key" personal_rsa_key
	pbpaste >$HOME/.ssh/personal.pub
	info "Retrieving private key"
	lpass show -c --field="Private Key" personal_rsa_key
	pbpaste >$HOME/.ssh/personal
	# Set permissions
	chmod 400 $HOME/.ssh/personal.pub $HOME/.ssh/personal
	# Add new key to ssh agent
	ssh-add -K $HOME/.ssh/personal
	# Set config for Sierra+
	echo "Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/personal" >$HOME/.ssh/config
	# Set flag for Lastpass signin
	$LPSIGNIN=1
else
	info "No keys will be entered or changed"
fi

######################################################################
# Mac store apps
# Magnet, Amphetamine, Giphy, Speedtest by Ookla
######################################################################
mac_store_apps=(937984704 441258766 668208984 1153157709)
prompt "Download apps from mac app store (requires signin)?" MACSTORE
if [[ $MACSTORE == y ]]; then
	prompt "Use password from LastPass?" MACLPASS
	if [[ $MACLPASS == y ]]; then
		if [[ $LPSIGNIN == 0 ]]; then
			lpass login --trust zbauer91@gmail.com
		fi
		info "Retrieving password, leaving it in the clipboard for dialog signin"
		lpass show -c --password Apple
	else
		info "Signing in manually..."
	fi
	mas login --dialog zbauer91@gmail.com
	for i in "${mac_store_apps[@]}"; do
		mas install "$i"
	done
else
	info "No Mac store apps will be installed"
fi

######################################################################
# iTerm2 Preferences
######################################################################
info "Configuring iTerm2"
plist=$HOME/Library/Application\ Support/iTerm2/DynamicProfiles/profiles.plist
curl -o "$plist" https://gist.githubusercontent.com/zbauer91/cac091c2fa56855cddc6cad9c221c77f/raw/9ca710199efb7445a0f3986d32d32a2fa5e20a6a/iterm2_profile.plist
info "Make sure you change your default profile in iTerm"

######################################################################
# oh-my-zsh
######################################################################
info "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed '/\s*env\s\s*zsh\s*/d')"

######################################################################
# Backup zshrc
######################################################################
info "Backing up zshrc to ~/.zshrc.bak"
cp $HOME/.zshrc $HOME/.zshrc.bak

######################################################################
# zsh settings
######################################################################
curl -o $HOME/.zshrc https://gist.githubusercontent.com/zbauer91/cac091c2fa56855cddc6cad9c221c77f/raw/9ca710199efb7445a0f3986d32d32a2fa5e20a6a/.zshrc

######################################################################
# Change to zsh
######################################################################
SH=$(echo $SHELL)
if [[ $SH == /bin/zsh ]]; then
	info "zsh is already the default shell"
else
	info "Changing default shell to zsh"
	chsh -s $(grep /zsh$ /etc/shells | tail -1)
fi

######################################################################
# Sets and installs diferent things for work or personal machines
######################################################################
if [[ $PERSONAL == y ]]; then
	info "Using personal email in git"
	git config --global user.email "zbauer91@gmail.com"

	info "Installing personal applications"
	extra_cask_apps=(google-backup-and-sync malwarebytes avast-security telegram veracrypt steam discord)
	brew_install extra_cask_apps "1"
else
	info "Using Upside email in Git"
	git config --global user.email "riley@upside.com"
fi

######################################################################
# Global Node Modules
######################################################################
info "Installing global node modules"
npm i -g @vue/cli @angular/cli create-react-app fkill nodemon typescript lerna

info "Make sure to run setting sync on first load of VS Code to get current settings"
source $HOME/.zshrc

######################################################################
# add programming folder
######################################################################
info "Creating programming directory"
mkdir $HOME/programming

######################################################################
# Add Root and Home folder to finder sidebar
######################################################################
info "Modifying Finder Sidebar"
mysides insert Root file:///
mysides insert Riley file://$HOME

######################################################################
# Adding only the shortcuts I want to the dock
######################################################################
info "Modifying Dock"
dockutil --remove all
dockutil --add '~/Downloads'
dockutil --add '~/programming'
dockutil --add '/Applications/Vivaldi.app'
dockutil --add '/Applications/Brave Browser.app'
dockutil --add '/Applications/iTerm.app'
dockutil --add '/Applications/Slack.app'
dockutil --add '/Applications/Spotify.app'
dockutil --add '/Applications/TIDAL.app'
dockutil --add '/Applications/Postman.app'
dockutil --add '/Applications/Visual Studio Code.app'
dockutil --add '/System/Applications/System Preferences.app'
if [[ $PERSONAL == y ]]; then
	info " Adding personal shortcuts"
	dockutil --add '/Applications/Telegram.app'
	dockutil --add '/Applications/Steam.app'
fi

######################################################################
# Apple configuration
######################################################################
info "Setting a handful of defualts settings"
warn "Shamelessly stolen from https://github.com/mathiasbynens/dotfiles"

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Set highlight color to purple
defaults write NSGlobalDomain AppleHighlightColor -string "0.968627 0.831373 1.000000"

# Set system-wide dark mode
defaults write NSGlobalDomain ApplexInterfaceStyle -string "Dark"

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Show all extensions
defaults write NSGlobalDomain AppleShowAllExtensions -int 1

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 3

# Disable Notification Center and remove the menu bar icon
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2>/dev/null

# Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
# all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
curl -o $HOME/desktop.jpg http://rileyrabbit.com/desktop.jpg
sqlite3 $HOME/Library/Application\ Support/Dock/desktoppicture.db <<EOF
UPDATE data SET value = "$HOME/desktop.jpg";
.quit
EOF

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Disable the Launchpad gesture (pinch with thumb and three fingers)
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 54

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Enable the automatic mac store update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Kill affected applications
for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Google Chrome Canary" \
	"Google Chrome" \
	"Mail" \
	"Messages" \
	"Opera" \
	"Photos" \
	"Safari" \
	"SizeUp" \
	"Spectacle" \
	"SystemUIServer" \
	"Transmission" \
	"Tweetbot" \
	"Twitter" \
	"iCal"; do

	killall "${app}" &>/dev/null
done

prompt "\nCONGRATULATIONS! Your Mac is now set up.\nNote that some of these changes require closing apps\nfollowed by a logout/restart to take effect.\nWould you like to sign out now?" SIGNOUT

if [[ $SIGNOUT == y ]]; then
	launchctl bootout user/$(id -un)
fi

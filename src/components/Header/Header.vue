<template>
  <div class="header">
    <div class="logo">
      <span class="logo-piece">LOGOS</span>
      <span class="logo-piece">GOES</span>
      <span class="logo-piece">HERE</span>
    </div>
    <div class="spacer"></div>
    <div class="fullscreen">
      <header-button
        v-for="(item, index) in buttons"
        :key="index"
        :text="item.text"
        :action="item.action"
        :icon="item.icon"
      ></header-button>
    </div>
    <div class="mobile">
      <button
        class="mobile__dropdown material-icons"
        @click="toggleMenu"
        v-if="menuOpen"
      >
        <i>menu</i>
        <ul class="mobile__link-list">
          <mobile-menu-item
            v-for="(item, index) in buttons"
            :key="index"
            :text="item.text"
            :action="item.action"
            :icon="item.icon"
          ></mobile-menu-item>
        </ul>
      </button>
    </div>
  </div>
</template>

<script>
import HeaderButton from "./HeaderButton.vue";
import MobileMenuItem from "./MobileMenuItem.vue";
import { buttonList } from "@/assets/config.ts";

export default {
  data() {
    return {
      menuOpen: false,
      buttons: buttonList
    };
  },
  components: {
    "mobile-menu-item": MobileMenuItem,
    "header-button": HeaderButton
  },
  methods: {
    toggleMenu() {
      this.menuOpen = !this.menuOpen;
    }
  }
};
</script>

<style lang="css" scoped>
.logo {
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
  align-items: center;
  padding: 10px 20px;
}

.header {
  display: flex;
  flex-flow: row nowrap;
  position: absolute;
  top: 0;
  left: 0;
  right: 0px;
  height: 50px;
  border-radius: 0 0 15px 15px;
}

.fullscreen {
  display: none;
}

.mobile {
  border: 1px solid rebeccapurple;
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-between;
  align-items: center;
}

.spacer {
  border: 1px solid red;
  flex-grow: 10;
}

/* Larger screen sizes */
@media only screen and (min-width: 750px) {
  .header {
    height: 100px;
  }

  .mobile {
    display: none;
  }

  .fullscreen {
    border: 1px solid rebeccapurple;
    width: 40vw;
    display: flex;
    flex-flow: row nowrap;
    justify-content: space-between;
    align-items: center;
  }
}
</style>

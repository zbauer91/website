<template>
  <div class="header">
    <div class="logo">
      <span class="logo-piece">LOGOS</span>
      <span class="logo-piece">GOES</span>
      <span class="logo-piece">HERE</span>
    </div>
    <div class="spacer"></div>
    <div class="fullscreen">
      <HeaderButton
        v-for="(item, index) in buttonList"
        :key="index"
      ></HeaderButton>
    </div>
    <div class="mobile">
      <button
        class="mobile__dropdown material-icons"
        @click="toggleMenu"
        v-if="menuOpen"
      >
        <i>menu</i>
        <ul class="mobile__link-list">
          <MobileMenuitem v-for="(item, index) in buttonList" :key="index">
          </MobileMenuitem>
        </ul>
      </button>
    </div>
  </div>
</template>

<script lang="ts">
import { Vue } from "vue-property-decorator";
import Component from "vue-class-component";
import HeaderButton from "./HeaderButton.vue";
import MobileMenuItem from "./MobileMenuItem.vue";
import { buttonList } from "@/assets/config.ts";

@Component({
  components: {
    HeaderButton,
    MobileMenuItem
  }
})
export default class Header extends Vue {
  menuOpen: boolean = false;
  buttonList = buttonList;
  toggleMenu() {
    this.menuOpen = !this.menuOpen;
  }
}
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
@media only screen and (min-width: 420px) {
  .header {
    height: 100px;
  }
  .mobile {
    display: none;
  }

  .fullscreen {
    border: 1px solid rebeccapurple;
    width: 20vw;
    display: flex;
    flex-flow: row nowrap;
    justify-content: space-between;
    align-items: center;
  }
}
</style>

<template>
  <div class="header">
    <div class="logo">LOGO GOES HERE</div>
    <div class="spacer"></div>
    <div class="fullscreen">
      <HeaderButton
        class="buttons"
        v-for="(item, index) in buttonList"
        :key="index"
      ></HeaderButton>
    </div>
    <div class="mobile">
      <button
        class="mobile__dropdown mterial-icons"
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
import { Prop, Vue } from "vue-property-decorator";
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
  toggleMenu() {}
}
</script>

<style lang="css" scoped>
.header {
  display: flex;
  flex-flow: row nowrap;
  position: absolute;
  top: 0;
  left: 0;
  height: 50px;
  border-radius: 0 0 15px 15px;
}

.fullscreen {
  display: none;
}

.mobile {
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-between;
  align-items: center;
}

.spacer {
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
    display: flex;
    flex-flow: row nowrap;
    justify-content: space-between;
    align-items: center;
  }
}
</style>

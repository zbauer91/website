<template>
  <div class="header">
    <ul class="header-list">
      <header-button
        v-for="(item, index) in buttons"
        :key="index"
        :text="item.text"
        :action="item.action"
        :icon="item.icon"
      ></header-button>
    </ul>
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
.header {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 50px;
  width: 100vw;
  background-color: rgba(100, 100, 100, 0.7);
}

/* Larger screen sizes */
@media only screen and (min-width: 750px) {
  .header-list {
    display: flex;
    flex-flow: row nowrap;
    justify-content: center;
    align-items: center;
  }
}
</style>

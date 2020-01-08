<template>
  <ul>
    <header-button
      v-for="(item, index) in buttons"
      :key="index"
      :text="item.text"
      :action="item.action"
      :icon="item.icon"
    ></header-button>
  </ul>
</template>

<script>
import HeaderButton from "./HeaderButton.vue";

export default {
  data() {
    return {
      menuOpen: false,
      buttons: [
        {
          text: "Email",
          action: "mailto:zbauer91@gmail.com"
        },
        {
          text: "Github",
          action: "https://www.github.com/zbauer91"
        },
        {
          text: "LinkedIn",
          action: "https://www.linkedin.com/in/rileybauerdev"
        }
      ]
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
ul {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 50px;
  width: 100vw;
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  float: left;
  background-color: rgba(50, 50, 50, 0.7);
}
</style>

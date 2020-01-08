<template>
  <ul>
    <header-button
      text="Email"
      action="mailto:zbauer91@gmail.com"
    ></header-button>
    <header-button
      text="Email"
      action="https://www.github.com/zbauer91"
    ></header-button>
    <header-button
      text="LinkedIn"
      action="https://www.linkedin.com/in/rileybauerdev"
    ></header-button>
    <header-button
      v-if="assets"
      text="Assets"
      action="/assets"
      :route="true"
    ></header-button>
  </ul>
</template>

<script>
import HeaderButton from "./HeaderButton.vue";

export default {
  data() {
    return {
      menuOpen: false,
      assets: false
    };
  },
  components: {
    "header-button": HeaderButton
  },
  methods: {
    toggleMenu() {
      this.menuOpen = !this.menuOpen;
    },
    keyListener(e) {
      if (e.key === "s" && e.ctrlKey && e.metaKey) {
        e.preventDefault();
        this.assets = !this.assets;
      }
    }
  },
  mounted() {
    document.addEventListener("keydown", this.keyListener.bind(this));
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

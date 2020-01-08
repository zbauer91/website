<template>
  <div class="home">
    <app-header></app-header>
    <div class="content">
      <h2>Assets:</h2>
      <a :href="bootstrap">Bootstrap Script - Raw</a>
      <a href="/desktop.jpg" download>Desktop Background</a>
      <a href="/login.jpg" download>Login Screen background</a>
    </div>
    <app-footer></app-footer>
  </div>
</template>

<script>
import Header from "../components/Header/Header.vue";
import Footer from "../components/Footer/Footer.vue";

export default {
  data() {
    return {
      bootstrap:
        "https://gist.githubusercontent.com/zbauer91/cac091c2fa56855cddc6cad9c221c77f/raw/3666942023b38df0e8fbf3f396892fe07c078c65/bootstrap.sh"
    };
  },
  components: {
    "app-header": Header,
    "app-footer": Footer
  }
};
</script>

<style scoped>
.content {
  font-family: "Kalam", cursive;
  font-size: 2vw;
  color: white;
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
  align-items: center;
}

a,
a:visited {
  text-decoration: underline;
  color: white;
}
</style>

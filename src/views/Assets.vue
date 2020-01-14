<template>
  <div class="home">
    <app-header></app-header>
    <div class="content">
      <h2>Assets:</h2>
      <ul>
        <li>
          <div v-clipboard:copy="curlURL" class="button" @click="copyText">
            Bootstrap Script - Install
          </div>
        </li>
        <li>
          <a href="/desktop.jpg" download>Desktop Background</a>
        </li>
        <li>
          <a href="/login.jpg" download>Login Screen background</a>
        </li>
      </ul>
    </div>
    <div class="popup" v-if="popup">Copied!</div>
    <app-footer></app-footer>
  </div>
</template>

<script>
import Header from "../components/Header/Header.vue";
import Footer from "../components/Footer/Footer.vue";

export default {
  data() {
    return {
      popup: false
    };
  },
  components: {
    "app-header": Header,
    "app-footer": Footer
  },
  computed: {
    curlURL() {
      return `cd ~/Desktop ; git clone https://github.com/zbauer91/dotfiles.git ; cd ./dotfiles ; sh bootstrap.sh`;
    }
  },
  methods: {
    copyText() {
      this.popup = true;
      window.setTimeout(() => (this.popup = false), 5000);
    }
  }
};
</script>

<style scoped>
.content {
  font-family: "Amatic SC", cursive;
  font-size: 3vw;
  color: white;
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
  align-items: center;
}

.popup {
  position: absolute;
  bottom: 0;
  right: 0px;
  left: 0px;
  background-color: aquamarine;
  text-align: center;
  border: 1px solid grey;
  border-radius: 4px;
}

h2 {
  font-size: 4vw;
}

ul {
  list-style: none;
}

.button {
  text-decoration: underline;
  cursor: pointer;
}

a,
a:visited {
  text-decoration: underline;
  color: white;
}
</style>

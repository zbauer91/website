<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
import { Component, Vue } from "vue-property-decorator";
import Header from "./components/Header/Header.vue";

export default {
  data() {
    return {};
  },
  mounted() {
    console.log("mounted app");
  }
};
</script>

<style>
body {
  background-image: url("./assets/black.jpg");
  background-repeat: repeat;
}
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>

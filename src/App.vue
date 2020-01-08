<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<style>
@font-face {
  font-family: "Amatic SC";
  src: url("./assets/AmaticSC-Regular.ttf") format("truetype");
}

@font-face {
  font-family: "Kalam";
  src: url("./assets/Kalam-Regular.ttf") format("truetype");
}

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

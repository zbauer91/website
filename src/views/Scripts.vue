<template>
  <div class="about">
    <h1>You found my tools page! Good job!</h1>
    <app-header></app-header>
    <a v-bind:href="bootstrapScriptURL">Bootstrap script</a>
  </div>
</template>

<script>
import Header from "../components/Header/Header.vue";

export default {
  data() {
    return {
      bootstrapScriptURL:
        "https://gist.githubusercontent.com/zbauer91/cac091c2fa56855cddc6cad9c221c77f/raw/3c456f44382f7294208d31e29764f8829dd2eba1/bootstrap.sh"
    };
  },
  components: {
    "app-header": Header
  }
};
</script>

<style lang="css"></style>

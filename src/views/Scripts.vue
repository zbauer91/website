<template>
  <div class="about">
    <h1>You found my tools page! Good job!</h1>
    <Header></Header>
    <a v-bind:href="bootstrapScriptURL">Bootstrap script</a>
  </div>
</template>

<script lang="ts">
import Header from "../components/Header/Header.vue";
import Component from "vue-class-component";
import { Vue } from "vue-property-decorator";

@Component({ components: { Header } })
export default class Scripts extends Vue {
  bootstrapScriptURL =
    "https://gist.githubusercontent.com/zbauer91/cac091c2fa56855cddc6cad9c221c77f/raw/3c456f44382f7294208d31e29764f8829dd2eba1/bootstrap.sh";
}
</script>

<style lang="css"></style>

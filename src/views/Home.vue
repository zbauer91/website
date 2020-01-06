<template>
  <div class="home">
    <Header></Header>
    <img alt="Vue logo" src="../assets/logo.png" />
    <router-link to="/scripts"
      ><i class="material-icons">memory</i></router-link
    >
  </div>
</template>

<script lang="ts">
import Header from "../components/Header/Header.vue";
import { Component, Vue } from "vue-property-decorator";

@Component({ components: { Header } })
export default class Home extends Vue {}
</script>

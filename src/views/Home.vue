<template>
  <div class="home">
    <Header></Header>
    <Footer></Footer>
  </div>
</template>

<script lang="ts">
import Header from "../components/Header/Header.vue";
import Footer from "../components/Footer/Footer.vue";
import { Component, Vue } from "vue-property-decorator";

@Component({ components: { Header, Footer } })
export default class Home extends Vue {}
</script>

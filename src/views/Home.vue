<template>
  <div class="home">
    <app-header></app-header>
    <app-footer></app-footer>
  </div>
</template>

<script>
import Header from "../components/Header/Header.vue";
import Footer from "../components/Footer/Footer.vue";

export default {
  components: {
    "app-header": Header,
    "app-footer": Footer
  }
};
</script>

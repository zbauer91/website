<template>
  <div class="home">
    <app-header></app-header>
    <div class="content">Hello World</div>
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

<style scoped>
.home {
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
  align-items: center;
  bottom: 50px;
  border: 1px solid red;
}

app-header {
  border: 1px solid blue;
}

app-footer {
  border: 1px solid orange;
}

.content {
  border: 1px solid white;
  margin-top: 50px;
  color: white;
}
/* Larger screen sizes */
@media only screen and (min-width: 750px) {
  .content {
    margin-top: 100px;
  }
}
</style>

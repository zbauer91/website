<template>
  <div class="home">
    <app-header></app-header>
    <div class="content">
      <span class="firstname">Riley Bauer</span>
      <span class="about">
        I'm a <span class="exciting">software developer</span>. I code for fun
        and totally know about design and stuff
      </span>
    </div>
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
.content {
  color: white;
  display: flex;
  flex-flow: column nowrap;
  font-size: 10vw;
  font-family: "Amatic SC", cursive;
  justify-content: center;
  align-items: center;
}

.firstname {
  margin-right: 5vw;
  margin-bottom: 3vh;
  transform: rotate(-10deg);
}

.about {
  font-family: "Kalam", cursive;
  font-size: 2vw;
  transform: rotate(0deg);
}

.exciting {
  animation: colorchange 5s infinite;
}

@keyframes colorchange {
  0% {
    color: red;
  }
  25% {
    color: yellow;
  }
  50% {
    color: blue;
  }
  75% {
    color: green;
  }
  100% {
    color: red;
  }
}
</style>

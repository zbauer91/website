<template>
  <li class="mobile-menu-item">
    <a class="button material-icons" :class="icon" :href="action">{{ text }}</a>
  </li>
</template>

<script>
export default {
  props: {
    action: String,
    text: String,
    icon: String
  }
};
</script>

<style lang="css" scoped>
.mobile-menu-item {
  height: 8vh;
  width: 100%;
  background-color: grey;
  color: white;
  display: flex;
  justify-content: flex-start;
  align-items: center;
}

.button {
  color: whitesmoke;
}
</style>

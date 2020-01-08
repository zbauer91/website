<template>
  <li>
    <router-link v-if="route" :to="action">{{ text }}</router-link>
    <a v-else :href="action">{{ text }}</a>
  </li>
</template>

<script>
export default {
  props: {
    action: String,
    text: String,
    route: Boolean
  }
};
</script>

<style lang="css" scoped>
li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* Change the link color to #111 (black) on hover */
li a:hover {
  background-color: rgba(20, 20, 20, 0.8);
}
</style>

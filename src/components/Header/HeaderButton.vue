<template>
  <li>
    <a :href="action">
      <i class="material-icons font">{{ icon }}</i>
      {{ text }}
    </a>
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
  background-color: #111;
}
</style>

<template>
  <li class="button">
    <a class=" font" :href="action">
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
.button {
  display: flex;
  flex-flow: row nowrap;
  justify-content: center;
  align-items: center;
  border-radius: 2px;
  border: 1px solid grey;
  height: 40px;
  width: 120px;
  color: whitesmoke;
  text-decoration: none;
  margin: 0 5px;
}
.font {
  font-size: 1rem;
}
</style>

<template>
  <a class="button font" :href="action">
    <i class="material-icons font">{{ icon }}</i>
    {{ text }}
  </a>
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
  border-radius: 5px;
  border: none;
  height: 40px;
  width: 120px;
  color: whitesmoke;
  background-color: darkgray;
  text-decoration: none;
  margin-left: 5px;
}
.font {
  font-size: 1rem;
}
</style>

<template>
  <div class="footer">
    <h5>Copyright {{ date }}, Riley Bauer</h5>
  </div>
</template>

<script>
export default {
  data() {
    return {
      date: new Date().getFullYear()
    };
  }
};
</script>

<style lang="css" scoped>
.footer {
  position: absolute;
  bottom: 0;
  right: 0;
  width: 100vw;
  float: right;
}

ul {
  float: right;
  margin-right: 10px;
}
</style>

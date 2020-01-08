<template>
  <div class="footer">
    <ul>
      <li>
        <a :href="bootstrap">
          <i class="material-icons">memory</i>
        </a>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      bootstrap:
        "https://gist.githubusercontent.com/zbauer91/cac091c2fa56855cddc6cad9c221c77f/raw/3666942023b38df0e8fbf3f396892fe07c078c65/bootstrap.sh"
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

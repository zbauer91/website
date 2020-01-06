<template>
  <a class="button material-icons" :class="icon" :href="action">
    {{ text }}
  </a>
</template>

<script lang="ts">
import { Prop, Vue } from "vue-property-decorator";
import Component from "vue-class-component";

@Component({
  props: {
    action: String,
    text: String,
    icon: String
  }
})
export default class HeaderButton extends Vue {}
</script>

<style lang="css" scoped>
.button {
  border-radius: 5px;
  border: none;
  height: 40px;
  width: 150px;
  color: whitesmoke;
  background-color: darkgray;
  margin-left: 5px;
}
</style>

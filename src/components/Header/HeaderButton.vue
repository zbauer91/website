<template>
  <a class="button material-icons" :class="icon" :href="action">
    {{ text }}
  </a>
</template>

<script lang="ts">
import { Prop, Vue } from "vue-property-decorator";
import Component from "vue-class-component";

@Component({})
export default class HeaderButton extends Vue {
  @Prop() action: string = "";
  @Prop() text: string = "";
  @Prop() icon: string = "";
}
</script>

<style lang="css" scoped>
.button {
  border-radius: 5px;
  border-color: brown;
  height: 15px;
  width: 30px;
  color: whitesmoke;
  background-color: grey;
  margin-left: 5px;
}
</style>

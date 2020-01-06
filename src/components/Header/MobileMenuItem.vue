<template>
  <li class="mobile-menu-item">
    <a class="button material-icons" :class="icon" :href="action">
      {{ text }}
    </a>
  </li>
</template>

<script lang="ts">
import { Prop, Vue } from "vue-property-decorator";
import Component from "vue-class-component";

@Component({})
export default class MobileMenuItem extends Vue {
  @Prop() action: string = "";
  @Prop() text: string = "";
  @Prop() icon: string = "";
}
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

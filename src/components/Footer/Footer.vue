<template>
  <div class="footer">
    <router-link to="/scripts">
      <i class="material-icons">memory</i>
    </router-link>
  </div>
</template>

<script lang="ts">
import { Prop, Vue } from "vue-property-decorator";
import Component from "vue-class-component";
import HeaderButton from "./HeaderButton.vue";
import MobileMenuItem from "./MobileMenuItem.vue";
import { buttonList } from "@/assets/config.ts";

@Component({})
export default class Footer extends Vue {}
</script>

<style lang="css" scoped>
.footer {
  display: flex;
  flex-flow: row nowrap;
  justify-content: flex-end;
  align-items: flex-end;
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0px;
  height: 50px;
  border-radius: 15px 15px 0 0;
}
</style>

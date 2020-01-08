import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "home",
    component: Home
  },
  {
    path: "/assets",
    name: "assets",
    component: () => import("../views/Assets.vue")
  }
];

const router = new VueRouter({ routes });

export default router;

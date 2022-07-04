import { createRouter, createWebHistory } from "vue-router";
import Layout from "@/layouts/Layout.vue";
const routes = [
  {
    path: "/",
    component: Layout,

    children: [
      { path: "/main", component: () => import("@/views/Main.vue") },
      { path: "/stopWatch", component: () => import("@/views/StopWatch.vue") },
    ],
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.beforeEach((to, from, next) => {
  // to and from are both route objects. must call `next`.
  next();
});

export default router;

// router.beforeEach

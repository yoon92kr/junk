import { createRouter, createWebHistory } from "vue-router";

const routes = [
  { path: "/main", component: () => import("@/views/HelloWorld.vue") },
  { path: "/login", component: () => import("@/views/Login.vue") },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;

// var router = new VueRouter({
//   routes: [
//     { path: "/main", component: () => import("@/views/HelloWorld.vue") },
//     { path: "/login", component: () => import("@/views/Login.vue") },
//   ],
// });
// router.router.beforeEach((to, from, next) => {
//   // to and from are both route objects. must call `next`.
// });

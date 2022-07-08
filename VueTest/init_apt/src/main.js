import { createApp } from "vue";
import App from "@/App.vue";
import router from "@/router/index.js";
import CoreuiVue from "@coreui/vue";
import PrimeVue from "primevue/config";
import { TroisJSVuePlugin } from "troisjs";

/* CSS */
import "primevue/resources/themes/lara-light-indigo/theme.css";
import "primevue/resources/primevue.min.css";
import "@coreui/coreui/dist/css/coreui.min.css";
import "bootstrap/dist/css/bootstrap.min.css";
 
const app = createApp(App);
app.use(router);
app.use(PrimeVue);
app.use(CoreuiVue);
app.use(TroisJSVuePlugin);
app.mount("#app");

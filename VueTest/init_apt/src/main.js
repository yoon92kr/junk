import { createApp } from "vue";
import App from "@/App.vue";
import router from "@/router/index.js";
import CoreuiVue from "@coreui/vue";
import PrimeVue from "primevue/config";

import "primevue/resources/themes/lara-light-indigo/theme.css";
import "primevue/resources/primevue.min.css";

const app = createApp(App);
app.use(router);
app.use(PrimeVue);
app.use(CoreuiVue);

app.mount("#app");

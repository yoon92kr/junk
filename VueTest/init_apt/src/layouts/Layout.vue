<template>
  <div id="Layout.vue">
    <HeaderNV />
    <CContainer>
      <router-view />
    </CContainer>
  </div>
</template>

<script>
import HeaderNV from "@/components/HeaderNV.vue";
import { CContainer } from "@coreui/vue";

export default {
  name: "Layout",
  components: {
    HeaderNV,
    CContainer,
  },
};
</script>

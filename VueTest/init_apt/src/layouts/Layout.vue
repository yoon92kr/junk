<template>
  <HeaderNV />
  <div>
    <CContainer fluid>
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

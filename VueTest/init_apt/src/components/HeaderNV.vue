<template>
  <div>
    <router-link to="/containerTest"><span class="header_nv">containerTest</span></router-link>
    <router-link to="/main"><span class="header_nv">main</span></router-link>
    <router-link to="/init"><span class="header_nv">init</span></router-link>
    <router-link to="/initBluePrint"><span class="header_nv">blue print</span></router-link>
  </div>
</template>
<script>
export default {
  name: "HeaderNV",
};
</script>
<style>
.header_nv {
  margin: 0px 30px 0px 30px;
}
</style>

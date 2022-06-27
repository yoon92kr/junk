<template>
  <div>
    <router-link to="/main"><span class="header_nv">main</span></router-link>
    <router-link to="/stopWatch"><span class="header_nv">StopWatch</span></router-link>
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

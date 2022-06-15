<template>
  <div id="app">
    {{ message }}
  </div>
</template>

<script>
new Vue({
  el: "#app",
  data: {
    message: "Hello Vue.js!",
  },
  beforeCreate: function () {
    console.log("beforeCreate");
  },
  created: function () {
    console.log("created");
  },
  mounted: function () {
    console.log("mounted");
    //this.message = "Do Update";
  },
  beforeUpdate: function () {
    console.log("beforeupdate");
  },
  updated: function () {
    console.log("updated");
  },
});
</script>

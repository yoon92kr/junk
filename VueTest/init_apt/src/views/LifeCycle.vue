<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8" />
    <title>Vue Sample</title>
  </head>
  <body>
    <div id="app">
      {{ message }}
    </div>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.2/dist/vue.js"></script>
    <script type="text/javascript">
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
  </body>
</html>

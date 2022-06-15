<template>
  <h1>This is Main page</h1>
</template>

<script>
export default {
  name: "HelloWorld",
  methods: {
    test() {
      console.log("script start"); // A

      setTimeout(function () {
        // B
        console.log("setTimeout");
      }, 0);

      Promise.resolve()
        .then(function () {
          // C
          console.log("promise1");
        })
        .then(function () {
          // D
          console.log("promise2");
        });

      console.log("script end"); // E
    },
  },
};
</script>

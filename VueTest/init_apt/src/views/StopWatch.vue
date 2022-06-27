<template>
  <div>
    <h1 id="StopWatch">{{ time }}</h1>
    <input type="button" id="startButton" value="Start" @click="Start" />
    <input type="button" id="startButton" value="Reset" @click="Reset" />
  </div>
</template>

<script>
export default {
  data() {
    return {
      time: 0.0,
    };
  },
  methods: {
    Start() {
      console.log("hi");
    },
    Reset() {
      console.log("reset");
    },
  },
};
</script>
<style scoped>
#startButton {
  width: 100px;
  margin: 30px;
}
#StopWatch {
  margin-left: 50px;
}
</style>

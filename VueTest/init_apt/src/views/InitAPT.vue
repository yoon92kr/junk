<template>
  <canvas width="150" height="200" class="canvas"></canvas>
</template>

<script>
export default {
  props: {
    param: {
      type: String,
    },
  },
  data() {
    return {
      dong: 0,
      floor: 0,
      basement: 0,
      ho: 0,
      stair: 0,
    };
  },
  watch: {
    param: function () {
      console.log("param :", this.param);
      var params = this.param.split(",");
      this.dong = parseInt(params[0]);
      this.floor = parseInt(params[1]);
      this.basement = parseInt(params[2]);
      this.ho = parseInt(params[3]);
      this.stair = parseInt(params[4]);

      console.log("dong :", this.dong);
      console.log("floor :", this.floor);
      console.log("basement :", this.basement);
      console.log("ho :", this.ho);
      console.log("stair :", this.stair);
      this.drops();
    },
  },
  methods: {
    draw() {
      this.ctx.beginPath();
      this.ctx.clearRect(0, 0, 200, 200);
      this.ctx.fillRect(100, 100, 4, 4);
      this.ctx.fillRect(105, 100, 4, 4);
      this.ctx.fillRect(110, 110, 4, 4);
      this.ctx.fillRect(115, 115, 4, 4);
      this.ctx.fill();

      console.log("canvas height :", this.ctx.canvas.height);
      console.log("canvas width :", this.ctx.canvas.width);
    },
    drops() {
      this.ctx.clearRect(100, 100, 1, 1);
    },
  },
  mounted() {
    this.ctx = this.$el.getContext("2d");
    this.draw();
  },
};
</script>

<style>
.canvas {
  border: 1px solid #000;
}
</style>

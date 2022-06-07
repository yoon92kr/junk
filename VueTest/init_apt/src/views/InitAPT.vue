<template>
  <canvas width="200" height="200" class="canvas"></canvas>
</template>

<script>
export default {
  props: {
    dong: {
      type: Number,
      default: 50,
    },
    floor: {
      type: Number,
      default: 20,
    },
    basement: {
      type: Number,
      default: 2,
    },
    ho: {
      type: Number,
      default: 8,
    },
    stair: {
      type: Number,
      default: 2,
    },
  },
  watch: {
    dong: function () {
      this.draw();
    },
    floor: function () {
      this.draw();
    },
    basement: function () {
      this.draw();
    },
    ho: function () {
      this.draw();
    },
    stair: function () {
      this.draw();
    },
  },
  methods: {
    draw() {
      this.ctx.canvas.width = (this.ho + this.stair) * 10;
      this.ctx.canvas.height = (this.floor + this.basement) * 20;
      this.ctx.beginPath();
      //this.ctx.strokeStyle = "black";
      this.ctx.clearRect(0, 0, 200, 200);
      this.ctx.fillRect(100, 100, 30, 30);

      //this.ctx.arc(100, 100, radius, 0, Math.PI * 2);
      this.ctx.fill();
      console.log(this.ctx);
    },
  },
  mounted() {
    // mounted 이후부터 canvas의 DOM에 접근할 수 있습니다.
    // CreateJS 등을 사용할 때에도 여기에서 canvas를 매개 변수로 전달해야 합니다.

    this.ctx = this.$el.getContext("2d");
    this.draw();
  },
};
</script>

<style scoped>
.canvas {
  border: 1px solid #000;
}
</style>

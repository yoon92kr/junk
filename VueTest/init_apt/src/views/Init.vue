<template>
  <CContainer>
    <CRow>
      <CCol>
        <span class="p-float-label init_input_box">
          <InputText id="dong" type="text" v-model.number="input_dong" />
          <label for="dong">동 이름</label>
        </span>
      </CCol>
      <CCol>
        <span class="p-float-label init_input_box">
          <InputText id="floor" type="text" v-model.number="input_floor" />
          <label for="floor">지상층 수</label>
        </span>
      </CCol>
      <CCol>
        <span class="p-float-label init_input_box">
          <InputText id="basement" type="text" v-model.number="input_basement" />
          <label for="basement">지하층 수</label>
        </span>
      </CCol> </CRow
    ><br />
    <CRow>
      <CCol>
        <span class="p-float-label init_input_box">
          <InputText id="ho" type="text" v-model.number="input_ho" />
          <label for="ho">호 개수</label>
        </span>
      </CCol>
      <CCol>
        <span class="p-float-label init_input_box">
          <InputText id="stair" type="text" v-model.number="input_stair" />
          <label for="stair">계단 개수</label>
        </span>
      </CCol>
      <CCol>
        <CButton type="button" color="primary" @click="initAPT">생성하기</CButton>
      </CCol> </CRow
    ><br /><br />

    <APT :param="param" />
  </CContainer>
</template>

<script>
// 캔버스 전용 컴토넌트 읽어 들이기
import InputText from "primevue/inputtext";
import APT from "./InitAPT.vue";
export default {
  components: {
    APT,
    InputText,
  },
  data() {
    return {
      input_dong: 0,
      input_floor: 0,
      input_basement: 0,
      input_ho: 0,
      input_stair: 0,
      param: "",
    };
  },
  methods: {
    initAPT() {
      this.param = [this.input_dong, this.input_floor, this.input_basement, this.input_ho, this.input_stair].join();

      console.log(this.param);
    },
  },
};
</script>
<style>
.init_input_box {
  margin: 0px 10px 0px 10px;
}
</style>

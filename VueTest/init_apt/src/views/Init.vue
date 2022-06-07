<template>
  <CContainer fluid>
    <CRow>
      <CCol>
        <span class="p-float-label init_input_box">
          <InputText id="dong" type="text" v-model.number="dong" />
          <label for="dong">동 이름</label>
        </span>
      </CCol>
      <CCol>
        <span class="p-float-label init_input_box">
          <InputText id="floor" type="text" v-model.number="floor" />
          <label for="floor">지상층 수</label>
        </span>
      </CCol>
      <CCol>
        <span class="p-float-label init_input_box">
          <InputText id="basement" type="text" v-model.number="basement" />
          <label for="basement">지하층 수</label>
        </span>
      </CCol>
    </CRow>
    <CRow>
      <CCol>
        <span class="p-float-label init_input_box">
          <InputText id="ho" type="text" v-model.number="ho" />
          <label for="ho">호 개수</label>
        </span>
      </CCol>
      <CCol>
        <span class="p-float-label init_input_box">
          <InputText id="stair" type="text" v-model.number="stair" />
          <label for="stair">계단 개수</label>
        </span>
      </CCol>
      <CCol>
        <button />
      </CCol>
    </CRow>
    <CRow>
      <MyCanvas :dong="dong" :floor="floor" :basement="basement" :ho="ho" :stair="stair" />
    </CRow>
  </CContainer>
</template>

<script>
// 캔버스 전용 컴토넌트 읽어 들이기
import InputText from "primevue/inputtext";
import MyCanvas from "./InitAPT.vue";
export default {
  components: {
    MyCanvas,
    InputText,
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
};
</script>
<style>
.init_input_box {
  margin: 0px 10px 0px 10px;
}
</style>

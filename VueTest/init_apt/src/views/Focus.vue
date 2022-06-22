<template>

   <FORM>
      [개인정보 입력]<br>
      이름 : <INPUT id=pname type=text size=10 onkeydown=moveFocus("age")><br>
      나이 : <INPUT id=age type=text size=10 onkeydown=moveFocus("sex")><br>
      성별 : <INPUT id=sex type=text size=10 onkeydown=moveFocus("confirm")>
      <INPUT type="button" id="confirm" value="confirm" onclick=onclick_confirm()>
   </FORM>

</template>

<script>
      let drowOptions = {
      
        map: this.map,
        
        drawingMode: [
          kakao.maps.drawing.OverlayType.CIRCLE,
          kakao.maps.drawing.OverlayType.POLYGON,
        ],
        
        guideTooltip: ['draw'],
        
        markerOptions: {
          draggable: true,
          removable: true,
        },
        
        circleOptions: {
          strokeColor: '#379457',
          strokeOpacity: 0.1,
          fillColor: '#379457',
          fillOpacity: 0.2,
        },
        
        //다각형도구 옵션
        polygonOptions: {
          strokeColor: '#379457',
          fillColor: '#379457',
          fillOpacity: 0.2,
          hintStrokeStyle: 'dash',
          hintStrokeOpacity: 0.5,
        },
      };
      
      this.manager = new kakao.maps.drawing.DrawingManager(drowOptions); 
      
      // 대부분의 도형들은 이런식으로 초기값을 설정해주는것이 좋다.
      this.polygon = new kakao.maps.Polygon({
        map: this.map,
        path: this.polygonPath, 
        strokeWeight: 2,
        strokeColor: '#29ada1',
        strokeOpacity: 0.8,
      });
</script>
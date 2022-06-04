<script>
 //그리기 옵션 설정
      let drowOptions = {
      
        //어디 지도위에 뿌려줄 것인지
        map: this.map,
        
        //사용하고싶은 드로잉모드
        drawingMode: [
          kakao.maps.drawing.OverlayType.CIRCLE,
          kakao.maps.drawing.OverlayType.POLYGON,
        ],
        
        guideTooltip: ['draw'],
        
        //드로잉 도구 옵션
        markerOptions: {
          draggable: true,
          removable: true,
        },
        
        //원형 옵션
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
      
      //드로잉도구들의 세팅값을 담는다 (지우는것도 remove로 가능하다)
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
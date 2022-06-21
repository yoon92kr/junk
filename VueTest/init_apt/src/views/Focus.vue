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
 
   function moveFocus(next) {
      if (event.keyCode == 13) { //엔터누를경우
         document.getElementById(next).focus();//아규먼트id 노드로 이동해서 focus한다
      }
   }
 
   function onclick_confirm() {
      alert("엔터로 버튼을 누르셨습니다.")
   }
 
</script>
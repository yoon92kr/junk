<!-- 2021.11.25 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="container-fluid">

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center"><h1 class="page_title">장바구니</h1></div>
	</div>

<div class="cart_list_header">
	<div class="row">

		<div class="col-lg-1 offset-lg-1 text-center cart_title"><input type="checkbox" id="cart_checkAll" onclick="checkAll();" class="join_01-check-01"></div>
		<div class="col-lg-5 text-center cart_title">상품정보</div>
		<div class="col-lg-1 text-center cart_title">수량</div>
		<div class="col-lg-1 text-center cart_title">가격</div>
		<div class="col-lg-1 text-center cart_total cart_total_1">총 상품금액</div>
		<div class="col-lg-1 text-center cart_total">[총 상품금액]</div>	
	</div>
</div>

<div class="cart_list_body">
	<div class="row">

		<div class="col-lg-1 offset-lg-1 text-center cart_body cart_checkbox"><input type="checkbox" class="join_01-check-01" name="checkRow" ></div>
		<div class="col-lg-2 text-center cart_body"><a href="${contextPath}/product_02.do"><img class="cart_image_clip" src="${contextPath}/resources/img/common/img-box.jpg" alt="장바구니 상품 이미지"></a></div>
		<div class="col-lg-3 text-center cart_body"><a href="${contextPath}/product_02.do">[상품 이름]</a></div>
		<div class="col-lg-1 text-center itemCount_row">
             <form name="itemCountBox" id="cart_itemCountBox_form">
               <div class="value-button cart_decrease" id="cart_decrease1" onclick="decreaseValue(this.id)" value="Decrease Value">-</div>
               <input type="number" class="cart_item_count"id="cart_item_count1" value="1" onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt(this.value, this.id);}" />
               <div class="value-button cart_increase" id="cart_increase1" onclick="increaseValue(this.id)" value="Increase Value">+</div>
             </form>  
		</div>
		<div class="col-lg-1 text-center cart_body">[상품 가격]</div>
		<div class="col-lg-1 text-center cart_total_body cart_total_1">총 배송비</div>
		<div class="col-lg-1 text-right cart_total_body">[배송비]</div>	
	</div>
</div>

<div class="cart_list_body">
	<div class="row">

		<div class="col-lg-1 offset-lg-1 text-center cart_body cart_checkbox"><input type="checkbox" class="join_01-check-01" name="checkRow"></div>
		<div class="col-lg-2 text-center cart_body"><a href="${contextPath}/product_02.do"><img class="cart_image_clip" src="${contextPath}/resources/img/common/img-box.jpg"  alt="장바구니 상품 이미지"></a></div>
		<div class="col-lg-3 text-center cart_body"><a href="${contextPath}/product_02.do">[상품 이름]</a></div>
		<div class="col-lg-1 text-center itemCount_row">
             <form name="itemCountBox" id="cart_itemCountBox_form">
                <div class="value-button cart_decrease" id="cart_decrease2" onclick="decreaseValue(this.id)" value="Decrease Value">-</div>
                <input type="number" class="cart_item_count" id="cart_item_count2" value="1"  onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt(this.value, this.id);}" />
                <div class="value-button cart_increase" id="cart_increase2" onclick="increaseValue(this.id)" value="Increase Value">+</div>
              </form>   
		</div>
		<div class="col-lg-1 text-center cart_body">[상품 가격]</div>
		<div class="col-lg-1 text-center cart_total_body cart_total_1">총 할인액</div>
		<div class="col-lg-1 text-right cart_total_body">[상품 할인 금액]</div>	
	</div>
</div>

<div class="cart_list_body">
	<div class="row">

		<div class="col-lg-1 offset-lg-1 text-center cart_body cart_checkbox"><input type="checkbox" class="join_01-check-01" name="checkRow"></div>
		<div class="col-lg-2 text-center cart_body"><a href="${contextPath}/product_02.do"><img class="cart_image_clip" src="${contextPath}/resources/img/common/img-box.jpg" alt="장바구니 상품 이미지"></a></div>
		<div class="col-lg-3 text-center cart_body"><a href="${contextPath}/product_02.do">[상품 이름]</a></div>
		<div class="col-lg-1 text-center itemCount_row">
              <form name="itemCountBox" id="cart_itemCountBox_form">
                <div class="value-button cart_decrease" id="cart_decrease3" onclick="decreaseValue(this.id)" value="Decrease Value">-</div>
                <input type="number" class="cart_item_count" id="cart_item_count3" value="1"  onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt(this.value, this.id);}" />
                <div class="value-button cart_increase" id="cart_increase3" onclick="increaseValue(this.id)" value="Increase Value">+</div>
              </form>   
		</div>
		<div class="col-lg-1 text-center cart_body">[상품 가격]</div>
		<div class="col-lg-1 text-center cart_total_body cart_total_1 cart_total_bottom"></div>
		<div class="col-lg-1 text-right cart_total_body cart_total_bottom"><span class="maybe_cost_text">예상 결제 금액</span><br><span class="maybe_cost">[최종결제금액]원</span></div>
	
	</div>
	
</div>

<div class="cart_list_body">
	<div class="row">

		<div class="col-lg-1 offset-lg-1 text-center cart_body cart_checkbox"><input type="checkbox" class="join_01-check-01" name="checkRow"></div>
		<div class="col-lg-2 text-center cart_body"><a href="${contextPath}/product_02.do"><img class="cart_image_clip" src="${contextPath}/resources/img/common/img-box.jpg" alt="장바구니 상품 이미지"></a></div>
		<div class="col-lg-3 text-center cart_body"><a href="${contextPath}/product_02.do">[상품 이름]</a></div>
		<div class="col-lg-1 text-center itemCount_row">
              <form name="itemCountBox" id="cart_itemCountBox_form">
                <div class="value-button cart_decrease" id="cart_decrease4" onclick="decreaseValue(this.id)" value="Decrease Value">-</div>
                <input type="number" class="cart_item_count" id="cart_item_count4" value="1"  onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt(this.value, this.id);}" />
                <div class="value-button cart_increase" id="cart_increase4" onclick="increaseValue(this.id)" value="Increase Value">+</div>
              </form>   
		</div>
		<div class="col-lg-1 text-center cart_body">[상품 가격]</div>

	
	</div>
	
</div>
<div class="cart_list_body">
<div class="row">

	<div class="col-lg-1 offset-lg-1 text-center cart_body cart_checkbox"><input type="checkbox" class="join_01-check-01" name="checkRow"></div>
	<div class="col-lg-2 text-center cart_body"><a href="${contextPath}/product_02.do"><img class="cart_image_clip" src="${contextPath}/resources/img/common/img-box.jpg" alt="장바구니 상품 이미지"></a></div>
	<div class="col-lg-3 text-center cart_body"><a href="${contextPath}/product_02.do">[상품 이름]</a></div>
	<div class="col-lg-1 text-center itemCount_row">
              <form name="itemCountBox" id="cart_itemCountBox_form">
                <div class="value-button cart_decrease" id="cart_decrease5" onclick="decreaseValue(this.id)" value="Decrease Value">-</div>
                <input type="number" class="cart_item_count" id="cart_item_count5" value="1"  onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt(this.value, this.id);}" />
                <div class="value-button cart_increase" id="cart_increase5" onclick="increaseValue(this.id)" value="Increase Value">+</div>
              </form>   
	</div>
	<div class="col-lg-1 text-center cart_body">[상품 가격]</div>
	
</div>
</div>

<div class="cart_list_bt">
	<div class="row">

		<div class="col-lg-2 offset-lg-8"><input type="button" value="전체 삭제"><input type="button" value="선택 삭제"></div>
	
	</div>
	
</div>

	<div class="row">

		<div class="col-lg-10 offset-lg-1 cart_list_bottom_hr"></div>

	</div>

<div class="cart_list_order_bt">
	<div class="row">

		<div class="col-lg-3 offset-lg-2"><a href="${contextPath}/order_01.do"><img src="${contextPath}/resources/img/common/all_item_order.png" alt="장바구니 전체 주문 버튼 이미지"></a></div>
		<div class="col-lg-3"><a href="${contextPath}/order_01.do"><img src="${contextPath}/resources/img/common/select_item_order.png" alt="장바구니 선택 주문 버튼 이미지"></a></div>
		<div class="col-lg-2"><a href="${contextPath}/main.do"><img src="${contextPath}/resources/img/common/continue_shopping.png" alt="장바구니 쇼핑 계속하기 버튼 이미지"></a></div>
	
	</div>
</div>

</div>

  <script>
  /* 체크박스 전체선택, 전체해제 */
  function checkAll(){
        if( $("#cart_checkAll").is(':checked') ){
          $("input[name=checkRow]").prop("checked", true);
        }else{
          $("input[name=checkRow]").prop("checked", false);
        }
  }
  
  /*---------- 수량 증감 input 박스 설정 ----------*/
  
  /* 수량 증감 */
function increaseValue(tagId) {
  let targetValue = '';
  for (i=0; i<10; i++) {
      if (String('cart_increase').concat(i)==String(tagId)) {
          targetValue = 'cart_item_count'.concat(i);
      }
      
  }
   let countValue = parseInt(document.getElementById(targetValue).value, 10);

   countValue = isNaN(countValue) ? 0 : countValue;
   countValue++;
   document.getElementById(targetValue).value = countValue;
 };

 function decreaseValue(tagId) {
  let targetValue = '';
  for (i=0; i<10; i++) {
      if (String('cart_decrease').concat(i)==String(tagId)) {       
          targetValue = 'cart_item_count'.concat(i);               
      }
      
  }
   let countValue = parseInt(document.getElementById(targetValue).value, 10);
     if(countValue<=1){
         alert("수량은 1보다 작을 수 없습니다.")
     };
     countValue = isNaN(countValue) ? 0 : countValue;
     countValue < 2 ? countValue = 2 : '';
     countValue--;
     document.getElementById(targetValue).value = countValue;
 };
  /* 수량입력 후 엔터 입력시 이벤트 */

  function searchEvt(targetValue, targetId) {

      if ( targetValue == "" || targetValue <1 ) {
                   alert( '수량은 1보다 작을 수 없습니다.' );
                    document.getElementById(targetId).value = 1;       
                } 

  }

   /* 수량입력 후 다른 영역 클릭 시 이벤트 */
window.onload = eventPlus();

function eventPlus() {

let target = document.querySelectorAll('.cart_item_count');

for (i=0; i<target.length; i++) {
  let item = target.item(i);
  item.onblur = eventGo;
}

}
function eventGo() {
if ( this.value == "" || this.value <1) {
   alert( '수량은 1보다 작을 수 없습니다.' );
    document.getElementById(this.id).value = 1;       
} 

}


  </script>

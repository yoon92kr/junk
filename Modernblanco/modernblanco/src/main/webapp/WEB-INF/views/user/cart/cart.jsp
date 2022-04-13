<!-- 2021.11.25 윤상현 -->
<!-- 2021.12.28 한건희(자바관련) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<div class="container-fluid">

   <c:choose>
      <c:when test="${not empty userInfo.user_id}">
         <div class="row">
            <div class="col-lg-4 offset-lg-4 text-center">
               <h1 class="page_title">장바구니</h1>
            </div>
         </div>
      </c:when>
      <c:when test="${empty userInfo.user_id}">
         <div class="row">
            <div class="col-lg-4 offset-lg-4 text-center">
               <h1 class="page_title">장바구니</h1>
               <span class="cart_notUser">현재 비회원 상태입니다. 비회원 주문 시 적립 및 회원 등급 혜택을 받으실 수 없습니다.</span>
            </div>
         </div>
      </c:when>
   </c:choose>

   <div class="cart_list_header">
      <div class="row">
         <div class="col-lg-1 offset-lg-2 text-center cart_title">
            <input type="checkbox" id="cart_checkAll"
               class="join_01-check-01" checked> 전체선택 버튼
         </div>
         <div class="col-lg-5 text-center cart_title">상품정보</div>
         <div class="col-lg-1 text-center cart_title">수량</div>
         <div class="col-lg-1 text-center cart_title">가격</div>
      </div>
   </div>
   <c:choose>
      <c:when test="${empty userCartListInfo}">
         <div class="row">
            <div class="offset-lg-2 col-lg-8 text-center cs_01_listsection">
               <span>장바구니에 상품이 없습니다.</span>
            </div>
         </div>
      </c:when>
      <c:when test="${not empty userCartListInfo}">
         <c:forEach var="i" begin="1" end="${userCartListInfo.size()}" varStatus="price">
         <c:set var="cart" value="myCartList${i}" />

            <form id="ListCeckBoxForm${i}" class="cartListForm" action="${contextPath}/cart/cartListDelete.do">
               <div class="cart_list_body">
                  <div class="row">
                     <div class="col-lg-1 offset-lg-2 text-center cart_body cart_checkbox">
                        <input id="ListCheckBox${i}" value="${userCartListInfo[cart].product.productVO.product_id}" type="checkbox" class="join_01-check-01" name="checkRow" checked>
                     </div>
                     <div class="col-lg-2 text-center cart_body">
                        <a href="${contextPath}/product/productDetail.do?product_id=${userCartListInfo[cart].product.productVO.product_id}">
                           <img class="cart_image_clip" src="data:image/jpeg;base64,${userCartListInfo[cart].product.main}" alt="장바구니 상품 이미지">
                        </a>
                     </div>
                     <div class="col-lg-3 text-center cart_body">
                        <input id="cartListProductTitle${i}" type="hidden"  value="${userCartListInfo[cart].product.productVO.product_main_title}" />
                        <a id="cartListProductTitle" href="${contextPath}/product/productDetail.do?product_id=${userCartListInfo[cart].product.productVO.product_id}">
                           ${userCartListInfo[cart].product.productVO.product_main_title}
                        </a>
                     </div>
                     <div class="col-lg-1 text-center itemCount_row">
                        <div id="cart_itemCountBox_form">
                           <div class="value-button cart_decrease" id="cart_decrease${i}"
                              onclick="upDownValue(this.id)">-</div>
                           <input type="number" class="cart_item_count"
                              id="cart_item_count${i}" name="cart_count" value="${userCartListInfo[cart].cart.cartVO.cart_count}"
                              onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt(this.value, this.id);}" readonly />
                           <div class="value-button cart_increase" id="cart_increase${i}"
                              onclick="upDownValue(this.id)" >+</div>
                        </div>
                     </div>
                     <div class="col-lg-1 text-center cart_body">
                        <span id="cart_listItemPrice${i}" class="cart_listItemPrice">
                           <fmt:formatNumber value="${(userCartListInfo[cart].product.productVO.product_price - userCartListInfo[cart].product.productVO.product_discount) * userCartListInfo[cart].cart.cartVO.cart_count}" /> 원
                        </span>
                     </div>
                     <input id="listItemPrice${i}" class="listItemPrice" value="${userCartListInfo[cart].product.productVO.product_price}" type="hidden"  />
                     <input id="listItemDiscount${i}" class="listItemDiscount" value="${userCartListInfo[cart].product.productVO.product_discount}" type="hidden">
                  </div>
               </div>
            </form>
         </c:forEach>
      </c:when>
   </c:choose>

   <div class="cart_list_bt">
      <div class="row">
         <div class="col-lg-2 offset-lg-8 text-right cart_check_delete_btn">
            <form id="ListCeckBoxForm" action="${contextPath}/cart/cartListDelete.do">
               <input id="selectCheckDelete" type="button" value="선택 삭제" onclick="selectBTN()">
            </form>
         </div>
      </div>
   </div>
   
   <div class="row">
      <div class="col-lg-2 offset-lg-2 text-center cart_total cart_total_1">총 상품금액</div>
      <div class="col-lg-2 text-center cart_total">총 배송비</div>
      <div class="col-lg-2 text-center cart_total">총 할인액</div>
      <div class="col-lg-2 text-center cart_total">
         <span class="maybe_cost_text">예상 결제 금액</span>
      </div>
   </div>
      
   <div class="row">
      <div class="col-lg-2 offset-lg-2 text-center cart_total_price">
         <span id="cart_totalPrice"></span> 원
      </div>
      <div class="col-lg-2 text-center cart_total_price">
         <span id="cart_delivery"></span> 원
      </div>
      <div class="col-lg-2 text-center cart_total_price">
         <span id="cart_totalDiscount"></span> 원
      </div>
      <div class="col-lg-2 text-center cart_total_price">
         <span id="cart_finalTotalPrice" class="maybe_cost"></span>
         <span class="maybe_cost">원</span>
      </div>
   </div>
         
   <div class="row">
      <div class="col-lg-8 offset-lg-2 cart_list_bottom_hr"></div>
   </div>

   <div class="cart_list_order_bt">
      <div class="row">
         <div class="col-lg-3 offset-lg-2">
            <a href="#" onclick="orderProduct('all')">
                 <input class="cart_btn_Bgreen" type="button" id="cs_02_02_list_btn" value="전체 상품 주문">
            </a>
         </div>
         <div class="col-lg-3">
            <a href="#" onclick="orderProduct('select')">
              <input class="cart_btn_green" type="button" id="cs_02_02_list_btn" value="선택 상품 주문">
            </a>
         </div>
         <div class="col-lg-2">
            <a href="${contextPath}/main.do">
               <input class="cart_btn_gray" type="button" id="cs_02_02_list_btn" value="쇼핑 계속하기">
            </a>
         </div>
      </div>
   </div>
   
</div>

<script>
   $(document).ready(function() {
	   let checkTotalPrice = 0;
       let checkTotalDisCount = 0;
       let deliveryPrice = 0;
       let checkFinalPrice = 0;
      /* 체크박스 전체 선택 해제 버튼 */
      $("#cart_checkAll").on("click", function() {
         
         if ($("#cart_checkAll").is(':checked')) {
            $("input[name=checkRow]").prop("checked", true);
            $("input[name=checkRow]").each(function(i) {
             let checkItem = $("input[name=checkRow]").parents("form").eq(i).attr("id");
                
                let itemPrice = parseInt($("#".concat(checkItem)).find(".listItemPrice").val() * $("#".concat(checkItem)).find(".cart_item_count").val());
                let itemDisCount = parseInt($("#".concat(checkItem)).find(".listItemDiscount").val() * $("#".concat(checkItem)).find(".cart_item_count").val());
                
                
                checkTotalPrice += itemPrice;
                checkTotalDisCount += itemDisCount;
          });
            
            checkFinalPrice = checkTotalPrice - checkTotalDisCount;
            
            if(checkFinalPrice >= 30000 || checkFinalPrice == 0) {
               
               deliveryPrice = 0;
               
            } else {
               
               deliveryPrice = 5000;
            }
            
            checkFinalPrice += deliveryPrice;
            
            document.getElementById("cart_totalPrice").innerHTML = checkTotalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            document.getElementById("cart_delivery").innerHTML = deliveryPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            document.getElementById("cart_totalDiscount").innerHTML = checkTotalDisCount.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            document.getElementById("cart_finalTotalPrice").innerHTML = checkFinalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            
         } else {
            $("input[name=checkRow]").prop("checked", false);
            
            document.getElementById("cart_totalPrice").innerHTML = checkTotalPrice;
            document.getElementById("cart_delivery").innerHTML = deliveryPrice;
            document.getElementById("cart_totalDiscount").innerHTML = checkTotalDisCount;
            document.getElementById("cart_finalTotalPrice").innerHTML = checkFinalPrice;
            
         }
         
      });
      /* 체크박스 하나라도 체크 안 되었을 시 전체 선택 버튼 해제 */
      $("input[name=checkRow]").on("click", function() {
         let total = $("input[name=checkRow]").length;
         let checked = $("input[name=checkRow]:checked").length;
         
         if(total != checked) $("#cart_checkAll").prop("checked", false);
         else $("#cart_checkAll").prop("checked", true);
         
      });
      
      /* 첫 화면 금액 */
   if($("input[name=checkRow]").is(":checked")) {
      
      $("input[name=checkRow]:checked").each(function(i) {
         let checkItem = $("input[name=checkRow]:checked").parents("form").eq(i).attr("id");
            
            let itemPrice = parseInt($("#".concat(checkItem)).find(".listItemPrice").val() * $("#".concat(checkItem)).find(".cart_item_count").val());
            let itemDisCount = parseInt($("#".concat(checkItem)).find(".listItemDiscount").val() * $("#".concat(checkItem)).find(".cart_item_count").val());
            
            
            checkTotalPrice += itemPrice;
            checkTotalDisCount += itemDisCount;
      });
      
      checkFinalPrice = checkTotalPrice - checkTotalDisCount;
        
        if(checkFinalPrice >= 30000 || checkFinalPrice == 0) {
           
           deliveryPrice = 0;
           
        } else {
           
           deliveryPrice = 5000;
        }
        
        checkFinalPrice += deliveryPrice;
        
        document.getElementById("cart_totalPrice").innerHTML = checkTotalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        document.getElementById("cart_delivery").innerHTML = deliveryPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        document.getElementById("cart_totalDiscount").innerHTML = checkTotalDisCount.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        document.getElementById("cart_finalTotalPrice").innerHTML = checkFinalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        
     } else {
        
        document.getElementById("cart_totalPrice").innerHTML = checkTotalPrice;
        document.getElementById("cart_delivery").innerHTML = deliveryPrice;
        document.getElementById("cart_totalDiscount").innerHTML = checkTotalDisCount;
        document.getElementById("cart_finalTotalPrice").innerHTML = checkFinalPrice;
        
     }
         
      
      $("input[name=checkRow]").change(function() {
         let checkBoxCheck = $("input[name=checkRow]:checked");
            
         if(checkBoxCheck.length >= 1) {
            
            checkBoxCheck.each(function(i) {
               
               let checkItem = $("input[name=checkRow]:checked").parents("form").eq(i).attr("id");
               
               let itemPrice = parseInt($("#".concat(checkItem)).find(".listItemPrice").val() * $("#".concat(checkItem)).find(".cart_item_count").val());
               let itemDisCount = parseInt($("#".concat(checkItem)).find(".listItemDiscount").val() * $("#".concat(checkItem)).find(".cart_item_count").val());
               
               
               checkTotalPrice += itemPrice;
               checkTotalDisCount += itemDisCount;
               
            });
            
            checkFinalPrice = checkTotalPrice - checkTotalDisCount;
            
            if(checkFinalPrice >= 30000 || checkFinalPrice == 0) {
               
               deliveryPrice = 0;
               
            } else {
               
               deliveryPrice = 5000;
            }
            
            checkFinalPrice += deliveryPrice;
            
            document.getElementById("cart_totalPrice").innerHTML = checkTotalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            document.getElementById("cart_delivery").innerHTML = deliveryPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            document.getElementById("cart_totalDiscount").innerHTML = checkTotalDisCount.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            document.getElementById("cart_finalTotalPrice").innerHTML = checkFinalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            
         }  else {
             
             document.getElementById("cart_totalPrice").innerHTML = checkTotalPrice;
             document.getElementById("cart_delivery").innerHTML = deliveryPrice;
             document.getElementById("cart_totalDiscount").innerHTML = checkTotalDisCount;
             document.getElementById("cart_finalTotalPrice").innerHTML = checkFinalPrice;
             
          }
         
      });
      
   });

   /*---------- 수량 증감 input 박스 설정 ----------*/ 

   /* 수량 증감 */
   function upDownValue(tagId) {
      let targetValue = '';
      let itemPrice;
      let itemDiscount;
      let itemTotalPrice;
      let product_id;
      let cart_count;
      /* 증가 */
      if(tagId.indexOf("cart_increase") != -1) {
         for (i = 0; i < 10; i++) {
            if (String('cart_increase').concat(i) == String(tagId)) {
               targetValue = 'cart_item_count'.concat(i);
               itemPrice = "listItemPrice".concat(i);
               itemDiscount = "listItemDiscount".concat(i);
               itemTotalPrice = "cart_listItemPrice".concat(i);
               product_id = document.getElementById("ListCheckBox".concat(i)).value;
            }
         }
         let itemTotal = parseInt(document.getElementById(itemPrice).value) - parseInt(document.getElementById(itemDiscount).value);
         let countValue = parseInt(document.getElementById(targetValue).value,
               10);
         countValue = isNaN(countValue) ? 0 : countValue;
         countValue++;
         document.getElementById(targetValue).value = countValue;
         let totalPrice = countValue * itemTotal;
         document.getElementById(itemTotalPrice).innerHTML = totalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",").concat(" 원");
         cart_count = 1;
      }
      /* 감소 */
      else {
         for (i = 0; i < 10; i++) {
            if (String('cart_decrease').concat(i) == String(tagId)) {
               targetValue = 'cart_item_count'.concat(i);
               itemPrice = "listItemPrice".concat(i);
               itemDiscount = "listItemDiscount".concat(i);
               itemTotalPrice = "cart_listItemPrice".concat(i);
               product_id = document.getElementById("ListCheckBox".concat(i)).value;
            }

         }
         let itemTotal = parseInt(document.getElementById(itemPrice).value) - parseInt(document.getElementById(itemDiscount).value);
         let countValue = parseInt(document.getElementById(targetValue).value,
               10);
         if (countValue <= 1) {
            alert("수량은 1보다 작을 수 없습니다.");
         }
         countValue = isNaN(countValue) ? 0 : countValue;
         countValue < 2 ? countValue = 2 : '';
         countValue--;
         document.getElementById(targetValue).value = countValue;
         let totalPrice = countValue * itemTotal;
         document.getElementById(itemTotalPrice).innerHTML = totalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",").concat(" 원");
         cart_count = -1;
      }
      
      $.ajax({
         url:"${contextPath}/cart/cartInProductOverLap.do", 
         type:"GET", 
         dataType:"text", 
         data: {
            "product_id": product_id, 
            "cart_count": cart_count
         }
      });

      
      let checkTotalPrice = 0;
      let checkTotalDisCount = 0;
      let deliveryPrice = 0;
      let checkFinalPrice = 0;
      
      if($("input[name=checkRow]").is(":checked")) {
         
         $(".cartListForm").each(function(index, element) {
            
            checkTotalPrice += parseInt($(element).find(".listItemPrice").val() * $(element).find(".cart_item_count").val());
            checkTotalDisCount += parseInt($(element).find(".listItemDiscount").val() * $(element).find(".cart_item_count").val());
            
         });
         
         checkFinalPrice = checkTotalPrice - checkTotalDisCount;
         
         if(checkFinalPrice >= 30000 || checkFinalPrice == 0) {
            
            deliveryPrice = 0;
            
         } else {
            
            deliveryPrice = 5000;
         }
         
         checkFinalPrice += deliveryPrice;
         
         document.getElementById("cart_totalPrice").innerHTML = checkTotalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         document.getElementById("cart_delivery").innerHTML = deliveryPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         document.getElementById("cart_totalDiscount").innerHTML = checkTotalDisCount.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         document.getElementById("cart_finalTotalPrice").innerHTML = checkFinalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         
      } else {
         
         document.getElementById("cart_totalPrice").innerHTML = checkTotalPrice;
         document.getElementById("cart_delivery").innerHTML = deliveryPrice;
         document.getElementById("cart_totalDiscount").innerHTML = checkTotalDisCount;
         document.getElementById("cart_finalTotalPrice").innerHTML = checkFinalPrice;
         
      }
      
   };
   
   /* 수량입력 후 엔터 입력시 이벤트 */
   function searchEvt(targetValue, targetId) {

      if (targetValue == "" || targetValue < 1) {
         alert('수량은 1보다 작을 수 없습니다.');
         document.getElementById(targetId).value = 1;
      }

   }

   /* 수량입력 후 다른 영역 클릭 시 이벤트 */
   window.onload = eventPlus();

   function eventPlus() {

      let target = document.querySelectorAll('.cart_item_count');

      for (i = 0; i < target.length; i++) {
         let item = target.item(i);
         item.onblur = eventGo;
      }

   }
   
   function eventGo() {
      if (this.value == "" || this.value < 1) {
         alert('수량은 1보다 작을 수 없습니다.');
         document.getElementById(this.id).value = 1;
      }

   }
   
   /* 2022.01.10 한건희 */
      
   /* 체크박스 선택 후 이벤트 */
   function selectBTN() {
      /* 선택된 체크박스가 있을 시 */
      if($("input[name=checkRow]").is(":checked")) {
         /* 선택된 체크박스의 값을 넣어줄 리스트 선언 */
         let checkList = new Array();
         /* 선택된 체크박스의 길이(갯수) */
         let checkItem = $("input[name=checkRow]:checked").length;
         if(checkItem > 0) {
            let product_id;
            $("input[name=checkRow]:checked").each(function(index, element) {
               /* 선택된 체크박스의 value를 each함수를 통해 각각 받아옴 */
               product_id = $(this).val();
               /* 받아온 value를 checkList에 담아줌 */
               checkList.push(product_id);
            })
         }
         
         if($("#selectCheckDelete").on("click")) {
            let deleteProduct;
         /* 삭제버튼 클릭 이벤트 */
            if(checkItem > 1) {
               deleteProduct = confirm("해당 상품들을 장바구니에서 제거 하시겠습니까?");
            }
            else if(checkItem == 1){
               deleteProduct = confirm("해당 상품을 장바구니에서 제거 하시겠습니까?");
            }
            if(deleteProduct == true) {
               $.ajax({
                  type:"post", 
                  url:"${contextPath}/cart/cartListDelete.do", 
                  dataType:"text", 
                  data: {
                     "deleteList": JSON.stringify(checkList)
                  }, 
                  success:function() {
                     alert("해당 상품이 장바구니에서 삭제되었습니다.");
                     location.reload();
                  }, 
                  error:function() {
                     alert("해당 상품 삭제가 실패했습니다.");
                  }
               });
            }
         }
      }
      else{
         alert("선택된 상품이 없습니다.");
      }
   }
   
//   2022.01.16 윤상현
// 파라미터option에는 
function orderProduct(TO) {
   
   let checkList = document.getElementsByName("checkRow");
   let productList = [];
   
   // 전체 상품 주문 선택시
   if(TO == 'all'){   
      if(checkList.length > 0) {
         
         for(i=0 ; i<checkList.length ; i++) {
               productList.push(checkList[i].value);            
           }
         
         submitOrder(productList);
       
         }
      
      else {
         alert("장바구니에 담긴 상품이 없습니다.");
      }
   }
   // 선택 상품 주문 선택시
   else if(TO == 'select') {
      let checkFlag = 0;
      if(checkList.length > 0) {
         
         for(i=0 ; i<checkList.length ; i++) {
            if(checkList[i].checked == true) {
               productList.push(checkList[i].value);   
               checkFlag++;
            }         
           }
         
         if(checkFlag == 0) {
            alert("선택된 상품이 없습니다.");
         }
         else if(checkFlag > 0) {
        	 submitOrder(productList);
            }
         }
      
      else {
         alert("장바구니에 담긴 상품이 없습니다.");
      }
         
      }
   }
   
   function submitOrder(productList) {
	   
       var form = document.createElement("form");
       form.setAttribute("charset", "UTF-8");
       form.setAttribute("method", "Post");
       form.setAttribute("action", "${contextPath}/order/order_form.do?lastViewName=cart");
       
       for(var key in productList) {
     	  
           var hiddenField = document.createElement("input");
           hiddenField.setAttribute("type", "hidden");
           hiddenField.setAttribute("name", "product_id");
           hiddenField.setAttribute("value", productList[key]);
           form.appendChild(hiddenField);
       }

     
       document.body.appendChild(form);
       form.submit();
   }
</script>
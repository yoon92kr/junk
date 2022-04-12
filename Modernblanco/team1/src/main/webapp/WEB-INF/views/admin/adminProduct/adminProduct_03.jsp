<!-- 2021.12.03 한건희 -->
<!-- 2021.12.08 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="VO" value="${productInfo.product.productVO}" />
<c:set var="Img" value="${productInfo.image}" />
<c:if test='${not empty userInfo && not empty productInfo }'>
	<script>
   if(${userInfo.user_rank > 2}) {

   }
   
   else if (${userInfo.user_rank < 3}) {
      if("${userInfo.user_id}" != "${VO.user_id}") {
         alert("잘못된 접근입니다.");
         location.replace('${contextPath}/admin/product/extra_list.do');
      }
      else {

      }
   }
   </script>

</c:if>
<c:if test='${empty userInfo }'>
	<script>

      alert("잘못된 접근입니다.");
      location.replace('${contextPath}/main.do')

   </script>

</c:if>


<div class="container">

	<div class="row">
		<div class="col-lg-6 offset-lg-3 text-center">
			<h1 class="page_title">관리자 페이지</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12 text-left myPage_03_01-content-body">
			<h6 class="order_01-sub-title-page">
				<span class="order_01-sub-title">[ ${VO.product_main_title} ]
					상품 수정</span>
			</h6>
		</div>
	</div>

	<form action="${contextPath}/admin/product/update_product.do"
		method="post" enctype="multipart/form-data" id="admin_product_update">
		<input type="hidden" name="user_id" value="${userInfo.user_id}">
		<input type="hidden" name="product_id" value="${VO.product_id}">
		<input type="hidden" name="last_view_name" value="${lastViewName}" >

		<div class="row">
			<div class="col-lg-2 text-center join_02-main-left">메인 상품명</div>
			<div class="col-lg-10 join_02-main-right">
				<input class="join_02-text-box" type="text"
					name="product_main_title" value="${VO.product_main_title}">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center join_02-main-left">상품 부제목</div>
			<div class="col-lg-10 join_02-main-right">
				<input class="join_02-text-box" type="text" name="product_sub_title"
					value="${VO.product_sub_title}">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center join_02-main-left">메인 정보</div>

			<div class="col-lg-10 join_02-main-right">
				<span class="adminProduct_02-content-body-left-text">상품금액 : </span>
				<input class="adminProduct_02-content-body-mainInfo" type="number"
					name="product_price" id="input_price" onchange="cost()"
					value="${VO.product_price}"> 할인금액 : <input
					class="adminProduct_02-content-body-mainInfo" type="number"
					name="product_discount" id="input_discount" onchange="cost()"
					value="${VO.product_discount}"> 최종금액 : <input
					class="adminProduct_02-content-body-mainInfo" type="number"
					disabled id="sumcost"> 재고수량 : <input
					class="adminProduct_02-content-body-mainInfo" type="number"
					name="product_amount" value="${VO.product_amount}">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center join_02-main-left">상품 분류</div>
			<div class="col-lg-10 join_02-main-right">
				<span class="adminProduct_02-content-body-left-text">대분류</span> <select
					class="adminProduct_02-category"
					onchange="productCategory02(this.options[this.selectedIndex].id)"
					name="product_main_category" id="main_category_value">
					<option id="category_01" value="농산물">농산물</option>
					<option id="category_02" value="수산물">수산물</option>
					<option id="category_03" value="축산물">축산물</option>
				</select> <span
					class="adminProduct_02-content-body-left-text adminProduct_02-content-body-category-text">소분류</span>

				<select id="adminProduct_02_category_01-text"
					class="adminProduct_02-category" name="product_sub_category">
					<option value="채소">채소</option>
					<option value="곡물">곡물</option>
					<option value="과일">과일</option>
				</select> <select id="adminProduct_02_category_02-text"
					class="adminProduct_02-category" name="product_sub_category"
					disabled>
					<option value="생선류">생선류</option>
					<option value="갑각류">갑각류</option>
					<option value="해조류">해조류</option>
				</select> <select id="adminProduct_02_category_03-text"
					class="adminProduct_02-category" name="product_sub_category"
					disabled>
					<option value="돼지고기">돼지고기</option>
					<option value="소고기">소고기</option>
					<option value="기타">기타</option>
				</select>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center adminProduct_02-main-content-left">
				내용</div>
			<div class="col-lg-10 adminProduct_02-main-right">
				<input class="adminProduct_02-main-img-add-btn" type="file"
					name="body" multiple="multiple" accept="image/*"> <span
					class="admin_product_Form_notice">※ 새로운 이미지를 업로드하면, 기존 등록된
					이미지는 모두 삭제됩니다.</span>
				<textarea class="adminProduct_02-main-content-text"
					name="product_body">${VO.product_body}</textarea>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center join_02-main-left">메인 이미지</div>
			<div class="col-lg-10 join_02-main-right">
				<input class="adminProduct_02-main-img-add-btn" type="file"
					name="main" accept="image/*" id="메인 이미지"><span
					class="admin_product_Form_notice">※ 새로운 이미지를 업로드하면, 기존 등록된
					이미지는 모두 삭제됩니다.</span>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center adminProduct_02-img-add-left">
				추가 이미지</div>
			<div class="col-lg-10 adminProduct_02-img-add-right">

				<input class="adminProduct_02-sub-img-add-btn image_upload_check"
					id="추가 이미지 1" type="file" name="sub1" accept="image/*"> <input
					class="adminProduct_02-sub-img-add-btn image_upload_check"
					id="추가 이미지 2" type="file" name="sub2" accept="image/*"> <input
					class="adminProduct_02-sub-img-add-btn image_upload_check"
					id="추가 이미지 3" type="file" name="sub3" accept="image/*">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-4 offset-lg-2 join_02-bottom-btn text-right">

				<a href="${contextPath}/admin/product/extra_list.do">
					<input type="button" class="admin_btn_gray" value="상품 목록">
				</a>

			</div>
			<div class="col-lg-4 join_02-bottom-btn">

				<a href="#" onclick="submit_admin_product_update()">
					<input type="button" class="admin_btn_blue" value="상품 수정">
				</a>
				<!-- </div> -->
			</div>
		</div>
		<input type="hidden" name="product_states" value="0">
	</form>
</div>

<script type="text/javascript">
// 2021.12.09 윤상현 수정
function productCategory02(productValue02) {
   let adminProduct_02_category_01 = '#adminProduct_02_category_01-text';
   let adminProduct_02_category_02 = '#adminProduct_02_category_02-text';
   let adminProduct_02_category_03 = '#adminProduct_02_category_03-text';

   let adminProduct_02 = '#adminProduct_02_'.concat(productValue02, '-text');

   if (adminProduct_02 == adminProduct_02_category_01) {
      document.querySelector(adminProduct_02_category_01).style.display = 'inline';
      document.querySelector(adminProduct_02_category_01).disabled = false;
      document.querySelector(adminProduct_02_category_02).style.display = 'none';
      document.querySelector(adminProduct_02_category_02).disabled = true;
      document.querySelector(adminProduct_02_category_03).style.display = 'none';
      document.querySelector(adminProduct_02_category_03).disabled = true;

   }
   else if (adminProduct_02 == adminProduct_02_category_02) {
      document.querySelector(adminProduct_02_category_01).style.display = 'none';
      document.querySelector(adminProduct_02_category_01).disabled = true;
      document.querySelector(adminProduct_02_category_02).style.display = 'inline';
      document.querySelector(adminProduct_02_category_02).disabled = false;
      document.querySelector(adminProduct_02_category_03).style.display = 'none';
      document.querySelector(adminProduct_02_category_03).disabled = true;
   }
   else {
      document.querySelector(adminProduct_02_category_01).style.display = 'none';
      document.querySelector(adminProduct_02_category_01).disabled = true;
      document.querySelector(adminProduct_02_category_02).style.display = 'none';
      document.querySelector(adminProduct_02_category_02).disabled = true;
      document.querySelector(adminProduct_02_category_03).style.display = 'inline';
      document.querySelector(adminProduct_02_category_03).disabled = false;
   }

   
 }

/*
// 한건희 작업물, 미사용으로 주석처리
function productInfoCange() {
   if(confirm("상품을 등록 하시겠습니까?") == true) {
      alert("등록 되었습니다.");
      location.href = "${contextPath}/adminProduct_01.do";
   }
   else {
      return;
   }
}
*/

/* 2021.12.08 윤상현*/
// 최종금액 연산 
function cost() {
   let price = document.getElementById('input_price').value;
   let discount = document.getElementById('input_discount').value;
   let sumcost = price - discount;
   
   if (price < '0' || sumcost < '0') {
      alert("상품금액은 0원보다 작을 수 없습니다.");
      document.getElementById('input_price').value = '0';
      document.getElementById('input_discount').value = '0';
      document.getElementById('sumcost').value='0';
   }
   
   else if (discount < '0' || sumcost < '0') {
      alert("할인금액을 양수로 입력해주세요.");
      document.getElementById('input_discount').value = '0';
      document.getElementById('sumcost').value=price;
   }

   else {

      document.getElementById('sumcost').value=sumcost;
   }
   
}

// 카테고리 기존 값 할당 스크립트
window.addEventListener('load', function() {
   if(${productInfo != null && productInfo != ""}) {
    cost();
    selectedOption("main_category_value", "${VO.product_main_category}");
    var option = document.getElementById("main_category_value");
    var main_option = option.options[option.selectedIndex].id;
    productCategory02(main_option);
    switch("${VO.product_main_category}") {
    case "농산물" :
       selectedOption("adminProduct_02_category_01-text", "${VO.product_sub_category}");
       break;
    case "수산물" :
       selectedOption("adminProduct_02_category_02-text", "${VO.product_sub_category}");
       break;
    case "축산물" :
       selectedOption("adminProduct_02_category_03-text", "${VO.product_sub_category}");
       break; 
    }
    
   }
});

// id에는 select의 id값, value에는 선택하고자 하는 option의 value 값을 파라미터로 입력한다.
function selectedOption(id, value) {
	var obj = document.getElementById(id);

	for (i=0 ; i<obj.length ; i++) {
	if(obj[i].value == value) {
	obj[i].selected = true;
	      }
	   }
	}

	// 상품수정 전 서브이미지 추가시, 확인 스크립트
	function submit_admin_product_update() {
		var elements = document.getElementsByClassName('image_upload_check'); // body 이미치 파일 select
		var checkFlag = 0;
		var incompleteTag = "";
		for(var i = 0; i < elements.length; i++){
			
			let uploadItem = elements[i].value;
			
			// 비어있는 파일이 하나라도 있다면 flag를 false로 대입.

			if(!uploadItem) {
				incompleteTag += "▶ "
				incompleteTag += elements[i].id;
				incompleteTag += "\n"
			}
			// 서브이미지가 등록될때마다 checkFlag를 1씩 증가
			else {
				checkFlag++;
			}
			
		}
		
		
		if (checkFlag == 3 || checkFlag == 0) {
			document.getElementById('admin_product_update').submit();	   
		}
		// 서브이미지가 한개이상 등록되있을때, 3개가 등록지되 않을경우 경고메세지 발생
		else {
			alert("서브 이미지를 수정할 경우, 세 이미지를 모두 입력해주세요.\n\n[ 미입력 항복 ]\n\n"+incompleteTag)
		}
		
	}


</script>
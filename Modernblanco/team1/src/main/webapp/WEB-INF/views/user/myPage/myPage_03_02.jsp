<!--  2021.11.29 강보석 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<div class="container-fluid">

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<h1 class="page_title">마이페이지</h1>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-3 col-lg-6 text-left cs_01_subtitle">
			<h3>반품 / 교환신청</h3>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-2 col-lg-8 cs_02_02_row">
		</div>
	</div>

<form action="${contextPath}/myPage/myOrder/askRefund.do" method="post" enctype="multipart/form-data" id="ask_refund">
	<input type="hidden" name="order_id" value="${order_id }">
	<input type="hidden" name="user_id" value="${userInfo.user_id }">
	<input type="hidden" name="notice_category" value="refund">
	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center notice_02_box01">
			<span>제목</span>
		</div>
		<div class="col-lg-4 text-left cs_02_02_box02">
			<input name="notice_title" type="text" class="form-control form_upload_check" placeholder="제목을 입력하세요.">
		</div>

	</div>


	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
			<span>주문 번호</span>
		</div>
		<div class="col-lg-4 cs_02_02_box02">
			<span>${order_id }</span>
		</div>


	</div>



	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
			<span>반품/교환 사유</span>
		</div>
		<div class="col-lg-4 text-left cs_02_02_box02">

				<select class="cs_02_select" name="notice_type">


					<option value="상품불량">상품불량</option>
					<option value="오배송">오배송</option>
					<option value="기타">기타</option>
				</select>


		</div>
	</div>




	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box03">
			<span>내용</span>
		</div>
		<div class="col-lg-4 text-left cs_02_02_box04">
			<div class="form-group">
				<textarea class="form-control form_upload_check" rows="8" name="notice_body" placeholder="내용을 입력하세요."></textarea>
			</div>


		</div>

	</div>
	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
			<span>사진 첨부</span>
		</div>
		<div class="col-lg-4 cs_02_02_box02">
			<input class="form-control form_upload_check" style="border:0px;" type="file" name="refund" accept="image/*">
		</div>


	</div>

</form>


</div>


		<div class="row">
			<div class="offset-lg-4 col-lg-2 text-center">
				<div class="cs_correct_btn">
					<input onclick="submit_refund_product()" class="user_btn_Bgreen" type="button" id="cs_02_02_update_btn" value="신청하기">							
				</div>
			</div>
			<div class="col-lg-2 text-center">
				<div class="notice_back_btn">
					<a href="${contextPath}/myPage/myOrder.do">			
						<input class="user_btn_gray" type="button" id="cs_02_02_list_btn" value="돌아가기">
					</a>
				</div>
			</div>
		</div>



<script>
// 반품 신청 전 누락사항 확인 스크립트
function submit_refund_product() {
	// 전체 input 태그 value를 체크하기위한 클래스 select
	var elements = document.getElementsByClassName('form_upload_check');
	var checkFlag = true;
	for (var i = 0; i < elements.length; i++) {

		let uploadItem = elements[i].value;
		
		// 비어있는 파일이 하나라도 있다면 flag를 false로 대입.
		if (!uploadItem) {
			checkFlag = false;
		}

	}
	if (checkFlag) {
		document.getElementById('ask_refund').submit();
	} else {
		alert("반품/교환 신청시 제목과 내용 및 사진은 필수입력 사항입니다.");
	}

} 
</script>
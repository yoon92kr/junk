<!-- 2021.12.02 한건희 -->
<!-- 2021.12.31 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">

	<div class="row">
		<div class="col-lg-6 offset-lg-3 text-center">
			<h1 class="page_title">관리자 페이지</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12 text-left myPage_03_01-content-body">
			<h6 class="order_01-sub-title-page">
				<span class="order_01-sub-title">회원 상세 정보</span>
			</h6>
		</div>
	</div>
	<form action="${contextPath}/admin/user/update_user.do"
		method="post" id="admin_user_update">
		<div class="row">
			<div class="col-lg-2 text-center join_02-main-left">아이디</div>
			<div class="col-lg-10 join_02-main-right">

				<input class="join_02-text-box update_form_check  adminUser_readonly" type="text" readonly name="user_id"
					value="${userVO_update.user_id}">

			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center join_02-main-left">비밀번호</div>
			<div class="col-lg-10 join_02-main-right">

				<input class="join_02-text-box update_form_check" type="text" name="user_pw"
					value="${userVO_update.user_pw}">

			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center join_02-main-left">가입일</div>
			<div class="col-lg-10 join_02-main-right">

				<input class="join_02-text-box update_form_check adminUser_readonly" type="text" readonly name="user_join_date"
					value="${userVO_update.user_join_date}">

			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center join_02-main-left">이 름</div>
			<div class="col-lg-10 join_02-main-right">

				<input class="join_02-text-box update_form_check" type="text" name="user_name"
					value="${userVO_update.user_name}">

			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center join_02-main-left">생년월일</div>
			<div class="col-lg-10 join_02-main-right">

				<input type="text" class="join_02-year-month-day update_form_check adminUser_readonly" id="select_year"
				 readonly name="user_birth_year"
					value="${userVO_update.user_birth_year}"> <span
					class="join_02-year-month-day-text">년</span> <input type="text"
					class="join_02-year-month-day update_form_check  adminUser_readonly" id="select_month"
					readonly name="user_birth_month"
					value="${userVO_update.user_birth_month}"> <span
					class="join_02-year-month-day-text">월</span> <input type="text"
					class="join_02-year-month-day update_form_check adminUser_readonly" id="select_day"
					readonly name="user_birth_day"
					value="${userVO_update.user_birth_day}"> <span
					class="join_02-year-month-day-text">일</span>

			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center join_02-main-left">핸드폰 번호</div>
			<div class="col-lg-10 join_02-main-right">

				<input type="number" class="join_02-mobile update_form_check admin_user_margin_left" name="user_mobile_1" oninput="join_02_mobile_number(this, 3)"
					value="${userVO_update.user_mobile_1}"> - <input
					class="join_02-mobile-02 update_form_check" type="number" name="user_mobile_2" oninput="join_02_mobile_number(this, 4)"
					value="${userVO_update.user_mobile_2}"> - <input
					class="join_02-mobile-02 update_form_check" type="number" name="user_mobile_3" oninput="join_02_mobile_number(this, 4)" 
					value="${userVO_update.user_mobile_3}">

			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center join_02-main-left">회원 멤버쉽 등급</div>
			<div class="col-lg-10 join_02-main-right">

				<select class="join_02-text-box" name="user_membership">
					<option value="0"
						<c:if test='${userVO_update.user_membership == "0"}'>selected</c:if>>비회원</option>
					<option value="1"
						<c:if test='${userVO_update.user_membership == "1"}'>selected</c:if>>일반
						회원</option>
					<option value="2"
						<c:if test='${userVO_update.user_membership == "2"}'>selected</c:if>>우수
						회원</option>
					<option value="3"
						<c:if test='${userVO_update.user_membership == "3"}'>selected</c:if>>단골
						회원</option>
					<option value="4"
						<c:if test='${userVO_update.user_membership == "4"}'>selected</c:if>>FLEX
						회원</option>
				</select>

			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center join_02-main-left">누적 구매액</div>
			<div class="col-lg-10 join_02-main-right">

				<input class="join_02-text-box update_form_check adminUser_readonly" type="text" readonly
					value="${userVO_update.user_total_amount}">

			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center join_02-main-left">주 소</div>
			<div class="col-lg-10 join_02-main-right">

				<input class="join_02-text-box update_form_check" type="text" name="user_new_address"
					value="${userVO_update.user_new_address}">

			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center join_02-main-left">상세 주소</div>
			<div class="col-lg-10 join_02-main-right">

				<input class="join_02-text-box update_form_check" type="text" name="user_detail_address"
					value="${userVO_update.user_detail_address}">

			</div>
		</div>
	</form>

	<div class="row">
		<div class="col-lg-4 offset-lg-2 join_02-bottom-btn">
			<div class="col-lg-4 offset-lg-2 text-right">

				<a href="${contextPath}/admin/user/user_list.do"> 
					<input type="button" class="admin_btn_gray" value="회원 목록">
				</a>

			</div>
		</div>
		<div class="col-lg-4 join_02-bottom-btn">

			<a href="#" onclick="submit_admin_product_update()">
				<input type="button" class="admin_btn_blue" value="회원 수정">
			</a>

		</div>
	</div>

</div>


<script>
// 상품수정 전, 비어있는 input 태그 확인 스크립트
function submit_admin_product_update() {
	
	var elements = document.getElementsByClassName(' update_form_check'); // 전체 양식 조회
	var checkFlag = true;
	for(var i = 0; i < elements.length; i++){
		
		let uploadItem = elements[i].value;
		
		// 비어있는 양식이 하나라도 있다면 flag를 false로 대입.

		if(!uploadItem) {
			checkFlag = false;
		}

		
	}
	
	
	if (checkFlag == true) {
		document.getElementById('admin_user_update').submit();	   
	}

	else {
		alert("비어있는 항목이 존재합니다. 다시 확인해주세요");
	}
}



function join_02_mobile_number(el, maxlength) {
	if (el.value.length > maxlength) {
		el.value = el.value.substr(0, maxlength);
	}
}




	

</script>
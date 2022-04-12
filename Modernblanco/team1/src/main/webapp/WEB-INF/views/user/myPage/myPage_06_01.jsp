<!--  2021.11.29 강보석 -->
<!-- 2022.02.08 한건희 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container-fluid">
	
	<c:if test="${message == 'myQuestion'}">
		<div class="row">
			<div class="col-lg-4 offset-lg-4 text-center">
				<h1 class="page_title">마이페이지</h1>
			</div>
		</div>
	</c:if>
	
	<div class="row">
		<div class="offset-lg-2 col-lg-8 text-left cs_01_subtitle">
			<h3>문의 내역</h3>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center notice_02_box01">
			<span>제목</span>
		</div>
		<div class="col-lg-4 text-center cs_02_02_box02">
			<span>${detail.question.notice_title}</span>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
			<span>문의 유형</span>
		</div>
		<c:if test="${empty detail.question.notice_type}">
			<div class="col-lg-4 text-center cs_02_02_box02">
				<span>상품 문의</span>
			</div>
		</c:if>
		<c:if test="${not empty detail.question.notice_type}">
			<div class="col-lg-4 text-center cs_02_02_box02">
				<span>${detail.question.notice_type}</span>
			</div>
		</c:if>
	</div>

	<c:if test="${not empty detail.product_title}">
		<div class="row">
			<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
				<span>문의 상품명</span>
			</div>
			<div class="col-lg-4 text-center cs_02_02_box02">
				<span>${detail.product_title}</span>
			</div>
		</div>
	</c:if>

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box03">
			<span>내용</span>
		</div>
		<div class="col-lg-4 text-center cs_02_02_box04">
			<span>${detail.question.notice_body}</span>
		</div>
	</div>
	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box03">
			<span>답변</span>
		</div>
		<div class="col-lg-4 text-center cs_02_02_box04">
			<span>${detail.answer.notice_body}</span>
		</div>
	</div>

	<form id="changeDeleteForm"></form>

	<c:if test="${empty detail.answer}">
		<div class="row">
			<div class="offset-lg-3 col-lg-2 text-center">
				<div class="notice_back_btn">
					<input class="user_btn_Bgreen" type="button" value="수정하기"
						onclick="questionUpdate();">
				</div>
			</div>

			<div class="col-lg-2 text-center">
				<div class="notice_back_btn">
					<input class="user_btn_gray" type="button" value="목록"
						onclick="history.back();">
				</div>
			</div>

			<div class="col-lg-2 text-center">
				<div class="notice_back_btn">
					<input class="user_btn_Dgray" type="button" value="삭제하기"
						onclick="deleteBtn();">
				</div>
			</div>
		</div>
	</c:if>

	<c:if test="${not empty detail.answer}">
		<div class="row">
			<div class="offset-lg-4 col-lg-2 text-center">
				<div class="notice_back_btn">
					<input class="user_btn_gray" type="button" value="목록"
						onclick="history.back();">
				</div>
			</div>

			<div class="col-lg-2 text-center">
				<div class="notice_back_btn">
					<input class="user_btn_Dgray" type="button" value="삭제하기"
						onclick="deleteBtn();">
				</div>
			</div>
		</div>
	</c:if>
</div>

<script>
	/* 수정 버튼 */
	function questionUpdate() {

		if ("${detail.question.user_id}" == "${userInfo.user_id}") {
			let form = document.getElementById("changeDeleteForm");
			let input = document.createElement("input");

			input.setAttribute("type", "hidden");
			input.setAttribute("name", "notice_id");
			input.setAttribute("value", "${detail.question.notice_id}");

			if ("${detail.question.product_id}" == null
					|| "${detail.question.product_id}" == "") {

				form.method = "GET";
				form.action = "${contextPath}/myPage/myQuestion/myUQAUpdate.do";
				form.appendChild(input);
				form.submit();

			} else if ("${detail.question.product_id}" != null
					|| "${detail.question.product_id}" != "") {

				let input2 = document.createElement("input");

				input2.setAttribute("type", "hidden");
				input2.setAttribute("name", "product_id");
				input2.setAttribute("value", "${detail.question.product_id}");

				form.method = "GET";
				form.action = "${contextPath}/myPage/myQuestion/myPQAUpdate.do";
				form.appendChild(input);
				form.appendChild(input2);
				form.submit();

			}

		} else {
			alert("수정은 문의 작성한 해당 아이디만 가능합니다.");
			location.replace('${contextPath}/main.do');
		}

	}

	/* 삭제 버튼 */
	function deleteBtn() {

		let deleteQuestion = confirm("문의 내용을 삭제하시겠습니까?");

		if (deleteQuestion == true) {

			let form = document.getElementById("changeDeleteForm");
			let input = document.createElement("input");

			input.setAttribute("type", "hidden");
			input.setAttribute("name", "notice_id");
			input.setAttribute("value", "${detail.question.notice_id}");

			form.method = "GET";
			form.action = "${contextPath}/myPage/myQuestion/questionDelete.do";
			form.appendChild(input);
			form.submit();

		}

	}
</script>


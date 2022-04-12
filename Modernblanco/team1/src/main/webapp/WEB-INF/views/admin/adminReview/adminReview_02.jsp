<!-- 2021.12.03 임석희 adminReview_01_01 -->
<!-- 2022.02.11 윤상현  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test='${not empty userInfo}'>
	<script>
   if(${userInfo.user_rank > 1}) {
   }
   
   else {
         alert("잘못된 접근입니다.");
         location.replace('${contextPath}/main.do');
      }
   </script>

</c:if>

<c:if test='${empty userInfo }'>
	<script>
      alert("잘못된 접근입니다.");
      location.replace('${contextPath}/main.do');
   </script>
</c:if>

<div class="container">
	<div class="MyPage_title">
		<div class="row">
			<div class="col-lg-4 offset-lg-4 text-center">
				<h1 class="page_title">관리자 페이지</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center MyPage_padding">답변 작성</div>

			<div class="container">
				<div class="MyPage_top-underline"></div>
			</div>
		</div>
	</div>

	<div class="MyPage_02_01_top">
		<div class="row">
			<div class="col-lg-2 text-center MyPage_02_01_menu-left">제 목</div>
			<div class="col-lg-9 MyPage_02_01_menu-right">
				<input class="AdminReturn_02-text-box text-center" type="text"
					disabled placeholder="${QAInfo.notice_title}">
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-2 text-center MyPage_02_01_menu-left">상품 명</div>
		<div class="col-lg-9 MyPage_02_01_menu-right">
			<input class="AdminReturn_02-text-box text-center" type="text"
				disabled placeholder="${QAInfo.product_main_title}">
		</div>
	</div>


	<div class="row">
		<div class="col-lg-2 text-center MyPage_02_01_menu-left">평점</div>
		<div class="col-lg-9 MyPage_02_01_menu-right">
			<input class="AdminReturn_02-text-box text-center" type="text"
				disabled placeholder="${QAInfo.notice_grade}점">
		</div>
	</div>



	<div class="row">
		<div
			class="col-lg-2 text-center MyPage_02_01_menu-left AdminReturn_02-height-04">
			내 용</div>
		<div class="col-lg-9 MyPage_02_01_menu-right AdminReturn_02-height-04">
			<textarea
				class="AdminReturn_02-height-06 AdminReturn_02-textarea text-center"
				disabled placeholder="${QAInfo.notice_body}"></textarea>

		</div>
	</div>
	<div class="row">
		<div
			class="col-lg-2 text-center admin_review_detail_menu-left admin_review_detail_image_height">
			첨부 이미지</div>
		<div class="col-lg-9 text-center admin_review_detail_menu-right admin_review_detail_image_height">
			<img class="admin_review_detail_image" src="data:image/jpeg;base64,${QAInfo.image_file}"
				alt="상품 관리 페이지 상품 이미지">
		</div>
	</div>


	<form action="${contextPath}/admin/CS/add_CS.do" method="post"
		id="reply">
		<div class="row">

			<input type="hidden" name="notice_id" value="${QAInfo.notice_id }">
			<input type="hidden" name="user_id" value="${userInfo.user_id }">
			<input type="hidden" name="product_id" value="${QAInfo.product_id }">
			<input type="hidden" name="notice_type" value="${QAInfo.notice_type }">
			<input type="hidden" name="notice_title" value="${QAInfo.notice_id} 답글">
			<input type="hidden" name="notice_category"
				value="${QAInfo.notice_category }">

			<div
				class="col-lg-2 text-center MyPage_02_01_menu-left AdminReturn_02-height-04">
				답 변</div>
			<div
				class="col-lg-9 MyPage_02_01_menu-right AdminReturn_02-height-04">

				<textarea name="notice_body"
					class="AdminReturn_02-height-06 AdminReturn_02-textarea"></textarea>

			</div>

		</div>
	</form>
	<br> <br>
	<div class="row">
		<a href="#" onclick="addCS()"
			class="col-lg-2 text-center AdminReturn_02-bottom-button-2">답변 등록</a>
		<a href="${contextPath}/admin/CS/review_list.do"
			class="col-lg-2 text-center AdminReturn_02-bottom-button-3">목 록</a>
	</div>

</div>

<script>
function addCS() {
	document.getElementById("reply").submit();
}
</script>
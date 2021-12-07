<!--  2021.11.30 강보석 -->

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
		<div class="offset-lg-2 col-lg-4 text-left cs_01_subtitle">
			<h3>문의 내역</h3>
		</div>
	</div>



	<div class="row">
		<div class="offset-lg-2 col-lg-8">
			<hr>
		</div>
	</div>




	<div class="row">

		<div class="offset-lg-2 col-lg-2 text-center cs_01_01header">
			<span>작성 일자</span>
		</div>
		<div class="col-lg-2 text-center cs_01_01header">
			<span>상품명</span>
		</div>
		<div class="col-lg-2 text-center cs_01_01header">
			<span>문의 번호</span>
		</div>
		<div class="col-lg-2 text-center cs_01_01header">
			<span>후기 변경</span>
		</div>

	</div>



	<div class="row">

		<div class="offset-lg-2 col-lg-2 text-center admincs_01listsection">
			<span>[후기 작성 일자]</span>
		</div>


		<div class="col-lg-2 text-center admincs_01listsection">
			<p class="cs">
				<a href="#">[후기 작성 상품 명]</a>
		</div>


		<div class="col-lg-2 text-center admincs_01listsection">
			<span>[후기 글 제목]</span>
		</div>


		<div class="col-lg-2 text-center admincs_01_01listsection">


			<a class="myPage_test" href="${contextPath}/myPage_07_01.do"><img
				src="${contextPath}/resources/img/common/Inquiries_correct.png"
				alt="문의내역 목록 수정하기버튼 이미지"></a> <br> <a class="myPage_test"
				href="#"><img
				src="${contextPath}/resources/img/common/Inquiries_delete_01.png"
				alt="문의내역 목록 삭제버튼 이미지" onclick="alert('삭제하시겠습니까?')"></a>


		</div>



	</div>
</div>








<div class="container-fluid">
	<div class="row">
		<div class="offset-lg-5 col-lg-1 text-center notice_01_line ">
			<p class="notice_01_next">
				<a href="#"> < 이전 </a>
		</div>
		<div class="col-lg-1 text-center notice_01_line">
			<p class="notice_01_next">
				<a href="#"> 다음 > </a>

			</p>
		</div>
	</div>

</div>




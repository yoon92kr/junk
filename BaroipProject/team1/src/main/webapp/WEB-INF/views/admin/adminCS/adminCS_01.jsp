<!--  2021.12.03 강보석 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<div class="container-fluid">

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<h1 class="page_title">관리자 페이지</h1>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-2 col-lg-4 text-left cs_01_subtitle">
			<h3>Q&A 관리</h3>
		</div>
		<div class="col-lg-4 text-right cs_02_writebtn">
			<a href="${contextPath}/adminCS_01_01.do"><img
				src="${contextPath}/resources/img/common/cs_write.png"
				alt="Q&A 글쓰기 버튼 이미지"></a>

		</div>
	</div>



	<div class="row">
		<div class="offset-lg-2 col-lg-8">
			<hr>
		</div>
	</div>




	<div class="row">

		<div class="offset-lg-2 col-lg-2 text-center cs_02_02header">
			<span>Q&A 번호</span>
		</div>

		<div class="col-lg-2 text-center cs_02_02header">
			<span>Q&A 제목</span>
		</div>
		<div class="col-lg-2 text-center cs_02_02header">
			<span>작성일</span>
		</div>
		<div class="col-lg-2 text-center cs_02_02header">
			<span>Q&A 변경</span>
		</div>

	</div>

	<div class="row">

		<div class="offset-lg-2 col-lg-2 text-center admincs_01_01listsection">
			<span>[Q&A 번호]</span> <br> <a class="myPage_test-t"
				href="${contextPath}/adminCS_01_03.do"><img
				src="${contextPath}/resources/img/common/Q&A_detatils.png"
				alt="Q&A목록 상세보기 버튼 이미지"></a>
		</div>


		<div class="col-lg-2 text-center admincs_01listsection ">
			<p class="cs">
				<a href="#">[Q&A 제목]</a>
		</div>


		<div class="col-lg-2 text-center admincs_01listsection ">
			<span>[작성일]</span>
		</div>


		<div class="col-lg-2 text-center admincs_01_01listsection ">


			<a class="myPage_test-t" href="${contextPath}/adminCS_01_02.do"><img
				src="${contextPath}/resources/img/common/Q&A_correct.png"
				alt="Q&A 목록 수정버튼 이미지"></a>
			
			<br>
			 <a class="myPage_test-t" href="#"><img
				src="${contextPath}/resources/img/common/Q&A_delete.png"
				alt="Q&A 목록 삭제버튼 이미지"
				onclick="alert('삭제하시겠습니까?')"></a>


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



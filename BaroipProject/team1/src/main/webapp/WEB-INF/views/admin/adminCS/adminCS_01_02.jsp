<!--  2021.11.29 강보석 -->

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
			<h3>Q&A 수정하기</h3>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-2 col-lg-8 cs_02_02_row">
			<hr>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center notice_02_box01">
			<span>제목</span>
		</div>
		<div class="col-lg-4 text-left cs_02_02_box02">
			<input type="text" class="form-control" placeholder="제목을 입력하세요.">
		</div>

	</div>




	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center admincs_02_02_box03">
			<span>내용</span>
		</div>
		<div class="col-lg-4 text-left admincs_02_02_box04">
			<textarea class="form-control" rows="15" placeholder="내용을 입력하세요."></textarea>
		</div>


	</div>


</div>


<div class="container-fluid">

	<div class="row">
		<div class="offset-lg-4 col-lg-2 text-center">
			<div class="cs_correct_btn">
				<a href="#"><img
					src="${contextPath}/resources/img/common/Q&A_correctform.png"
					alt="Q&A 수정하기페이지 수정하기 이미지"></a>
			</div>
		</div>

		<div class="col-lg-2 text-center">
			<div class="notice_back_btn">
				<a href="${contextPath}/adminCS_01.do"><img
					src="${contextPath}/resources/img/common/cs_return.png"
					alt="Q&A 수정하기페이지 돌아가기 버튼 이미지"></a>
			</div>
		</div>



	</div>
</div>




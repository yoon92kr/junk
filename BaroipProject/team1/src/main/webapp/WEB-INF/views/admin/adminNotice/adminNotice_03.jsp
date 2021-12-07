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
			<h3>공지사항 상세보기</h3>
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
			<span>[공지 제목]</span>
		</div>

	</div>




	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center admincs_02_02_box03">
			<span>내용</span>
		</div>
		<div class="col-lg-4 text-left admincs_02_02_box04">
			<span>[공지 내용]</span>
		</div>


	</div>


</div>


<div class="container-fluid">

	<div class="row">


		<div class="offset-lg-5 col-lg-2 text-center">
			<div class="notice_back_btn">
				<a href="${contextPath}/adminNotice_01.do"><img
					src="${contextPath}/resources/img/common/cs_list.png"
					alt="공지사항 상세보기 목록 버튼 이미지"></a>
			</div>
		</div>


	</div>
</div>



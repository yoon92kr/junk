<!--  2021.11.29 강보석 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<div class="container-fluid">

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<h1 class="page_title">고객센터</h1>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-2 col-lg-4 text-left cs_01_subtitle">
			<h3>1:1 문의 내용 작성</h3>
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
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
			<span>문의유형</span>
		</div>
		<div class="col-lg-4 text-left cs_02_02_box02">
			<form>
				<select class="cs_02_select">
					<option value="010">상품문의</option>
					<option value="011">계정문의</option>
					<option value="016">결제문의</option>
					<option value="017">기타문의</option>
				</select>
			</form>

		</div>
	</div>


	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
			<span>공개여부</span>
		</div>
		<div class="col-lg-4 cs_02_02_box02">
			<form>

				<input type="radio" name="chk_info" value="public" checked="checked">
				공개 <input type="radio" name="chk_info" value="private"
					checked="checked" style="margin-left: 100px"> 비공개

			</form>
		</div>


	</div>


	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center notice_02_box01">
			<span>비밀번호</span>
		</div>


		<div class="col-lg-1 text-left cs_02_02_ex01box02">

			<input type="password" class="form-control" placeholder="비밀번호">
		</div>


		<div class="col-lg-3 text-left cs_02_02_ex02box02"></div>


	</div>



	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box03">
			<span>내용</span>
		</div>
		<div class="col-lg-4 text-left cs_02_02_box04">
			<textarea class="form-control" rows="8" placeholder="내용을 입력하세요."></textarea>
		</div>


	</div>


</div>


<div class="container-fluid">

	<div class="row">
		<div class="offset-lg-4 col-lg-2 text-center">
			<div class="cs_correct_btn">
				<form>
					<input type="image"
						src="${contextPath}/resources/img/common/cs_register.png"
						alt="1:1문의 등록 버튼 이미지">
				</form>
			</div>
		</div>

		<div class="col-lg-2 text-center">
			<div class="notice_back_btn">
				<a href="${contextPath}/cs_02.do"><img
					src="${contextPath}/resources/img/common/cs_return.png"
					alt="1:1문의 이전페이지 버튼 이미지"></a>
			</div>
		</div>



	</div>
</div>




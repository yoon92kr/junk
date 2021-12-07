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
		<div class="offset-lg-2 col-lg-4 text-left cs_01_subtitle">
			<h3>상품 후기</h3>
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
			<span>상품명</span>
		</div>
		<div class="col-lg-4 cs_02_02_box02">
			<span>[주문 상품 명]</span>
		</div>


	</div>



	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
			<span>반품/취소사유</span>
		</div>
		<div class="col-lg-4 text-left cs_02_02_box02">
			<form>

				<input type="radio" name="chk_info" value="Very satisfied "
					checked="checked"> 매우 만족 <input type="radio"
					class="mypage_radiobox" name="chk_info" value="Satisfied"
					checked="checked"> 만족 <input type="radio"
					class="mypage_radiobox" name="chk_info" value="Moderately "
					checked="checked"> 보통 <input type="radio"
					class="mypage_radiobox" name="chk_info" value="dissatisfied"
					checked="checked"> 불만족 <input type="radio"
					class="mypage_radiobox" name="chk_info" value="Very dissatisfied"
					checked="checked"> 매우 불만족

			</form>

		</div>
	</div>




	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box03">
			<span>내용</span>
		</div>
		<div class="col-lg-4 text-left cs_02_02_box04">
			<div class="form-group">
				<textarea class="form-control" rows="8" placeholder="내용을 입력하세요."></textarea>
			</div>


		</div>

	</div>
	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
			<span>사진 첨부</span>
		</div>
		<div class="col-lg-4 cs_02_02_box02">
			<input class="form-control" type="file" id="formFileMultiple"
				multiple>
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
						alt="상품후기 등록 버튼 이미지">
				</form>
			</div>
		</div>

		<div class="col-lg-2 text-center">
			<div class="notice_back_btn">
				<a href="${contextPath}/myPage_03.do"><img
					src="${contextPath}/resources/img/common/cs_return.png"
					alt="상품후기 돌아가기 버튼 이미지"></a>
			</div>
		</div>



	</div>
</div>




<!--  2021.11.29 강보석 -->
<!-- 2022.02.14 한건희 수정 -->

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
		<div class="offset-lg-2 col-lg-8 text-left cs_01_subtitle">
			<h3>상품 후기</h3>
		</div>
	</div>
	
	<form id="productCommentForm" enctype="multipart/form-data">
		<div class="row">
			<div class="offset-lg-3 col-lg-2 text-center notice_02_box01">
				<span>제목</span>
			</div>
			<div class="col-lg-4 text-left cs_02_02_box02">
				<input type="text" class="form-control" name="notice_title" placeholder="제목을 입력하세요.">
			</div>
		</div>
	
		<div class="row">
			<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
				<span>상품명</span>
			</div>
			<div class="col-lg-4 cs_02_02_box02">
			<input type="hidden" name="product_id" value="${product_id}">
			<input type="hidden" name="order_id" value="${order_id}">
				<span>${product_main_title}</span>
			</div>
		</div>
	
		<div class="row">
			<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
				<span>상품 평점</span>
			</div>
			<div class="col-lg-4 text-left cs_02_02_box02">
				<input type="radio" name="notice_grade" value="5" checked> 매우 만족 
				<input type="radio" class="mypage_radiobox" name="notice_grade" value="4"> 만족 
				<input type="radio"class="mypage_radiobox" name="notice_grade" value="3"> 보통 
				<input type="radio" class="mypage_radiobox" name="notice_grade" value="2"> 불만족 
				<input type="radio" class="mypage_radiobox" name="notice_grade" value="1"> 매우 불만족
			</div>
		</div>
	
		<div class="row">
			<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box03">
				<span>내용</span>
			</div>
			<div class="col-lg-4 text-left cs_02_02_box04">
				<div class="form-group">
					<textarea name="notice_body" class="form-control" rows="8" placeholder="내용을 입력하세요."></textarea>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
				<span>사진 첨부</span>
			</div>
			<div class="col-lg-4 cs_02_02_box02">
				<input class="notice_upload_check form-control" type="file" name="comment" accept="image/*" id="formFileMultiple">
			</div>
		</div>
	</form>
	
	<div class="row">
		<div class="offset-lg-4 col-lg-2 text-center">
			<div class="cs_correct_btn">
				<input type="button" class="user_btn_Bgreen" onclick="addComment();" value="등록하기">
			</div>
		</div>
		<div class="col-lg-2 text-center">
			<div class="notice_back_btn">
				<input type="button" class="user_btn_gray" onclick="history.go(-1);" value="돌아가기">
			</div>
		</div>
	</div>
	
</div>

<script>
	function addComment() {
		// 전체 input 태그 value를 체크하기위한 클래스 select
		var elements = document.getElementsByClassName('notice_upload_check');
		var checkFlag = true;
		for (var i = 0; i < elements.length; i++) {

			let uploadItem = elements[i].value;
			// 비어있는 파일이 하나라도 있다면 flag를 false로 대입.
			if (!uploadItem) {
				checkFlag = false;
			}

		}
		
		if(!checkFlag) {
			alert("제목과 내용, 사진은 반드시 입력해주셔야 합니다.");
		}
		
		if (checkFlag) {
			let form = document.getElementById('productCommentForm');
			
			form.method="POST";
			form.action="${contextPath}/myPage/myComment/commentAdd.do";
			form.submit();
			
		}
	}
</script>


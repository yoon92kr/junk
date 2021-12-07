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
			<h3>문의 내역</h3>
		</div>
	</div>
	
	
	<div class="row">
		<div class="offset-lg-2 col-lg-8 cs_02_02_row">
			<hr>
		</div>
	</div>
	
	
	   <div class="row">
        <div class="offset-lg-3 col-lg-2 text-center notice_02_box01" ><span>제목</span></div>
        <div class="col-lg-4 text-center cs_02_02_box02"><span>[문의 제목]</span></div>
        </div>
        
        <div class="row">
        <div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01" ><span>문의 유형</span></div>
        <div class="col-lg-4 text-center cs_02_02_box02"><span>[문의 유형]</span></div>
        </div>
        
         <div class="row">
        <div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01" ><span>문의 상품명</span></div>
        <div class="col-lg-4 text-center cs_02_02_box02"><span>[문의 상품명]</span></div>
        </div>
        
        <div class="row">
        <div class="offset-lg-3 col-lg-2 text-center cs_02_02_box03" ><span>내용</span></div>
        <div class="col-lg-4 text-center cs_02_02_box04"><span>[문의 내용]</span></div>
    </div>
    <div class="row">
        <div class="offset-lg-3 col-lg-2 text-center cs_02_02_box03" ><span>답변</span></div>
        <div class="col-lg-4 text-center cs_02_02_box04"><span>[관리자 답변 내용]</span></div>
	
	
	
	
	</div>
	</div>

		
		
<div class="container-fluid">

<div class="row">
<div class="offset-lg-3 col-lg-2 text-center">
				<div class="notice_back_btn">
					<form>
					<input type="image"
						src="${contextPath}/resources/img/common/cs_correct_01.png" alt="mypage06 문의 수정하기 버튼 이미지">
						</form>
				</div>
			</div>
		
		  <div class="col-lg-2 text-center">
				<div class="notice_back_btn">
					<a href="${contextPath}/myPage_06.do"><img
						src="${contextPath}/resources/img/common/cs_list.png" alt="mypage06 문의내역 목록 버튼 이미지"></a>
				</div>
			</div>
			
			<div class="col-lg-2 text-center">
				<div class="notice_back_btn">
					<a href="#"><img
						src="${contextPath}/resources/img/common/cs_delete_01.png" alt="mypage06 문의 삭제하기 버튼 이미지"
						onclick="alert('삭제하시겠습니까?')"></a>
				</div>
			</div>
			
			</div>
			</div>
		
	
	
	
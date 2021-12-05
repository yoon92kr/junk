<!-- 2021.11.30 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-10 offset-lg-1 text-left product_02_mini_category_text product_03_mini_category_text">
			<a href="${contextPath}/product_02.do">상품 상세정보</a> 
			<a href="${contextPath}/product_03.do">고객 후기</a> 
			<a href="${contextPath}/product_04.do">배송 / 교환 /반품 안내</a> 
			<a href="${contextPath}/product_05.do">상품 문의</a>
		</div>
	</div>
	
	<div class="row">
	<div class="col-lg-2 offset-lg-1">
	<img class="product_03_main_img" src="${contextPath}/resources/img/common/img-box.jpg" alt="고객후기 대표 이미지">
	</div>
	
	<div class="col-lg-7 text-center">
	<div class="product_03_title">상품 상세 이름</div>	
	</div>
	
	</div>
	
	    <div class="row">

        <div class="offset-lg-1 col-lg-2 text-center product_detail_title_header" ><span>번호</span></div>
        <div class="col-lg-1 text-left product_detail_title_header"><span>작성자</span></div>
        <div class="col-lg-4 text-center product_detail_title_header"><span>제목</span></div>
        <div class="col-lg-3 text-center product_detail_title_header"><span>작성일자</span></div>
        <hr>
        </div>
        
        <div class="row">
        <div class="offset-lg-1 col-lg-2 text-center notice_01_section"><span>[글번호]</span></div>
        <div class="col-lg-1 text-left notice_01_section"><span>[작성자]</span></div>
        <div class="col-lg-1  notice_01_section">
        <img class="product_03_user_img" src="${contextPath}/resources/img/common/img-box.jpg" alt="고객후기 첨부 이미지">
        </div>
        <div class="col-lg-3 text-center notice_01_section">
		<a>
		<span class="">[게시글 제목]</span>
		</a>
		
        </div>
        <div class="col-lg-3 text-center notice_01_section"><span>[게시글 작성 일자]</span></div>
        </div>
        
                <div class="row">
        <div class="offset-lg-1 col-lg-2 text-center notice_01_section"><span>[글번호]</span></div>
        <div class="col-lg-1 text-left notice_01_section"><span>[작성자]</span></div>
        <div class="col-lg-1  notice_01_section">
        <img class="product_03_user_img" src="${contextPath}/resources/img/common/img-box.jpg" alt="고객후기 첨부 이미지">
        </div>
        <div class="col-lg-3 text-center notice_01_section">
        		<a>
		<span class="">[게시글 제목]</span>
		</a>
		

		
        </div>
        <div class="col-lg-3 text-center notice_01_section"><span>[게시글 작성 일자]</span></div>
        </div>
	
	    <div class="row">

        <div class="offset-lg-5 col-lg-1 product_05_footer_button" >
        <span>< 이전</span>
        </div>
        
        <div class="col-lg-1 product_05_footer_button">
        <span>다음 ></span>
        </div>
        
        </div>		
	</div>
	
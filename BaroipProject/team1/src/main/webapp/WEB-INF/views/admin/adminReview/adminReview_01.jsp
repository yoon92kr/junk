<!-- 2021.12.03 임석희 adminReview_01 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">
<div class="MyPage_title">
    <div class="row">
        <div class="col-lg-4 offset-lg-4 text-center"><h1 class="page_title">관리자 페이지</h1></div>
    </div>
		
    	<div class="row">
    		<div class="col-lg-2 text-center MyPage_padding">후기 관리</div>
    		
    <div class="container">
	    <div class="MyPage_top-underline"></div>
    </div>
    </div>
    </div>
    
	<div class="row">
        <div class="col-lg-4 text-center adminUser_01-content-header">
        	조회 유형
        	<select class="adminUser_01-select-box-lookup" onchange="selectLookup(this.value)">
        			<option value="ranking">회원 등급</option>
			        <option value="joinDate">가입일</option>
			        <option value="lastAccess">최종 접속일</option>
			        <option value="id">아이디</option>
			        <option value="birthYear">생년월일</option>
        		</select>
        </div>
        <div class="col-lg-4 text-center adminUser_01-content-header">
        	조회 기준
        	<select id="adminUser_01-member-ranking-text" class="adminUser_01-select-box-lookup">
        			<option value="일반">일반 회원</option>
        			<option value="우수">우수 회원</option>
        			<option value="단골">단골 회원</option>
        			<option value="FLEX">FLEX 회원</option>
        		</select>

        		<input id="adminUser_01-member-date-text" class="adminUser_01-select-box-lookup" type="date"> 
        		<input id="adminUser_01-member-id-text" class="adminUser_01-select-box-lookup" type="text">
        </div>
        <div class="col-lg-4 text-center adminUser_01-content-header">
        <form>
			<input type="radio" name="answer" checked="checked" value="전체" /> 전체 
			<input type="radio" name="answer" class="adminReview_01-radio-box" value="답변" /> 답변 
			<input type="radio" name="answer" class="adminReview_01-radio-box" value="미답변" /> 미답변 
        	<input class="adminUser_01-button-top" type="button" value="조회하기">
		</form>
        </div>
    </div>
 
    <div class="row">
		<div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">후기 번호</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">후기 상품</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">후기 평점</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">작성자ID</h6>
	    </div>
	    <div class="col-lg-4 text-left order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text AdminReview_01-text-position">후기 제목</h6>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-2 text-center order_01-content-item">
        	<div>[후기 번호]</div>
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[후기 상품]
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[후기 평점]
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[작성자ID]
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[후기 제목]
        </div>
        <div class="col-lg-2 text-center adminProduct_01-content-item">
        	<input class="adminProduct_01-product adminProduct_01-product-top" type="button" value="후기 삭제" onclick="review_cancel()">
        	<input class="adminProduct_01-product" type="button" value="답변 작성" onclick="location.href='${contextPath}/adminReview_01_01.do'">
        </div>
	</div>
	
	<div class="MyPage_03_bottom_return_next">
		<div class="row">
        	<div class="col-lg-2 text-center MyPage_03_left_text">◁이전</div>
        	<div class="col-lg-2 text-center MyPage_03_right_text">다음▷</div>
	    </div>
	</div>
</div>


<script type="text/javascript">
	function review_cancel() {
		let returnValue = confirm('삭제하시겠습니까?');	
	}
</script>
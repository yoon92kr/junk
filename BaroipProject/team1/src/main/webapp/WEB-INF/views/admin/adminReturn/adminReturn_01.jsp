<!-- 2021.12.02 임석희 adminReturn_01 -->

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
    		<a href="${contextPath}/adminOrder.do" class="col-lg-2 text-center MyPage_padding MyPage_title_02 adminOrder_hov">주문 관리</a>
    		<div class="col-lg-10 text-left MyPage_padding">반품 / 교환</div>
    		
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
	        <h6 class="order_01-content-hedaer-text">회원아이디</h6>
	    </div>
	    <div class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">주문 내역</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">결제 금액</h6>
	    </div>
	    <div class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">반품 / 교환 사유</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">승인 / 거절</h6>
	    </div>
	</div>
    
    
   	<div class="AdminReturn_center-box-01 text-center">
	<div class="row">
        <div class="col-lg-2 text-center">
        	<div>[회원아이디]</div>
        	<input class="MyPage_03-submit-box-01" type="button" value="반품 신청서 확인" onclick="location.href='${contextPath}/adminReturn_02.do'">
        	<input class="MyPage_03-submit-box-01" type="button" value="주문 상세 정보" onclick="location.href='${contextPath}/myPage_03_01.do'">
        </div>
        	<div class="col-lg-2 MyPage_03_text_position_04">[주문 상품 명]</div>
        	<div class="col-lg-2 MyPage_03_text_position_04">[결제 금액]</div>
        	<div class="col-lg-2 MyPage_03_text_position_04">[반품 / 교환 사유]</div>
        	<div class="col-lg-2 MyPage_03_text_position_03">
        <div>
        	<input class="MyPage_03-submit-box-01" type="button" value="수 락" onclick="order_cancel()">
        	<input class="MyPage_03-submit-box-01" type="button" value="거 절" onclick="order_cancel()">
        </div>
        	</div>
        </div>
    </div>
</div>

<script type="text/javascript">
function selectLookup(selectValue) {
	
    let adminUser_01_member_ranking = '#adminUser_01-member-ranking-text';
    let adminUser_01_member_joinDate = '#adminUser_01-member-date-text';
    let adminUser_01_member_lastAccess = '#adminUser_01-member-date-text';
    let adminUser_01_member_id = '#adminUser_01-member-id-text';
    let adminUser_01_member_birthYear = '#adminUser_01-member-date-text';

    let adminUser_member = '#adminUser_01-member-'.concat(selectValue, '-text');


    if (adminUser_member == adminUser_01_member_ranking) {
       document.querySelector(adminUser_01_member_ranking).style.display = 'inline';
       document.querySelector(adminUser_01_member_joinDate).style.display = 'none';
       document.querySelector(adminUser_01_member_lastAccess).style.display = 'none';
       document.querySelector(adminUser_01_member_birthYear).style.display = 'none';
       document.querySelector(adminUser_01_member_id).style.display = 'none';
    }
    else if (adminUser_member == adminUser_01_member_id) {
       document.querySelector(adminUser_01_member_id).style.display = 'inline';
       document.querySelector(adminUser_01_member_ranking).style.display = 'none';
       document.querySelector(adminUser_01_member_joinDate).style.display = 'none';
       document.querySelector(adminUser_01_member_lastAccess).style.display = 'none';
       document.querySelector(adminUser_01_member_birthYear).style.display = 'none';
    }
    else if (adminUser_member == adminUser_01_member_joinDate || adminUser_01_member_lastAccess || adminUser_01_member_birthYear) {
       document.querySelector(adminUser_01_member_joinDate).style.display = 'inline';
       document.querySelector(adminUser_01_member_lastAccess).style.display = 'inline';
       document.querySelector(adminUser_01_member_birthYear).style.display = 'inline';
       document.querySelector(adminUser_01_member_ranking).style.display = 'none';
       document.querySelector(adminUser_01_member_id).style.display = 'none';
    }

 }
</script>
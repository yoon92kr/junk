<!-- 2021.12.06 강보석  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">
<div class="MyPage_title">
    	<div class="row">
    		<div class="col-lg-2 text-center MyPage_padding AdminReview_01-top">문의 관리</div>
    		
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
			        <option value="joinDate">문의기간</option>
			        <option value="id">상세조회</option>
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
			<input type="radio" name="chk_info" value="Very satisfied "
					checked="checked"> 전체
					<input type="radio"
					class="mypage_radiobox" name="chk_info" value="Satisfied">답변
					<input type="radio" 
					class="mypage_radiobox" name="chk_info" value="Moderately ">미답변
        	<input class="adminUser_01-button-top" type="button" value="조회하기">
		</form>
		
        </div>
    </div>
 
    <div class="row">
		<div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">문의 번호</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">문의 유형</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">문의 상품</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">작성자ID</h6>
	    </div>
	    <div class="col-lg-4 text-left order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text AdminReview_01-text-position">문의 제목</h6>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-2 text-center order_01-content-item">
        	<div>[문의 번호]</div>
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[문의 유형]
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[문의 상품]
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[작성자ID]
        </div>
        <div class="col-lg-2 text-center order_01-content-item">
        	[문의 제목]
        </div>
        <div class="col-lg-2 text-center adminProduct_01-content-item">
        	<input class="adminProduct_01-product adminProduct_01-product-top" 
        	 type="button" value="후기 삭제" onclick="alert('삭제하시겠습니까?')">
        	 <form action="${contextPath}/adminCS_02_01.do">
        	<input class="adminProduct_01-product" type="submit"  value="답변 작성">
        	</form>
        	
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
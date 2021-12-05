<!-- 2021.11.30 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">

    <div class="row">
        <div class="col-lg-8 offset-lg-2 text-center">
        	<h1 class="page_title">마이 페이지</h1>
        </div>
	</div>
	
	<div class="row">
        <div class="col-lg-12 text-left myPage_03_01-content-body">
        	<h6 class="order_01-sub-title-page">
        		<span class="order_01-sub-title">회원 관리</span>
        	</h6>
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
        	<input class="adminUser_01-button-top" type="button" value="조회하기">
        	<input class="adminUser_01-button-top" type="button" value="삭제하기">
        </div>
    </div>
    
    <div class="row">
		<div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">회원 아이디</h6>
	    </div>
	    <div class="col-lg-1 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">회원 등급</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">누적 구매액</h6>
	    </div>
	    <div class="col-lg-1 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">총 구매 건</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">최초 가입일</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">최종 접속일</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">회원 권한 수정</h6>
	    </div>
	</div>
	
	<div class="row">
        <div class="col-lg-2 text-center adminUser_01-member-change-item-name">
        	<div>[회원 아이디]</div>
        	<form action="adminUser_02.do">
        	<input class="adminUser_01-member-detail-lookup-btn" type="submit" value="회원 정보 수정">
        	</form>
        </div>
        <div class="col-lg-1 text-center adminUser_01-member-change-item">
        	[회원 등급]
        </div>
        <div class="col-lg-2 text-center adminUser_01-member-change-item">
        	[회원 누적 구매액]
        </div>
        <div class="col-lg-1 text-center adminUser_01-member-change-item">
        	[누적 건]
        </div>
        <div class="col-lg-2 text-center adminUser_01-member-change-item">
        	[회원 가입일]
        </div>
        <div class="col-lg-2 text-center adminUser_01-member-change-item">
        	[회원 접속일]
        </div>
        <div class="col-lg-2 text-center adminUser_01-member-change-item">
        <form class="admin_01-user-ranking">
        	<select class="adminUser_01-ranking">
        		<option value="0">비회원</option>
			    <option value="1">회원</option>
			    <option value="2">관리자1</option>
			    <option value="3">관리자2</option>
        	</select>
        	<input class="adminUser_01-ranking" type="submit" value="변경">
        </form>
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
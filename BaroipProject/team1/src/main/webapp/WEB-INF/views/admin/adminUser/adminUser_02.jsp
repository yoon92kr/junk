<!-- 2021.12.02 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">

    <div class="row">
        <div class="col-lg-6 offset-lg-3 text-center">
        	<h1 class="page_title">관리자 페이지</h1>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-12 text-left myPage_03_01-content-body">
        	<h6 class="order_01-sub-title-page">
        		<span class="order_01-sub-title">회원 상세 정보</span>
        	</h6>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center join_02-main-left">
        	아이디
        </div>
        <div class="col-lg-10 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text" disabled>
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center join_02-main-left">
        	비밀번호
        </div>
        <div class="col-lg-10 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="password">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center join_02-main-left">
        	가입일
        </div>
        <div class="col-lg-10 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text" disabled>
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center join_02-main-left">
        	이 름
        </div>
        <div class="col-lg-10 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center join_02-main-left">
        	생년월일
        </div>
        <div class="col-lg-10 join_02-main-right">
        	<form>
        		<select class="join_02-year-month-day" 
        		id="select_year" onchange="javascript:lastday();" disabled></select> 
        		<span class="join_02-year-month-day-text">년</span>
        		<select class="join_02-year-month-day" 
        		id="select_month" onchange="javascript:lastday();" disabled></select> 
        		<span class="join_02-year-month-day-text">월</span>
        		<select class="join_02-year-month-day" 
        		id="select_day" onchange="javascript:lastday();" disabled></select> 
        		<span class="join_02-year-month-day-text">일</span>
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center join_02-main-left">
        	핸드폰 번호
        </div>
        <div class="col-lg-10 join_02-main-right">
        	<form>
        		<select class="join_02-mobile">
        			<option value="010">010</option>
        			<option value="011">011</option>
        			<option value="016">016</option>
        			<option value="017">017</option>
        			<option value="019">019</option>
        			<option value="070">070</option>
        		</select> - 
        		<input class="join_02-mobile-02" type="number"> - 
        		<input class="join_02-mobile-02" type="number">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center join_02-main-left">
        	회원 등급
        </div>
        <div class="col-lg-10 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center join_02-main-left">
        	누적 구매액
        </div>
        <div class="col-lg-10 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text" disabled>
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center join_02-main-left">
        	주 소
        </div>
        <div class="col-lg-10 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center join_02-main-left">
        	상세 주소
        </div>
        <div class="col-lg-10 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-4 offset-lg-2 join_02-bottom-btn">
        	<div class="join_01-btn">
	        	<a class="join_01-back" href="${contextPath}/adminUser_01.do">
					<img class="join_01-btn-img bottom_btn_size" src="${contextPath}/resources/img/common/user_list_btn.png" alt="회원 목록 이동 버튼 이미지">
			    </a>
		    </div>
        </div>
		<div class="col-lg-4 join_02-bottom-btn">
        	<div class="join_01-btn">
	        	<a class="adminUser_02-btn-color" href="javascript:userInfoCange()">
					<img class="bottom_btn_size join_01-btn-img" src="${contextPath}/resources/img/common/user_info_change_btn.png" alt="회원정보 수정 버튼 이미지">
			    </a>
		    </div>
        </div>
    </div>

</div>

<!-- 생년월일 값 -->
<script>
var start_year="1970"; //시작 년도
var today = new Date();
var today_year = today.getFullYear();
var index = 0;
// start_year ~ 현재 년도
for(var y = start_year; y <= today_year; y++) {
	document.getElementById('select_year').options[index] = new Option(y, y);
	index++;
}
index = 0;
for(var m = 1; m <= 12; m++) {
	document.getElementById('select_month').options[index] = new Option(m, m);
	index++;
}

lastday();

//년과 월에 따라 마지막 일 구하기
function lastday() {
	var Year = document.getElementById('select_year').value;
	var Month = document.getElementById('select_month').value;
	var day = new Date(new Date(Year,Month,1)-86400000).getDate();
	
	var dayIndex_len = document.getElementById('select_day').length;
	if(day > dayIndex_len) {
		for(var i = (dayIndex_len + 1); i <= day; i++) {
			document.getElementById('select_day').options[i - 1] = new Option(i, i);
		}
	}
	else if(day < dayIndex_len) {
		for(var i = dayIndex_len; i >= day; i--) {
			document.getElementById('select_day').options[i] = null;
		}
	}
}

function userInfoCange() {
	if(confirm("회원 정보를 수정하시겠습니까?") == true) {
		alert("수정 되었습니다.");
		location.href = "${contextPath}/adminUser_01.do";
	}
	else {
		return;
	}
}
</script>


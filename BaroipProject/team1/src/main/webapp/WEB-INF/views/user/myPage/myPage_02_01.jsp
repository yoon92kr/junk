<!-- 2021.11.25 임석희 mypage_02_01 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">
<div class="MyPage_title">
    <div class="row">
        <div class="col-lg-4 offset-lg-4 text-center"><h1 class="page_title">마이 페이지</h1></div>
    </div>
		
    	<div class="row">
    	<div class="col-lg-2 text-center"><img src="${contextPath}/resources/img/common/basic_member_icon.png" alt="회원정보수정페이지 회원등급 이미지"></div>
    		<div class="col-lg-10 text-left MyPage_padding">회원정보 수정</div>
    		
    <div class="container">
	    <div class="MyPage_top-underline"></div>
    </div>
    </div>
    </div>
</div>

<div class="container">
	<div class="MyPage_02_01_top">
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	아이디
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        	<form>
        		<input class="MyPage_02_01_text-box" type="text">
        		<input class="MyPage_02_01-submit-box" type="submit" value="중복 확인">
        	</form>
        </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	비밀번호
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        	<form>
        		<input class="MyPage_02_01_text-box" type="password">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	비밀번호 확인
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        	<form>
        		<input class="MyPage_02_01_text-box" type="password">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	이 름
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        	<form>
        		<input class="MyPage_02_01_text-box" type="text">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	생년월일
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        	<form>
        		<select class="MyPage_02_01-year-month-day"
        		id="select_year" onchange="javascript:lastday();"></select> 
        		<span class="MyPage_02_01-year-month-day-text">년</span>
        		<select class="MyPage_02_01-year-month-day" 
        		id="select_month" onchange="javascript:lastday();"></select> 
        		<span class="MyPage_02_01-year-month-day-text">월</span>
        		<select class="MyPage_02_01-year-month-day" 
        		id="select_day" onchange="javascript:lastday();"></select> 
        		<span class="MyPage_02_01-year-month-day-text">일</span>
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	핸드폰 번호
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        	<form>
        		<select class="MyPage_02_01-mobile">
        			<option value="010">010</option>
        			<option value="011">011</option>
        			<option value="016">016</option>
        			<option value="017">017</option>
        			<option value="019">019</option>
        			<option value="070">070</option>
        		</select> - 
        		<input class="MyPage_02_01-mobile-02" type="number"> - 
        		<input class="MyPage_02_01-mobile-02" type="number">
        		<input class="MyPage_02_01-submit-box-02" type="submit" value="인증번호 전송">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	인증 번호
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        	<form>
        		<input class="MyPage_02_01_text-box" type="text">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	주 소
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        	<form>
        		<input class="MyPage_02_01_text-box" type="text">
        		<input class="join_02-submit-box" type="submit" value="우편번호 검색">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	상세 주소
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        	<form>
        		<input class="MyPage_02_01_text-box" type="text">
        	</form>
        </div>
    </div>

	<div class="row">
    	<div class="col-lg"><hr>
    </div>
    
    <div class="container">
    <div class="MyPage_02_01_button">
      <div class="row">
    	<a href="myPage_01.do" class="col-lg-3 text-center MyPage_02_01_button_03">수정하기</a>
    	<a href="myPage_01.do" class="col-lg-3 text-center MyPage_02_01_button_04">돌아가기</a>
    	<a href="dropOut_01.do" class="col-lg-3 text-center MyPage_02_01_button_05">탈퇴하기</a>
      </div>
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
</script>
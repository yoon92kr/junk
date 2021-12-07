<!-- 2021.11.25 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<div class="container-fluid">

    <div class="row">
        <div class="col-lg-6 offset-lg-3 text-center">
        	<h1 class="page_title">회원가입</h1>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-10 offset-lg-1 text-center">
	        <h4 class="join-sub-title">01. 약관동의 > 
	        	<span class="join_01-sub-title">02. 정보입력</span>
	        </h4>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-8 offset-lg-2">
        	<div class="join_02-top">
        		가입정보 입력
        	</div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	아이디
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        		<input class="join_02-submit-box" type="submit" value="중복 확인">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	비밀번호
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<input id="join_02_password" class="join_02-text-box" type="password">
        		<span class="join_02_pass_info">※ 비밀번호는 영문(소) / 숫자 / 특수문자가 포함되어야 합니다.</span>
        	</form>
        </div>
    </div>
    <!-- input창 password에 id = 나중에 비밀번호 유효성 검사 위해 넣어놓음 -->
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	비밀번호 확인
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<input id="join_02_passowrd_check" class="join_02-text-box" type="password">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	이 름
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	생년월일
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<select class="join_02-year-month-day" 
        		id="select_year" onchange="javascript:lastday();"></select> 
        		<span class="join_02-year-month-day-text">년</span>
        		<select class="join_02-year-month-day" 
        		id="select_month" onchange="javascript:lastday();"></select> 
        		<span class="join_02-year-month-day-text">월</span>
        		<select class="join_02-year-month-day" 
        		id="select_day" onchange="javascript:lastday();"></select> 
        		<span class="join_02-year-month-day-text">일</span>
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	핸드폰 번호
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form onsubmit="return false;">
        		<select class="join_02-mobile">
        			<option value="010">010</option>
        			<option value="011">011</option>
        			<option value="016">016</option>
        			<option value="017">017</option>
        			<option value="019">019</option>
        		</select> - 
        		<input id="join_02_mobile_center" class="join_02-mobile-02" type="number" oninput="join_02_mobile_number(this, 4)"> - 
        		<input id="join_02_mobile_last" class="join_02-mobile-02" type="number" oninput="join_02_mobile_number(this, 4)">
        		<input class="join_02-submit-box-02" type="submit" value="인증번호 전송" onclick="numberCheck(this)">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	인증 번호
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        		<input class="join_02-submit-box" type="submit" value="인증번호 확인">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	주 소
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        		<input class="join_02-submit-box" type="submit" value="우편번호 검색">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
        	상세 주소
        </div>
        <div class="col-lg-7 join_02-main-right">
        	<form>
        		<input class="join_02-text-box" type="text">
        	</form>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-4 offset-lg-2 join_02-bottom-btn">
        	<div class="join_01-btn">
	        	<a class="join_01-back" href="${contextPath}/user/join_01.do">
					<img class="bottom_btn_size" src="${contextPath}/resources/img/common/back_page_btn.png" alt="회원가입 정보입력 이전페이지 버튼 이미지">
			    </a>
		    </div>
        </div>
		<div class="col-lg-4 join_02-bottom-btn">
        	<div class="join_01-btn">
	        	<form  class="join_01-next" action="${contextPath}/user/join_03.do">
	        		<input class="bottom_btn_size" type="image" src="${contextPath}/resources/img/common/join_btn.png" alt="회원가입 정보입력 가입하기 버튼 이미지">
	        	</form>
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

/* 핸드폰 중간 및 마지막 번호 text 4자리로 제한 */
function join_02_mobile_number(el, maxlength) {
	if(el.value.length > maxlength) {
		el.value = el.value.substr(0, maxlength);
	}
}

/* 핸드폰 번호 확인 이벤트 */
function numberCheck(center, last) {
        let join_02_mobile_center = document.getElementById('join_02_mobile_center').value
        let join_02_mobile_last = document.getElementById('join_02_mobile_last').value

		if(join_02_mobile_center.length < 3) {
			alert( '핸드폰 번호를 확인해 주세요' );
 		}
		else if(join_02_mobile_last.length != 4) {
 			alert('핸드폰 번호를 확인해 주세요');
 		}
  }

</script>


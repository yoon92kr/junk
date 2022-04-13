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
 <form action="${contextPath}/myPage/update_MyInfo.do" method="post" id="myPage_user_update">
	<div class="MyPage_02_01_top">
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	아이디
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        		<input class="MyPage_02_01_text-box check_update_form background_gray" type="text" value="${userInfo.user_id}" readonly name="user_id">
        </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	비밀번호
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        		<input id="pw1" class="MyPage_02_01_text-box" type="password" name="user_pw">
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	비밀번호 확인
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        		<input id="pw2"  class="MyPage_02_01_text-box" type="password">
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	이 름
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        		<input class="MyPage_02_01_text-box check_update_form background_gray" type="text" value="${userInfo.user_name}" readonly name="user_name">
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	생년월일
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        
        		<input class="MyPage_02_01-year-month-day check_update_form background_gray" type="text" value="${userInfo.user_birth_year}" readonly name="user_birth_year"> 
        		<span class="MyPage_02_01-year-month-day-text">년</span>
        		<input class="MyPage_02_01-year-month-day check_update_form background_gray" type="text" value="${userInfo.user_birth_month}" readonly name="user_birth_month"> 
        		<span class="MyPage_02_01-year-month-day-text">월</span>
        		<input class="MyPage_02_01-year-month-day check_update_form background_gray" type="text" value="${userInfo.user_birth_day}" readonly name="user_birth_day"> 
        		<span class="MyPage_02_01-year-month-day-text">일</span>
        	
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	이메일
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        		<input class="MyPage_02_01_text-box check_update_form" type="text" value="${userInfo.user_email}" name="user_email">
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	핸드폰 번호
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        		<select id="myPage_02_01_mobile1" class="MyPage_02_01-mobile check_update_form" name="user_mobile_1">
        			<option value="010">010</option>
        			<option value="011">011</option>
        			<option value="016">016</option>
        			<option value="017">017</option>
        			<option value="019">019</option>
        			<option value="070">070</option>
        		</select> - 
        		<input id="myPage_02_01_mobile2" class="MyPage_02_01-mobile-02 check_update_form" type="number" oninput="myPage_02_01_mobile_number(this, 4)" value="${userInfo.user_mobile_2}" name="user_mobile_2"> - 
        		<input id="myPage_02_01_mobile3" class="MyPage_02_01-mobile-02 check_update_form" type="number" oninput="myPage_02_01_mobile_number(this, 4)" value="${userInfo.user_mobile_3}" name="user_mobile_3">
        		<input class="MyPage_02_01-submit-box-02" type="button" value="인증번호 전송"
        			onclick="mobileNumberCheck_02();">
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	인증 번호
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
       		<input id="mobileNumber" class="MyPage_02_01_text-box" type="text">
       		<input id="mobileCheckNumber" type="hidden">
       		<input id="randomNumberCheck" class="join_02-submit-box" type="button" value="인증번호 확인" onclick="chckMobile_02();">
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	주 소
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        		<input class="MyPage_02_01_text-box check_update_form" type="text" value="${userInfo.user_new_address}" name="user_new_address">
        		<input class="join_02-submit-box" type="submit" value="우편번호 검색">
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-2 text-center MyPage_02_01_menu-left">
        	상세 주소
        </div>
        <div class="col-lg-9 MyPage_02_01_menu-right">
        		<input class="MyPage_02_01_text-box check_update_form" type="text" value="${userInfo.user_detail_address}" name="user_detail_address">
        </div>
    </div>
</form>

	<div class="row">
    	<div class="col-lg"><hr>
    </div>
    
    <div class="container">
      <div class="row">
    	<a href="#" onclick="submit_mypage_info_update()" class="col-lg-offset-3 col-lg-3 col-lg-offset-1 MyPage_02_01_button_03 text-center">수정하기</a>
	   	<a href="${contextPath}/myPage/myInfo.do" class="col-lg-3 text-center MyPage_02_01_button_04">돌아가기</a>
    	<a href="${contextPath}/myPage/dropOut_form.do" class="col-lg-3 text-center MyPage_02_01_button_05">탈퇴하기</a>
      </div>
    </div>
    </div>
</div>


<script>

/* 핸드폰 중간 및 마지막 번호 text 4자리로 제한 */
function myPage_02_01_mobile_number(el, maxlength) {
	if (el.value.length > maxlength) {
		el.value = el.value.substr(0, maxlength);
	}
}

/* 핸드폰번호 인증 */
function mobileNumberCheck_02() {
	
	let mobile1 = document.getElementById("myPage_02_01_mobile1").value;
	let mobile2 = document.getElementById("myPage_02_01_mobile2").value;
	let mobile3 = document.getElementById("myPage_02_01_mobile3").value;
	
	if(mobile2.length < 3) {
		
		alert("핸드폰 번호를 확인해 주세요.");
		mobile2.focus();
		return false;
		
	} else if(mobile3.length < 4) {
		
		alert("핸드폰 번호를 확인해 주세요.");
		mobile3.focus();
		return false;
		
	}
	
	let mobile = mobile1 + mobile2 + mobile3;
	
	$.ajax({
		url:"${contextPath}/user/userMobileCheck.do", 
		type:"POST", 
		dataType:"text",
		data: {
			"mobile": mobile
		}, success: function(randomNumber) {
			alert("인증번호가 전송되었습니다.");
			document.getElementById("mobileCheckNumber").value = randomNumber.toString();
		}
	}).error(function() {
		alert("모바일 인증 에러");
	});
}

/* 모바일 인증번호 확인 */
function chckMobile_02() {
	
	let user_number = document.getElementById("mobileNumber");
	let randomNumber = document.getElementById("mobileCheckNumber");
	
	if(user_number.value == randomNumber.value) {
		alert("인증이 완료되었습니다.");
	} else {
		alert("인증번호가 맞지 않습니다.");
		return false;
	} 
}

//회원정보수정 전, 비어있는 input 태그 확인 스크립트
function submit_mypage_info_update() {
	
	var elements = document.getElementsByClassName(' check_update_form'); // 전체 양식 조회
	var checkFlag = true;
	for(var i = 0; i < elements.length; i++){
		
		let uploadItem = elements[i].value;
		
		// 비어있는 양식이 하나라도 있다면 flag를 false로 대입.

		if(!uploadItem) {
			checkFlag = false;
		}

		
	}
	
	
	
	if (checkFlag == true) {
		
		let pw1 = document.getElementById('pw1').value;
		let pw2 = document.getElementById('pw2').value;
		
		// 비밀번호 입력시 공백여부 확인
		if (pw1.match(/\s/g)) {
			alert("비밀번호에 공백은 포함될 수 없습니다.");
		}
		// 비밀번호 미입력시 기존 비밀번호 입력
		else if(pw1 == null || pw1 == ""){
			document.getElementById('pw1').value = "${userInfo.user_pw}";
			document.getElementById('myPage_user_update').submit();
		}
		
		// 비밀번호 입력시 일치여부 확인
		else {			
			
			if(pw1 == pw2) {
				document.getElementById('myPage_user_update').submit();
			}
			else {
				alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			}
			
		}

	    
	}

	else {
		alert("비어있는 항목이 존재합니다. 다시 확인해주세요");
	}
}



</script>




<!-- 생년월일 값 -->
<!-- 
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
 -->
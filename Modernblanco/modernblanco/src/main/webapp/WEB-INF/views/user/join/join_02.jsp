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
			<h4 class="join-sub-title">
				01. 약관동의 > <span class="join_01-sub-title">02. 정보입력</span>
			</h4>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-8 offset-lg-2">
			<div class="join_02-top">가입정보 입력</div>
		</div>
	</div>
	
	<form action="${contextPath}/user/addUser.do" name="joinNewUser" method="post">
		
		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				아이디
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input id="join_02_user_new_id" class="join_02-text-box" type="text" 
					name="user_id">
				<input id="join_02_user_id_overlap_btn" class="join_02-submit-box" 
					type="button" name="idOverLapCheck" value="중복 확인" onClick="idOverlap();">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				비밀번호
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input id="join_02_password" class="join_02-text-box"
					type="password" name="user_pw"> 
				<span class="join_02_pass_info">
					※ 비밀번호는 영문(소) / 숫자 / 특수문자가 포함되어야 합니다.
				</span>
			</div>
		</div>
		<!-- input창 password에 id = 나중에 비밀번호 유효성 검사 위해 넣어놓음 -->
		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				비밀번호 확인
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input id="join_02_passowrd_check" class="join_02-text-box"
					type="password">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				이 름
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input id="join_02_userName" class="join_02-text-box" type="text" name="user_name">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				이메일
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input id="join_02_email" class="join_02-text-box" type="email" name="user_email">
			<%-- 	<input class="join_02-submit-box" type="button" value="이메일 인증번호 전송" onclick="checkEmail();"> --%>
			</div>
		</div>
	<%-- 
		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				이메일 인증
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input id="join_02_emailCheck" class="join_02-text-box" type="text"> 
				<input id="join_02_emailCheckNum" type="hidden">
				<input class="join_02-submit-box" type="button" value="이메일 인증 확인" onclick="checkEmailNum();">
			</div>
		</div>
--%>
		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				생년월일
			</div>
			<div class="col-lg-7 join_02-main-right">
				<!-- <select class="join_02-year-month-day" id="select_year"
				name="user_birth_yaer" onchange="javascript:lastday();">
				</select> -->
				<select id="select_year" class="join_02-year-month-day"
					name="user_birth_year">
					<c:forEach var="year" begin="1" end="50">
						<c:choose>
							<c:when test="${year==50}">
								<option value="${1971+year}" selected>${1971+year}</option>
							</c:when>
							<c:otherwise>
								<option value="${1971+year}">${1971+year}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select> 
				<span class="join_02-year-month-day-text">년</span>

				<!-- <select class="join_02-year-month-day" id="select_month"
				name="user_birth_month" onchange="javascript:lastday();">
				</select> -->

				<select id="select_month" class="join_02-year-month-day join_02_birth"
					name="user_birth_month">
					<c:forEach var="month" begin="1" end="12">
						<c:choose>
							<c:when test="${month== 1}">
								<option value="${month}" selected>${month}</option>
							</c:when>
							<c:otherwise>
								<option value="${month}">${month}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select> 
				<span class="join_02-year-month-day-text">월</span>
				 
				<select id="select_day" class="join_02-year-month-day join_02_birth"
					name="user_birth_day">
					<c:forEach var="day" begin="1" end="31">
						<c:choose>
							<c:when test="${day== 1}">
								<option value="${day}" selected>${day}</option>
							</c:when>
							<c:otherwise>
								<option value="${day}">${day}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select> 
				<span class="join_02-year-month-day-text">일</span>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				핸드폰 번호
			</div>
			<div class="col-lg-7 join_02-main-right">
				<!-- 핸드폰 앞 번호 -->
				<select id="join_02_mobile1" class="join_02-mobile join_02-mobile_first" name="user_mobile_1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
				</select> -
				<!-- 핸드폰 중간 번호 -->
				<input id="join_02_mobile2" class=" join_02-mobilejoin_02-mobile-02 join_02-mobile"
					type="number" name="user_mobile_2"
					oninput="join_02_mobile_number(this, 4)"> -
				<!-- 핸드폰 끝 번호 -->
				<input id="join_02_mobile3" class=" join_02-mobilejoin_02-mobile-02 join_02-mobile"
					type="number" name="user_mobile_3"
					oninput="join_02_mobile_number(this, 4)">
				<!-- 인증번호 전송 버튼 -->
				<input class="join_02-submit-box-02" type="button" value="인증번호 전송"
					onclick="mobileNumberCheck();">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				인증 번호
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input id="mobileNumber" class="join_02-text-box" type="text"> 
				<input id="mobileCheckNumber" type="hidden">
				<input id="randomNumberCheck" class="join_02-submit-box" type="button" value="인증번호 확인" onclick="checkMobile();">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				주 소
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input id="user_post_code" class="join_02-text-box" type="text"
					name="user_post_code"> 
				<input id="user_post_code" class="join_02-submit-box" type="button" value="우편번호 검색"
					name="user_post_code" onclick="javascript:execDaumPostcode()">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				지번 주소
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input class="join_02-text-box" type="text" id="user_old_address"
					name="user_old_address">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				도로명 주소
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input class="join_02-text-box" type="text" id="user_new_address"
					name="user_new_address">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-1 offset-lg-2 text-center join_02-main-left">
				상세 주소
			</div>
			<div class="col-lg-7 join_02-main-right">
				<input id="user_detail_address" class="join_02-text-box" type="text"
					name="user_detail_address">
			</div>
		</div>

		<div class="row">
			<div class="col-lg-4 offset-lg-2 join_02-bottom-btn text-center">
				<input class="user_btn_gray" type="button" value="이전 페이지" onclick="history.back();">
			</div>
			<div class="col-lg-4 join_02-bottom-btn text-center">
				<input class="user_btn_Dgray" type="button" value="가입하기" onclick="joinFormCheck();">
			</div>
		</div>
	</form>

</div>



<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

	function joinFormCheck() {
		
		let user_id = document.getElementById("join_02_user_new_id");
		let user_pwd = document.getElementById("join_02_password");
		let check_pwd = document.getElementById("join_02_passowrd_check");
		let user_name = document.getElementById("join_02_userName");
		let email = document.getElementById("join_02_email");
		let year = document.getElementById("select_year");
		let month = document.getElementById("select_month");
		let day = document.getElementById("select_day");
		let postCode = document.getElementById("user_post_code");
		let detailAddr = document.getElementById("user_detail_address");
		let user_MobileNumber = document.getElementById("mobileNumber");
		let mobileRandomNumber = document.getElementById("mobileCheckNumber");
		// let user_emailNumber = document.getElementById("join_02_emailCheck");
		// let emailRandomNumber = document.getElementById("join_02_emailCheckNum");
		
		let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
		
		if(user_id.value == "") {
			alert("사용할 아이디를 입력해주세요.");
			user_id.focus();
			return false;
		}  else if(user_pwd.value == "") {
			alert("비밀번호를 입력해주세요.");
			user_pwd.focus();
			return false;
		} else if(!pwdCheck.test(user_pwd.value)) {
			alert("비밀번호는 영문+숫자 조합으로 8~25자리 사이를 입력해 주세요.");
			user_pwd.focus();
			return false;
		} else if(user_pwd.value !== check_pwd.value) {
			alert("비밀번호확인을 입력해주세요.");
			check_pwd.focus();
			return false;
		} else if(user_name.value == "") {
			alert("이름을 입력해주세요.");
			user_name.focus();
			return false;
		} else if(email.value == "") {
			alert("이메일 주소를 입력해주세요.");
			email.focus();
			return false;
		} else if (year.value == "" || month.value == "" || day.value == "") {
			alert("생년월일을 입력해주세요.");
			year.focus();
			return false;
		} else if(user_MobileNumber.value != mobileRandomNumber.value) {
			alert("핸드폰 인증을 확인해주세요.");
			user_MobileNumber.focus();
			return false;
		} else if(mobileRandomNumber.value == "") {
			alert("핸드폰 인증을 해주세요.");
			user_MobileNumber.focus();
			return false;
		}
<%--		else if(emailRandomNumber.value == "") {
			alert("이메일 인증을 해주세요.");
			user_emailNumber.focus();
			return false;
		} else if(user_emailNumber.value != emailRandomNumber.value) {
			alert("이메일 인증을 확인해주세요.");
			user_emailNumber.focus();
			return false;
		} --%>
		else if(postCode.value == "") {
			alert("주소를 입력해주세요.");
			postCode.focus();
			return false;
		} else if(detailAddr.value == "") {
			alert("상세주소를 입력해 주세요.");
			detailAddr.focus();
			return false;
		}
		
		document.joinNewUser.submit();
		
	}
	
	/* 아이디 중복 확인 */
	function idOverlap() {
		
		let user_id = document.getElementById("join_02_user_new_id");
		
		let idCheck = /^[a-z]+[a-z0-9]{5,19}$/g;
		
		if(!idCheck.test(user_id.value)) {
			alert("아이디는 영문+숫자 조합으로 6~20 자리 사이로 만들어 주세요.");
			user_id.focus();
			return false;
		}
		
		$.ajax({
			type:"POST", 
			url:"${contextPath}/user/userIdOverlap.do", 
			dataType:"text", 
			data: {
				id: user_id.value
			}, 
			success:function (result){
				if(result == "false"){
					alert("사용 가능한 아이디 입니다.");
				}else if (result == "true"){
					alert("사용할 수 없는 ID입니다.");
					return false;
				}
			}
		}).error(function() {
			alert("페이지 에러.");
		});
	}
	
	/* 핸드폰번호 인증 */
	function mobileNumberCheck() {
		
		let mobile1 = document.getElementById("join_02_mobile1").value;
		let mobile2 = document.getElementById("join_02_mobile2").value;
		let mobile3 = document.getElementById("join_02_mobile3").value;
		
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
	
	/* 이메일 인증 */
	function checkEmail() {
		
		let user_email = document.getElementById("join_02_email");
		
		if(user_email.value == "") {
			alert("이메일을 입력해 주세요.");
			user_email.focus();
			return false;
		}
		
		$.ajax({
			url:"${contextPath}/user/emailCheck.do", 
			type:"POST", 
			dataType:"text",
			data: {
				"user_email": user_email.value
			}, success: function(randomNumber) {
				alert("인증번호가 전송되었습니다.");
				document.getElementById("join_02_emailCheckNum").value = randomNumber.toString();
			}
		}).error(function(){
			alert("이메일 인증 에러");
		});
	}
	
	/* 이메일 인증번호 확인 */
	function checkEmailNum() {
		
		let user_number = document.getElementById("join_02_emailCheck");
		let randomNumber = document.getElementById("join_02_emailCheckNum");
		
		if(user_number.value == randomNumber.value) {
			alert("인증이 완료되었습니다.");
			return true;
		} else {
			alert("인증번호가 맞지 않습니다.");
			return false;
		}
	}
	
	/* 모바일 인증번호 확인 */
	function checkMobile() {

		let user_number = document.getElementById("mobileNumber");
		let randomNumber = document.getElementById("mobileCheckNumber");
		if(user_number.value != null && user_number.value != "" && user_number.value == randomNumber.value) {
			alert("인증이 완료되었습니다.");
		} else {
			alert("인증번호가 맞지 않습니다.");
			return false;
			
		}
	}

	/* 핸드폰 중간 및 마지막 번호 text 4자리로 제한 */
	function join_02_mobile_number(el, maxlength) {
		if (el.value.length > maxlength) {
			el.value = el.value.substr(0, maxlength);
		}
	}
	
	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('user_post_code').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('user_new_address').value = fullRoadAddr;
						document.getElementById('user_old_address').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
						} else {
							document.getElementById('guide').innerHTML = '';
						}

					}
				}).open();
	}
</script>


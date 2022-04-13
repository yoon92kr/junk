<!-- 2021.11.24 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test="${not empty message }">
	<script>
		alert("${message}");
	</script>
</c:if>

<div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4 text-center">
			<h1 class="page_title login_02-title">아이디 / 비밀번호 찾기</h1>
		</div>
	</div>
</div>
<div class="login_02-main">

	<div class="row">
		<div class="col-lg-4 offset-lg-2 text-center border-right border">
			<div class="login_02-top">아이디 찾기</div>
			<form id="userIdFindForm">
				<input id="IdFindUserName" class="login_02-id-find" type="text" name="user_name" placeholder="이름을 입력해주세요."> 
				<input id="idFundUserMobile" class="login_02-id-find" type="text" name="user_mobile" placeholder="핸드폰 번호를 입력해주세요." oninput="autoMobileNum(this)"> 
				<input id="login_02_userIdFind" class="login_02-btn login_02-id-btn" type="button" value="아이디 찾기" onclick="idFind();">
			</form>
		</div>
		<div class="col-lg-4 text-center border-left border">
			<div class="login_02-top">비밀번호 찾기</div>
			<form id="userPwdFindForm">
				<input id="login_02_pwd_find" class="login_02-pwd-find" type="text" name="user_id" placeholder="아이디를 입력해주세요.">
				<input id="login_02_pwdFindMobile" class="login_02-pwd-find login_02_pwd_find_check" type="text" name="user_mobile" oninput="autoMobileNum(this)" placeholder="핸드폰 번호를 입력해 주세요.">
				<input id="login_02_pwdFindEmail" class="login_02-pwd-find login_02_pwd_find_check" name="user_email" type="hidden">
				<input id="pwd_randomNumber_btn" class="login_02_pwd_find_check cart_btn_green" type="button" value="인증번호 발송" onclick="userInfoCheck();">
				<input id="pwd_randomNumInput" class="login_02-pwd-find login_02_pwd_find_check" type="hidden" placeholder="인증번호를 입력해 주세요.">
				<input id="pwd_randomNumber" type="hidden" value=""><!-- 인증번호 확인을 위한 inputbox -->
				<input id="pwd_randomcheck_btn" class="login_02_pwd_find_check cart_btn_green" type="hidden" value="인증번호 확인" onclick="pwdFindNumberCheck();">
				<input id="login_02_pwdFindMobile_btn" class="login_02-btn login_02-pwd-btn-01" type="button" value="휴대폰으로 인증하기" onclick="pwdCertification(this.id);"> 
				<input id="login_02_pwdFindEmail_btn" class="login_02-btn login_02-pwd-btn-02" type="button" value="이메일로 인증하기" onclick="pwdCertification(this.id);">
			</form>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<a href="${contextPath}/user/loginpage.do"> 
				<input class="cart_btn_gray login_02_btn" type="button" value="로그인 페이지">
			</a>
		</div>
	</div>

</div>

<script>
	/* 핸드폰 번호 입력시 - 입력 */
	let autoMobileNum = (target) => {
		target.value = target.value
		   .replace(/[^0-9]/, '')
		   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}

	/* 아이디 찾기 */
	function idFind() {
		
		userName = document.getElementById("IdFindUserName");
		userMobile = document.getElementById("idFundUserMobile");
		findIdFrom = document.getElementById("userIdFindForm");
		
		if(userName.value == "") {
			alert("이름을 입력해 주세요.");
			userName.focus();
			return false;
		} else if(userMobile.value == "") {
			alert("핸드폰 번호를 입력해 주세요.");
			userMobile.focus();
			return false;
		} else {
			findIdFrom.action = "${contextPath}/user/userIdFind.do";
			findIdFrom.method = "post";
			findIdFrom.submit();
		}
		
	} 

	/* 비밀번호 찾기 인증수단 일치 확인 */
	function userInfoCheck() {
		
		let pwdFindType;
		let userId = document.getElementById("login_02_pwd_find");
		let userMobile = document.getElementById("login_02_pwdFindMobile");
		let userEmail = document.getElementById("login_02_pwdFindEmail");
		
		if(userId.value == "") {
			alert("아이디를 입력해 주세요.");
			userId.focus();
			return false;
		} else if(userMobile.type == "text") {
			if(userMobile.value == "") {
			alert("핸드폰 번호를 입력해 주세요.");
			userMobile.focus();
			return false;
			} else {
				pwdFindType = userMobile.value;
			}
		} else if(userEmail.type == "email") {
			if(userEmail.value == "") {
				alert("이메일을 입력해 주세요.");
				userEmail.focus();
				return false;
			} else {
				pwdFindType = userEmail.value;
			}
		}
		$.ajax({
			url:"${contextPath}/user/userPwdFind.do", 
			type:"POST", 
			dataType:"text", 
			data: {
				"user_id": userId.value, 
				"pwdFindType": pwdFindType
			}, success: function(Num) {
				if(Num == 0) {
					alert("입력하신 아이디와 인증 수단이 일치하지 않습니다.");
				} else {
					alert("인증번호가 전송되었습니다.");
					let randoumNum = document.getElementById("pwd_randomNumber").value = Num.toString();
					let userMobileBtn = document.getElementById("login_02_pwdFindMobile_btn");
					let userEmailBtn = document.getElementById("login_02_pwdFindEmail_btn");
					
					if(pwdFindType == userEmail.value) {
						userMobileBtn.disabled = true;
					} else if(pwdFindType == userMobile.value) {
						userEmailBtn.disabled = true;
					}
					
					document.getElementById("pwd_randomNumInput").type="text";
					document.getElementById("pwd_randomcheck_btn").type="button";
				}
			}
		}).error(function() {
			alert("페이지 에러");
		});
		
	}
	
	/* 인증번호 일치 확인 */
	function pwdFindNumberCheck() {
		
		let randoumNum = document.getElementById("pwd_randomNumber");
		let randomNumInput = document.getElementById("pwd_randomNumInput");
		
		if(randoumNum.value == randomNumInput.value) {
			location.href = "${contextPath}/user/changeUserPwd.do";
		} else if(randoumNum.value != randomNumInput.value) {
			alert("인증번호가 일치하지 않습니다.");
		}
		
	}

	/* 비밀번호 찾기 전 인증 수단 선택 버튼 */
	function pwdCertification(btnid) {

		let userMobile = document.getElementById("login_02_pwdFindMobile");
		let userEmail = document.getElementById("login_02_pwdFindEmail");
		
		if(btnid == "login_02_pwdFindMobile_btn") {
			userMobile.type="text";
			userEmail.type="hidden";
			userEmail.disabled= true;
			userMobile.disabled = false;
			userMobile.placeholder="핸드폰 번호를 입력해 주세요.";
		} else if(btnid == "login_02_pwdFindEmail_btn") {
			userMobile.type="hidden";
			userEmail.type="email";
			userEmail.placeholder="가입당시 이메일을 입력해 주세요.";
			userMobile.disabled= true;
			userEmail.disabled = false;
		}
		
	}
	
</script>
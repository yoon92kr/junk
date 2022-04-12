<!-- 2021.11.25 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
		<div class="col-lg-4 text-center">
			<h1 class="login_03-id-find-title">비밀번호 찾기</h1>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<div class="row">
		<div class="col-lg-4 offset-lg-4">
			<h3 class="sub-title login_04-sub-title">신규 비밀번호 설정</h3>
			<form id="changePwdForm">
				<input id="login_inputPwd" class="login_01-pwd-box" type="password" oninput="autoMobileNum(this)" name="user_pw" placeholder="새로운 비밀번호를 입력해주세요."> 
				<input id="login_inputCheck" class="login_01-pwd-box" type="password" placeholder="비밀번호를 다시 입력해주세요.">
				<input id="pwdChangeUserId" type="hidden" name="user_id" value="${userPwdChange.user_id}">
				<br> 
				<input id="changePwdBtn" class="login_01-btn login_04-btn" type="button" value="비밀번호 변경하기" onclick="changeBtn();">
			</form>
		</div>
	</div>
</div>

<script>

	function changeBtn() {
		
		let form = document.getElementById("changePwdForm");
		let user_id = document.getElementById("pwdChangeUserId");
		let user_pw = document.getElementById("login_inputPwd");
		let check = document.getElementById("login_inputCheck");
		
		let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
		
		if(user_pw.value == "") {
			alert("비밀번호를 입력해 주세요.");
			user_pw.focus();
			false;
		} else if(!pwdCheck.test(user_pw.value)) {
			alert("비밀번호는 영문+숫자 조합으로 8~25자리 사이를 입력해 주세요.");
			user_pw.focus();
			return false;
		} else if(check.value == "") {
			alert("비밀번호 확인란을 입력해 주세요.");
			check.focus();
			false;
		} else if(user_pw.value != check.value) {
			alert("입력하신 비밀번호가 동일하지 않습니다.");
			false;
		} else if(user_pw.value == check.value) {
			check.style.disabled = true;
			form.action = "${contextPath}/user/changeUserPwdInput.do";
			form.method = "POST";
			form.submit();
		}
		
	}
	
</script>
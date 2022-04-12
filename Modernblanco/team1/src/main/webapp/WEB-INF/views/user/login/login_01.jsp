<!-- 2021.11.24 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"
	import="java.net.URLEncoder, java.security.SecureRandom, java.math.BigInteger"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test='${not empty message }'>
	<script>
		alert("${message}");
	</script>
	<%
	session.removeAttribute("message");
	%>
</c:if>

<c:if test="${not empty userPwdChange}">
	<%
		session.removeAttribute("userPwdChange");
	%>
</c:if>

<div class="container">

	<div class="row">
		<div class="col-lg-2 offset-lg-5 text-center">
			<h1 class="page_title">로그인</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-4 offset-lg-4">
			<h3 class="sub-title">아이디 로그인</h3>
			<form id="login_01_loginForm" name="Login_01_LoginForm" method="post">
				<input class="login_01-id-box" name="user_id" type="text"
					placeholder="아이디(이메일)를 입력해주세요."> 
				<input id="login_01_pwd" class="login_01-pwd-box" name="user_pw" type="password" onkeypress="if(event.keyCode == 13)loginBtn();"
					placeholder="비밀번호를 입력해주세요."><br> 
				<input class="login_01-btn" type="button" value="로그인" onclick="loginBtn();">
				
			</form>
			<p class="login_01-id-pwd-find">
				<a href="${contextPath}/user/findUserInfoPage.do">아이디 / 비밀번호 찾기</a>
			</p>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-4 offset-lg-4">
			<br>
			<br>
			<h3 class="login-title">SNS 간편 로그인</h3>
			<div class="login_01-sns-login-btn">
				<a class="login_01-naver-login" href="${url}"> 
					<img class="login_01-naver-kakao-login"
						src="${contextPath}/resources/img/common/naver_login_btn.png"
						alt="로그인페이지 네이버 로그인 버튼 이미지">
				</a> 
				<a class="login_01-kakao-login" href="#"> 
					<img class="login_01-naver-kakao-login"
						src="${contextPath}/resources/img/common/kakao_login_btn.png"
						alt="로그인페이지 카카오 로그인 버튼 이미지">
				</a>
			</div>
			<br>
			<p class="login_01-join-text">
				바로입이 처음이신가요? 
				<a href="${contextPath}/user/joinTerms.do">회원가입하기</a>
			</p>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-4 offset-lg-4">
			<br>
			<!-- 비회원 주문 조회 버튼 -->
			<div class="login_01-sns-login-btn">
				<input id="guest_search_login" type="button" value="비회원 주문 조회" onclick="guest_order_search()">
			</div>
			<br>
		</div>
	</div>
	
</div>

<script type="text/javascript">
		
	window.name = "parent";

	function loginBtn() {
		
		let loginForm = document.Login_01_LoginForm;
		let user_id = loginForm.user_id.value;
		let user_pw = loginForm.user_pw.value;
		
		loginForm.action="${contextPath}/user/login.do";
		loginForm.submit();
		
	}
	
	function guest_order_search() {
		var url = "${contextPath}/guest/search_order.do";
		var name = "바로입 프로젝트";
		var popupX = (document.body.offsetWidth / 2) - (500 / 2);
		var popupY= (window.screen.height / 2) - (500 / 2);
		
		var option = "width = 500, height = 500, left="+popupX+ ", top="+popupY+", location = no, directories = no, resizable = no, menubar = no, scrollbars = no, toolbars = no, status = no";

		window.open(url, name, option);
	}

</script>
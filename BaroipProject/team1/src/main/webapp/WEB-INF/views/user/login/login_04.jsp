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
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<h3 class="sub-title login_04-sub-title">신규 비밀번호 설정</h3>
			<form action="${contextPath}/user/login_05.do">
				<input class="login_01-pwd-box" type="password"
					placeholder="새로운 비밀번호를 입력해주세요."> 
				<input class="login_01-pwd-box" type="password"
					placeholder="비밀번호를 다시 입력해주세요.">
				<br> 
				<input class="login_01-btn login_04-btn" type="submit" value="비밀번호 변경하기">
			</form>
		</div>
		<div class="col-lg-4"></div>
	</div>
</div>
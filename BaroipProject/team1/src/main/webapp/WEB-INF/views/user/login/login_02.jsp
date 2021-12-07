<!-- 2021.11.24 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">
    <div class="row">
   		<div class="col-lg-4"></div>
        <div class="col-lg-4 text-center">
        	<h1 class="page_title login_02-title">아이디 / 비밀번호 찾기</h1>
        </div>
        <div class="col-lg-4"></div>
    </div>
</div>
<div class="login_02-main">
	<div class="container border">
		
	    <div class="row">
	        <div class="col-lg-6 text-center border-right">
	        	<div class="login_02-top">아이디 찾기</div>
	        	<form action="${contextPath}/user/login_03.do">
	        		<input class="login_02-id-find" type="text" placeholder="가입할 때 입력하신 이름을 입력해주세요.">
	        		<input class="login_02-id-find" type="text" placeholder="가입할 때 입력하신 전화번호를 입력해주세요.">
	        		<input class="login_02-btn login_02-id-btn" type="submit" value="아이디 찾기">
	        	</form>
	        </div>
	        <div class="col-lg-6 text-center border-left">
	        	<div class="login_02-top">비밀번호 찾기</div>
	        	<form action="${contextPath}/user/login_04.do">
	        		<input class="login_02-pwd-find" type="text" placeholder="아이디를 입력해주세요.">
	        		<input class="login_02-btn login_02-pwd-btn-01" type="submit" value="휴대폰 인증">
	        		<input class="login_02-btn login_02-pwd-btn-02" type="submit" value="이메일 인증">
	        	</form>
	        </div>
	    </div>
	</div>
</div>
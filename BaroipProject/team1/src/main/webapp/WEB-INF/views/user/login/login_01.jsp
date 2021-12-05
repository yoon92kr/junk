<!-- 2021.11.24 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">
	<div class="row">
        <div class="col-lg-5"></div>
        <div class="col-lg-2 text-center">
        	<h1 class="page_title" >로그인</h1>
        </div>
        <div class="col-lg-5"></div>
    </div>
	<div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
	        <h3 class="sub-title">이메일 로그인</h3>
        	<form>
        		<input class="login_01-id-box" type="text" placeholder="아이디(이메일)를 입력해주세요.">
        		<input class="login_01-pwd-box" type="password" placeholder="비밀번호를 입력해주세요."><br>
        		<input class="login_01-btn" type="submit" value="로그인">
        	</form>
        	<p class="login_01-id-pwd-find">
        		<a href="${contextPath}/login_02.do">아이디 / 비밀번호 찾기</a>
        	</p>
        </div>
        <div class="col-lg-4"></div>
    </div>
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
	        <br><br>
	        <h3 class="login-title">SNS 간편 로그인</h3>
		        <div class="login_01-sns-login-btn">
			        <a class="login_01-naver-login" href="#">
			        	<img class="login_01-naver-kakao-login" src="${contextPath}/resources/img/common/naver_login_btn.png" alt="로그인페이지 네이버 로그인 버튼 이미지">
			        </a>
			        <a class="login_01-kakao-login" href="#">
			        	<img class="login_01-naver-kakao-login" src="${contextPath}/resources/img/common/kakao_login_btn.png" alt="로그인페이지 카카오 로그인 버튼 이미지">
			        </a>
		        </div>
	        <br>
	        <p class="login_01-join-text">
	        	바로입이 처음이신가요? <a href="${contextPath}/join_01.do">회원가입하기</a>
	        </p>
        </div>
        <div class="col-lg-4"></div>
    </div>
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
        	<br>
<!-- 비회원 주문 조회 버튼 -->
        	<div class="login_01-sns-login-btn">
		        <a class="login_01-non-member-search" href="#">
					<img class="login_01-non-member-search-btn bottom_btn_size" src="${contextPath}/resources/img/common/non_member_search_btn.png" alt="로그인페이지 비회원 조회 버튼 이미지">
		        </a>
        	</div>
        </div>
    </div>
</div>

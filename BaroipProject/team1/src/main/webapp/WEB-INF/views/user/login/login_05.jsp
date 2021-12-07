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
	    <div class="col-lg-4 text-center">
	    	<h4 class="login_03-lookup">비밀번호 변경 완료</h4>
	    </div>
	    <div class="col-lg-4"></div>
    </div>
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10 text-center">
        	<h3 class="login_03-id-text">[회원 이름]님의 비밀번호가 정상적으로 변경되었습니다.</h3>
        </div>
        <div class="col-lg-1"></div>
    </div>
    <div class="row">
        <div class="col-lg-6 offset-lg-3">
        <!-- 로그인 페이지 하단 버튼 -->
        	<div class="login_03-bottom-btn">
	        	<a class="login_03-login-page-btn login_05-btn" href="${contextPath}/user/login_01.do">
					<img class="bottom_btn_size" src="${contextPath}/resources/img/common/login_page_btn.png" alt="비밀번호찾기 페이지_로그인페이지 이동 버튼 이미지">
			     </a>
        	</div>
        </div>
        <div class="col-lg-3"></div>
    </div>
</div>
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
	        <h4 class="join_03-sub-title">회원가입 완료</h4>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-10 offset-lg-1 text-center">
        	<h3 class="join_03-id-text">
        		환영합니다 [회원 이름]님! 회원가입이 성공적으로 완료되었습니다.
        	</h3>
        </div>
    </div>
    
    <div class="row">
        <div class="col-lg-3 offset-lg-3">
        <!-- 로그인 페이지 하단 버튼 -->
        	<div class="login_03-bottom-btn">
	        	<a class="login_03-id-pwd-find-btn" href="${contextPath}/main.do">
					<img class="bottom_btn_size" src="${contextPath}/resources/img/common/main_page_btn.png" alt="회원가입 가입완료 메인페이지 버튼 이미지">
			     </a>
        	</div>
        </div>
        <div class="col-lg-3">
        <!-- 아이디 / 비밀번호 찾기 하단 버튼 -->
       		<div class="login_03-bottom-btn">
	        	<a class="login_03-login-page-btn" href="${contextPath}/login_01.do">
					<img class="bottom_btn_size" src="${contextPath}/resources/img/common/login_page_btn.png" alt="회원가입 가입완료 로그인페이지 버튼 이미지">
			    </a>
		    </div>
        </div>
    </div>
    
</div>
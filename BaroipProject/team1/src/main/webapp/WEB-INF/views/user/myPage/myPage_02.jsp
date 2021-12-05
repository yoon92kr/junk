<!-- 2021.11.25 임석희 mypage_02 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<div class="container">
    <div class="row">
        <div class="col-lg-4 offset-lg-4 text-center"><h1 class="page_title">마이 페이지</h1></div>
    </div>
</div>

<div class="container">
	<div class="row">
    		<div class="col-lg MyPage_02_hr"><hr></div>
</div>

<div class="MyPage_02">
	<div class="row">
        <div class="col-lg-12 text-center MyPage_padding">회원정보를 수정하기 위해서 비밀번호를 다시 확인해주세요.</div>
    </div>
    	<div class="MyPage_02_text">
    		<div class="row">
    			<div class="col-lg-offset-2 col-lg-4 text-right" style="padding-top: 2px;">비밀번호</div>
        		<input class="MyPage_02_password_box" type="password">
    		</div>
    	</div>
	</div>
	
	<div class="row">
    	<div class="col-lg"><hr>
    </div>
    
    <div class="container">
    <div class="row">
    	<a href="myPage_02_01.do" class="col-lg-offset-2 col-lg-3 col-lg-offset-1 text-center MyPage_02_button_01">회원정보 수정</a>
    	<a href="myPage_01.do" class="col-lg-3 text-center MyPage_02_button_02">돌아가기</a>
    </div>
    </div>
    </div>
</div>
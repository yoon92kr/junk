<!-- 2021.12.10 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />




<div class="container-fluid">


	<div class="row">
		<div class="col-lg-10 offset-lg-1 text-center">
			<img class="error_image" src="${contextPath}/resources/img/common/commonError.png" alt="에러 이미지">
		</div>
	</div>

	<div class="row">
		<div class="col-lg-10 offset-lg-1 text-center">
			<a href="${contextPath}/main.do">
				<input type="button" class="user_btn_Bgreen" value="메인페이지로 이동">	
			</a>
		</div>
	</div>
</div>


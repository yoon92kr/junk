<!-- 2021.11.24 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">
	<!--  임시 css 파일 -->
	<link rel="stylesheet" href="${contextPath}/resources/css/kang.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/yoon.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/lim.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/han.css">
	
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- Slick -->
	<script type="text/javascript" src="${contextPath}/resources/js/slick.min.js"></script>
   	<script type="text/javascript" src="${contextPath}/resources/js/slick.js"></script>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/js/slick.css"/>
 	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/js/slick-theme.css"/>
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/png" href="${contextPath }/resources/img/common/favicon.png">
	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- Fontawesome -->
	<link rel="stylesheet" href="${contextPath}/resources/css/all.min.css">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">
	<!-- Main style -->
	<link rel="stylesheet" href="${contextPath}/resources/css/main.css">

	<!-- Title 배치 -->
	<title><tiles:insertAttribute name="title" /></title>


</head>

<body>

	<div class="content">
	<div class="content-inside">
		<!-- Header 배치 -->
		<tiles:insertAttribute name="header" />
		
		<!--  Side 배치 -->
		<tiles:insertAttribute name="side" />
		
		<!-- Body 배치 -->
		<tiles:insertAttribute name="body" />
	
		<!-- Chat API 배치 -->
		<tiles:insertAttribute name="chat" />
		
		<!-- Quick Menu 배치 -->
		<tiles:insertAttribute name="quickMenu" />
	</div>
	</div>

	<!--  Footer 배치 -->
	<tiles:insertAttribute name="footer" />

</body>
</html>
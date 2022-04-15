<!-- 2022.01.24 윤상현 -->

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
<!-- Favicon -->
<link rel="shortcut icon" type="image/png"
	href="${contextPath }/resources/img/common/favicon.png">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">
<!-- Main style -->
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">

<!-- Title 배치 -->
<title><tiles:insertAttribute name="title" /></title>


</head>

<body>


	<!-- Body 배치 -->
	<tiles:insertAttribute name="body" />



</body>
</html>
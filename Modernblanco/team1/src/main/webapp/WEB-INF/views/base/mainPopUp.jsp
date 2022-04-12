<!-- 2022.01.24 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="text-center">
	<p id="popUp_title">
		<img class="header-icon"
			src="${contextPath}/resources/img/common/favicon.png" alt="로고 이미지">
		안녕하세요 바로입 입니다!
	</p>

	<pre class="popUp_body">
	
해당 사이트는 개인 <b>학습용 프로젝트</b> 입니다.



사이트 내 결제는 실제로 이루어지지 않으며, 
<b>가상 계좌</b>로 결제를 진행할 경우 주문 완료 페이지로 이동됩니다.
 
 
 ■ 시연용 관리자 계쩡
 
 ID : baroip 
 PW : 0000
 
 
</pre>


	<p>2022.02.17 Team1</p>

	<input type="checkbox" id="MainCheckBox" onclick="NoPopup()"> <a onclick="NoPopup()">오늘 하루동안 보지않기</a>
</div>

<script>
	function NoPopup() {

		var date = new Date();
		date.setTime(date.getTime() + (24 * 60 * 60 * 1000));
		document.cookie = 'mainPop=none;expires=' + date.toUTCString() + ';path=/';
		window.close();
	}
</script>
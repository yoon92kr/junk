<!--  2021.11.30 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- side section -->

<div class="container">
	<div class="MyPage_side-section">
		<div class="row">
			<div class="col-lg-4 offset-lg-4 text-center">

			<a href="${contextPath}/admin.do" class="no-underline">사이트 정보</a>
			<a href="${contextPath}/adminUser_01.do" class="no-underline">회원 관리</a>
			<a href="${contextPath}/adminProduct_01.do"  class="no-underline">상품 관리</a>
			<a href="${contextPath}/adminOrder.do"  class="no-underline">주문 관리</a>
			<a href="${contextPath}/adminCS_02.do"  class="no-underline">문의 관리</a>
			<a href="${contextPath}/adminReview_01.do"  class="no-underline">후기 관리</a>
			<a href="https://channel.io/ko?utm_source=powered_by&utm_medium=localhost%3A8080&utm_channel_id=67859&utm_content=%EB%B0%94%EB%A1%9C%EC%9E%85" target="_blank" class="no-underline">실시간 채팅</a>
			<a href="${contextPath}/adminNotice_01.do" class="no-underline">공지 관리</a>
			<a href="${contextPath}/adminCS_01.do"  class="no-underline">Q&A 관리</a>
	
			</div>
		</div>
	</div>
</div>

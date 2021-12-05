<!-- 2021.11.24 임석희 사이드메뉴 -->

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

			<a href="${contextPath}/myPage_01.do"  class="no-underline">내정보</a>
			<a href="${contextPath}/myPage_02.do"  class="no-underline">회원정보 수정</a>
			<a href="${contextPath}/myPage_03.do"  class="no-underline">주문/배송조회</a>
			<a href="${contextPath}/cart.do"  class="no-underline">장바구니</a>
			<a href="${contextPath}/myPage_04.do"  class="no-underline">포인트 내역</a>
			<a href="${contextPath}/myPage_05.do"  class="no-underline">회원등급 안내</a>
			<a href="${contextPath}/myPage_06.do"  class="no-underline">문의내역</a>
			<a href="${contextPath}/myPage_07.do"  class="no-underline">상품후기</a>
	
			</div>
		</div>
	</div>
</div>

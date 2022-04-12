<!--  2021.11.30 한건희 -->
<!--  2021.12.08 윤상현 -->

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

			<a id="adminMain" href="${contextPath}/admin/main.do" class="no-underline">사이트 정보</a>
			<a id="user" href="${contextPath}/admin/user/user_list.do" class="no-underline">회원 관리</a>
			<a id="extra" href="${contextPath}/admin/product/extra_list.do"  class="no-underline">임시 상품 관리</a>
			<a id="order" href="${contextPath}/admin/order/order_list.do"  class="no-underline">주문 / 반품 관리</a>
			<a id="QA" href="${contextPath}/admin/CS/QA_list.do"  class="no-underline">문의 관리</a>
			<a id="review" href="${contextPath}/admin/CS/review_list.do"  class="no-underline">후기 관리</a>
			<a href="https://channel.io/ko?utm_source=powered_by&utm_medium=localhost%3A8080&utm_channel_id=67859&utm_content=%EB%B0%94%EB%A1%9C%EC%9E%85" target="_blank" class="no-underline">실시간 채팅</a>
			<a id="notice" href="${contextPath}/admin/notice/notice_list.do" class="no-underline">공지 관리</a>
			<a id="FAQ" href="${contextPath}/admin/FAQ/FAQ_list.do"  class="no-underline">FAQ 관리</a>
		<c:if test="${userInfo.user_rank > 2}">
			<a id="general" href="${contextPath}/admin/product/general_list.do"  class="no-underline">전체 상품 관리</a>
		</c:if>

			</div>
		</div>
	</div>
</div>

<script>
	window.addEventListener('load',function() {
		if('${viewName}'.indexOf('main') != -1) {
			document.getElementById("adminMain").style.fontFamily = "kopub_bold";
		}
		else if('${viewName}'.indexOf('user') != -1) {
			document.getElementById("user").style.fontFamily = "kopub_bold";
		}
		else if('${viewName}'.indexOf('extra') != -1) {
			document.getElementById("extra").style.fontFamily = "kopub_bold";
		}
		else if('${viewName}'.indexOf('order') != -1) {
			document.getElementById("order").style.fontFamily = "kopub_bold";
		}
		else if('${viewName}'.indexOf('QA') != -1) {
			document.getElementById("QA").style.fontFamily = "kopub_bold";
		}
		else if('${viewName}'.indexOf('review') != -1) {
			document.getElementById("review").style.fontFamily = "kopub_bold";
		}
		else if('${viewName}'.indexOf('notice') != -1) {
			document.getElementById("notice").style.fontFamily = "kopub_bold";
		}
		else if('${viewName}'.indexOf('FAQ') != -1) {
			document.getElementById("FAQ").style.fontFamily = "kopub_bold";
		}
		else if('${viewName}'.indexOf('general') != -1) {
			document.getElementById("general").style.fontFamily = "kopub_bold";
		}
						
	});
</script>
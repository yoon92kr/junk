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

			<a id="myInfo" href="${contextPath}/myPage/myInfo.do"  class="no-underline">내정보</a>
			<a id="updateMyInfo" href="${contextPath}/myPage/updateMyInfo.do"  class="no-underline">회원정보 수정</a>
			<a id="myOrder" href="${contextPath}/myPage/myOrder.do"  class="no-underline">주문/배송조회</a>
			<a href="${contextPath}/cart/cartList.do"  class="no-underline">장바구니</a>
			<%--<a id="myPoint" href="${contextPath}/myPage/myPoint.do"  class="no-underline">포인트 내역</a> --%>
			<a id="membership" href="${contextPath}/myPage/membership.do"  class="no-underline">회원등급 안내</a>
			<a id="myQuestion" href="${contextPath}/myPage/myQuestion.do"  class="no-underline">문의내역</a>
			<a id="myComment" href="${contextPath}/myPage/myComment.do"  class="no-underline">상품후기</a>
	
			</div>
		</div>
	</div>
</div>


<script>
	window.addEventListener('load',function() {
		if('${viewName}'.indexOf('myInfo') != -1) {
			document.getElementById("myInfo").style.fontFamily = "kopub_bold";
		}
		else if('${viewName}'.indexOf('membership') != -1) {
			document.getElementById("membership").style.fontFamily = "kopub_bold";
		}
		else if('${viewName}'.indexOf('myOrder') != -1) {
			document.getElementById("myOrder").style.fontFamily = "kopub_bold";
		}
		else if('${viewName}'.indexOf('myPoint') != -1) {
			document.getElementById("myPoint").style.fontFamily = "kopub_bold";
		}
		else if('${viewName}'.indexOf('updateMyInfo') != -1) {
			document.getElementById("updateMyInfo").style.fontFamily = "kopub_bold";
		}
		else if('${viewName}'.indexOf('myQuestion') != -1) {
			document.getElementById("myQuestion").style.fontFamily = "kopub_bold";
		}	
		else if('${viewName}'.indexOf('myComment') != -1) {
			document.getElementById("myComment").style.fontFamily = "kopub_bold";
		}	
								
	});
</script>
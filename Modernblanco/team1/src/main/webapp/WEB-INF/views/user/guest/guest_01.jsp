<!--2022.02.09 윤상현  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">

	<div class="row">
		<div class="col-lg-2 offset-lg-5 text-center">
			<br><h1 class="page_title">비회원 주문 조회</h1><br><br><br>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-4 offset-lg-4">
			<form id="login_01_loginForm" name="guestOrderDetail" method="post">
				<input id="guest_order_id" class="login_01-pwd-box" name="order_id" type="text" onkeypress="if(event.keyCode == 13)search_order();" placeholder="주문번호를 입력해주세요. 예시 : baroip_order_xxxx_xxxx"><br> 
				<input id="guest_name" class="login_01-id-box" name="user_name" type="text" onkeypress="if(event.keyCode == 13)search_order();" placeholder="수령인의 이름을 입력해주세요."> <br><br>
				<input class="login_01-btn" type="button" value="조회하기" onclick="search_order();"><br>
				<p class="login_01-join-text">주문번호를 잊어버리셨나요?  <a onclick="forgot_order()"> 1:1문의하기</a></p>
			</form>

		</div>
	</div>
</div>
<script>
function forgot_order() {
	window.opener.location.href="${contextPath}/cs/UQA_list.do";
	window.close()

}

function search_order() {
	
	var order_id = document.getElementById('guest_order_id').value;
	var guest_name = document.getElementById('guest_name').value;
	
	if (order_id.match(/\s/g) || guest_name.match(/\s/g)) {
		alert("검색어에 공백은 포함될 수 없습니다.");
	}
	else{
		
		if (order_id == "" || order_id == null) {
			alert("주문 번호를 입력해주세요.");
		} 
		else {
			if (guest_name == "" || guest_name == null) {
				alert("수령인의 이름을 입력해주세요.");
			}
			else {
				document.guestOrderDetail.action = "${contextPath}/guest/guest_order_detail.do";
				document.guestOrderDetail.target = opener.window.name;
				document.guestOrderDetail.submit();
				window.close();
			}
			
		}
	}

}
</script>
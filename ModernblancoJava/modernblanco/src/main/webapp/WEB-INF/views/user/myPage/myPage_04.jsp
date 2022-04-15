<!-- 2021.11.30 임석희 myPage_03 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="7" />
<!-- itemSize에는 표시할 item의 size를 대입한다. -->
<c:set var="itemSize" value="${userList.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${userList}" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:if test='${not empty pageNo}'>
	<script>
		window
				.addEventListener(
						'load',
						function() {
							if (document.getElementById("${pageNo}")) {
								document.getElementById("${pageNo}").style.fontFamily = "kopub_bold";
								document.getElementById("${pageNo}").style.fontSize = "15px";
							}
						});
	</script>
</c:if>
<c:if test='${not empty message }'>

	<script>
		alert("${message}");
	</script>
	<%
	session.removeAttribute("message");
	%>
</c:if>

<div class="container">

	<div class="MyPage_title">
		<div class="row">
			<div class="col-lg-4 offset-lg-4 text-center">
				<h1 class="page_title">마이 페이지</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center">
			
			<c:if test='${userInfo.user_membership == 1 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/basic_member_icon.png" alt="회원정보수정페이지 일반회원 이미지">
			</c:if>
			<c:if test='${userInfo.user_membership == 2 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/under_member_icon.png" alt="회원정보수정페이지 우수회원 이미지">
			</c:if>
			<c:if test='${userInfo.user_membership == 3 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/top_member_icon.png" alt="회원정보수정페이지 단골회원 이미지">
			</c:if>
			<c:if test='${userInfo.user_membership == 4 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/flex_member_icon.png" alt="회원정보수정페이지 FLEX회원 이미지">
			</c:if>									
				
			</div>
			<div class="col-lg-10 text-left MyPage_padding">포인트 내역</div>

			<div class="container">
				<div class="MyPage_top-underline"></div>
			</div>
		</div>
	</div>


	<div class="row">

		<div class="col-lg-3 text-center adminUser_01-content-header">
			조회 기간</div>

		<div class="col-lg-6 text-center adminUser_01-content-header">

			<div id="search_option_date_mypage">
				<input id="search_option_date_begin"
					class="adminUser_01-select-box-lookup" type="date"> 부터 <input
					id="search_option_date_end" class="adminUser_01-select-box-lookup"
					type="date"> 까지
			</div>

		</div>

		<div class="col-lg-3 text-center adminUser_01-content-header">
			<input class="adminProduct_01-header-button" type="button"
				value="조회하기" onclick="search_user_to_option()">

		</div>
	</div>

	<div class="MyPage_03_center-box text-center">
		<div class="row">
			<div class="col-lg-2">주문 일자</div>
			<div class="col-lg-3">상품명</div>
			<div class="col-lg-2">사용 포인트</div>
			<div class="col-lg-3">적립 포인트</div>
			<div class="col-lg-2">현재 포인트</div>
		</div>
	</div>

	<c:if test="${empty itemList}">
		<br>
		<div class="col-lg-12 text-center">조회된 주문내역이 없습니다.</div>
	</c:if>

	<c:if test="${not empty itemList}">
		<c:forEach var="i" begin="0" end="${itemSize}">
			<c:set var="j" value="${(pageNo * pageNoMax - pageNoMax) + i}" />
			<c:if test="${not empty itemList[j] && i < pageNoMax}">

				<div class="MyPage_03_center-box-01 text-center">
					<div class="row">
						<div class="col-lg-2 text-center">
							<div>${itemList[j].order_date}</div>
							<input class="MyPage_03-submit-box-01" type="button"
								value="주문 상세 정보">
						</div>
						<a href="product_02.do"
							class="col-lg-2 MyPage_03_text_position_02">${itemList[j].product_main_title}</a>
						<div class="col-lg-2 MyPage_03_text_position_02"><fmt:formatNumber value="${itemList[j].order_amount}" /> 개</div>
						<div class="col-lg-2 MyPage_03_text_position_02"><fmt:formatNumber value="${(itemList[j].product_price - itemList[j].product_discount) * itemList[j].order_amount}" /> 원</div>
						<div class="col-lg-2 MyPage_03_text_position_03">

							<c:if test='${itemList[j].order_state == 0}'>
								<div class="text-center">상품 준비 중</div>
								<div>
									<input class="MyPage_03-submit-box-02" type="button"
										value="주문 취소" onclick="order_cancel()">
								</div>
							</c:if>

							<c:if test='${itemList[j].order_state == 1}'>
								<div class="text-center">상품 배송 중</div>
								<input class="MyPage_03-submit-box-02" type="button"
									value="배송 조회" onclick="order_cancel()">
								<input class="MyPage_03-submit-box-02" type="button"
									value="구매 확정" onclick="order_cancel()">
							</c:if>

							<c:if test='${itemList[j].order_state == 1}'>
								<div class="text-center">배송 완료</div>
								<div>
									<input class="MyPage_03-submit-box-02" type="button"
										value="반품 / 교환 신청" onclick="order_cancel()"> <input
										class="MyPage_03-submit-box-02" type="button" value="상품 후기"
										onclick="order_cancel()">
								</div>
							</c:if>


						</div>
					</div>
				</div>

			</c:if>

		</c:forEach>

		<c:if test="${itemSize > pageNoMax}">

			<div class="row">

				<div class="col-lg-12 text-center admin_product_page_index">
					<a href="#" onclick="pageMove(this.id)" id="이전">이전</a>
					<c:if test="${itemSize > pageNoMax}">

						<c:set var="maxNo" value="${itemSize+pageNoMax-1}" />

						<c:forEach var="x" begin="1" end="${maxNo / pageNoMax}">
							<fmt:parseNumber type="number" integerOnly="true" var="noFlag"
								value="${(pageNo+pageNoMax-1) / pageNoMax}" />

							<c:if
								test="${(noFlag * pageNoMax) - (pageNoMax-1) <= x and x <= (noFlag * pageNoMax)}">
								<a href="#" onclick="pageMove(this.id)" id="${x}">${x}</a>
							</c:if>
						</c:forEach>

					</c:if>

					<a href="#" onclick="pageMove(this.id)" id="다음">다음</a>
				</div>

			</div>

		</c:if>

	</c:if>
</div>



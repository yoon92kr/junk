<!-- 2021.11.24 윤상현 -->
<!-- 2021.12.03 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"
	import="java.net.URLEncoder, java.net.URL, 
   java.net.HttpURLConnection, java.io.BufferedReader, java.io.InputStreamReader"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="3" />
<!-- itemList에는 표시할 item의 size를 대입한다. -->
<c:set var="itemList" value="${bestProducts.size()}" />
<c:if test='${cookie.mainPop.value ne "none"}'>
	<script>
		window.addEventListener('load', function() {
		
		var url = "${contextPath}/popUp.do";
		var name = "바로입 프로젝트";
		var popupX = (document.body.offsetWidth / 2) - (500 / 2);
		var popupY= (window.screen.height / 2) - (500 / 2);
		
		var option = "width = 500, height = 500, left="+popupX+ ", top="+popupY+", location = no, directories = no, resizable = no, menubar = no, scrollbars = no, toolbars = no, status = no";
		window.open(url, name, option);
		});
	</script>
</c:if>


<div class="main-section">
	<div class="container-fluid">
		<!--page slider -->
		<div class="post-slider">

			<div class="post-wrapper">
				<div class="post">
					<img src="${contextPath}/resources/img/common/mainImage1.jpg"
						class="slider-image" alt="메인 이미지">

				</div>
				<div class="post">
					<img src="${contextPath}/resources/img/common/mainImage2.jpg"
						class="slider-image" alt="메인 이미지">
				</div>

				<div class="post">
					<img src="${contextPath}/resources/img/common/mainImage3.jpg"
						class="slider-image" alt="메인 이미지">
				</div>

				<div class="post">
					<img src="${contextPath}/resources/img/common/mainImage4.jpg"
						class="slider-image" alt="메인 이미지">

				</div>
			</div>
		</div>
		<!--post slider-->
	</div>
</div>
<br>

<!-- product section -->

<div class="product-section">
	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-4 offset-lg-1 main-section-solid">
				<hr>
			</div>

			<div class="col-lg-2 text-center">
				<div class="section-title">BEST ITEM</div>
			</div>

			<div class="col-lg-4 main-section-solid">
				<hr>
			</div>
		</div>
		<br>
	</div>
</div>
<c:if test="${empty bestProducts}">
	<br>
	<div class="col-lg-12 text-center">등록된 상품이 없습니다.</div>
</c:if>



<div class="container">
	<div class="row">
		<c:if test="${not empty bestProducts}">
			<c:forEach var="i" begin="1" end="${itemList}">
				<c:set var="key" value="product${i}" />

				<div class="col-lg-4">



					<div class="product_01_image">
						<a
							href="${contextPath}/product/productDetail.do?product_id=${bestProducts[key].product_id}">
							<img src="data:image/jpeg;base64,${bestProducts[key].image_file}"
							alt="상품 이미지">
						</a>
					</div>

					<div class="row item-format">

						<div class="col-lg-6">
							<a
								href="${contextPath}/product/productDetail.do?product_id=${bestProducts[key].product_id}">
								<span class="item-title">${bestProducts[key].product_main_title}</span>
								<br> <span class="item-comment">${bestProducts[key].product_sub_title}</span>
							</a>
						</div>

						<div class="col-lg-3 main_item_bottom_text">
							<span class="item-price"><fmt:formatNumber
									value="${bestProducts[key].product_price}" />원</span> <span
								class="item-dc"><fmt:formatNumber
									value="${bestProducts[key].product_discount}" />원</span> <br> <span
								class="item-real-price"><fmt:formatNumber
									value="${bestProducts[key].product_price-bestProducts[key].product_discount}" />원</span>
						</div>

						<div class="col-lg-3 text-right">
							<button class="main_cartImage" id="main_cartImage${i}" type="button" value="${bestProducts[key].product_id}" onclick="cartBTN(this);">
								<img src="${contextPath}/resources/img/common/cart-put-icon.png" alt="카트 담기 버튼 이미지">
							</button>
							<input id="main_bestItemTitle${i}" type="hidden"
								value="${bestProducts[key].product_main_title}">
						</div>

					</div>

				</div>


			</c:forEach>
		</c:if>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$('.post-wrapper').slick({
			slidesToShow : 1,
			slidesToScroll : 1,
			autoplay : true,
			autoplaySpeed : 6000,
			nextArrow : $('.next'),
			prevArrow : $('.prev'),
		});
	});


</script>
<!-- 2022.01.10 한건희 -->
<c:if test="${not empty bestProducts}">
	<script>
		function cartBTN(item) {
			let product_id = item.value;
			let userFind = "${userInfo.user_id}";
			/* 비로그인 시 팝업창 */
			if (userFind == null || userFind == "") {
				let notUser = confirm("현재 비회원 상태 입니다. 비회원으로 주문 하시겠습니까?확인(예), 취소(로그인 or 회원가입)");
				if (notUser == false) {
					location = '${contextPath}/user/loginpage.do';
				} else {
					$.ajax({
						url : "${contextPath}/cart/addProductInCart.do",
						type : "GET",
						dataType : "text",
						data : {
							"product_id" : product_id,
							"cart_count" : 1
						},
						success : function(find) {
							let cartGo;
							let cartIn;
							/* 해당 상품이 장바구니에 있을 경우 수량 변경 여부 */
							if (find == "overLapProduct") {
							cartIn = confirm("장바구니에 해당 상품이 있습니다. 수량을 추가하시겠습니까?");
							if (cartIn == true) {
								$.ajax({
									url : '${contextPath}/cart/cartInProductOverLap.do',
									type : 'GET',
									dataType : 'text',
									data : {
										"product_id" : product_id,
										"cart_count" : 1,
									},success : function() {
										
									}
								}).error(function() {
										alert('수량 변경이 실패했습니다. 잠시 후 다시 시도해 주세요.');
									});
								}
							} else {
								cartGo = confirm("장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?");
								if (cartGo == true) {
									location = '${contextPath}/cart/cartList.do';
								}
							}
						}
					}).error(function() {
						alert('장바구니에 담기 실패했습니다. 잠시 후 다시 시도해 주세요.');
					});
				}
			} else {
				$.ajax({
					url : "${contextPath}/cart/addProductInCart.do",
					type : "GET",
					dataType : "text",
					data : {
						"product_id" : product_id,
						"cart_count" : 1
					},success : function(find) {
						let cartGo;
						let cartIn;
						/* 해당 상품이 장바구니에 있을 경우 수량 변경 여부 */
						if (find == "overLapProduct") {
							cartIn = confirm("장바구니에 해당 상품이 있습니다. 수량을 추가하시겠습니까?");
							if (cartIn == true) {
								$.ajax({
									url : '${contextPath}/cart/cartInProductOverLap.do',
									type : 'GET',
									dataType : 'text',
									data : {
										"product_id" : product_id,
										"cart_count" : 1,
									},success : function() {
										
										}
									}).error(function() {
										alert('수량 변경이 실패했습니다. 잠시 후 다시 시도해 주세요.');
									});
								}
							} else {
								cartGo = confirm("장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?");
								if (cartGo == true) {
									location = '${contextPath}/cart/cartList.do';
								}
							}
						}
					}).error(function() {
						alert('장바구니에 담기 실패했습니다. 잠시 후 다시 시도해 주세요.');
					});
				}
		}
	</script>
</c:if>

<!-- 2021.11.24 윤상현 -->
<!-- 2021.12.03 한건희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<div class="main-section">
	<div class="container-fluid">
		<!--page slider -->
		<div class="post-slider">

			<div class="post-wrapper">
				<div class="post">
					<img src="${contextPath}/resources/img/common/img-box.jpg"
						class="slider-image" alt="메인 이미지">

				</div>
				<div class="post">
					<img src="${contextPath}/resources/img/common/img-box.jpg"
						class="slider-image" alt="메인 이미지">
				</div>

				<div class="post">
					<img src="${contextPath}/resources/img/common/img-box.jpg"
						class="slider-image" alt="메인 이미지">
				</div>

				<div class="post">
					<img src="${contextPath}/resources/img/common/img-box.jpg"
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
				<div class="section-title">
					BEST ITEM
				</div>
			</div>

			<div class="col-lg-4 main-section-solid">
				<hr>
			</div>
		</div>
		<br>

	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-4 text-center">
				<div class="product-image">
					<a href="${contextPath}/product_02.do"><img
						src="${contextPath}/resources/img/common/img-box.jpg"
						alt="베스트 상품 이미지"></a>
				</div>
			</div>

			<div class="col-lg-4  text-center">
				<div class="product-image">
					<a href="${contextPath}/product_02.do"><img
						src="${contextPath}/resources/img/common/img-box.jpg"
						alt="베스트 상품 이미지"></a>
				</div>
			</div>

			<div class="col-lg-4 text-center">
				<div class="product-image">
					<a href="${contextPath}/product_02.do"><img
						src="${contextPath}/resources/img/common/img-box.jpg"
						alt="베스트 상품 이미지"></a>
				</div>
			</div>
		</div>
		<div class="item-format">
			<div class="row">
				<div class="col-lg-3 main_item_bottom_text">
					<a href="${contextPath}/product_02.do" class="">
						<span class="item-title item-location-left-top">[상품명]</span>
						<span class="item-price"></span>
						<span class="item-dc">[할인]</span>
						<br>
						<span class="item-comment item-location-left-bottom">[상품 설명]</span>
						<span class="item-real-price">[판매가]</span>
					</a>
				</div>
				
				<div class="col-lg-1 text-center main_item_bottom_text">
					<form>
						<input type="image" src="${contextPath}/resources/img/common/cart-put-icon.png" alt="카트 담기 버튼 이미지">
					</form>
				</div>

				<div class="col-lg-3 main_item_bottom_text">
					<a href="${contextPath}/product_02.do" class="">
						<span class="item-title item-location-left-top">[상품명]</span>
						<span class="item-price">[상품원가]</span>
						<span class="item-dc">[할인]</span>
						<br>
						<span class="item-comment item-location-left-bottom">[상품 설명]</span>
						<span class="item-real-price">[판매가]</span>
					</a>
				</div>
				
				<div class="col-lg-1 text-center main_item_bottom_text">
					<form>
						<input type="image" src="${contextPath}/resources/img/common/cart-put-icon.png" alt="카트 담기 버튼 이미지">
					</form>
				</div>

				<div class="col-lg-3 main_item_bottom_text">
					<a href="${contextPath}/product_02.do" class="">
						<span class="item-title item-location-left-top">[상품명]</span>
						<span class="item-price">[상품원가]</span>
						<span class="item-dc">[할인]</span>
						<br>
						<span class="item-comment item-location-left-bottom">[상품 설명]</span>
						<span class="item-real-price">[판매가]</span>
					</a>
				</div>
				
				<div class="col-lg-1 text-center main_item_bottom_text">
					<form>
						<input type="image" src="${contextPath}/resources/img/common/cart-put-icon.png" alt="카트 담기 버튼 이미지">
					</form>
				</div>

		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$('.post-wrapper').slick({
			slidesToShow : 1,
			slidesToScroll : 1,
			autoplay : true,
			autoplaySpeed : 3000,
			nextArrow : $('.next'),
			prevArrow : $('.prev'),
		});
	});
</script>
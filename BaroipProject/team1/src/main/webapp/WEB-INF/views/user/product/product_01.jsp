<!-- 2021.11.25 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-10 offset-lg-1 text-center product_01_banner">
			<img id="product_01_main_img"
				src="${contextPath}/resources/img/common/vegi_main_banner.jpg" alt="상품리스트 배너 이미지">
		</div>
	</div>

	<div class="row">
		<div class="col-lg-8 offset-lg-2 text-center product_01_main_title">[카테고리명]</div>
	</div>

	<div class="row">
		<div class="col-lg-6 offset-lg-3 text-center product_01_sub_title">
			<a href="#">[소분류]</a> <a href="#">[소분류]</a> <a href="#">[소분류]</a>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12 .product_01_hr"></div>
	</div>

</div>


<!-- 아이템 필드  -->
<div class="container">
	<div class="row">
		<div class="col-lg-4 text-left">총 [상품개수] 의 상품이 있습니다.</div>
	</div>

	<div class="row">
		<div class="col-lg-6 text-left product_01_filter">
			<a href="#">판매 인기순</a> <a href="#">등록일순</a> <a href="#">높은 가격순</a> <a
				href="#">낮은 가격순</a>
		</div>
		
		<div class="col-lg-2 offset-lg-4 text-center">
					<form class="product_01_search-box">
						<input class="search-box" type="text">
					</form>
				</div>

	</div>

	<div class="row">
		<div class="col-lg-12 product_01_hr"></div>

	</div>

	<div class="row">
		<div class="col-lg-4 text-center">
			<div class="product_01_image">
				<a href="${contextPath}/product_02.do"><img
					src="${contextPath}/resources/img/common/img-box.jpg" alt="상품 리스트 상품 이미지"></a>
			</div>
		</div>

		<div class="col-lg-4  text-center">
			<div class="product_01_image">
				<a href="${contextPath}/product_02.do"><img
					src="${contextPath}/resources/img/common/img-box.jpg" alt="상품 리스트 상품 이미지"></a>
			</div>
		</div>

		<div class="col-lg-4 text-center">
			<div class="product_01_image">
				<a href="${contextPath}/product_02.do"><img
					src="${contextPath}/resources/img/common/img-box.jpg" alt="상품 리스트 상품 이미지"></a>
			</div>
		</div>
	</div>
	<div class="item-format">
		<div class="row">
			<div class="col-lg-3">
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
					<form action="${contextPath}/cart/cartLst.do">
						<input type="image" src="${contextPath}/resources/img/common/cart-put-icon.png" alt="카트 담기 버튼 이미지">
					</form>
				</div>

			<div class="col-lg-3">
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

			<div class="col-lg-3">
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
	<div class="row">
		<div class="col-lg-4 text-center">
			<div class="product_01_image">
				<a href="${contextPath}/product_02.do"><img
					src="${contextPath}/resources/img/common/img-box.jpg" alt="상품 리스트 상품 이미지"></a>
			</div>
		</div>

		<div class="col-lg-4  text-center">
			<div class="product_01_image">
				<a href="${contextPath}/product_02.do"><img
					src="${contextPath}/resources/img/common/img-box.jpg" alt="상품 리스트 상품 이미지"></a>
			</div>
		</div>

		<div class="col-lg-4 text-center">
			<div class="product_01_image">
				<a href="${contextPath}/product_02.do"><img
					src="${contextPath}/resources/img/common/img-box.jpg" alt="상품 리스트 상품 이미지"></a>
			</div>
		</div>
	</div>
	<div class="item-format">
		<div class="row">
			<div class="col-lg-2">
				<a href="#" class="item-title">[상품명]</a><br> <a href="#"
					class="item-comment">[상품 설명]</a>

			</div>

			<div class="col-lg-1 text-left" style="padding: 0px 5px 0px 5px">
				<a href="#" class="item-price">[상품 원가]</a> <a href="#"
					class="item-dc">[할인]</a><br> <a href="#"
					class="item-real-price">[판매가]</a>
			</div>


			<div class="col-lg-1 text-center">
				<a href="#"><img class="cart-put-icon"
					src="${contextPath}/resources/img/common/cart-put-icon.png" alt="상품리스트 장바구니 담기 버튼 이미지"></a>
			</div>

			<div class="col-lg-2">
				<a href="#" class="item-title">[상품명]</a><br> <a href="#"
					class="item-comment">[상품 설명]</a>

			</div>

			<div class="col-lg-1 text-left" style="padding: 0px 5px 0px 5px">
				<a href="#" class="item-price">[상품 원가]</a> <a href="#"
					class="item-dc">[할인]</a><br> <a href="#"
					class="item-real-price">[판매가]</a>
			</div>
			<div class="col-lg-1 text-center">
				<a href="#"><img class="cart-put-icon"
					src="${contextPath}/resources/img/common/cart-put-icon.png" alt="상품리스트 장바구니 담기 버튼 이미지"></a>
			</div>

			<div class="col-lg-2">
				<a href="#" class="item-title">[상품명]</a><br> <a href="#"
					class="item-comment">[상품 설명]</a>

			</div>

			<div class="col-lg-1 text-left" style="padding: 0px 5px 0px 5px">
				<a href="#" class="item-price">[상품 원가]</a> <a href="#"
					class="item-dc">[할인]</a><br> <a href="#"
					class="item-real-price">[판매가]</a>
			</div>

			<div class="col-lg-1 text-center">
				<a href="#"><img class="cart-put-icon"
					src="${contextPath}/resources/img/common/cart-put-icon.png" alt="상품리스트 장바구니 담기 버튼 이미지"></a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-4 text-center">
			<div class="product_01_image">
				<a href="${contextPath}/product_02.do"><img
					src="${contextPath}/resources/img/common/img-box.jpg" alt="상품 리스트 상품 이미지"></a>
			</div>
		</div>

		<div class="col-lg-4  text-center">
			<div class="product_01_image">
				<a href="${contextPath}/product_02.do"><img
					src="${contextPath}/resources/img/common/img-box.jpg" alt="상품 리스트 상품 이미지"></a>
			</div>
		</div>

		<div class="col-lg-4 text-center">
			<div class="product_01_image">
				<a href="${contextPath}/product_02.do"><img
					src="${contextPath}/resources/img/common/img-box.jpg" alt="상품 리스트 상품 이미지"></a>
			</div>
		</div>
	</div>
	<div class="item-format">
		<div class="row">
			<div class="col-lg-2">
				<a href="#" class="item-title">[상품명]</a><br> <a href="#"
					class="item-comment">[상품 설명]</a>

			</div>

			<div class="col-lg-1 text-left" style="padding: 0px 5px 0px 5px">
				<a href="#" class="item-price">[상품 원가]</a> <a href="#"
					class="item-dc">[할인]</a><br> <a href="#"
					class="item-real-price">[판매가]</a>
			</div>


			<div class="col-lg-1 text-center">
				<a href="#"><img class="cart-put-icon"
					src="${contextPath}/resources/img/common/cart-put-icon.png" alt="상품리스트 장바구니 담기 버튼 이미지"></a>
			</div>

			<div class="col-lg-2">
				<a href="#" class="item-title">[상품명]</a><br> <a href="#"
					class="item-comment">[상품 설명]</a>

			</div>

			<div class="col-lg-1 text-left" style="padding: 0px 5px 0px 5px">
				<a href="#" class="item-price">[상품 원가]</a> <a href="#"
					class="item-dc">[할인]</a><br> <a href="#"
					class="item-real-price">[판매가]</a>
			</div>
			<div class="col-lg-1 text-center">
				<a href="#"><img class="cart-put-icon"
					src="${contextPath}/resources/img/common/cart-put-icon.png" alt="상품리스트 장바구니 담기 버튼 이미지"></a>
			</div>

			<div class="col-lg-2">
				<a href="#" class="item-title">[상품명]</a><br> <a href="#"
					class="item-comment">[상품 설명]</a>

			</div>

			<div class="col-lg-1 text-left" style="padding: 0px 5px 0px 5px">
				<a href="#" class="item-price">[상품 원가]</a> <a href="#"
					class="item-dc">[할인]</a><br> <a href="#"
					class="item-real-price">[판매가]</a>
			</div>

			<div class="col-lg-1 text-center">
				<a href="#"><img class="cart-put-icon"
					src="${contextPath}/resources/img/common/cart-put-icon.png" alt="상품리스트 장바구니 담기 버튼 이미지"></a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-4 text-center">
			<div class="product_01_image">
				<a href="${contextPath}/product_02.do"><img
					src="${contextPath}/resources/img/common/img-box.jpg" alt="상품 리스트 상품 이미지"></a>
			</div>
		</div>

		<div class="col-lg-4  text-center">
			<div class="product_01_image">
				<a href="${contextPath}/product_02.do"><img
					src="${contextPath}/resources/img/common/img-box.jpg" alt="상품 리스트 상품 이미지"></a>
			</div>
		</div>

		<div class="col-lg-4 text-center">
			<div class="product_01_image">
				<a href="${contextPath}/product_02.do"><img
					src="${contextPath}/resources/img/common/img-box.jpg" alt="상품 리스트 상품 이미지"></a>
			</div>
		</div>
	</div>
	<div class="item-format">
		<div class="row">
			<div class="col-lg-2">
				<a href="#" class="item-title">[상품명]</a><br> <a href="#"
					class="item-comment">[상품 설명]</a>

			</div>

			<div class="col-lg-1 text-left" style="padding: 0px 5px 0px 5px">
				<a href="#" class="item-price">[상품 원가]</a> <a href="#"
					class="item-dc">[할인]</a><br> <a href="#"
					class="item-real-price">[판매가]</a>
			</div>


			<div class="col-lg-1 text-center">
				<a href="#"><img class="cart-put-icon"
					src="${contextPath}/resources/img/common/cart-put-icon.png" alt="상품리스트 장바구니 담기 버튼 이미지"></a>
			</div>

			<div class="col-lg-2">
				<a href="#" class="item-title">[상품명]</a><br> <a href="#"
					class="item-comment">[상품 설명]</a>

			</div>

			<div class="col-lg-1 text-left" style="padding: 0px 5px 0px 5px">
				<a href="#" class="item-price">[상품 원가]</a> <a href="#"
					class="item-dc">[할인]</a><br> <a href="#"
					class="item-real-price">[판매가]</a>
			</div>
			<div class="col-lg-1 text-center">
				<a href="#"><img class="cart-put-icon"
					src="${contextPath}/resources/img/common/cart-put-icon.png" alt="상품리스트 장바구니 담기 버튼 이미지"></a>
			</div>

			<div class="col-lg-2">
				<a href="#" class="item-title">[상품명]</a><br> <a href="#"
					class="item-comment">[상품 설명]</a>

			</div>

			<div class="col-lg-1 text-left" style="padding: 0px 5px 0px 5px">
				<a href="#" class="item-price">[상품 원가]</a> <a href="#"
					class="item-dc">[할인]</a><br> <a href="#"
					class="item-real-price">[판매가]</a>
			</div>

			<div class="col-lg-1 text-center">
				<a href="#"><img class="cart-put-icon"
					src="${contextPath}/resources/img/common/cart-put-icon.png" alt="상품리스트 장바구니 담기 버튼 이미지"></a>
			</div>
		</div>

	</div>

	<!-- 필드 이동 -->

	<div class="row">
		<div class="offset-lg-5 col-lg-1 text-center notice_01_line ">
			<p class="notice_01_next">
				<a href="#"> < 이전 </a>
		</div>
		<div class="col-lg-1 text-center notice_01_line">
			<p class="notice_01_next">
				<a href="#"> 다음 > </a>

			</p>
		</div>
	</div>


</div>
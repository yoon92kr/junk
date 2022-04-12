<!-- 2021.11.24 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="quick-menu">
	<div class="quick-item up">
		<a href="#"><img
			src="${contextPath }/resources/img/common/top.png" alt="퀵메뉴 상단 이동 버튼 이미지"></a>
	</div>
	<p>최근 본 상품</p>
	
		<c:if test="${not empty lastProduct[0]}">
			<div class="quick-item past-image">
				<a href="${contextPath}/product/productDetail.do?product_id=${lastProduct[0]}"><img
					class= "quickImg" src="data:image/jpeg;base64,${lastImage[0]}" alt="퀵메뉴 상품 이미지"></a>
			</div>
		</c:if>
		
		<c:if test="${empty lastProduct[0]}">
			<div class="quick-item past-image">
				<img class= "quickImg" src="${contextPath}/resources/img/common/img-box.jpg" alt="퀵메뉴 상품 이미지">
			</div>
		</c:if>	
		
		<c:if test="${not empty lastProduct[1]}">
			<div class="quick-item past-image">
				<a href="${contextPath}/product/productDetail.do?product_id=${lastProduct[1]}"><img
					class= "quickImg" src="data:image/jpeg;base64,${lastImage[1]}" alt="퀵메뉴 상품 이미지"></a>
			</div>
		</c:if>
		
		<c:if test="${empty lastProduct[1]}">
			<div class="quick-item past-image">
				<img class= "quickImg" src="${contextPath}/resources/img/common/img-box.jpg" alt="퀵메뉴 상품 이미지">
			</div>
		</c:if>		
		

</div>

<script>
	$(function() {
		$('.up').on('click', function(e) {
			e.preventDefault();
			$('html,body').animate({
				scrollTop : 0
			}, 300);
		});
	});
</script>
<!-- 2021.11.24 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:set var="loginCheck" value="${userInfo.user_rank }" />

<!-- 클릭한 메뉴 색상변경을 위한 페이지 정보 확인 -->
<c:if test='${not empty pageInfo }'>
<script>
window.addEventListener('load', function() {
				 document.getElementById("${pageInfo}").style.color = "#e6b822";
});
</script>
</c:if>


<div class="header">
		<div class="container-fluid">


			<div class="row">
                <div class="col-lg-1 text-right">
					<a href="${contextPath}/main.do" class="logo-text" > 
						<img class="header-icon" src="${contextPath}/resources/img/common/favicon.png" alt="로고 이미지">   바로입
					</a>
				</div>
				
				<div class="col-lg-3 text-center">
					<div class="category">
						<a href="${contextPath}/product/product_list/farm.do" class="header-navi" id="set_farm">농산물</a>
						<a href="${contextPath}/product/product_list/marine.do" class="header-navi" id="set_marine">수산물</a>
						<a href="${contextPath}/product/product_list/meat.do" class="header-navi" id="set_meat">축산물</a>
					</div>
				</div>

				<div class="col-lg-2 text-right offset-lg-2">
					<div class="notice_navi">
						<a href="${contextPath}/notice/notice_list.do" class="header-navi" id="set_notice">공지사항</a>
						<a href="${contextPath}/cs/FAQ_list.do" class="header-navi navi-button" id="set_cs">고객센터</a>
					</div>
				</div>
		
				<div class="col-lg-2 text-center">
					<div class="user_navi">
					<c:choose>
					
						<c:when test="${loginOn==true and userInfo.user_rank > 1}">
								<a href="${contextPath}/user/logout.do" class="header-navi">로그아웃</a>
								<a href="${contextPath}/admin/main.do" class="header-navi" id="set_admin">관리자 페이지</a>
						</c:when>
							
						<c:when test="${loginOn==true and not empty userInfo and userInfo.user_rank == 1}">
								<a href="${contextPath}/user/logout.do" class="header-navi">로그아웃</a>
								<a href="${contextPath}/myPage/myInfo.do" class="header-navi" id="set_myPage">마이 페이지</a>
						</c:when>
						
						<c:otherwise>
						<a href="${contextPath}/user/loginpage.do" class="header-navi" id="set_login">로그인</a>
						<a href="${contextPath}/user/joinTerms.do" class="header-navi" id="set_join">회원가입</a>
						</c:otherwise>
						
					</c:choose>
					</div>	
				</div>

				<div class="col-lg-1 text-center">

				</div>
				
				<!-- SiteMap 내용 -->
				<div id="mySidenav" class="sidenav">
  					<h1> 사이트 맵 </h1>
  					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  					<h3> 쇼핑하기 </h3>
  					<div class="navImg" >
  					<a href="${contextPath}/product/product_list/farm.do"><img src="${contextPath}/resources/img/common/vegi_icon.png" alt="농산물 아이콘 이미지"></a>
  					<a href="${contextPath}/product/product_list/marine.do"><img src="${contextPath}/resources/img/common/fish_icon.png" alt="수산물 아이콘 이미지"></a>
  					<a href="${contextPath}/product/product_list/meat.do"><img src="${contextPath}/resources/img/common/meat_icon.png" alt="축산물 아이콘 이미지"></a>
  					</div>
  					<div class="shopingNav">
  					<a href="${contextPath}/product/product_list/farm.do">농산물</a>
  					<a href="${contextPath}/product/product_list/marine.do">수산물</a>
  					<a href="${contextPath}/product/product_list/meat.do">축산물</a>
  					</div>
  					<hr>
  					<h3>메뉴</h3>
  					<span class="myPageNav">
  					
  					<c:choose>
					
						<c:when test="${loginOn==true and userInfo.user_rank > 1}">
								<a href="${contextPath}/admin/main.do">관리자 페이지</a><br>
						</c:when>
							
						<c:when test="${loginOn==true and not empty userInfo and userInfo.user_rank == 1}">
								<a href="${contextPath}/myPage/myInfo.do">마이 페이지</a><br>
						</c:when>
						
						<c:otherwise>
						<a href="${contextPath}/user/loginpage.do">로그인</a><br>
						</c:otherwise>
						
					</c:choose>

  					<a href="${contextPath}/cart/cartList.do">장바구니</a><br>
  					<a href="${contextPath}/notice/notice_list.do">공지사항</a><br>
  					<a href="${contextPath}/cs/FAQ_list.do">고객센터</a>
  					</span>
				</div>
				
				<div class="col-lg-1 text-left" >
					<div class="menu_navi">
						<a href="${contextPath}/cart/cartList.do" class="header-cart"><img src="${contextPath}/resources/img/common/cart-icon.png" alt="장바구니 아이콘 이미지"></a>
						<span onclick="openNav()" class="header-navi header-siteMap-icon"><img src="${contextPath}/resources/img/common/site-map-icon.png" alt="사이트맵 아이콘 이미지"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
<script>
/* 사이트맵 설정 */
function openNav() {
    document.getElementById("mySidenav").style.width = "500px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}


window.onload = checkRank();

function checkRank() {

	if ('${loginCheck}' > 1) {

			var elements = document.getElementsByClassName('header'); // get all elements
			for(var i = 0; i < elements.length; i++){
				elements[i].style.backgroundColor = "#203864";
			}

	}

}


 

</script>

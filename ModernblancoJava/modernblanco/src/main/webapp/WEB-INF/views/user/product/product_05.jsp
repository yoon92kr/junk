<!-- 2021.11.30 윤상현 -->
<!-- 2022.02.08 한건희 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="8" />
<!-- itemSize에는 표시할 item의 size를 대입한다. -->
<c:set var="itemSize" value="${PQAList.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${PQAList}" />
<c:if test='${not empty pageNo}'>
	<script>
	
		window.addEventListener('load',function() {
			if(document.getElementById("${pageNo}")) {
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

<div class="container-fluid">
	<div class="row">
		<div
			class="col-lg-10 offset-lg-1 text-left product_02_mini_category_text product_03_mini_category_text">
			<a
				href="${contextPath}/product/productDetail.do?product_id=${product_id}">상품
				상세정보</a> <a
				href="${contextPath}/notice/productComment.do?product_id=${product_id}">고객
				후기</a> <a
				href="${contextPath}/product/productInfoPage.do?product_id=${product_id}">배송
				/교환 /반품 안내</a> <a>상품 문의</a>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-2 offset-lg-1">
			<img class="product_03_main_img"
				src="data:image/jpeg;base64,${productInfo.product.main}"
				alt="상품 대표 이미지">
		</div>
		<div class="col-lg-7 text-center">
			<div class="product_03_title">${productInfo.product.productVO.product_main_title}</div>
		</div>
		<div class="col-lg-1 text-center">
			<form action="${contextPath}/notice/add_PQA_form.do" method="GET">
				<input type="hidden" name="product_main_title"
					value="${productInfo.product.productVO.product_main_title}" /> <input
					type="hidden" name="product_id" value="${product_id}"> <input
					class="UQA_add_btn PQA_add_btn" type="submit" value="글쓰기" />
			</form>
		</div>
	</div>

	<div class="row">
		<div
			class="offset-lg-1 col-lg-1 text-center product_05_detail_title_header">
			<span>번호</span>
		</div>
		<div class="col-lg-1 text-center product_05_detail_title_header">
			<span>작성자</span>
		</div>
		<div class="col-lg-1 text-center product_05_detail_title_header">
			<span>공개 여부</span>
		</div>
		<div class="col-lg-4 text-center product_05_detail_title_header">
			<span>제목</span>
		</div>
		<div class="col-lg-3 text-center product_05_detail_title_header">
			<span>작성일자</span>
		</div>
		<hr>
	</div>

	<c:choose>
		<c:when test="${empty itemList}">
			<div class="row">
				<div class="offset-lg-1 col-lg-10 text-center notice_01_section">
					<span>작성된 상품 후기가 없습니다.</span>
				</div>
			</div>
		</c:when>
		<c:when test="${not empty itemList}">
			<c:forEach var="i" begin="1" end="${itemSize}">
				<c:set var="list" value="noticeItem${i}" />
				<c:set var="desc" value="${itemSize - i + 1}" />
				<c:set var="j" value="${(pageNoMax - pageNo * pageNoMax) + desc}" />

				<c:if
					test="${not empty itemList[list].noticeList.notice_id && i< pageNoMax+1}">

					<div class="row">
						<div class="offset-lg-1 col-lg-1 text-center notice_01_section">
							<span>${j}</span>
						</div>
						<div class="col-lg-1 text-center notice_01_section">
							<span>${itemList[list].noticeList.user_id}</span>
						</div>
						<div class="col-lg-1 text-center notice_01_section">
							<c:if test="${itemList[list].noticeList.notice_private == 0}">
								<input type="hidden" id="PQAPW_${j}"
									value="${itemList[list].noticeList.notice_pw}">
								<span>비공개</span>
							</c:if>
							<c:if test="${itemList[list].noticeList.notice_private == 1}">
								<span>공개</span>
							</c:if>
						</div>
						<div class="col-lg-4 text-center notice_01_section">
							<a id="PQAdetail_${j}" onclick="PQA_detail(this.id);">${itemList[list].noticeList.notice_title}</a>
						</div>
						<div class="col-lg-3 text-center notice_01_section">
							<span>${itemList[list].noticeList.notice_cre_date}</span>
						</div>
					</div>
					<input type="hidden" id="PQAprivate_${j}"
						value="${itemList[list].noticeList.notice_private}">
					<input type="hidden" id="PQAnoticeID_${j}"
						value="${itemList[list].noticeList.notice_id}">
					<input type="hidden" id="PQAuserID_${j}"
						value="${itemList[list].noticeList.user_id}">
				</c:if>
			</c:forEach>
		</c:when>
	</c:choose>


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
</div>

<script>

function PQA_detail(no) {
	let strArray = no.split('_');
	let target = document.getElementById('PQAprivate_'.concat(strArray[1])).value;
	let notice_id = document.getElementById('PQAnoticeID_'.concat(strArray[1])).value;
	let user_id = document.getElementById('PQAuserID_'.concat(strArray[1])).value;
	
	if(target == 1) {
		document.location="${contextPath}/myPage/productQuestion/QuestionDetail.do?notice_id="+notice_id;
	}
	else if(target == 0) {
		
		let notice_pw = document.getElementById('PQAPW_'.concat(strArray[1])).value;
		
		if ("${userInfo.user_id}" == user_id || "${userInfo.user_rank}" > 1) {
			document.location="${contextPath}/myPage/productQuestion/QuestionDetail.do?notice_id="+notice_id;
		}
		else {
			let pwFlag = prompt("비밀글입니다. 비밀번호를 입력해주세요.");
			if (notice_pw == pwFlag) {
				document.location="${contextPath}/myPage/productQuestion/QuestionDetail.do?notice_id="+notice_id;
			}
			else if(pwFlag == null) {
				
			}
			else if(notice_pw != pwFlag){
				alert("비밀번호가 올바르지 않습니다. 다시 확인해주세요.")
			}
		}
	}


}

	//페이지 이동 스크립트
	function pageMove(no) {
		var getValue = 0;
		var lastPage = parseInt(${itemSize+pageNoMax-1} / ${pageNoMax});
		if(no == "이전" || no == "다음") {
			var uriValue = window.location.search;
			
			var array = uriValue.split("pageNo=");
			if(array[1] == "" || array[1] == null) {
				array[1] = 1;
			}
			getValue = array[1];
		}
	
		
		if(no == "이전") {
			if(getValue == 1) {
				alert("마지막 페이지 입니다.");
			}
			else {
			document.location='${contextPath}/notice/PQAListPage.do?product_id=${product_id}&pageNo='+(--getValue);
			}
		}
		else if (no == "다음") {
			if(getValue == lastPage) {
				alert("마지막 페이지 입니다.");
			}
			else {
			document.location='${contextPath}/notice/PQAListPage.do?product_id=${product_id}&pageNo='+(++getValue);
			}
		}
		else {
			document.location='${contextPath}/notice/PQAListPage.do?pageNo='+no;
		}
	}
</script>
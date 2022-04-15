<!--  2021.11.30 강보석 -->
<!-- 2022.02.14 한건희 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="8" />
<!-- itemSize에는 표시할 item의 size를 대입한다. -->
<c:set var="itemSize" value="${myComments.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${myComments}" />
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


<div class="container-fluid">

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<h1 class="page_title">마이페이지</h1>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-2 col-lg-8 text-left cs_01_subtitle">
			<h3>상품후기</h3>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-2 col-lg-2 text-center cs_01_01header">
			<span>작성 일자</span>
		</div>
		<div class="col-lg-2 text-center cs_01_01header">
			<span>상품명</span>
		</div>
		<div class="col-lg-2 text-center cs_01_01header">
			<span>후기 제목</span>
		</div>
		<div class="col-lg-2 text-center cs_01_01header">
			<span>후기 변경</span>
		</div>
	</div>

	<c:choose>
		<c:when test="${empty itemList}">
			<div class="row">
				<div class="offset-lg-2 col-lg-8 text-center cs_02_listsection">
					<span>작성하신 문의가 없습니다.</span>
				</div>
			</div>
		</c:when>
		<c:when test="${not empty itemList}">
			<c:forEach var="i" begin="1" end="${itemSize}">
				<c:set var="desc" value="${itemSize - i + 1}" />
				<c:set var="j" value="${(pageNoMax - pageNo * pageNoMax) + desc}" />
				<c:set var="Num" value="${i-1}" />

				<c:if test="${not empty itemList[Num].notice_title && i< pageNoMax+1}">
					<div class="row">
						<div
							class="offset-lg-2 col-lg-2 text-center admincs_01listsection">
							<span>${itemList[Num].notice_cre_date}</span>
						</div>
						<div class="col-lg-2 text-center admincs_01listsection">
							<p class="cs">
								<a href="${contextPath}/product/productDetail.do?product_id=${itemList[Num].product_id}">${itemList[Num].product_main_title}</a>
						</div>
						<div class="col-lg-2 text-center admincs_01listsection">
							<button class="question_07 text-center questionList" id="que-${j}" onclick="openCloseAnswer(this.id)">
								<span id="que-${j}-toggle">${itemList[Num].notice_title}</span>
							</button>
							<div class="answer" id="ans-${j}">▶ ${itemList[Num].notice_body}
								<c:forEach var="a" begin="0" end="${answer.size()}">
									<c:if test="${answer[a].notice_match_no == itemList[Num].notice_id}">
										<br>└ Re : ${answer[a].notice_body}
									</c:if>
								</c:forEach>
							</div>
						</div>
						<div class="col-lg-2 text-center admincs_01_01listsection">
							<input id="update-${itemList[Num].notice_id}" class="myPage_myCommentList_btn_green" type="button" value="수정하기" onclick="deleteAndUpdateBtn(this);">
							<br> 
							<input id="delete-${itemList[Num].notice_id}" class="myPage_myCommentList_btn_gray" type="button" value="삭제하기" onclick="deleteAndUpdateBtn(this);">
						</div>
 					</div>
				</c:if>
			</c:forEach>
		</c:when>
	</c:choose>
	<form id="myComment_delete_update">
	</form>
	
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
function deleteAndUpdateBtn(target) {
	let notice_id = target.id.split("-");
	let form = document.getElementById("myComment_delete_update");
	let input = document.createElement("input");
	
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "notice_id");
	input.setAttribute("value", notice_id[1]);
	
	form.method = "GET";
	form.appendChild(input);
	
	if(notice_id[0] == "update") {
		form.action = "${contextPath}/myPage/myComment/myCommentUpdate.do";
		form.submit();
	}
	if(notice_id[0] == "delete") {
		let commentDelete = confirm("해당 후기를 삭제하시겠습니까?");
		if(commentDelete == true) {
			form.action = "${contextPath}/myPage/myComment/myCommentDelete.do";
			form.submit();
		}
	}
}

function openCloseAnswer(target) {
    let answerId = target.replace('que', 'ans');
    	    
	    if(document.getElementById(answerId).style.display === 'block') {
	      document.getElementById(answerId).style.display = 'none';
	    } else {
	      document.getElementById(answerId).style.display = 'block';
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
		document.location='${contextPath}/myPage/myComment.do?pageNo='+(--getValue);
		}
	}
	else if (no == "다음") {
		if(getValue == lastPage) {
			alert("마지막 페이지 입니다.");
		}
		else {
		document.location='${contextPath}/myPage/myComment.do?pageNo='+(++getValue);
		}
	}
	else {
		document.location='${contextPath}/myPage/myComment.do?pageNo='+no;
	}
}

</script>
<!--  2021.11.26 강보석 -->
<!--2022.01.14 윤상현 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 2022.01.07 윤상현 -->
<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="8" />
<!-- itemSize에는 표시할 item의 size를 대입한다. -->
<c:set var="itemSize" value="${UQAList.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${UQAList}" />
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
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<div class="container-fluid">

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<h1 class="page_title">고객센터</h1>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-2 col-lg-4 text-left cs_01_subtitle_update">
			<h3>1:1 문의</h3>
		</div>
		<div class="col-lg-4 text-right cs_02_writebtn">
			<input class="UQA_add_btn" value="1:1문의 글쓰기" type="button"
				onclick="location.href='${contextPath}/cs/add_UQA_form.do'">
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-2 col-lg-1 text-left cs_01_01header">
			<span>번호</span>
		</div>
		<div class="col-lg-1 text-left cs_01_01header">
			<span>아이디</span>
		</div>
		<div class="col-lg-1 text-center cs_01_01header">
			<span>공개 여부</span>
		</div>
		<div class="col-lg-3 text-center cs_01_01header">
			<span>제목</span>
		</div>
		<div class="col-lg-1 text-center cs_01_01header">
			<span>상태</span>
		</div>
		<div class="col-lg-1 text-center cs_01_01header">
			<span>작성일</span>
		</div>
		<hr>
	</div>


	<c:if test="${empty itemList}">
		<div class="row">
			<div class="offset-lg-2 col-lg-8 text-center cs_01_listsection">
				<span>등록된 글이 없습니다.</span>
			</div>
		</div>
	</c:if>

	<c:if test="${not empty itemList}">
		<c:forEach var="i" begin="0" end="${itemSize}">
			<c:set var="desc"
				value="${(pageNoMax - pageNo * pageNoMax) + itemSize - i}" />
			<c:set var="j" value="${(pageNo * pageNoMax - pageNoMax) + i}" />
			<c:if test="${not empty itemList[j] && i < pageNoMax}">

				<div class="row">
					<div class="offset-lg-2 col-lg-1 text-left cs_02_listsection ">
						<span>${desc}</span>
					</div>
					<div class="col-lg-1 text-left cs_02_listsection ">
						<span>${itemList[j].user_id }</span>
					</div>
					<div class="col-lg-1 text-center cs_02_listsection ">
						<c:if test="${itemList[j].notice_private == 0}">
							<input type="hidden" id="noticePW_${j}"
								value="${itemList[j].notice_pw}">
							<span>비공개</span>
						</c:if>
						<c:if test="${itemList[j].notice_private == 1}">
							<span>공개</span>
						</c:if>
					</div>
					<div class="col-lg-3 text-center cs_02_listsection ">
						<p class="cs">
							<a id="detail_${j}" onclick="UQA_detail(this.id)">
								${itemList[j].notice_title} </a>
						</p>
					</div>
					<div class="col-lg-1 text-center cs_02_listsection ">
						<span>
						<c:if test="${itemList[j].notice_parent_no == 0}">
							답변 대기중
						</c:if>
						<c:if test="${itemList[j].notice_parent_no == 1}">
							답변 완료
						</c:if>						
						</span>
					</div>
					<div class="col-lg-1 text-center cs_02_listsection ">
						<span><fmt:formatDate
								value="${itemList[j].notice_cre_date}" pattern="yyyy-MM-dd" /></span>
					</div>
				</div>
				<input type="hidden" id="private_${j}"
					value="${itemList[j].notice_private}">
				<input type="hidden" id="noticeID_${j}"
					value="${itemList[j].notice_id}">
				<input type="hidden" id="userID_${j}" value="${itemList[j].user_id}">
			</c:if>


		</c:forEach>

		<!--  2022.01.07 윤상현   -->
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

<script>


	// 2022.01.07 윤상현  
	// 페이지 이동 스크립트
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
			document.location='${contextPath}/cs/UQA_list.do?pageNo='+(--getValue);
			}
		}
		else if (no == "다음") {
			if(getValue == lastPage) {
				alert("마지막 페이지 입니다.");
			}
			else {
			document.location='${contextPath}/cs/UQA_list.do?pageNo='+(++getValue);
			}
		}
		else {
			document.location='${contextPath}/cs/UQA_list.do?pageNo='+no;
		}
	}
	
	// 게시글 상세보기시, 비밀글에 대한 유효성 스크립트
	function UQA_detail(no) {
		let strArray = no.split('_');
		let target = document.getElementById('private_'.concat(strArray[1])).value;
		let notice_id = document.getElementById('noticeID_'.concat(strArray[1])).value;
		let user_id = document.getElementById('userID_'.concat(strArray[1])).value;
		
		if(target == 1) {
			document.location="${contextPath}/cs/UQA_datail.do?notice_id="+notice_id;
		}
		else if(target == 0) {
			
			let notice_pw = document.getElementById('noticePW_'.concat(strArray[1])).value;
			
			if ("${userInfo.user_id}" == user_id || "${userInfo.user_rank}" > 1) {
				document.location="${contextPath}/cs/UQA_datail.do?notice_id="+notice_id;
			}
			else {
				let pwFlag = prompt("비밀글입니다. 비밀번호를 입력해주세요.");
				if (notice_pw == pwFlag) {
					document.location="${contextPath}/cs/UQA_datail.do?notice_id="+notice_id;
				}
				else if(pwFlag == null) {
					
				}
				else if(notice_pw != pwFlag){
					alert("비밀번호가 올바르지 않습니다. 다시 확인해주세요.")
				}
			}
		}

	
	}
</script>

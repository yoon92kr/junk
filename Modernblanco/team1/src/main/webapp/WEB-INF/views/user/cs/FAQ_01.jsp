<!--  2021.11.25 강보석 -->
<!-- 2021.12.14 한건희 수정 -->
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
<c:set var="itemSize" value="${noticeList.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${noticeList}" />
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

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>

<div class="container-fluid">

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<h1 class="page_title">고객센터</h1>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-2 col-lg-4 text-left cs_01_subtitle_update">
			<h3>자주 묻는 질문</h3>
		</div>
		<div class="col-lg-2 offset-lg-2 text-right">
   			<div class="search_box" style="margin-top: 30px;">
    			<input type="text" class="search_box_text" id="search_title" maxlength="9" onkeypress="if(event.keyCode=='13'){event.preventDefault(); serach_title();}">
    			<img src="${contextPath}/resources/img/common/search-icon.png" onclick="serach_title()" class="search_box_btn" >
    		</div>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-2 col-lg-1 text-center cs_01_01header">
			<span>번호</span>
		</div>
		<div class="col-lg-7 text-center cs_01_01header">
			<span>제목</span>
		</div>
		<hr>
	</div>

	<c:choose>
		<c:when test="${itemList == null }">
			<div class="row">
				<div class="offset-lg-2 col-lg-1 text-left cs_01_listsection">
						<span>등록된 글이 없습니다.</span>
				</div>
			</div>
		</c:when>
		
		<c:when test="${itemList != null }">
	<!--  2022.01.07 윤상현   -->		
		<c:forEach var="i" begin="1" end="${itemSize}">
			<c:set var="desc" value="${itemSize - i + 1}" />		
			<c:set var="j" value="${(pageNoMax - pageNo * pageNoMax) + desc}" />
			<c:set var="key" value="notice${j}" />
			
			<c:if test="${not empty itemList[key].notice.notice_id && i< pageNoMax+1}">
				
				<div class="row">
					<div class="offset-lg-2 col-lg-1 text-center cs_01_listsection">
						<span>${j}</span>
					</div>
					<div class="col-lg-7 text-center cs_01_listsection">
						<div class="faq-content">
							<button class="question text-center" id="que-${j}" onclick="openCloseAnswer(this.id)">
								<span id="que-${j}-toggle" class="cs_01-que-tollge">${itemList[key].notice.notice_title}</span>
							</button>
							<div class="answer" id="ans-${j}">▶ ${itemList[key].notice.notice_body}</div>
						</div>
					</div>
				</div>
				</c:if>
			</c:forEach>
			
		</c:when>
	</c:choose>
			<!--  2022.01.07 윤상현   -->
			<c:if test="${itemSize > pageNoMax}">

				<div class="row">

					<div class="col-lg-12 text-center admin_product_page_index">
						<a href="#" onclick="pageMove(this.id)" id="이전">이전</a>
						<c:if test="${itemSize > pageNoMax}">
						
							<c:set var="maxNo" value="${itemSize+pageNoMax-1}" />
							
							<c:forEach var="x" begin="1" end="${maxNo / pageNoMax}">
								<fmt:parseNumber type="number" integerOnly="true" var="noFlag" value="${(pageNo+pageNoMax-1) / pageNoMax}" />
							
								<c:if test="${(noFlag * pageNoMax) - (pageNoMax-1) <= x and x <= (noFlag * pageNoMax)}">
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
  
  function openCloseAnswer(target) {
	    let answerId = target.replace('que', 'ans');
	    	    
		    if(document.getElementById(answerId).style.display === 'block') {
		      document.getElementById(answerId).style.display = 'none';
		    } else {
		      document.getElementById(answerId).style.display = 'block';
		    }
	    
	  }  
//2022.01.07 윤상현  
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
		document.location='${contextPath}/cs/FAQ_list.do?pageNo='+(--getValue);
		}
	}
	else if (no == "다음") {
		if(getValue == lastPage) {
			alert("마지막 페이지 입니다.");
		}
		else {
		document.location='${contextPath}/cs/FAQ_list.do?pageNo='+(++getValue);
		}
	}
	else {
		document.location='${contextPath}/cs/FAQ_list.do?pageNo='+no;
	}
}

// FAQ 검색 스크립트
function serach_title() {
	let title = document.getElementById("search_title").value;
	
	if(title != null && title != "") {
		document.location='${contextPath}/cs/FAQ_list.do?search_option=notice_title&search_value='+title;
	}
	
}
</script>
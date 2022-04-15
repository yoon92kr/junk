<!--  2022.01.10 윤상현 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="7" />
<!-- itemSize에는 표시할 item의 size를 대입한다. -->
<c:set var="itemSize" value="${noticeList.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${noticeList}" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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

<c:if test='${not empty userInfo}'>
	<script>
   if(${userInfo.user_rank > 1}) {
   }
   
   else {
         alert("잘못된 접근입니다.");
         location.replace('${contextPath}/main.do');
      }
   </script>

</c:if>

<c:if test='${empty userInfo }'>
	<script>
      alert("잘못된 접근입니다.");
      location.replace('${contextPath}/main.do')
   </script>
</c:if>

<div class="container">

	<div class="row">
		<div class="col-lg-8 offset-lg-2 text-center">
			<h1 class="page_title" id="test">관리자 페이지</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12 text-left myPage_03_01-content-body">
			<h6 class="order_01-sub-title-page">
				<span class="order_01-sub-title">공지 관리</span>
			</h6>
		</div>
	</div>

	<div class="row">

		<div class="col-lg-2 offset-10 text-center adminUser_01-content-header">
			<input class="adminProduct_01-header-button adminProduct_01-button-top" type="button" value="공지 등록" onclick="add_notice()">
		</div>
	</div>

	<div class="row">
		<div class="col-lg-1 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">공지 번호</h6>
		</div>
		<div class="col-lg-1 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">등록일</h6>
		</div>
		<div class="col-lg-1 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">담당자</h6>
		</div>
		<div class="col-lg-7 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">공지 제목</h6>
		</div>
		<div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">상태 변경</h6>
		</div>
	</div>
	
	<c:if test="${empty itemList}">
		<br>
		<div class="col-lg-12 text-center">등록된 공지사항이 없습니다.</div>
	</c:if>
	
	<c:if test="${not empty itemList}">
		<c:forEach var="i" begin="1" end="${itemSize}">
			<c:set var="desc" value="${itemSize - i + 1}" />		
			<c:set var="j" value="${(pageNoMax - pageNo * pageNoMax) + desc}" />
			<c:set var="key" value="notice${j}" />
			
			<c:if test="${not empty itemList[key].notice.notice_id && i< pageNoMax+1}">

				<div class="row">
					<div class="col-lg-1 text-center admin_notice_01_list">
						${j}
					</div>
					<div class="col-lg-1 text-center admin_notice_01_list"	style="padding: 20px 0px 0px 0px">
						${itemList[key].notice.notice_cre_date}	
					</div>
					<div class="col-lg-1 text-center admin_notice_01_list">
						${itemList[key].notice.user_id}
					</div>
					<div id="admin_notice_title${j}" class="col-lg-7 text-center admin_notice_01_list">
						<a href ="${contextPath}/notice/notice_detail.do?notice_id=${itemList[key].notice.notice_id}" class="admin_notice_black">
						${itemList[key].notice.notice_title}
						</a>
					</div>
					<input type="hidden" id="notice_id${j}" value="${itemList[key].notice.notice_id}">
					<div class="col-lg-2 text-center admin_notice_01_list_btn_section">
						<input class="admin_notice_01_list_btn adminProduct_01-product-top" type="button" value="공지 수정" id="updateN_${j}" onclick="update_notice_form(this.id)"> 
						<input class="admin_notice_01_list_btn" id="deleteN_${j}" type="button" value="공지 삭제" onclick="delete_notice(this.id)">
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
			
	</c:if>


</div>

<script type="text/javascript">
	
	/* 공지 삭제 ajax */
	function delete_notice(target) {
		var strArray = target.split('_');
		var target_no = strArray[1];
		var user_rank = '${userInfo.user_rank}';

		let notice_title = document.getElementById('admin_notice_title'.concat(target_no)).innerText;
		let notice_id = document.getElementById('notice_id'.concat(target_no)).value;
		
		if(user_rank >= 3) {
			var confirmFlag = confirm(notice_title+"을(를) 정말 삭제하시겠습니까?");
			
			if(confirmFlag){
				
				$.ajax({
					type : "post",
					async : false,
					url : "${contextPath}/admin/notice/delete_notice.do",
					dataType : "text",
					data : {
						"notice_id" : notice_id			
					},
					success : function(message) {
						alert(notice_title+" 게시물이 정상적으로 삭제되었습니다.");
				 		location.reload();
					},
					error : function() {
						alert("해당 게시물 삭제에 문제가 발생하였습니다.");
					}

				});
			}
		} else {
			alert("해당 게시물을 삭제할 권한이 없습니다.");
		}
		

			

	
	}
	
	/* 공지 수정 ajax */
	function update_notice_form(target) {
		var strArray = target.split('_');
		var target_no = strArray[1];
		
		let notice_id = document.getElementById('notice_id'.concat(target_no)).value;
	
		
		if(${userInfo.user_rank > 2}) {

			location.href='${contextPath}/admin/notice/update_notice_form.do?notice_id='+notice_id;
			
		}
		
		else {
			alert("해당 게시물을 수정할 권한이 없습니다.");
		}
	}

	
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
			document.location='${contextPath}/admin/notice/notice_list.do?pageNo='+(--getValue);
			}
		}
		else if (no == "다음") {
			if(getValue == lastPage) {
				alert("마지막 페이지 입니다.");
			}
			else {
			document.location='${contextPath}/admin/notice/notice_list.do?pageNo='+(++getValue);
			}
		}
		else {
			document.location='${contextPath}/admin/notice/notice_list.do?pageNo='+no;
		}
	}
	
	function add_notice() {
		var user_rank = '${userInfo.user_rank}';
		
		if(user_rank >= 3) {
			document.location='${contextPath}/admin/notice/add_notice_form.do';
		}
		 else {
				alert("게시물을 등록할 권한이 없습니다.");
			}
		
	}
</script>
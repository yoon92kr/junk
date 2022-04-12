<!--  2022.01.11 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test='${not empty userInfo}'>
	<script>
   if(${userInfo.user_rank > 2}) {

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
<c:if test='${empty noticeVO }'>
	<script>

      alert("잘못된 접근입니다.");
      location.replace('${contextPath}/main.do')

   </script>

</c:if>

<div class="container-fluid">

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<h1 class="page_title">관리자 페이지</h1>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-3 col-lg-6 text-left cs_01_subtitle">
			<h3>공지 수정</h3>
		</div>
	</div>


<form action="${contextPath}/admin/notice/update_notice.do" method="post"
		id="admin_update_notice">
	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center notice_02_box01">
			<span>제목</span>
		</div>
		<div class="col-lg-4 text-left cs_02_02_box02">
			<input type="text" class="form-control notice_upload_check" name="notice_title" id="제목" value="${noticeVO.notice_title}">
		</div>

	</div>




	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center admincs_02_02_box03">
			<span>내용</span>
		</div>
		<div class="col-lg-4 text-left admincs_02_02_box04">
			<textarea class="form-control notice_upload_check" id="내용" name="notice_body" rows="15" >${noticeVO.notice_body}</textarea>
		</div>


	</div>
	<input type="hidden" name="user_id" value="${userInfo.user_id }" >
	<input type="hidden" name="notice_id" value="${noticeVO.notice_id}" >
	<input type="hidden" name="notice_category" value="Notice" >
</form>

</div>


<div class="container-fluid">

	<div class="row">
		<div class="offset-lg-4 col-lg-2 text-right join_02-bottom-btn">
			<div class="bottom_btn_size admin_product_list_btn">
				<a href="#" onclick="submit_update_notice()">
					<input type="button" class="admin_btn_blue" value="공지 수정">
				</a>


			</div>
		</div>

		<div class="col-lg-2 text-center join_02-bottom-btn">
			<div class="bottom_btn_size admin_product_list_btn">
				<a href="${contextPath}/admin/notice/notice_list.do">
					<input type="button" class="admin_btn_gray" value="돌아가기">
				</a>
			</div>
		</div>



	</div>
</div>


<script type="text/javascript">

	// 공지 수정 전 rank 및 null 확인 스크립트
function submit_update_notice() {
	// 전체 input 태그 value를 체크하기위한 클래스 select
	var elements = document.getElementsByClassName('notice_upload_check');
	var checkFlag = true;
	for (var i = 0; i < elements.length; i++) {

		let uploadItem = elements[i].value;
		// 비어있는 파일이 하나라도 있다면 flag를 false로 대입.
		if (!uploadItem) {
			checkFlag = false;
		}

	}
	if (checkFlag) {
		document.getElementById('admin_update_notice').submit();
	} else {
		alert("제목과 내용은 반드시 입력해주셔야 합니다.")
	}

}
</script>

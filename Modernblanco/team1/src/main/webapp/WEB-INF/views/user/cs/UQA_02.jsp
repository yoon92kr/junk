<!--  2021.11.26 강보석 -->
<!-- 2021.12.15 한건희 수정 -->
<!--2022.01.14 윤상현 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<div class="container-fluid">

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<h1 class="page_title">고객센터</h1>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-2 col-lg-8 text-left cs_01_subtitle">
			<h3>1:1 문의</h3>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center notice_02_box01">
			<span>제목</span> <input type="hidden" name="notice_id"
				value="${noticeVO.notice_id}">
		</div>
		<div class="col-lg-4 text-center cs_02_02_box02">
			<input class="cs_02_02_text_box1" type="text" name="notice_title"
				value="${noticeVO.notice_title}" readonly>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
			<span>문의유형</span>
		</div>
		<div class="col-lg-4 text-center cs_02_02_box02">
			<input class="cs_02_02_text_box1" type="text" name="notice_type"
				value="${noticeVO.notice_type}" readonly>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
			<span>작성자 아이디</span>
		</div>
		<div class="col-lg-4 text-center cs_02_02_box02">
			<input class="cs_02_02_text_box1" type="text" name="user_id"
				value="${noticeVO.user_id}" readonly>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box03">
			<span>내용</span>
		</div>
		<div class="col-lg-4 text-center cs_02_02_box04">
			<textarea class="cs_02_02_quest_content" name="notice_body" readonly>${noticeVO.notice_body}</textarea>
		</div>
	</div>

	<div class="row">
		<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box03">
			<span>답글</span>
		</div>
		<div class="col-lg-4 text-center cs_02_02_box04">
			<textarea class="cs_02_02_quest_content" name="notice_body" readonly>${noticeVO.review}</textarea>
		</div>
	</div>	


	<div class="row">
	<c:if test="${noticeVO.user_id eq userInfo.user_id}">
		<div class="offset-lg-3 col-lg-2 text-center">
			<div class="notice_back_btn">
				<input onclick="update_notice()" class="user_btn_Bgreen" type="button" id="cs_02_02_update_btn" value="수정하기">
			</div>
		</div>	
	</c:if>
	<c:if test="${noticeVO.user_id ne userInfo.user_id}">
	<div class="offset-lg-3 col-lg-2 text-center"></div>
	</c:if>	

		<div class="col-lg-2 text-center">
			<div class="notice_back_btn">
				<a href="${contextPath}/cs/UQA_list.do">			
					<input class="user_btn_gray" type="button" id="cs_02_02_list_btn" value="목록">
				</a>
			</div>
		</div>
	<c:if test="${noticeVO.user_id eq userInfo.user_id}">
		<div class="col-lg-2 text-center">
			<div class="notice_back_btn">
			<input onclick="delete_notice()" class="user_btn_Dgray" type="button" id="cs_02_02_delete_btn" value="삭제">
			</div>
		</div>	
	</c:if>
	
	<c:if test="${noticeVO.user_id ne userInfo.user_id}">		
		<div class="col-lg-2 text-center"></div>
	</c:if>	

	</div>

</div>

<script>

	// notice 삭제 버튼	
	function delete_notice() {

		let user_rank = '${userInfo.user_rank}';
		let notice_title = '${noticeVO.notice_title}';
		let notice_id = '${noticeVO.notice_id}';
		
			var confirmFlag = confirm(notice_title+"을(를) 정말 삭제하시겠습니까?");
			
			if(confirmFlag){
				
				$.ajax({
					type : "post",
					async : false,
					url : "${contextPath}/cs/delete_UQA.do",
					dataType : "text",
					data : {
						"notice_id" : notice_id			
					},
					success : function(message) {
						alert(notice_title+" 게시물이 정상적으로 삭제되었습니다.");
						document.location='${contextPath}/cs/UQA_list.do';
					},
					error : function() {
						alert("해당 게시물 삭제에 문제가 발생하였습니다.");
					}

				});
			}
			
	}

	
	// notice 수정 버튼
	function update_notice() {

        var form = document.createElement("form");
        form.setAttribute("charset", "UTF-8");
        form.setAttribute("method", "Post");
        form.setAttribute("action", "${contextPath}/cs/UQA_update_form.do");
        
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "notice_id");
        hiddenField.setAttribute("value", '${noticeVO.notice_id}');

        form.appendChild(hiddenField);
        
        document.body.appendChild(form);
        form.submit();

		}

</script>

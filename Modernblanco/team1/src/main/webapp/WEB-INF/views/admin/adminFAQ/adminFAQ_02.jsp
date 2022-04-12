<!--  2022.01.11 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
			<h3>FAQ 상세보기</h3>
		</div>
	</div>



     <div class="row">
        <div class="offset-lg-3 col-lg-2 text-center notice_02_box01" ><span>제목</span>
        	<input type="hidden" name="notice_id" value="${noticeVO.notice_id}">
        </div>
        
        <div class="col-lg-4 text-center notice_02_box02">
        	<input class="cs_02_02_text_box1" type="text" name="notice_title"
        		value="${noticeVO.notice_title}" readonly>
        </div>
	</div>
        
	<div class="row">
        <div class="offset-lg-3 col-lg-2 text-center notice_02_box01" ><span>작성자</span>
        </div>
        <div class="col-lg-4 text-center notice_02_box02">
        <input class="cs_02_02_text_box1" type="text" name="user_id"
        	value="${noticeVO.user_id}" readonly>
        </div>
	</div>
        
        <div class="row">
        	<div class="offset-lg-3 col-lg-2 text-center notice_02_box01" ><span>작성 일자</span>
        </div>
        <div class="col-lg-4 text-center notice_02_box02">
        <input class="cs_02_02_text_box1" type="text" name="notice_cre_date"
        	value="${noticeVO.notice_cre_date}" readonly>
    	</div>
    </div>
    
    
    <div class="row">
        <div class="offset-lg-3 col-lg-2 text-center notice_02_box03" ><span>내용</span>
        </div>
        <div class="col-lg-4  notice_02_box04 text-center">
        <textarea class="notice_02_content_02" readonly>${noticeVO.notice_body}</textarea>
        </div>
    </div>


</div>


<div class="container-fluid">

	<div class="row">
		<div class="offset-lg-4 col-lg-2 text-right join_02-bottom-btn">
			<div class="bottom_btn_size admin_product_list_btn">
				<a href="${contextPath}/admin/FAQ/update_FAQ_form.do?notice_id=${noticeVO.notice_id}">
					<input type="button" class="admin_btn_blue" value="FAQ 수정">
				</a>


			</div>
		</div>

		<div class="col-lg-2 text-center join_02-bottom-btn">
			<div class="bottom_btn_size admin_product_list_btn">
				<a href="${contextPath}/admin/FAQ/FAQ_list.do">
					<input type="button" class="admin_btn_gray" value="돌아가기">
				</a>
			</div>
		</div>



	</div>
</div>



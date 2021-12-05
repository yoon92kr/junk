<!--  2021.11.24 강보석 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<div class="container-fluid">

    <div class="row">
        <div class="col-lg-4 offset-lg-4 text-center"><h1 class="page_title">공지사항</h1></div>
    </div>

      <div class="row">
        <div class="offset-lg-1 col-lg-10 offset-lg-1 notice_02_line02">
        <hr>
        </div>
        </div>
 
    
     <div class="row">
        <div class="offset-lg-3 col-lg-2 text-center notice_02_box01" ><span>제목</span></div>
        <div class="col-lg-4 text-center notice_02_box02"><span>[공지 제목]</span></div>
        </div>
        
        <div class="row">
        <div class="offset-lg-3 col-lg-2 text-center notice_02_box01" ><span>작성자</span></div>
        <div class="col-lg-4 text-center notice_02_box02"><span>[공지 작성자]</span></div>
        </div>
        
        <div class="row">
        <div class="offset-lg-3 col-lg-2 text-center notice_02_box01" ><span>작성 일자</span></div>
        <div class="col-lg-4 text-center notice_02_box02"><span>[공지 작성일자]</span></div>
    </div>
    <div class="row">
        <div class="offset-lg-3 col-lg-2 text-center notice_02_box03" ><span>내용</span></div>
        <div class="col-lg-4 text-center notice_02_box04"><span>[공지 내용]</span></div>
    </div>
    
    <div class="offset-lg-5 col-lg-2 text-right">
				<div class="notice_back_btn">
					<a href="${contextPath}/notice_01.do"><img
						src="${contextPath}/resources/img/common/notice_return.png" alt="공지사항 상세페이지 목록이동 버튼 이미지"></a>
				</div>
			</div>
   
    </div>

  
  



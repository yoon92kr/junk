<!-- 2021.11.30 한건희 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">
    <div class="MyPage_title">
    	<div class="row">
        	<div class="col-lg-4 offset-lg-4 text-center"><h1 class="page_title">관리자 페이지</h1></div>
    	</div>
    	
    	<div class="row">
    		<div class="col-lg-2 text-center"><img class="admin_main_page_favicon" src="${contextPath}/resources/img/common/admin_icon.png" alt="관리자 이미지"></div>
    		<div class="col-lg-10 text-left MyPage_padding">환영합니다 ${userInfo.user_id} 님!</div>
    		
    <div class="container">
	    <div class="MyPage_top-underline"></div>
    </div>
    </div>
</div>

<div class="container">
			<div class="MyPage_01_title">
				<div class="row">
        		<div class="col-lg-3 text-center">배송 대기 내역</div>
        		<div class="col-lg-3 text-center">배송 진행 중</div>
        		<div class="col-lg-3 text-center">미답변 문의 내역</div>
        		<div class="col-lg-3 text-center">미답변 후기 내역</div>
    		</div>
    		
    		<div class="MyPage_01_content MyPage_01_subtitle">
    		<div class="row admin_main_count">
    			<a href="${contextPath}/admin/order/order_list.do" class="col-lg-3 text-center">${mainInfo.total_order}건</a>
        		<a href="${contextPath}/admin/order/order_list.do" class="col-lg-3 text-center">${mainInfo.total_delivery}건</a>
        		<a href="${contextPath}/admin/CS/QA_list.do" class="col-lg-3 text-center">${mainInfo.total_QA}건</a>
        		<a href="${contextPath}/admin/CS/review_list.do" class="col-lg-3 text-center">${mainInfo.total_comment}건</a>
    		</div>
    		
    		
    		<div class="row">
    		<div class="col-lg"><hr></div>
			</div>
    	</div>                                   
    </div>                                       
</div>
</div>                                              
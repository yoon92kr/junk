<!--  2021.11.25 강보석 -->
<!--2022.01.14 윤상현 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



      
        <div class="container">
	<div class="cs01-section">
		<div class="row">
			<div class="offset-lg-4 col-lg-4 text-center">

			<a id="FAQ" href="${contextPath}/cs/FAQ_list.do"  class="no-underline">자주 묻는 질문</a>
			<a id="UQA" href="${contextPath}/cs/UQA_list.do"  class="no-underline">1:1 문의</a>
			
	
			</div>
		</div>
	</div>
	</div>
<script>
	window.addEventListener('load',function() {
		if('${viewName}'.indexOf('FAQ') != -1) {
			document.getElementById("FAQ").style.fontFamily = "kopub_bold";
		}
		else if('${viewName}'.indexOf('UQA') != -1) {
			document.getElementById("UQA").style.fontFamily = "kopub_bold";
		}
						
	});
</script>
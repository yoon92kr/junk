<!-- 2021.11.30 윤상현 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-10 offset-lg-1 text-left product_02_mini_category_text product_03_mini_category_text">
			<a href="${contextPath}/product_02.do">상품 상세정보</a> 
			<a href="${contextPath}/product_03.do">고객 후기</a> 
			<a href="${contextPath}/product_04.do">배송 / 교환 /반품 안내</a> 
			<a href="${contextPath}/product_05.do">상품 문의</a>
		</div>
	</div>

	
	<div class="row">	
		<div class="offset-lg-1 col-lg-10 text-left product_04_detail_title_header" ><span>배송 정보</span></div>
    </div>      
     
	<div class="row">	
		<div class="offset-lg-1 col-lg-2 text-left product_04_text_title" ><span>배송 택배사</span></div>
		<div class="col-lg-8 text-left product_04_text_body" ><span>우체국 택배</span></div>
    </div>     
       
	<div class="row">	
		<div class="offset-lg-1 col-lg-2 text-left product_04_text_title" ><span>배송 비용</span></div>
		<div class="col-lg-8 text-left product_04_text_body" ><span>3,000원 (특정 상품의 경우 배송비가 상이할 수 있습니다.)</span></div>
    </div> 
    
	<div class="row">	
		<div class="offset-lg-1 col-lg-2 text-left product_04_text_title" ><span>배송 기간</span></div>
		<div class="col-lg-8 text-left product_04_text_body" ><span>결제 후 3일 이내에 상품 발송</span></div>
    </div>   
    
 
	<div class="row">	
		<div class="offset-lg-1 col-lg-10 text-left product_04_detail_title_header" ><span>교환 / 반품 정보</span></div>
    </div> 
    
	<div class="row">	
		<div class="offset-lg-1 col-lg-2 text-left product_04_text_title" ><span>교환 규정</span></div>
		<div class="col-lg-8 text-left product_04_text_body" >
		<span>
		상품 특성상 단순 변심 및 개인적인 사유로 인한 교환 / 반품 / 환불이 불가능합니다.<br><br>
		상품의 변질, 이물질 발견, 택배 박스 파손의 경우 고객센터 (042—123-4567)로 문의주시면 교환 / 반품을 도와드리겠습니다.<br><br>
		고객센터 운영 시간은 평일 오전 09시 ~ 17시이며, 운영 시간 외 전화 문의는 다소 어렵습니다.<br>
		고객센터 1:1 문의에 사진과 함께 등록을 해주신다면, 담당자가 확인 후 빠른 업무처리를 도와드리겠습니다.<br><br>
		</span>
		</div>
    </div>   
    
	<div class="row">	
		<div class="offset-lg-1 col-lg-2 text-left product_04_text_title" ><span>반품 정보</span></div>
		<div class="col-lg-8 text-left product_04_text_body" ><span>대전광역시 서구 대덕대로 182 (반품 시 착불 발송)</span></div>
    </div>       	            
</div>
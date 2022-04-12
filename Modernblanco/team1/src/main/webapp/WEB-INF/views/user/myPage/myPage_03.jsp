<!-- 2021.11.30 임석희 myPage_03 -->
<!-- 2022.02.03 윤상현 수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="5" />
<!-- itemSize에는 표시할 item의 size를 대입한다. -->
<c:set var="itemSize" value="${orderList.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${orderList}" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:if test='${not empty pageNo}'>
	<script>
		window
				.addEventListener(
						'load',
						function() {
							if (document.getElementById("${pageNo}")) {
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

<div class="container">

	<div class="MyPage_title">
		<div class="row">
			<div class="col-lg-4 offset-lg-4 text-center">
				<h1 class="page_title">마이 페이지</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-2 text-center">
			
			<c:if test='${userInfo.user_membership == 1 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/basic_member_icon.png" alt="회원정보수정페이지 일반회원 이미지">
			</c:if>
			<c:if test='${userInfo.user_membership == 2 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/under_member_icon.png" alt="회원정보수정페이지 우수회원 이미지">
			</c:if>
			<c:if test='${userInfo.user_membership == 3 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/top_member_icon.png" alt="회원정보수정페이지 단골회원 이미지">
			</c:if>
			<c:if test='${userInfo.user_membership == 4 }'>
			<img class="mypage_membership_img" src="${contextPath}/resources/img/common/flex_member_icon.png" alt="회원정보수정페이지 FLEX회원 이미지">
			</c:if>									
				
			</div>
			<div class="col-lg-10 text-left MyPage_padding">주문 / 배송조회</div>

			<div class="container">
				<div class="MyPage_top-underline"></div>
			</div>
		</div>
	</div>


	<div class="row">

        <div class="col-lg-3 text-center adminUser_01-content-header">
        	조회 유형
        	<select class="adminUser_01-select-box-lookup" onchange="selectLookup(this.value)" id="search_option_category">
        			<option value="all">전체 주문</option>
        			<option value="orderDate">주문 일자</option>
			        <option value="productId">주문 상품</option>
			        <option value="state">배송 상태</option>
        		</select>
        </div>

		<div class="col-lg-6 text-center adminUser_01-content-header">

			<select id="search_option_state" class="adminUser_01-select-box-lookup">
				<option value="-2">반품/교환</option>
				<option value="-1">주문 취소</option>
				<option value="0">상품 준비중</option>
				<option value="1">상품 배송중</option>
				<option value="2">배송 완료</option>
			</select>
		
			<div id="search_option_date">
				<input id="search_option_date_begin"
					class="adminUser_01-select-box-lookup" type="date"> 부터 <input
					id="search_option_date_end" class="adminUser_01-select-box-lookup"
					type="date"> 까지
			</div>
			
			<div id="search_option_product_box">
				검색할 상품 : <input id="search_option_product" class="adminUser_01-select-box-lookup" type="text" onkeypress="if(event.keyCode=='13'){event.preventDefault(); search_order_to_date();}">
			</div>

		</div>

		<div class="col-lg-3 text-center adminUser_01-content-header">
			<input class="adminProduct_01-header-button" type="button"
				value="조회하기" onclick="search_order_to_date()">

		</div>
	</div>

	<div class="MyPage_03_center-box text-center">
		<div class="row">
			<div class="col-lg-2">주문 일자</div>
			<div class="col-lg-3">상품명</div>
			<div class="col-lg-1">수량</div>
			<div class="col-lg-2">결제금액</div>
			<div class="col-lg-2">주문 상태</div>
			<div class="col-lg-2">변경</div>
		</div>
	</div>

	<c:if test="${empty itemList}">
		<br>
		<div class="col-lg-12 text-center">조회된 주문내역이 없습니다.</div>
	</c:if>

	<c:if test="${not empty itemList}">
		<c:forEach var="i" begin="0" end="${itemSize}">
			<c:set var="j" value="${(pageNo * pageNoMax - pageNoMax) + i}" />
			<c:if test="${not empty itemList[j] && i < pageNoMax}">

				<div class="MyPage_03_center-box-01 text-center">
					<div class="row">
					<input type="hidden" value="${itemList[j].order_id }" id="orderID_${j}">
					<input type="hidden" value="${itemList[j].order_amount }" id="orderCount_${j}">
					<input type="hidden" value="${(itemList[j].product_price - itemList[j].product_discount) * itemList[j].order_amount}" id="orderAmount_${j}">
						<div class="col-lg-2 text-center">
								<div class=" "><fmt:formatDate value="${itemList[j].order_date}" pattern="yyyy-MM-dd" /></div>
							<input class="MyPage_03-submit-box-01" type="button" id="orderDetail_${j}" 
								value="주문 상세 정보" onclick="order_detail(this.id)">
						</div>
						
						<div class="col-lg-3 MyPage_03_text_position_02">
							<a href="${contextPath}/product/productDetail.do?product_id=${itemList[j].product_id}">${itemList[j].product_main_title}</a>
						</div>
						<div class="col-lg-1 MyPage_03_text_position_02"><fmt:formatNumber value="${itemList[j].order_amount}" /> 개</div>
						<div class="col-lg-2 MyPage_03_text_position_02"><fmt:formatNumber value="${(itemList[j].product_price - itemList[j].product_discount) * itemList[j].order_amount}" /> 원</div>
				
							<c:if test='${itemList[j].order_state == -3}'>
							<div class="col-lg-4">
								<div class="text-center MyPage_03_text_position_02">반품 / 교환 처리 완료</div>
							</div>
							</c:if>	
														
							<c:if test='${itemList[j].order_state == -2}'>
							<div class="col-lg-4">
								<div class="text-center MyPage_03_text_position_02">반품 / 교환 신청 접수</div>
							</div>
							</c:if>	
												
							<c:if test='${itemList[j].order_state == -1}'>
							<div class="col-lg-4">
								<div class="text-center MyPage_03_text_position_02">주문 취소</div>
							</div>
							</c:if>
							
							<c:if test='${itemList[j].order_state == 0}'>
							<div class="col-lg-2">
								<div class="text-center MyPage_03_text_position_02">상품 준비 중</div>
							</div>
							<div class="col-lg-2">
									<input class="MyPage_03_order_cancel-box MyPage_03_text_position_02" type="button" id="cancelOrder_${j}" value="주문 취소" onclick="update_state(this.id)">
							</div>
							</c:if>

							<c:if test='${itemList[j].order_state == 1}'>
							<div class="col-lg-2">
								<div class="text-center MyPage_03_text_position_02">상품 배송 중</div>
							</div>
							<div class="col-lg-2">
								<input class="MyPage_03-submit-box-02" type="button" id="deliveryCompleted_${j}" value="구매 확정" onclick="update_state(this.id)">
								<input class="MyPage_03-submit-box-02" type="button" value="배송 조회" onclick="checkDelivery('${itemList[j].order_delivery_id}')">
							</div>
							</c:if>						

							<c:if test='${itemList[j].order_state == 2}'>
							<div class="col-lg-2  ">
								<div class="text-center MyPage_03_text_position_02">배송 완료</div>
							</div>
							<c:if test='${itemList[j].notice_id != null}'>
								<div class="col-lg-2">
										<input class="MyPage_03_order_cancel-box MyPage_03_text_position_02" type="button" id="refund_${j}" value="반품 / 교환 신청" onclick="update_state(this.id)">
								</div>								
							</c:if>
							<c:if test='${itemList[j].notice_id == null}'>
								<div class="col-lg-2">
									<a href="${contextPath}/myPage/myComment/buyProductComment.do?product_id=${itemList[j].product_id}&order_id=${itemList[j].order_id}">
										<input class="MyPage_03-submit-box-02" type="button" value="상품 후기">
									</a>
										<input class="MyPage_03_order_cancel-box" type="button" id="refund_${j}" value="반품 / 교환 신청" onclick="update_state(this.id)">
								</div>							
							</c:if>


							</c:if>


						
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
//조회 필터 스크립트
function selectLookup(selectValue) {

    if (selectValue == "all") {
    	document.getElementById("search_option_state").style.display = 'none';
    	document.getElementById("search_option_date").style.display = 'none';
    	document.getElementById("search_option_product_box").style.display = 'none';
    }
    else if (selectValue == "orderDate") {
    	document.getElementById("search_option_state").style.display = 'none';
    	document.getElementById("search_option_date").style.display = 'inline';
    	document.getElementById("search_option_product_box").style.display = 'none';
    }
    else if (selectValue == "productId") {
    	document.getElementById("search_option_state").style.display = 'none';
    	document.getElementById("search_option_date").style.display = 'none';
    	document.getElementById("search_option_product_box").style.display = 'inline';
    }
    else if (selectValue == "state") {
    	document.getElementById("search_option_state").style.display = 'inline';
    	document.getElementById("search_option_date").style.display = 'none';
    	document.getElementById("search_option_product_box").style.display = 'none';
    }
    

    
 }
 
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
		document.location='${contextPath}/myPage/myOrder.do?pageNo='+(--getValue);
		}
	}
	else if (no == "다음") {
		if(getValue == lastPage) {
			alert("마지막 페이지 입니다.");
		}
		else {
		document.location='${contextPath}/myPage/myOrder.do?pageNo='+(++getValue);
		}
	}
	else {
		document.location='${contextPath}/myPage/myOrder.do?pageNo='+no;
	}
}

function checkDelivery(order_delivery_id) {
	
	var url = "https://tracker.delivery/#/kr.epost/"+order_delivery_id;
	var name = "바로입 프로젝트";
	var option = "width = 500, height = 500, top = 200, left = 700, location = no, directories = no, resizable = no, menubar = no, scrollbars = no, toolbars = no, status = no";

	alert("가상의 송장번호로, 정확한 배송조회가 되지 않습니다.");
	window.open(url, name, option);
	
	
	
}

// 주문 상세 스크립트
function order_detail(target){
	var strArray = target.split('_');
	var target_no = strArray[1];

	let order_id = document.getElementById('orderID_'.concat(target_no)).value;
	let user_id = "${userInfo.user_id}";

	let order_array = order_id.split('_');
	let order_id_group = 'baroip_order_'.concat(order_array[2], '_', order_array[3]);
		
    var form = document.createElement("form");
    form.setAttribute("charset", "UTF-8");
    form.setAttribute("method", "Post");
    form.setAttribute("action", "${contextPath}/myPage/myOrder/orderDetail.do");
  	  
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "order_id");
        hiddenField.setAttribute("value", order_id_group);
        form.appendChild(hiddenField);

  
    document.body.appendChild(form);
    form.submit();
	
}

// 구매확정 스크립트
function update_state(target) {
	var strArray = target.split('_');
	var target_no = strArray[1];

	let order_id = document.getElementById('orderID_'.concat(target_no)).value;
	let order_amount = document.getElementById('orderAmount_'.concat(target_no)).value;
	let order_count = document.getElementById('orderCount_'.concat(target_no)).value;
	let user_id = "${userInfo.user_id}";
	let update_option = strArray[0];
	let point = "";
	let submitFlag = false;
	let refundFlag = false;
	
    switch("${userInfo.user_membership}") {
    case "1" :
    	point = order_amount * 0.01
       break;
    
    case "2" :
    	point = order_amount * 0.03
       break;
       
    case "3" :
    	point = order_amount * 0.05
       break;
       
    case "4" :
    	point = order_amount * 0.1
	   break;
    }
   
    if(update_option == "deliveryCompleted") {
    	submitFlag = confirm("해당 주문을 구매확정 처리 하시겠습니까?");
    }  
    else if (update_option == "cancelOrder") {
    	submitFlag = confirm("해당 주문을 취소 하시겠습니까?");
    }
    else {
    	refundFlag = confirm("수령하신 상품을 반품/교환 신청 하시겠습니까?");
    }	
    	// 구매취소 신청 양식 이동
    	if(refundFlag) {
    	       var form = document.createElement("form");
    	       form.setAttribute("charset", "UTF-8");
    	       form.setAttribute("method", "Post");
    	       form.setAttribute("action", "${contextPath}/myPage/myOrder/refundForm.do");
    	     	  
    	           var hiddenField = document.createElement("input");
    	           hiddenField.setAttribute("type", "hidden");
    	           hiddenField.setAttribute("name", "order_id");
    	           hiddenField.setAttribute("value", order_id);
    	           form.appendChild(hiddenField);

    	     
    	       document.body.appendChild(form);
    	       form.submit();
    	}
			
    	else if(submitFlag) {
			$.ajax({
				type : "post",
				async : false,
				url : "${contextPath}/myPage/updateOrder.do",
				dataType : "text",
				data : {
					"update_option" : update_option,
					"order_id" : order_id,
					"point" : point,
					"user_id" : user_id,
					"amount" : order_amount,
					"count" : order_count
				},
				success : function(message) {
					alert(message);
			 		location.reload();
				},
				error : function() {
					alert("주문상태 변경에 문제가 발생하였습니다.");
				}

			});	
		}
				
}


function search_order_to_date() {

	let searchOption = document.getElementById('search_option_category').value;
	let beginDate = document.getElementById('search_option_date_begin').value;
	let endDate = document.getElementById('search_option_date_end').value;
	let searchDate = beginDate.concat(',', endDate);
	let searchText = document.getElementById('search_option_product').value;
	let searchState = document.getElementById('search_option_state').value;
	
	// 날짜 기준 조회
	if (searchOption == "orderDate") {
		if(endDate == "" || beginDate == "") {
			alert("정확한 조회 기간을 입력해주세요.");
		}
		else if(beginDate > endDate) {
			alert("조회 기준일이 종료일보다 클 수 없습니다.")
		}
		else {
			location.href='${contextPath}/myPage/myOrder.do?search_option='+searchOption+'&search_value='+searchDate;

		}
		
	}
	// 포함된 아이디 기준 조회
	else if (searchOption == "userId" || searchOption == "productId") {
		if (searchText.match(/\s/g)) {
			alert("검색어에 공백은 포함될 수 없습니다.")
		}
		else if(searchText == null || searchText == ""){
			alert("검색어를 입력해주세요.");
		}
		else {
			location.href='${contextPath}/myPage/myOrder.do?search_option='+searchOption+'&search_value='+searchText;
		}
	}
	
	// 주문 상태 기준 조회
	else if (searchOption == "state") {
			location.href='${contextPath}/myPage/myOrder.do?search_option='+searchOption+'&search_value='+searchState;
	}

	// 전체 회원 조회
	else if (searchOption == "all") {
		location.href='${contextPath}/myPage/myOrder.do';
	}
	
}

window.addEventListener('load', function() {
	
	   if(${search_option != null && search_option != ""}) {
	    selectedOption("search_option_category", "${search_option}");

	    var main_option = document.getElementById("search_option_category").value;
	    selectLookup(main_option);
	    
	    var begin = "";
	    var end = "";
	    if("${search_option}" == "orderDate") {
	    	var splitDate = "${search_value}".split(",");
	    }
	    
	    switch("${search_option}") {
	    case "orderDate" :
	    	document.getElementById("search_option_date_begin").value = splitDate[0];
	    	document.getElementById("search_option_date_end").value = splitDate[1];
	       break;
	    
	    case "productId" :
	    	document.getElementById("search_option_product").value = "${search_value}";
	       break;
	       
	    case "state" :
	    	selectedOption("search_option_state", "${search_value}");
		   break;
	    }
	    
	   }

	});
	
// id에는 select의 id값, value에는 선택하고자 하는 option의 value 값을 파라미터로 입력한다.
function selectedOption(id, value) {
	
	var obj = document.getElementById(id);

	for (i=0 ; i<obj.length ; i++) {
	if(obj[i].value == value) {
	obj[i].selected = true;
	
	      }
	   }
	}
</script>

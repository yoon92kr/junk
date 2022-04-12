<!-- 2021.12.02 임석희 adminReturn_01 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="6" />
<!-- itemSize에는 표시할 item의 size를 대입한다. -->
<c:set var="itemSize" value="${orderList.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${orderList}" />

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
        <div class="col-lg-4 offset-lg-4 text-center"><h1 class="page_title">관리자 페이지</h1></div>
    </div>
		
    	<div class="row">
    		<div class="col-lg-12 text-left myPage_03_01-content-body">
    			<h6 class="order_01-sub-title-page">
    				<a href="${contextPath}/admin/order/order_list.do" class="adminOrder_hov">주문 관리</a>
    				<a href="${contextPath}/admin/order/return_list.do" class="order_01-sub-title adminOrder_hov" style="margin-left: 50px;">반품 / 교환</a>
    			</h6>    			    		
   			</div>
	    </div>
   
    <div class="row">
        <div class="col-lg-3 text-center adminUser_01-content-header">
        	조회 유형
        	<select class="adminUser_01-select-box-lookup" onchange="selectLookup(this.value)" id="search_option_category">
        			<option value="all">전체</option>
        			<option value="orderDate">접수 일자</option>
        			<option value="userId">아이디</option>
			        <option value="productId">주문 번호</option>
        		</select>
        </div>
		<div class="col-lg-6 text-center adminUser_01-content-header">

			<div id="search_option_date">
				<input id="search_option_date_begin"
					class="adminUser_01-select-box-lookup" type="date"> 부터 <input
					id="search_option_date_end" class="adminUser_01-select-box-lookup"
					type="date"> 까지
			</div>
			
			<div id="search_option_id_box">
				검색할 아이디 : <input id="search_option_id" class="adminUser_01-select-box-lookup" type="text" onkeypress="if(event.keyCode=='13'){event.preventDefault(); search_order_to_option();}">
			</div>
			
			<div id="search_option_product_box">
				검색할 주문 번호 : <input id="search_option_product" class="adminUser_01-select-box-lookup" type="text" onkeypress="if(event.keyCode=='13'){event.preventDefault(); search_order_to_option();}">
			</div>
		

		</div>
        <div class="col-lg-3 text-right adminUser_01-content-header">
        	<input class="adminProduct_01-header-button" type="button" value="조회하기" onclick="search_order_to_option()">
        </div>
    </div>
    
    <div class="row">
		<div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">회원아이디</h6>
	    </div>
	    <div class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">주문 내역</h6>
	    </div>
	    <div class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">결제 금액</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">반품 / 교환 사유</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">승인 / 거절</h6>
	    </div>
	</div>
    
	<c:if test="${empty itemList}">
		<br>
		<div class="col-lg-12 text-center">반품 / 교환 요청이 없습니다.</div>
	</c:if>    
	
	<c:if test="${not empty itemList}">
		<c:forEach var="i" begin="0" end="${itemSize}">
			<c:set var="j" value="${(pageNo * pageNoMax - pageNoMax) + i}" />
			<c:if test="${not empty itemList[j] && i < pageNoMax}">
	<input type="hidden" value="${itemList[j].order_id }" id="orderID_${j}">		
	<input type="hidden" value="${(itemList[j].product_price - itemList[j].product_discount) * itemList[j].order_amount}" id="orderAmount_${j}">	
	<input type="hidden" value="${itemList[j].user_membership }" id="membership_${j}">	 
	<input type="hidden" value="${itemList[j].order_amount }" id="count_${j}">	    
   	<div class="AdminReturn_center_box_01 text-center">
	<div class="row">
        <div class="col-lg-2 text-center">
        	<div id="userID_${j}">${itemList[j].user_id}</div>
        	<input id="returnDetail_${j}" class="MyPage_03-submit-box-01" type="button" value="반품 신청서 확인" onclick="order_detail(this.id)">
        </div>
        	<div class="col-lg-3 MyPage_03_text_position_04_update">
        		<a id="orderDetail_${j}" onclick="order_detail(this.id)">
        			${itemList[j].product_main_title}
        		</a>
        	</div>
        	<div class="col-lg-3 MyPage_03_text_position_04_update">
        		<fmt:formatNumber value="${(itemList[j].product_price - itemList[j].product_discount) * itemList[j].order_amount}" /> 원
        	</div>
        	<div class="col-lg-2 MyPage_03_text_position_04_update">${itemList[j].notice_type}</div>
        	<div class="col-lg-2 MyPage_03_text_position_03">
        <div>
        	<input class="MyPage_03-submit-box-01" type="button" id="accept_${j}" value="수 락" onclick="update_return_state(this.id)">
        	<input class="MyPage_03-submit-box-01" type="button" id="negative_${j}" value="거 절" onclick="update_return_state(this.id)">
        </div>
        	</div>
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
//조회 필터 스크립트
function selectLookup(selectValue) {

    if (selectValue == "all") {
    	document.getElementById("search_option_date").style.display = 'none';
    	document.getElementById("search_option_id_box").style.display = 'none';
    	document.getElementById("search_option_product_box").style.display = 'none';
    }
    else if (selectValue == "orderDate") {
    	document.getElementById("search_option_date").style.display = 'inline';
    	document.getElementById("search_option_id_box").style.display = 'none';
    	document.getElementById("search_option_product_box").style.display = 'none';
    }
    else if (selectValue == "userId") {
    	document.getElementById("search_option_date").style.display = 'none';
    	document.getElementById("search_option_id_box").style.display = 'inline';
    	document.getElementById("search_option_product_box").style.display = 'none';
    }
    else if (selectValue == "productId") {
    	document.getElementById("search_option_date").style.display = 'none';
    	document.getElementById("search_option_id_box").style.display = 'none';
    	document.getElementById("search_option_product_box").style.display = 'inline';
    }
    else if (selectValue == "state") {
    	document.getElementById("search_option_date").style.display = 'none';
    	document.getElementById("search_option_id_box").style.display = 'none';
    	document.getElementById("search_option_product_box").style.display = 'none';
    }
    

    
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
	    
	    if(strArray[0] == "returnDetail") {
	    	form.setAttribute("action", "${contextPath}/admin/order/return_Detail.do");	
	    }
	    else {
	    	form.setAttribute("action", "${contextPath}/admin/order/orderDetail.do");	
	    }
	    
  	  
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "order_id");
        hiddenField.setAttribute("value", order_id_group);
        form.appendChild(hiddenField);

  
    document.body.appendChild(form);
    form.submit();
	
}

// 반품/교환 승인 거절 스크립트
function update_return_state(target){
	
	if(${userInfo.user_rank > 2}) {
		var strArray = target.split('_');
		var target_no = strArray[1];
		
		let order_id = document.getElementById('orderID_'.concat(target_no)).value;
		let user_id = document.getElementById('userID_'.concat(target_no)).innerHTML;
		let order_count = document.getElementById('count_'.concat(target_no)).value;
		let order_amount = document.getElementById('orderAmount_'.concat(target_no)).value;
		let user_membership = document.getElementById('membership_'.concat(target_no)).value;
		let point;
	    switch(user_membership) {
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

		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/admin/order/update_return_state.do",
			dataType : "text",
			data : {
				"option" : strArray[0],
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
	
	else {
		alert("상태를 수정할 권한이 없습니다.");
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
		document.location='${contextPath}/admin/order/return_list.do?pageNo='+(--getValue);
		}
	}
	else if (no == "다음") {
		if(getValue == lastPage) {
			alert("마지막 페이지 입니다.");
		}
		else {
		document.location='${contextPath}/admin/order/return_list.do?pageNo='+(++getValue);
		}
	}
	else {
		document.location='${contextPath}/admin/order/return_list.do?pageNo='+no;
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
	       
	    case "userId" :
	    	document.getElementById("search_option_id").value = "${search_value}";
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
	
function search_order_to_option() {
	let searchOption = document.getElementById('search_option_category').value;
	let beginDate = document.getElementById('search_option_date_begin').value;
	let endDate = document.getElementById('search_option_date_end').value;
	let searchDate = beginDate.concat(',', endDate);
	let searchText = "";
	
	// 날짜 기준 조회
	if (searchOption == "orderDate") {
		if(endDate == "" || beginDate == "") {
			alert("정확한 조회 기간을 입력해주세요.");
		}
		else if(beginDate > endDate) {
			alert("조회 기준일이 종료일보다 클 수 없습니다.")
		}
		else {
			location.href='${contextPath}/admin/order/return_list.do?search_option='+searchOption+'&search_value='+searchDate;

		}
		
	}
	// 포함된 아이디 기준 조회
	else if (searchOption == "userId" || searchOption == "productId") {
		
		if(searchOption == "userId") {
			searchText = document.getElementById('search_option_id').value;	
		}
		else {
			searchText = document.getElementById('search_option_product').value;
		}
		
		if (searchText.match(/\s/g)) {
			alert("검색어에 공백은 포함될 수 없습니다.")
		}
		else if(searchText == null || searchText == ""){
			alert("검색어를 입력해주세요.");
		}
		else {			
			location.href='${contextPath}/admin/order/return_list.do?search_option='+searchOption+'&search_value='+searchText;
		}
	}
	
	// 전체 회원 조회
	else if (searchOption == "all") {
		location.href='${contextPath}/admin/order/return_list.do';
	}
	
}
</script>
<!-- 2021.12.03 임석희 adminOrder -->
<!-- 2022.01.27 윤상현 구현 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="9" />
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
    				<a href="${contextPath}/admin/order/order_list.do" class="order_01-sub-title adminOrder_hov">주문 관리</a>
    				<a href="${contextPath}/admin/order/return_list.do" class="adminOrder_hov" style="margin-left: 50px;">반품 / 교환</a>
    			</h6>    			    		
   			</div>
	    </div>

    
    
    <div class="row">
        <div class="col-lg-3 text-center adminUser_01-content-header">
        	조회 유형
        	<select class="adminUser_01-select-box-lookup" onchange="selectLookup(this.value)" id="search_option_category">
        			<option value="all">전체 주문</option>
        			<option value="orderDate">주문 일자</option>
        			<option value="userId">아이디</option>
			        <option value="productId">주문 상품</option>
			        <option value="state">배송 상태</option>
        		</select>
        </div>
		<div class="col-lg-6 text-center adminUser_01-content-header">
		
			<select id="search_option_state" class="adminUser_01-select-box-lookup">
				<option value="0">상품 준비중</option>
				<option value="1">상품 배송중</option>
				<option value="2">배송 완료</option>
				<option value="-1">주문 취소</option>
				<option value="-2">반품 / 교환 요청</option>
				<option value="-3">반품 / 교환 완료</option>
				
			</select>
		
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
				검색할 상품 : <input id="search_option_product" class="adminUser_01-select-box-lookup" type="text" onkeypress="if(event.keyCode=='13'){event.preventDefault(); search_order_to_option();}">
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
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">주문 번호</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">수량</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">결제 금액</h6>
	    </div>
	    <div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">주문 일자</h6>
	    </div>
		<div class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
	        <h6 class="order_01-content-hedaer-text">배송 상태</h6>
	    </div>
	</div>
	
	<c:if test="${empty itemList}">
		<br>
		<div class="col-lg-12 text-center">등록된 주문이 없습니다.</div>
	</c:if>
	
	<c:if test="${not empty itemList}">
		<c:forEach var="i" begin="0" end="${itemSize}">
			<c:set var="j" value="${(pageNo * pageNoMax - pageNoMax) + i}" />
			<c:if test="${not empty itemList[j] && i < pageNoMax}">
		
	<div class="row">
	<input type="hidden" value="${itemList[j].order_id }" id="orderID_${j}">
        <div class="col-lg-2 text-center admin_order_content_info">
        	<div>${itemList[j].user_id}</div>
        </div>
        
        <div class="col-lg-2 text-center admin_order_content_info">
        	<a id="orderDetail_${j}" onclick="order_detail(this.id)">${itemList[j].order_id}</a>
        </div>
        <div class="col-lg-2 text-center admin_order_content_info">
        	<fmt:formatNumber value="${itemList[j].order_amount}" /> 개
        </div>
        <div class="col-lg-2 text-center admin_order_content_info">
        	<fmt:formatNumber value="${(itemList[j].product_price - itemList[j].product_discount) * itemList[j].order_amount}" /> 원
        </div>
        <div class="col-lg-2 text-center admin_order_content_info">
        <fmt:formatDate value="${itemList[j].order_date}" pattern="yyyy-MM-dd" />
        	
        </div>
      
        <div class="col-lg-2 text-center admin_order_content_info">
        	<c:if test='${itemList[j].order_state == 0}'>
        		<select name="yeer" class="MyPage_03_yeer text-center" id="orderState_${j}">
        			<option value="0">상품 준비중</option>
	        		<option value="1">상품 배송중</option>
        		</select>
        		<input class="AdminOrder_boxsize" id="updateBtn_${j}" type="button" value="변경" onclick="update_state(this.id)">
        	</c:if>
        	<c:if test='${itemList[j].order_state == 1}'>
        		<div class="text-center"> 상품 배송중 </div>
        	</c:if>    
        	<c:if test='${itemList[j].order_state == 2}'>
        		<div class="text-center"> 배송 완료 </div>
        	</c:if> 
        	<c:if test='${itemList[j].order_state == -1}'>
        		<div class="text-center"> 주문 취소 </div>
        	</c:if>       
        	<c:if test='${itemList[j].order_state == -2}'>
        		<div class="text-center"> 반품 / 교환 요청 </div>
        	</c:if>   	
        	<c:if test='${itemList[j].order_state == -3}'>
        		<div class="text-center"> 반품 / 교환 완료</div>
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

<script>

//조회 필터 스크립트
function selectLookup(selectValue) {

    if (selectValue == "all") {
    	document.getElementById("search_option_state").style.display = 'none';
    	document.getElementById("search_option_date").style.display = 'none';
    	document.getElementById("search_option_id_box").style.display = 'none';
    	document.getElementById("search_option_product_box").style.display = 'none';
    }
    else if (selectValue == "orderDate") {
    	document.getElementById("search_option_state").style.display = 'none';
    	document.getElementById("search_option_date").style.display = 'inline';
    	document.getElementById("search_option_id_box").style.display = 'none';
    	document.getElementById("search_option_product_box").style.display = 'none';
    }
    else if (selectValue == "userId") {
    	document.getElementById("search_option_state").style.display = 'none';
    	document.getElementById("search_option_date").style.display = 'none';
    	document.getElementById("search_option_id_box").style.display = 'inline';
    	document.getElementById("search_option_product_box").style.display = 'none';
    }
    else if (selectValue == "productId") {
    	document.getElementById("search_option_state").style.display = 'none';
    	document.getElementById("search_option_date").style.display = 'none';
    	document.getElementById("search_option_id_box").style.display = 'none';
    	document.getElementById("search_option_product_box").style.display = 'inline';
    }
    else if (selectValue == "state") {
    	document.getElementById("search_option_state").style.display = 'inline';
    	document.getElementById("search_option_date").style.display = 'none';
    	document.getElementById("search_option_id_box").style.display = 'none';
    	document.getElementById("search_option_product_box").style.display = 'none';
    }
    

    
 }
 
function search_order_to_option() {
	let searchOption = document.getElementById('search_option_category').value;
	let beginDate = document.getElementById('search_option_date_begin').value;
	let endDate = document.getElementById('search_option_date_end').value;
	let searchDate = beginDate.concat(',', endDate);
	let searchText = "";
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
			location.href='${contextPath}/admin/order/order_list.do?search_option='+searchOption+'&search_value='+searchDate;

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
			location.href='${contextPath}/admin/order/order_list.do?search_option='+searchOption+'&search_value='+searchText;
		}
	}
	
	// 주문 상태 기준 조회
	else if (searchOption == "state") {
			location.href='${contextPath}/admin/order/order_list.do?search_option='+searchOption+'&search_value='+searchState;
	}

	// 전체 회원 조회
	else if (searchOption == "all") {
		location.href='${contextPath}/admin/order/order_list.do';
	}
	
}

/* 주문 상태 수정 ajax */

function update_state(target) {
		var strArray = target.split('_');
		var target_no = strArray[1];
		
		let order_id = document.getElementById('orderID_'.concat(target_no)).value;
		let orderState = document.getElementById('orderState_'.concat(target_no)).value;
		
		if(${userInfo.user_rank > 2}) {
			
			if(orderState == 0) {
				alert("주문의 상태를 변경해주세요.")
			}
			
			else {
				let order_delivery_id = prompt("주문 번호 "+order_id+" 의 운송장 번호를 입력해주세요");
				
				$.ajax({
					type : "post",
					async : false,
					url : "${contextPath}/admin/order/update_state.do",
					dataType : "text",
					data : {
						"order_id" : order_id,
						"order_delivery_id" : order_delivery_id
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
		document.location='${contextPath}/admin/order/order_list.do?pageNo='+(--getValue);
		}
	}
	else if (no == "다음") {
		if(getValue == lastPage) {
			alert("마지막 페이지 입니다.");
		}
		else {
		document.location='${contextPath}/admin/order/order_list.do?pageNo='+(++getValue);
		}
	}
	else {
		document.location='${contextPath}/admin/order/order_list.do?pageNo='+no;
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
	    form.setAttribute("action", "${contextPath}/admin/order/orderDetail.do");
	  	  
	        var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", "order_id");
	        hiddenField.setAttribute("value", order_id_group);
	        form.appendChild(hiddenField);

	  
	    document.body.appendChild(form);
	    form.submit();
		
	}

</script>
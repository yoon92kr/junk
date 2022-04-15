<!-- 2022.02.11 윤상현  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- pageNoMax에는 화면에 표시할 item의 최대 갯수를 대입한다. -->
<c:set var="pageNoMax" value="7" />
<!-- itemSize에는 표시할 item의 size를 대입한다. -->
<c:set var="itemSize" value="${CSList.size()}" />
<!-- itemList에는 java에서 바인딩한 Map 객체를 대입한다. -->
<c:set var="itemList" value="${CSList}" />

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
		<div class="col-lg-8 offset-lg-2 text-center">
			<h1 class="page_title" id="test">관리자 페이지</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12 text-left myPage_03_01-content-body">
			<h6 class="order_01-sub-title-page">
				<span class="order_01-sub-title">문의 관리</span>
			</h6>
		</div>
	</div>

	<div class="row">

		<div class="col-lg-3 text-center adminUser_01-content-header">
			조회 유형 <select class="adminUser_01-select-box-lookup"
				onchange="selectLookup(this.value)" id="search_option_category">
				<option value="all">전체</option>
				<option value="noticeDate">문의 일자</option>
				<option value="userID">회원 아이디</option>
				<option value="state">진행 상태</option>
			</select>
		</div>

		<div class="col-lg-6 text-center adminUser_01-content-header">

			<select id="search_option_state"
				class="adminUser_01-select-box-lookup">
				<option value="0">답변 대기중</option>
				<option value="1">답변 완료</option>
			</select>

			<div id="search_option_date">
				<input id="search_option_date_begin"
					class="adminUser_01-select-box-lookup" type="date"> 부터 <input
					id="search_option_date_end" class="adminUser_01-select-box-lookup"
					type="date"> 까지
			</div>

			<div id="search_option_product_box">
				작성자 ID : <input id="search_option_product"
					class="adminUser_01-select-box-lookup" type="text"
					onkeypress="if(event.keyCode=='13'){event.preventDefault(); search_notice_to_option();}">
			</div>

		</div>

		<div class="col-lg-3 text-center adminUser_01-content-header">
			<input class="adminProduct_01-header-button" type="button"
				value="조회하기" onclick="search_notice_to_option()">

		</div>
	</div>

	<div class="row">
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">문의 일자</h6>
		</div>
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">작성자ID</h6>
		</div>
		<div
			class="col-lg-3 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">문의 제목</h6>
		</div>
		<div
			class="col-lg-1 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">유형</h6>
		</div>
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">상태</h6>
		</div>
		<div
			class="col-lg-2 text-center order_01-content-header myPage_05-member-ranking-info adminUser_01-header-border">
			<h6 class="order_01-content-hedaer-text">변경</h6>
		</div>
	</div>

	<c:if test="${empty itemList}">
		<br>
		<div class="col-lg-12 text-center">등록된 문의가 없습니다.</div>
	</c:if>

	<c:if test="${not empty itemList}">
		<c:forEach var="i" begin="0" end="${itemSize}">
			<c:set var="j" value="${(pageNo * pageNoMax - pageNoMax) + i}" />
			<c:if test="${not empty itemList[j] && i < pageNoMax}">
				<input type="hidden" id="noticeID_${j}"
					value="${itemList[j].notice_id}">
				<input type="hidden" id="noticeCategory_${j}"
					value="${itemList[j].notice_category}">
				<input type="hidden" id="parent_${j}"
					value="${itemList[j].notice_parent_no}">
				<div class="row">
					<div class="col-lg-2 text-center admin_CS_QAList">
						<div>
							<fmt:formatDate value="${itemList[j].notice_cre_date}"
								pattern="yyyy-MM-dd" />
						</div>
					</div>
					<div class="col-lg-2 text-center admin_CS_QAList">
						${itemList[j].user_id}</div>
					<div class="col-lg-3 text-center admin_CS_QAList">
						<a id="detail_${j}" onclick="update_state(this.id)">${itemList[j].notice_title}</a>
					</div>
					<c:if test="${itemList[j].notice_parent_no == 0 }">
						<div class="col-lg-1 text-center admin_CS_QAList">
							${itemList[j].notice_category}</div>
						<div class="col-lg-2 text-center admin_CS_QAList">답변 대기중</div>

						<div class="col-lg-2 text-center admin_CS_QAList_oth">
							<input
								class="adminProduct_01-product adminProduct_01-product-top_yoon"
								id="deleteCS_${j}" type="button" value="문의 삭제"
								onclick="update_state(this.id)"> <input
								class="adminProduct_01-product" id="addCS_${j}" type="button"
								onclick="update_state(this.id)" value="답변 작성">
						</div>
					</c:if>

					<c:if test="${itemList[j].notice_parent_no == 1 }">
						<div class="col-lg-1 text-center admin_CS_QAList">
							${itemList[j].notice_category}</div>
						<div class="col-lg-2 text-center admin_CS_QAList">답변 완료</div>

						<div class="col-lg-2 text-center admin_CS_QAList">
							<input class="adminProduct_01-product" id="deleteCS_${j}"
								type="button" value="문의 삭제" onclick="update_state(this.id)">
						</div>
					</c:if>
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













<script type="text/javascript">
//조회 필터 스크립트
function selectLookup(selectValue) {

    if (selectValue == "all") {
    	document.getElementById("search_option_state").style.display = 'none';
    	document.getElementById("search_option_date").style.display = 'none';
    	document.getElementById("search_option_product_box").style.display = 'none';
    }
    else if (selectValue == "noticeDate") {
    	document.getElementById("search_option_state").style.display = 'none';
    	document.getElementById("search_option_date").style.display = 'inline';
    	document.getElementById("search_option_product_box").style.display = 'none';
    }
    else if (selectValue == "userID") {
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
		document.location='${contextPath}/admin/CS/QA_list.do?pageNo='+(--getValue);
		}
	}
	else if (no == "다음") {
		if(getValue == lastPage) {
			alert("마지막 페이지 입니다.");
		}
		else {
		document.location='${contextPath}/admin/CS/QA_list.do?pageNo='+(++getValue);
		}
	}
	else {
		document.location='${contextPath}/admin/CS/QA_list.do?pageNo='+no;
	}
}


function search_notice_to_option() {

	let searchOption = document.getElementById('search_option_category').value;
	let beginDate = document.getElementById('search_option_date_begin').value;
	let endDate = document.getElementById('search_option_date_end').value;
	let searchDate = beginDate.concat(',', endDate);
	let searchText = document.getElementById('search_option_product').value;
	let searchState = document.getElementById('search_option_state').value;
	
	// 날짜 기준 조회
	if (searchOption == "noticeDate") {
		if(endDate == "" || beginDate == "") {
			alert("정확한 조회 기간을 입력해주세요.");
		}
		else if(beginDate > endDate) {
			alert("조회 기준일이 종료일보다 클 수 없습니다.")
		}
		else {
			location.href='${contextPath}/admin/CS/QA_list.do?search_option='+searchOption+'&search_value='+searchDate;

		}
		
	}
	// 포함된 아이디 기준 조회
	else if (searchOption == "userID") {
		if (searchText.match(/\s/g)) {
			alert("검색어에 공백은 포함될 수 없습니다.")
		}
		else if(searchText == null || searchText == ""){
			alert("검색어를 입력해주세요.");
		}
		else {
			location.href='${contextPath}/admin/CS/QA_list.do?search_option='+searchOption+'&search_value='+searchText;
		}
	}
	
	// 주문 상태 기준 조회
	else if (searchOption == "state") {
			location.href='${contextPath}/admin/CS/QA_list.do?search_option='+searchOption+'&search_value='+searchState;
	}

	// 전체 회원 조회
	else if (searchOption == "all") {
		location.href='${contextPath}/admin/CS/QA_list.do';
	}
	
}

// 문의 삭제 및 답변 작성 Form 스크립트
function update_state(target) {
	var strArray = target.split('_');
	var target_no = strArray[1];
	var update_option = strArray[0];
	
	let parent_no = document.getElementById('parent_'.concat(target_no)).value;
	let notice_category = document.getElementById('noticeCategory_'.concat(target_no)).value;
	let notice_id = document.getElementById('noticeID_'.concat(target_no)).value;
	let submitFlag = false;
	

    if(update_option == "addCS") {
    	
        var form = document.createElement("form");
        form.setAttribute("charset", "UTF-8");
        form.setAttribute("method", "Post");
        form.setAttribute("action", "${contextPath}/admin/CS/add_QA_form.do");
      	  
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "notice_id");
            hiddenField.setAttribute("value", notice_id);
            form.appendChild(hiddenField);

            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "option");
            hiddenField.setAttribute("value", notice_category);
            form.appendChild(hiddenField);
      
        document.body.appendChild(form);
        form.submit();

    }  
    else if (update_option == "deleteCS") {
    	if(${userInfo.user_rank > 2}) {
    		
        	submitFlag = confirm("해당 문의를 삭제하시겠습니까?");
        	
        	if(submitFlag) {
    			$.ajax({
    				type : "post",
    				async : false,
    				url : "${contextPath}/admin/CS/delete_CS.do",
    				dataType : "text",
    				data : {
    					"notice_id" : notice_id
    				},
    				success : function(message) {
    					alert(message);
    			 		location.reload();
    				},
    				error : function() {
    					alert("문의 삭제에 문제가 발생하였습니다.");
    				}

    			});	
    		}
    		
    	}
    	
    	else {
    		alert("문의를 삭제할 권한이 없습니다.")
    	}

    }
    else if(update_option == "detail") {
    	
        var form = document.createElement("form");
        form.setAttribute("charset", "UTF-8");
        form.setAttribute("method", "Post");
        form.setAttribute("action", "${contextPath}/admin/CS/QA_detail.do");
      	  
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "notice_id");
            hiddenField.setAttribute("value", notice_id);
            form.appendChild(hiddenField);

            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "option");
            hiddenField.setAttribute("value", notice_category);
            form.appendChild(hiddenField);
      
        document.body.appendChild(form);
        form.submit();
    	
    }



				
}
window.addEventListener('load', function() {
	
	   if(${search_option != null && search_option != ""}) {
	    selectedOption("search_option_category", "${search_option}");

	    var main_option = document.getElementById("search_option_category").value;
	    selectLookup(main_option);
	    
	    var begin = "";
	    var end = "";
	    if("${search_option}" == "noticeDate") {
	    	var splitDate = "${search_value}".split(",");
	    }
	    
	    switch("${search_option}") {
	    case "noticeDate" :
	    	document.getElementById("search_option_date_begin").value = splitDate[0];
	    	document.getElementById("search_option_date_end").value = splitDate[1];
	       break;
	    
	    case "userID" :
	    	document.getElementById("search_option_product").value = "${search_value}";
	       break;
	       
	    case "state" :
	    	selectedOption("search_option_state", "${search_value}");
		   break;
	    }
	    
	   }

	});
	
//id에는 select의 id값, value에는 선택하고자 하는 option의 value 값을 파라미터로 입력한다.
function selectedOption(id, value) {
	
	var obj = document.getElementById(id);

	for (i=0 ; i<obj.length ; i++) {
	if(obj[i].value == value) {
	obj[i].selected = true;
	
	      }
	   }
	}
</script>
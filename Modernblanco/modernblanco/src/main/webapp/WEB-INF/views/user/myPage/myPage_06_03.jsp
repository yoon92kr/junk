<!--  2021.11.30 강보석 -->
<!-- 2022.02.08 한건희 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<div class="container-fluid">

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<h1 class="page_title">마이페이지</h1>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-2 col-lg-8 text-left cs_01_subtitle">
			<h3>문의 내용 수정</h3>
		</div>
	</div>

	<form id="PQAForm">
		<div class="row">
			<div class="offset-lg-3 col-lg-2 text-center notice_02_box01">
				<span>제목</span>
			</div>
			<div class="col-lg-4 text-left cs_02_02_box02">
				<input name="notice_title" type="text" class="form-control notice_upload_check" value="${detail.question.notice_title }">
			</div>

		</div>


		<div class="row">
			<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
				<span>상품명</span>
			</div>
			<div class="col-lg-4 text-left cs_02_02_box02">
				<span>${detail.product_title}</span>
			</div>
		</div>

		<div class="row">
			<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box01">
				<span>공개여부</span>
			</div>
			<div class="col-lg-4 cs_02_02_box02">
				<label> <input id="PQAPY" type="radio" name="notice_private" value="1" 
				onClick="this.form.notice_pw.disabled=true" checked="checked"> 공개
				</label> 
				<label> <input id="PQAPN" class="cs_02_01_private_btn" type="radio" 
				onClick="this.form.notice_pw.disabled=false" name="notice_private" value="0"> 비공개
				</label>
			</div>
		</div>


		<div class="row">
			<div class="offset-lg-3 col-lg-2 text-center notice_02_box01">
				<span>비밀번호</span>
			</div>
			<div class="col-lg-1 text-left cs_02_02_ex01box02">
				<input id="PQAPwd" type="password" class="form-control"
					name="notice_pw" disabled placeholder="비밀번호" maxlength='10'>

			</div>

			<div class="col-lg-3 text-left cs_02_02_ex02box02">
				<span class="admin_product_Form_notice">※ 비밀번호는 4자리 이상 ~ 10자리
					이하로 입력해주세요. </span>
			</div>
		</div>

		<div class="row">
			<div class="offset-lg-3 col-lg-2 text-center cs_02_02_box03">
				<span>내용</span>
			</div>
			<div class="col-lg-4 text-left cs_02_02_box04">
				<textarea name="notice_body" class="form-control notice_upload_check" rows="8" placeholder="내용을 입력하세요.">${detail.question.notice_body}</textarea>
			</div>
		</div>
		<input type="hidden" name="notice_id" value="${detail.question.notice_id }">
		<input type="hidden" name="user_id" value="${userInfo.user_id}" >
		<input type="hidden" name="notice_category" value="PQA" >
		<input type="hidden" name="notice_parent_no" value="0" >
	</form>

	<div class="row">
			<div class="offset-lg-4 col-lg-2 text-center">
				<div class="cs_correct_btn">
					<input onclick="submit_update_notice();" class="user_btn_Bgreen" type="button" id="cs_02_02_update_btn" value="수정하기">							
				</div>
			</div>
			<div class="col-lg-2 text-center">
				<div class="notice_back_btn">
					<input class="user_btn_gray" type="button" value="돌아가기" onclick="history.go(-2);">
				</div>
			</div>
		</div>
</div>

<script>
	function submit_update_notice() {
		
		var form = document.getElementById("PQAForm");
		var input = document.createElement("input");
		
		var elements = document.getElementsByClassName('notice_upload_check');
		var checkFlag = true;
		var private_Flag = $('input:radio[name=notice_private]:checked').val();
		for (var i = 0; i < elements.length; i++) {

			let uploadItem = elements[i].value;
			// 비어있는 파일이 하나라도 있다면 flag를 false로 대입.
			if (!uploadItem) {
				checkFlag = false;
			}

		}
		
		if(private_Flag == 0) {
			
			var private_value = document.getElementById('PQAPwd').value;
			
			if(private_value.length < 4) {
				alert("비밀번호를 4글자 이상 입력해주세요");
				checkFlag = false;
			}

			
		}
		else if(!checkFlag) {
			alert("제목과 내용은 반드시 입력해주셔야 합니다.");
		}
		
		if (checkFlag) {
			input.setAttribute("type", "hidden");
			input.setAttribute("name", "product_id");
			input.setAttribute("value", "${product_id}");
			form.action="${contextPath}/myPage/myQuestion/questionUpdate.do";
			form.method="POST";
			form.appendChild(input);
			form.submit();
		}
		
	}
</script>




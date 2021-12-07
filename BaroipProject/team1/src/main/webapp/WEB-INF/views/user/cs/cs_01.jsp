<!--  2021.11.25 강보석 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<div class="container-fluid">

	<div class="row">
		<div class="col-lg-4 offset-lg-4 text-center">
			<h1 class="page_title">고객센터</h1>
		</div>
	</div>


	<div class="row">
		<div class="offset-lg-2 col-lg-4 text-left cs_01_subtitle">
			<h3>자주 묻는 질문</h3>
		</div>
		<div class="offset-lg-3 col-lg-1 text-right cs_01_search-box">
			<form>
				<input class="search-box" type="text">
			</form>
		</div>
	</div>






	<div class="row">
		<div class="offset-lg-2 col-lg-8">
			<hr>
		</div>
	</div>


	<div class="row">

		<div class="offset-lg-2 col-lg-1 text-left cs_01_01header">
			<span>번호</span>
		</div>
		<div class="col-lg-7 text-left cs_01_01header">
			<span>제목</span>
		</div>

		<hr>
	</div>
</div>



<div class="container-fluid">


	<div class="row">
		<div class="offset-lg-2 col-lg-1 text-left cs_01_listsection">
			<span>공지번호</span>
		</div>
		<div class="col-lg-7 text-center cs_01_listsection">

			<div class="faq-content">

				<button class="question" id="que-1">
					<span id="que-1-toggle">∨</span> <span>[입금문의] 입금했는데 주문이 취소
						되었어요.</span>
				</button>
				<div class="answer" id="ans-1">주문일로부터 7일이 지난 경우입니다. 결제가 완료되지
					않은 상태로 게시판이나 고객상담실(1600-7846)로 문의하시면 처리 도와드리겠습니다.</div>
			</div>

		</div>
	</div>

	<div class="row">
		<div class="offset-lg-2 col-lg-1 text-left cs_01_listsection">
			<span>공지번호</span>
		</div>
		<div class="col-lg-7 text-center cs_01_listsection">

			<div class="faq-content">

				<button class="question" id="que-2">
					<span id="que-2-toggle">∨</span> <span>[입금문의] 입금했는데 주문이 취소
						되었어요.</span>
				</button>
				<div class="answer" id="ans-2">주문일로부터 7일이 지난 경우입니다. 결제가 완료되지
					않은 상태로 게시판이나 고객상담실(1600-7846)로 문의하시면 처리 도와드리겠습니다.</div>
			</div>

		</div>
	</div>

	<div class="row">
		<div class="offset-lg-2 col-lg-1 text-left cs_01_listsection">
			<span>공지번호</span>
		</div>
		<div class="col-lg-7 text-center cs_01_listsection">

			<div class="faq-content">

				<button class="question" id="que-5">
					<span id="que-5-toggle">∨</span> <span>[입금문의] 입금했는데 주문이 취소
						되었어요.</span>
				</button>
				<div class="answer" id="ans-5">주문일로부터 7일이 지난 경우입니다. 결제가 완료되지
					않은 상태로 게시판이나 고객상담실(1600-7846)로 문의하시면 처리 도와드리겠습니다.</div>
			</div>

		</div>
	</div>




</div>






<div class="row">
	<div class="offset-lg-5 col-lg-1 text-center notice_01_line ">
		<p class="notice_01_next">
			<a href="#"> < 이전 </a>
	</div>
	<div class="col-lg-1 text-center notice_01_line">
		<p class="notice_01_next">
			<a href="#"> 다음 > </a>

		</p>
	</div>
</div>
















<script>
  const items = document.querySelectorAll('.question');

  function openCloseAnswer() {
    const answerId = this.id.replace('que', 'ans');

    if(document.getElementById(answerId).style.display === 'block') {
      document.getElementById(answerId).style.display = 'none';
      document.getElementById(this.id + '-toggle').textContent = '∨';
    } else {
      document.getElementById(answerId).style.display = 'block';
      document.getElementById(this.id + '-toggle').textContent = '∧';
    }
  }

  items.forEach(item => item.addEventListener('click', openCloseAnswer));
</script>
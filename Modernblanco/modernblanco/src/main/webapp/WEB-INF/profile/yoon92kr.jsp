<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<!--
	Dimension by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html >
	<head>
		<title>Yoon92kr</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta charset="UTF-8" />
		<meta content="Yoon92kr" property="og:title" />
		<meta content="yoon92kr.gabia.io" property="og:url"/>
		<meta content="${contextPath}/resources/images/bg.jpg" property="og:image" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		
		<link rel="shortcut icon" type="image/png" href="${contextPath }/resources/images/binary-code.png">
		
		<link rel="stylesheet" href="${contextPath}/resources/assets/css/main.css" />
		<script src="https://kit.fontawesome.com/35e6f5ba7c.js" crossorigin="anonymous"></script>
		<noscript><link rel="stylesheet" href="${contextPath}/resources/assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="logo">
							<span class="icon"><i class="fas fa-laptop-code fa-lg"></i></span>
						</div>
						<div class="content">
							<div class="inner">
								<h1>Just Run</h1>
								<p>
									2021.08 ~ <br>
									오늘보다 성장한 내일을 기다리는,<br>
									꾸준히 달리는 개발자 윤상현입니다.<br>
								
								</p>
							</div>
						</div>
						<nav>
							<ul>
								<li><a href="https://github.com/yoon92kr"><i class="fab fa-github"></i> GitHub</a></li>
								<li><a href="#project"><i class="far fa-file-word"></i> Project</a></li>
								<li><a href="#about"><i class="fas fa-user-circle"></i> About</a></li>
							</ul>
						</nav>
					</header>
					
				<!-- Main -->
					<div id="main">

						<!-- Project -->
							<article id="project">
								<h2 class="major">Project</h2>
								<span class="image main"><a href="http://baroip.shop/main.do"><img src="${contextPath}/resources/images/project_01.jpg" alt="프로젝트 이미지" /></a></span>
								<h3><a href="http://baroip.shop/main.do">■ Baroip 프로젝트</a></h3>
								<blockquote>
									<ul>
										<li>개발 기간 : 2021.11.01 ~ 2022.02.22</li>
										<li>반응형 지원이 되지않으며 PC환경에 최적화되어 있습니다.</li>
										<li>구현 기능 : 관리자 권한 설정 / 상품 관리 / 게시물 관리 / 주문 관리 등</li>
									</ul>

									<p>Spring Framework 교육과정 중 수행한 프로젝트입니다.<br>
										 클라이언트용 관리자 페이지가 별도로 구현되어있으며 Toss Test API를 연결하여 실제 결제는 이루어지지 않습니다.<p>
								</blockquote>
				
								
							</article>

						<!-- About -->
						<article id="about">
							<h2 class="major">About</h2>
							<span class="image main"><img src="${contextPath}/resources/images/yoon.jpg" alt="" /></span>
							<h3>Skill.</h3>
							<blockquote>

								<h4>Front-End</h4>
								<ul>
									<li>★★★☆☆ JavaScript </li>
									<li>★★☆☆☆ HTML/CSS</li>
								</ul>

								<h4>Back-End</h4>
								<ul>
									<li>★★★☆☆ Java</li>
									<li>★★★☆☆ Spring Framework</li>
									<li>★★★☆☆ JSP</li>
								</ul>

								<h4>Database</h4>
								<ul>
									<li>★★★☆☆ MySQL</li>
								</ul>
							</blockquote>

							<h3>Education.</h3>
							<blockquote>
								<ul>
									<li>2021.08 ~ 2022.02 그린컴퓨터아트학원 개발자 과정</li>
									<li>2013.03 ~ 2018.02 배재대학교 여가서비스경영학과</li>
								</ul>
	
							</blockquote>

						</article>

					</div>

				<!-- Footer -->
					<footer id="footer">
						<p class="copyright">&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
					</footer>

			</div>

		<!-- BG -->
			<div id="bg"></div>

		<!-- Scripts -->
			<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${contextPath}/resources/assets/js/util.js"></script>
			<script src="${contextPath}/resources/assets/js/main.js"></script>

	</body>
</html>

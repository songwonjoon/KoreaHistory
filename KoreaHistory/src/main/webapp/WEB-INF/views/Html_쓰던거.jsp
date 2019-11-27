<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session = "true" %>
<%-- <% 
	session.getAttribute("id"); 
	session.getAttribute("name");
%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/CSS.css">
<title>메인페이지</title>
<script src="resources/js/login.js"></script>
<script type="text/javascript">
	name = "name(popup_start)"; //로그인창에서 회원가입누르면, 회원가입화면이 여기에서 보이게  해놓음.
</script>
</head>
<body>
	<main id="container"> <header class="m-header sticky">
	<div class="logo">
		<h2 class="s-title">
			<a href="Html">KOREAN&nbsp;HISTORY</a>
		</h2>
	</div>
	<div class="nav">
		<ul>
			<li><a href="#">역사</a></li>
			<c:choose>
				<c:when test="${login == true }">
					<li><a href="/KoreaHistory/history/question?cnt=1">문제</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#" onclick="question()">문제</a></li>
				</c:otherwise>
			</c:choose>
			<li><a href="/KoreaHistory/history/ranking">랭킹</a></li>
			<li><a href="historylist">자유게시판</a></li>
			<li><a href="/KoreaHistory/qna/list">QnA</a></li>
			<li><a href="#">갤러리</a></li>
			<div id="action_menu">
			
				<!-- <a class="action_link" href="">로그인</a>
				
															&nbsp;|&nbsp;
												
							<a class="action_link" href="#">회원가입</a> -->
				<c:choose>
					<c:when test="${login == true}">
						<a href="/KoreaHistory/modify/modify" target="_self"
							title="개인정보수정으로 이동">내정보</a> |
						<a href="/KoreaHistory/logout">로그아웃</a>
					</c:when>

					<c:otherwise>
						<a href="javascript:popup()" target="_top">로그인</a>&nbsp;|&nbsp;
						<a href="/KoreaHistory/join/join" target="_self">회원가입</a>
					</c:otherwise>
				</c:choose>
				<br>
				<c:if test="${login == true}">
				${id }님! 환영합니다. 
				</c:if>

				<!-- &nbsp;&nbsp;&nbsp;<a href="/KoreaHistory">홈으로</a> -->
			
			</div>
		</ul>
	</div>
	</header>
	<!-- <div class="slide">
		<input type="radio" name="pos" id="pos1" checked> 
		<input type="radio" name="pos" id="pos2"> 
		<input type="radio" name="pos" id="pos3"> 
		<input type="radio" name="pos" id="pos4">
		<ul>
			<li>1</li>
			<li>2</li>
			<li>3</li>
			<li>4</li>
		</ul>
		<input type="radio" name="pos" id="pos1" checked> 
		<input type="radio" name="pos" id="pos2"> 
		<input type="radio" name="pos" id="pos3"> 
		<input type="radio" name="pos" id="pos4">
		<p class="pos">
			<label for="pos1">11</label> 
			<label for="pos2">22</label> 
			<label for="pos3">33</label> 
			<label for="pos4">44</label>
		</p>
	</div> -->
	<!-- <div class="slide-radio">
		<input type="radio" name="pos" id="pos1" checked> 
		<input type="radio" name="pos" id="pos2"> 
		<input type="radio" name="pos" id="pos3"> 
		<input type="radio" name="pos" id="pos4">
	</div> -->
	<!-- <div class="asdf"></div> -->
	


	<foorter class="fixed-bottom">
	<div class="wrap">All content copyright KoreanHistory co, ltd.</div>
	</foorter> <!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>a</div> --> <!-- 		<div>a</div> -->
	<!-- 		<div>a</div> --> <!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> -->
	<!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> -->
	<!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> -->
	<!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> -->
	<!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> -->
	<!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> -->
	<!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> -->
	<!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> -->
	<!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> --> <!-- 		<div>aaaaaaaaaa</div> -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/CSS.css">
<script src="../resources/js/login.js"></script>
</head>
<body>
<div class="Gradient">
      <div class="rollbar">
         <a href="#">
            <span class="roll">위로</span>
         </a>
      </div>
      <header class="MainHeaderBar sticky">
         <div class="icon">   
            <h2>
               <a class="logo" href="../Html">KOREAN|HISTORY.</a>
            </h2>
         </div>
         <nav class="TopMenu">
            <ul>
               <li class="topmenuLink">
                  <a class="menuLink" href="#">News</a>
                     <ul class="subMenu">
                        <li><a class="submenuLink longLink" href="../news/introduce">소개</a></li>
                     </ul>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="#">History</a>   
                     <ul class="subMenu">
                        <li><a class="submenuLink longLink" href="../wiki/wiki_view/k_im">독립운동      </a></li>
                        <li><a class="submenuLink longLink" href="../wiki/wiki_view/dokdo">독도         </a></li>
                        <li><a class="submenuLink longLink" href="../wiki/wiki_view/slave">위안부         </a></li>
                        <li><a class="submenuLink longLink" href="../wiki/wiki_view/ktw">한일 관계      </a></li>
                        <li><a class="submenuLink longLink" href="../wiki/wiki_view/eastsea">동해         </a></li>
                     </ul>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="question_view?cnt=1">Test</a>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="ranking">Ranking</a>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="../dice/dice_game">Game</a>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="#">Community</a>
                     <ul class="subMenu">
                        <li><a class="submenuLink longLink" href="../qna/list">Q & A      </a>   </li>
                        <li><a class="submenuLink longLink" href="../freeboard/historylist">자유게시판   </a>   </li>
                     </ul>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="#">Gallery</a>
                     <ul class="subMenu">
                        <li><a class="submenuLink longLink" href="photo/photo_list">한국사 사진관</a></li>
                        <li><a class="submenuLink longLink" href="photo/photo_list">세계사 사진관</a></li>
                     </ul>
               </li>
               <div id="action_menu">
                  <!-- <a class="action_link" href="#">로그인</a>
                                 &nbsp;|&nbsp;   
                  <a class="action_link" href="#">회원가입</a> -->
                  <c:choose>
					<c:when test="${login == true}">
						<a class="action_link" href="/KoreaHistory/modify/modify" target="_self"
							title="개인정보수정으로 이동">내정보</a> |
						<a class="action_link" href="/KoreaHistory/logout">로그아웃</a>
					</c:when>

					<c:otherwise>
						<a class="action_link" href="javascript:popup()" target="_top">로그인</a>&nbsp;|&nbsp;
						<a class="action_link" href="/KoreaHistory/join/join" target="_self">회원가입</a>
					</c:otherwise>
				</c:choose>
				<br>
				<c:if test="${login == true}">
				<label class="action_link">${id }님! 환영합니다.</label> 
				</c:if>
                  
               </div>
            </ul>
         </nav>
      </header>
   </div>
</body>
</html>
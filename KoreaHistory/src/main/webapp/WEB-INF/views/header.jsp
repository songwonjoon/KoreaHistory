<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/CSS.css">
<script src="../resources/js/login.js"></script>
<script type="text/javascript">
   name = "name(popup_start)"; //로그인창에서 회원가입누르면, 회원가입화면이 여기에서 보이게  해놓음.
</script>
</head>
<body>
<div class="Gradient">
      <div class="rollbar">
         <a href="#">
            <span class="roll"></span>
         </a>
      </div>
      <header class="MainHeaderBar sticky">
         <div class="icon">   
            <h2>
               <a class="logo" href="../Html">KOREAN HISTORY</a>
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
                  <a class="menuLink" href="../question/question_view?cnt=1">Test</a>
                     <!-- <ul class="subMenu">
                        <li><a class="submenuLink longLink" href="#">독립운동      </a></li>
                        <li><a class="submenuLink longLink" href="#">독도         </a></li>
                        <li><a class="submenuLink longLink" href="#">위안부         </a></li>
                        <li><a class="submenuLink longLink" href="#">한일 관계      </a></li>
                        <li><a class="submenuLink longLink" href="#">동해         </a></li>
                     </ul> -->
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="../question/ranking">Ranking</a>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="../dice/dice_game">Game</a>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="#">Community</a>
                     <ul class="subMenu">
                        <li><a class="submenuLink longLink" href="../qna/list">Q & A      </a>   </li>
                        <li><a class="submenuLink longLink" href="../freeboard/historylist">자유게시판   </a></li>
                     </ul>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="#">Gallery</a>
                     <ul class="subMenu">
                        <li><a class="submenuLink longLink" href="../photo/photo_list">독도 사진관</a></li>
                        <li><a class="submenuLink longLink" href="../photo1/photo_list1">위안부 사진관</a></li>
                     	<li><a class="submenuLink longLink" href="../photo2/photo_list2">한일관계 사진관</a></li>
                     	<li><a class="submenuLink longLink" href="../photo3/photo_list3">동해 사진관</a></li>
                     	<li><a class="submenuLink longLink" href="../photo4/photo_list4">독립운동 사진관</a></li>
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
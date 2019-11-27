<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../resources/css/CSS.css"/>
<link type="text/css" rel="stylesheet" href="../resources/css/gallery/photo_view.css"/>
<%
String[] arr={"blue","MASTER"};
request.setAttribute("master",arr);
%>
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
                        <li><a class="submenuLink longLink" href="#">소개</a></li>
                        <li><a class="submenuLink longLink" href="#">업데이트   </a></li>
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
                     <ul class="subMenu">
                        <li><a class="submenuLink longLink" href="#">독립운동      </a></li>
                        <li><a class="submenuLink longLink" href="#">독도         </a></li>
                        <li><a class="submenuLink longLink" href="#">위안부         </a></li>
                        <li><a class="submenuLink longLink" href="#">한일 관계      </a></li>
                        <li><a class="submenuLink longLink" href="#">동해         </a></li>
                     </ul>
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
                        <li><a class="submenuLink longLink" href="../historylist">자유게시판   </a>   </li>
                     </ul>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="photo_list">Gallery</a>
                     <ul class="subMenu">
                        <li><a class="submenuLink longLink" href="../photo/photo_list">한국사 사진관</a></li>
                    	<li><a class="submenuLink longLink" href="../photo1/photo_list1">2 사진관</a></li>
                     	<li><a class="submenuLink longLink" href="../photo2/photo_list2">3 사진관</a></li>
                     	<li><a class="submenuLink longLink" href="../photo3/photo_list3">4 사진관</a></li>
                     	<li><a class="submenuLink longLink" href="photo_list4">5 사진관</a></li>
                     	
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
     	<div>
     		<h3 class="h1">
     			<a style="text-decoration: none; color: black;" href="list">Gallery</a>
     		</h3>
     	</div>
     	<div style="padding-bottom: 50px">
     	<hr>
     	</div>
<table class="photo_view_table">
		<tr>
			<td  class="photo_view_td">제목 -</td>
			<td class="photo_view_td_c">
			${photo_view4.ptitle }
			</td>
		</tr>
		<tr>
			<td class="photo_view_td">아이디 -</td>
			<td class="photo_view_td_c">${id}</td>
		</tr>
		<tr>
			<td class="photo_view_td">첨부파일 -</td>
			<c:if test="${photo_view4.pfile ne null }">
			<td>
				<a href="pdownload4?pp=../resources/upload/&p=
				${photo_view4.pfile }
				&pid=${photo_view4.pid }"><img alt="${photo_view4.pfile }" 
				src="../resources/upload/${photo_view4.pfile }" style="width: 900px; height: 500px;"></a>
			</td>
			</c:if>
			<c:if test="${photo_view4.pfile eq null }">
			<td><img alt="파일없음" src="../resources/img/pang.jpg" style="width: 900px; height: 500px;"></td>
			</c:if>
		</tr>
		<tr>
			<td class="photo_view_td">설명 -</td>
			<td class="photo_view_td_c">
			${photo_view4.p_content }</td>
		</tr>
		<tr>
			<td class="photo_view_asub" colspan="2">
			<c:choose>
				<c:when test="${id eq photo_view4.pid }">
							<a href="photo_modify4?p_num=${photo_view4.p_num }">
							<input class="photo_view_sub" type="submit" value="수정" /></a>
				</c:when>
				<c:when test="${id eq 'blue' }"> 
							<a href="photo_modify4?p_num=${photo_view4.p_num }">
							<input class="photo_view_sub" type="submit" value="수정" /></a>
				</c:when>
				<c:when test="${id eq 'MASTER' }"> 
							<a href="photo_modify4?p_num=${photo_view4.p_num }">
							<input class="photo_view_sub" type="submit" value="수정" /></a>
				</c:when>
			</c:choose>
							<a class="photo_view_return" href="photo_list4">목록보기</a>
			</td>
		</tr>
</table>
</body>
<foorter class="footer">
            <div class="copyright">
               <p>All content copyright KoreanHistory co, ltd.</p>
            </div>
         </foorter>
</html>
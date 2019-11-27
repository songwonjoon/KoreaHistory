<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../resources/css/CSS.css"/>
<link type="text/css" rel="stylesheet" href="../resources/css/qna_css/content_view.css"/>
<script src="../resources/js/login.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
   name = "name(popup_start)"; //로그인창에서 회원가입누르면, 회원가입화면이 여기에서 보이게  해놓음.
</script>
<script type="text/javascript">
		
	$(document).ready(function() {
   		$('#btn_modi').click(function() {
	   	var mo;
			   mo=confirm("수정 하시겠습니까??");
			if (mo==true) {
				alert("이동합니다.");
				location.href="modify_view?q_num=${content_view.q_num }";
			}	   
			else{
				alert("취소했습니다.");
			}  
	});
});
</script>
<%
	String[] arr={"blue","MASTER"};
	request.setAttribute("master", arr);
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
                        <li><a class="submenuLink longLink" href="list">Q & A      </a>   </li>
                        <li><a class="submenuLink longLink" href="../historylist">자유게시판   </a>   </li>
                     </ul>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="../photo/photo_list">Gallery</a>
                     <ul class="subMenu">
                        <li><a class="submenuLink longLink" href="../photo/photo_list">한국사 사진관</a></li>
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
     			<a style="text-decoration: none; color: black;" href="list">Q&A</a>
     		</h3>
     	</div>
     	<div >
     	<hr>
     	</div>
<table class="content_table">
		<tr>
			<td class="content_tdt">제목 -</td>
			<td class="content_td_c" id="qtitle">
			${content_view.qtitle }
			</td>
		</tr>
		<tr>
			<td class="content_tdt">아이디 -</td>
			<td class="content_td_c"> ${content_view.writer }</td>
		</tr>
		<tr>
			<td class="content_td" >내용 -</td>
			<td class="content_td_con">
			${content_view.w_content }</td>
		</tr>
		<tr>
			<td class="content_td">첨부파일 -</td>
			<td class="content_td_f">
				<a href="qdownload?pa=../resources/upload/&q=
				${content_view.qfile }
				&writer=${content_view.writer }">
				${content_view.qfile }</a>
			</td>
		</tr>
		<tr>
		<c:choose>
		<c:when test="${id eq content_view.writer  }">
			<td colspan="2">
			<input class="content_sub" id="btn_modi" type="button" value="수정" />
		</td>
		</c:when>
		<c:when test="${id eq 'blue'  }">
			<td colspan="2">
			<input class="content_sub" id="btn_modi" type="button" value="수정" />
		</td>
		</c:when>
		<c:when test="${id eq 'MASTER'  }">
			<td colspan="2">
			<input class="content_sub" id="btn_modi" type="button" value="수정" />
		</td>
		</c:when>
		</c:choose>
		</tr>
</table>
							<a class="content_return" href="list">목록보기</a>
  </div>
  <div style="padding-top: 10px;">
		<hr>
     	</div>
	<div>
	<h4 class="h3">답변</h3>
	</div>
	<div class="content_reply">
	<pre class="content_reply_content">
	${reply_view }
	</pre>
	</div>
<div style="padding-top: 50px;">
		<hr>
     	</div>
</body>
 <foorter class="footer">
            <div class="copyright">
               <p>All content copyright KoreanHistory co, ltd.</p>
            </div>
         </foorter>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/CSS.css"/>
<link rel="stylesheet" href="../resources/css/qna_css/qna_write.css"/>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
 var num=0;
var list=new Array();
	list[0]='#qtitle';
	list[1]='#w_content';
	list[2]='#writer';
	
function reAnswer() {
		if (($(list[0]).val()=='')) {
			for (var i = 0; i < 3; i++) {
			($(list[i]).css('border-color','red'));
			num++;	
			}
			alert("작성 실패.");
	}else{
		alert("작성 완료.");
		document.writeform.submit();
	}
}
</script>
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
     	<div style="padding-bottom: 50px">
     	<hr>
     	</div>
<table class="write_table">
	<form action="qwrite" method="post"  name="writeform" enctype="multipart/form-data">
		<tr class="write_tr">
			<td class="write_td">제목</td>
			<td><input 
			class="write_td_title" id="qtitle"	type="text" name="qtitle" size="200" /></td>
		</tr>
		<tr>
			<td class="write_td">아이디</td>
			<td>
			<input class="write_td_id" id="writer" type="text" value="${id }" name="writer" size="200" readonly />
			</td>
		</tr>
		<tr>
			<td class="write_td">내용</td>
			<td><textarea class="write_td_content" id="w_content" size="500" name="w_content" ></textarea></td>
		</tr>
		 <script type="text/javascript">
  CKEDITOR.replace('w_content',
    {
      height : '500px',  // 입력창의 높이
      startupFocus : false
    }
  );
</script>
		
		<tr >
			<td  class="write_td" style="margin-top: 50px;">첨부파일</td>
			<td class="write_td_file"><input id="write_file" type="file" name="qfile" /></td>
		</tr>
		<tr>
			<td colspan="2"><input class="write_sub" type="button" onclick="reAnswer()" value="작성" />&nbsp;&nbsp;
			</td>
		</tr>
	</form>
</table>
<a class="write_return" href="list">목록보기</a>
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
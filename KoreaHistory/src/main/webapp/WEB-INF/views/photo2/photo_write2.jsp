<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link  rel="stylesheet" href="../resources/css/CSS.css"/>
<link  rel="stylesheet" href="../resources/css/gallery/photo_write.css"/>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
 var num=0;
var list=new Array();
	list[0]='#ptitle';
	list[1]='#pid';
	
var file='#pfile';
	
function reAnswer() {
		if (($(list[0]).val()=='')&& file!=true) {
			for (var i = 0; i < 2; i++) {
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
                        <li><a class="submenuLink longLink" href="../qna/list">Q & A      </a>   </li>
                        <li><a class="submenuLink longLink" href="../historylist">자유게시판   </a>   </li>
                     </ul>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="photo_list">Gallery</a>
                     <ul class="subMenu">
                         <li><a class="submenuLink longLink" href="../photo/photo_list">한국사 사진관</a></li>
                    	<li><a class="submenuLink longLink" href="../photo1/photo_list1">2 사진관</a></li>
                     	<li><a class="submenuLink longLink" href="photo_list2">3 사진관</a></li>
                     	<li><a class="submenuLink longLink" href="../photo3/photo_list3">4 사진관</a></li>
                     	<li><a class="submenuLink longLink" href="../photo4/photo_list4">5 사진관</a></li>
                     	
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
<table class="photo_write_table">
	<form action="pwrite2" method="post" name="writeform" enctype="multipart/form-data">
		<tr >
			<td class="photo_write_td" >제목</td>
			<td><input 
			 class="photo_write_td_title" id="ptitle"	type="text" name="ptitle" size="200" /></td>
		</tr>
		<tr>
			<td class="photo_write_td" >아이디</td>
			<td><input class="photo_write_td_id"  id="pid" type="text" value="${id }" name="pid" size="200" readonly></td>
		</tr>
		<tr>
			<td class="photo_write_td" >내용</td>
			<td><textarea id="p_content" rows="10" name="p_content" ></textarea></td>
		</tr>
		 <script type="text/javascript">
  CKEDITOR.replace('p_content',
    {
      height : '500px',  // 입력창의 높이
      startupFocus : false
    }
  );
</script>
		<tr>
			<td class="photo_write_td" style="margin-top: 50px;">첨부파일</td>
			<td  class="photo_write_td_file"><input  type="file" id="pfile" name="pfile" /></td>
		</tr>
		<tr>
			<td colspan="2"><input class="photo_write_sub" onclick="reAnswer()"  type="button"  value="작성" />&nbsp;&nbsp;
							<a class="photo_write_return" href="photo_list2">목록보기</a></td>
		</tr>
	</form>
</table>
</body>
<foorter class="footer">
            <div class="copyright">
               <p>All content copyright KoreanHistory co, ltd.</p>
            </div>
         </foorter>
</html>
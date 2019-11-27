<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../resources/css/CSS.css"/>
<link rel="stylesheet" href="../resources/css/qna_css/modify_view.css"/>
<script src="//cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>
<script src="../resources/js/login.js"></script>
<script type="text/javascript">
   name = "name(popup_start)"; //로그인창에서 회원가입누르면, 회원가입화면이 여기에서 보이게  해놓음.
</script>
<script type="text/javascript">
	function modi_done() {
		alert("수정완료");
	}
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
     	<div style="padding-bottom: 50px">
     	<hr>
     	</div>
<table class="modify_table">
	<form action="modify_his" method="post" >
	<input type="hidden" name="q_num" value="${modify_view.q_num }">
	<input type="hidden" name="writer" value="${modify_view.writer }">
		<tr>
			<td class="modify_td">제목</td>
			<td><input class="modify_td_title" type="text" name="qtitle"
			value="${modify_view.qtitle }" size="200">
			</td>
		</tr>
		<tr>
			<td class="modify_td">아이디</td>
			<td><input class="modify_td_id" type="text" name="writer" 
			value="${id }" size="200" readonly/></td>
		</tr>
		<tr>
			<td class="modify_td">내용</td>
			<td><textarea id="w_content" name="w_content" >
			${modify_view.w_content }</textarea></td>
		</tr>
		  <script type="text/javascript">
  			CKEDITOR.replace('w_content',
   			 {
     		 height : '500px',  // 입력창의 높이
      			startupFocus : false
   			 }
  				);
		</script>
		
		<tr>
			<td class="modify_td">첨부파일</td>
			<td class="modify_td_qfile">
				<a href="qdownload?pa=../resources/upload/&q=
				${modify_view.qfile }
				&writer=${modify_view.writer }">
				${modify_view.qfile }</a>
			</td>
		</tr>
		<tr>
			<td  colspan="2"><input class="modify_td_modi" onclick="modi_done()" type="submit" value="수정" />&nbsp;&nbsp;
							&nbsp;&nbsp;
					<a class="modify_td_return" href="list">목록보기</a>
							<a class="modify_td_delete" href="qdelete?q_num=${modify_view.q_num }
							">삭제</a>
		</tr>
	</form>
</table>
<c:forEach var="master" items="${master }">
 <c:if test="${id eq master }">
 
<div style="padding:50px 0 30px 0;">
		<hr>
     	</div>
		<script type="text/javascript">
			function noMore() {
				alert("답변 수정이 되었습니다.");
			}
			function addReply() {
				alert("등록이 완료 되었습니다.");
			}
			
		</script>
		<h5 class="h5">관리자 전용</h5>
		<c:if test="${reply_view eq null }">
<form action="insert_reply" method="post">
	<div class="modify_re">
			<input type="hidden" name="q_num"  value="${modify_view.q_num }"/>
			<input type="hidden" name="qtitle"  value="${modify_view.qtitle }"/>
			<textarea name="a_content" id="a_content" rows="10" cols="100"></textarea>
			<a onclick="addReply()"><input class="modify_re_sub" type="submit" value="등록"/></a>
	</div>
	  <script type="text/javascript">
  			CKEDITOR.replace('a_content',
   			 {
  				width : '1000px',
     		 height : '300px',  // 입력창의 높이
      			startupFocus : false
   			 }
  				);
		</script>
</form>
		</c:if>
				<c:if test="${reply_view ne null }">
	<form action="update_reply" method="post">
	<div class="modify_re">
		<input type="hidden" name="q_num"  value="${modify_view.q_num }"/>
		<input type="hidden" name="qtitle"  value="${modify_view.qtitle }"/>
		<textarea name="a_content" id="a_content" rows="10" cols="100"></textarea>
		<a onclick="noMore()"><input class="modify_re_sub" type="submit" value="답변수정"></a>
	</div>
	<script type="text/javascript">
  			CKEDITOR.replace('a_content',
   			 {
     		 width : '1000px',
     		 height : '300px',  // 입력창의 높이
      			startupFocus : false
   			 }
  				);
		</script>
	</form>	
		</c:if>
		</c:if>
    </c:forEach>
	<div style="padding:50px 0 20px 0;">
		<hr>
    </div>
	<h5 class="h5">답변</h5>
	<div class="modify_reply">
	<pre class="modify_reply_content">
	${reply_view }
	</pre>
	</div>
</body>
<foorter class="footer">
            <div class="copyright">
               <p>All content copyright KoreanHistory co, ltd.</p>
            </div>
         </foorter>
</html>
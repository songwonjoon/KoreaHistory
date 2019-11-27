<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/CSS2.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="resources/js/login.js"></script>
<!-- <link rel="script" href="js/jquery-3.4.1min.js">
<script src="js/jquery-3.4.1min.js"></script>
<!-- <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>  -->
<script type="text/javascript">
   name = "name(popup_start)"; //로그인창에서 회원가입누르면, 회원가입화면이 여기에서 보이게  해놓음.
</script>
<title>KOREANHISTORY</title>
<script type="text/javascript">
$( document ).ready( function() {
    $( window ).scroll( function() {
      if ( $( this ).scrollTop() > 400 ) {
        $( '.top' ).fadeIn();
      } else {
        $( '.top' ).fadeOut();
      }
      
      if ( $( this ).scrollTop() > 1100 ) {
          $( '.wrap_box' ).fadeIn();
        } else {
          $( '.wrap_box' ).fadeOut();
        }
      
      if ( $( this ).scrollTop() > 1500 ) {
          $( '.wrap_box1' ).fadeIn();
        } else {
          $( '.wrap_box1' ).fadeOut();
        }
      
      if ( $( this ).scrollTop() > 1650 ) {
          $( '.wrap_box2' ).fadeIn();
        } else {
          $( '.wrap_box2' ).fadeOut();
        }
    } );
    $( '.top' ).click( function() {
      $( 'html, body' ).animate( { scrollTop : 0 }, 1200 );
      return false;
    } );
  } );
</script>
</head>
<body>
   <div class="Gradient">
      <div class="rollbar">
			<a href="#"><span class="top"></span></a>
      </div>
      <header class="MainHeaderBar sticky">
         <div class="icon">   
            <h2>
               <a class="logo" href="Html">KOREAN HISTORY</a>
            </h2>
         </div>
         <nav class="TopMenu">
            <ul>
               <li class="topmenuLink">
                  <a class="menuLink" href="#">News</a>
                     <ul class="subMenu">
                        <li><a class="submenuLink longLink" href="news/introduce">소개</a></li>
                        <!-- <li><a class="submenuLink longLink" href="#">업데이트   </a>   </li> -->
                     </ul>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="#">History</a>   
                     <ul class="subMenu">
                        <li><a class="submenuLink longLink" href="wiki/wiki_view/k_im">독립운동      </a></li>
                        <li><a class="submenuLink longLink" href="wiki/wiki_view/dokdo">독도         </a></li>
                        <li><a class="submenuLink longLink" href="wiki/wiki_view/slave">위안부         </a></li>
                        <li><a class="submenuLink longLink" href="wiki/wiki_view/ktw">한일 관계      </a></li>
                        <li><a class="submenuLink longLink" href="wiki/wiki_view/eastsea">동해         </a></li>
                     </ul>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="question/question_view?cnt=1">Test</a>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="question/ranking">Ranking</a>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="dice/dice_game">Game</a>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="#">Community</a>
                     <ul class="subMenu">
                        <li><a class="submenuLink longLink" href="qna/list">Q & A      </a>   </li>
                        <li><a class="submenuLink longLink" href="freeboard/historylist">자유게시판   </a>   </li>
                     </ul>
               </li>
               <li class="topmenuLink">
                  <a class="menuLink" href="#">Gallery</a>
                     <ul class="subMenu">
                        <li><a class="submenuLink longLink" href="photo/photo_list">독도 사진관</a></li>
                        <li><a class="submenuLink longLink" href="photo1/photo_list1">위안부 사진관</a></li>
                     	<li><a class="submenuLink longLink" href="photo2/photo_list2">한일관계 사진관</a></li>
                     	<li><a class="submenuLink longLink" href="photo3/photo_list3">동해 사진관</a></li>
                     	<li><a class="submenuLink longLink" href="photo4/photo_list4">독립운동 사진관</a></li>
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
         <div class="slide">
            <ul>
               <li class="img1"></li>
               <li class="img2"></li>
               <li class="img3"></li>
               <li class="img4"></li>
               <li class="img5"></li>
            </ul>
         </div>
         <div class="sector1">
         	<ul>
               <li>“역사란 과거와 현재의 끊임없는 대화이다.”</li>
              
            </ul>
            <ul>
               <li><pre> “역사는 항상 새롭게 다시 쓰이며,
    따라서 모든 역사는 현재의 역사이다.”</pre></li>
              
            </ul>
            <ul>
               <li style="margin-top: 200px;"><pre > “과거를 잊어버린 자는 
    그것을 또다시 반복하게 된다.”</pre></li>
              
            </ul>
            <ul>
               <li style="margin-top: 400px;"><pre > “역사는 죽은 과거가 아니라,
   현재 속에 살아있는 과거다.”</pre></li>
              
            </ul>    
         </div>
         <div class="slider">
           
         </div>
      <section class="contents">
         <div class="frame">
         <div class="pillar">
         <div class="body_margin">
            <ul>
               <li>
                  <div class="wrap_box">
                     <div class="gallery_wrap_a">
                        <div class="box_img">
                           <img alt="" src="resources/img/G-T_wrapbox/3432535213513.png">
                        </div>
                     </div>
                     <a href="wiki/wiki_view/dokdo"><div class="text_wrap1">
                        <p class="backcolor"><strong class="first-letter">&nbsp;독</strong>도</p>
                     </div></a>
                  </div>
               </li>
               
               <li>
               
                  <div class="wrap_box">
                     <div class="gallery_wrap_a">
                        <div class="box_img">
                           <img alt="" src="resources/img/G-T_wrapbox/24175433320.jpg">
                        </div>
                     </div>
                     <a href="wiki/wiki_view/k_im"><div class="text_wrap2">
                        <p class="backcolor"><strong class="first-letter">&nbsp;독</strong>립운동</p>
                     </div></a>
                  </div>
                 
               </li>
               
               <li>
               
                  <div class="wrap_box1" >
                     <div class="gallery_wrap_a">
                        <div class="box_img">
                           <img alt="" src="resources/img/G-T_wrapbox/54635463456346.jpg">
                        </div>
                     </div>
                     <a href="wiki/wiki_view/slave"><div class="text_wrap3">
                        <p class="backcolor"><strong class="first-letter">&nbsp;위</strong>안부</p>
                     </div></a>
                  </div>
                 
               </li>
               
               <li>
               
                  <div class="wrap_box1">
                     <div class="gallery_wrap_a">
                        <div class="box_img">
                           <img alt=""src="resources/img/G-T_wrapbox/21312412541.PNG">
                        </div>
                     </div>
                     <a href="wiki/wiki_view/eastsea"><div class="text_wrap4">
                        <p class="backcolor"><strong class="first-letter">&nbsp;동</strong>해</p>
                     </div></a>
                  </div>
                 
               </li>
               
               <li>
               
                  <div class="wrap_box2">
                     <div class="gallery_wrap_a">
                        <div class="box_img">
                           <img alt=""src="resources/img/G-T_wrapbox/534464576.jpg">
                        </div>
                     </div>
                     <a href="wiki/wiki_view/ktw"><div class="text_wrap5">
                        <p class="backcolor"><strong class="first-letter">&nbsp;한</strong>일관계</p>
                     </div></a>
                  </div>
                 
               </li>
               
               <!-- <li>
                  <div class="wrap_box">
                     <div class="gallery_wrap_a">
                        <div class="box_img">
                           <img alt=""src="resources/img/G-T_wrapbox/C.jpg">
                        </div>
                     </div>
                     <div class="text_wrap6">
                        <p class="backcolor"><strong class="first-letter">&nbsp;뭐</strong>하지</p>
                     </div>
                  </div>
               </li> -->
            </ul>
         </div>
         </div>
         </div>
      </section>
      <div class="sector2">
         <pre>
            안녕하세요!
            <br>
            <strong>Team IOI</strong> 입니다.
            <br>
            저희 첫번째 작업페이지에 오신것을,
            <br>
            진심으로 환영합니다.
         </pre>
      </div>

      <div class="workspace_l">
         <div class="box_outer">
            <div class="top_box">
            <a href="qna/list">+More</a>
            </div>
            <div class="bottom_box">
            <table class="qna_table">
	<tr class="qna_tr">
		<th class="qna_ti" >제목</th>
		<th class="qna_t" >아이디</th>
		<th class="qna_t" >날짜</th>
		<th class="qna_t" >확인</th>
	</tr>
	<c:forEach items="${list }" var="dto">
		<tr class="qna_tr">
			<td class="qna_td">${dto.qtitle }</td>
			<td class="qna_td" id="qna_td_writer"> ${dto.writer }</td>
			<td class="qna_td" id="qna_td_qdate">
			<fmt:formatDate value="${dto.qdate }" var="rstDate" pattern="yyyy-MM-dd" />
			${rstDate }
			</td>
			
			<c:if test="${dto.ox==null }">
			<td class="qna_td" id="qna_td_ox">x</td>
			</c:if>
			<c:if test="${dto.ox!=null }">
			<td class="qna_td" id="qna_td_ox">o</td>
			</c:if>
			
		</tr>
	</c:forEach>	
	<%-- <tr>
		<c:if test="${id ne null }">
 		<td class="qna_wri"  colspan="5"><a class="qna_wri_qwri" href="write_view">글쓰기</a></td>
		</c:if>
 	</tr> --%>
</table>
            
            </div>
         </div>
      </div>
      
      <div class="workspace_r">
         <div class="box_outer">
            <div class="top_box">
            <!-- <img alt="이미지불러오지못함" src="resources/img/9.jpg"> -->
            <a href="question/ranking">+More</a>
            </div>
            <div class="bottom_box">
            
            <table class="ranking_box" border="1">
		<tr class="table_title">
			<th class="ttt">등수</th>
			<th class="ttt">아이디</th>
			<th class="ttt">점수</th>
		</tr>
		<c:forEach items="${rank }" var="rank" varStatus="status">
			<tr class="table_content">
			<c:if test="${status.count == 1}">
				<th class="ttt"><img src="resources/img/금.jpg" /></th>
				<th class="ttt">${rank.id }</th>
				<th class="ttt">${rank.score }</th>
			</c:if>
			<c:if test="${status.count == 2}">
				<th class="ttt"><img src="resources/img/은.jpg" /></th>
				<th class="ttt">${rank.id }</th>
				<th class="ttt">${rank.score }</th>
			</c:if>
			<c:if test="${status.count == 3}">
				<th class="ttt"><img src="resources/img/동.jpg" /></th>
				<th class="ttt">${rank.id }</th>
				<th class="ttt">${rank.score }</th>
			</c:if>
			<c:if test="${status.count > 3}">
			
				<th class="ttt">${status.count }</th>
				<th class="ttt">${rank.id }</th>
				<th class="ttt">${rank.score }</th>
			</tr>
			</c:if>
		</c:forEach>
	</table>
            
            </div>
         </div>
      </div>

         <foorter class="footer">
            <div class="copyright">
               <p>All content copyright KoreanHistory co, ltd.</p>
            </div>
         </foorter>
         
</body>
</html>
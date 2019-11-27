<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link  rel="stylesheet" href="../resources/css/CSS.css"/>
<link  rel="stylesheet" href="../resources/css/qna_css/qna.css"/>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="../resources/js/login.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
   name = "name(popup_start)"; //로그인창에서 회원가입누르면, 회원가입화면이 여기에서 보이게  해놓음.
	function goTop() {
		$('list').
	}
   </script>
</head>
<body>	
   <%@ include file="/WEB-INF/views/header.jsp" %>
     	<div>
     		<h3 class="h1">
     			<a style="text-decoration: none; color: black;" href="list">Q&A</a> 
     		</h3>
     	</div>
     	<div style="padding-bottom: 50px">
     	<hr>
     	</div>
     	<div class="qna_list">
     	&nbsp;
<table class="qna_table">
	<tr class="qna_tr">
		<th class="qna_ti" >제목</th>
		<th class="qna_t" >아이디</th>
		<th class="qna_t" >날짜</th>
		<th class="qna_t" >확인</th>
	</tr>
	<c:forEach items="${list }" var="dto">
		<tr class="qna_tr">
			<td class="qna_td">
			<a class="qna_td_tit" href="content_view?q_num=${dto.q_num }">${dto.qtitle }</a></td>
			<td class="qna_td" id="qna_td_writer"> ${dto.writer }</td>
			<td class="qna_td" id="qna_td_qdate">${dto.qdate }</td>
			
			<c:if test="${dto.ox==null }">
			<td class="qna_td" id="qna_td_ox">x</td>
			</c:if>
			<c:if test="${dto.ox!=null }">
			<td class="qna_td" id="qna_td_ox">o</td>
			</c:if>
			
		</tr>
	</c:forEach>	
	<tr>
		<c:if test="${id ne null }">
 		<td class="qna_wri"  colspan="5"><a class="qna_wri_qwri" href="write_view">글쓰기</a></td>
		</c:if>
 	</tr>
</table>
&nbsp;
     	</div>
<div style="clear: both;"></div>
&nbsp;
	<form action="list" method="post" id="hform" name="hform">
		<input type="hidden" name="page" value=""/>
		<script type="text/javascript">
			function pageForm(page) {
				document.hform.page.value=page;
				document.hform.submit();
			}
		</script>
		<div>
	<c:if test="${searchHis.totPage>0 }">
	<c:if test="${searchHis.totPage>1 }">
		<a href="list?page=1"><img alt="#" src="../resources/img/arrow1.PNG"></a>
		<a href="list?page=${searchHis.page-1 }"><img alt="#" src="../resources/img/arrow.PNG"></a>
	</c:if>	
<c:forEach begin="${searchHis.pageStart }" end="${searchHis.pageEnd }" var="i">
<c:choose>
	<c:when test="${i eq searchHis.page }">
		<c:out value="${i}"></c:out>
	</c:when>
	<c:otherwise>
		<a class="qna_page_num" href="javascript:pageForm(${i })"><c:out value="${i}"></c:out></a>
	</c:otherwise>
</c:choose>
</c:forEach>
	<c:if test="${searchHis.totPage>1 }">
		<a href="list?page=${searchHis.page+1 }"><img alt="#" src="../resources/img/arrow3.png"></a>
		<a href="list?page=${searchHis.totPage }"><img alt="#" src="../resources/img/arrow4.png"></a>
	</c:if>
</c:if>
</div>
</form>
<form action="list" method="post" id="searform">
<div >
		<input type="hidden" name="page" value=""/>
	
	<c:choose>
		<c:when test="${qtitle }">
			 <input id="qna_search_check" type="checkbox" name="searchType" value="qtitle" checked="checked">
			<label id="qna_label_tit"  for="qna_search_check"></label>
		</c:when>
		<c:otherwise>
			<input id="qna_search_check"  type="checkbox" name="searchType" value="qtitle" >
			<label id="qna_label_tit"  for="qna_search_check"></label>
		</c:otherwise>
	</c:choose>
 <label class="qna_search">제목</label>
	
	
 <c:choose>
		<c:when test="${w_content }">
			 <input id="qna_search_con"  type="checkbox" name="searchType" value="w_content" checked="checked">
			<label id="qna_label_con" for="qna_search_con"></label>
		</c:when>
		<c:otherwise>
			<input id="qna_search_con" type="checkbox" name="searchType" value="w_content">
			<label id="qna_label_con"  for="qna_search_con"></label>
		</c:otherwise>
	</c:choose>
 <label class="qna_search">내용</label>
 <input class="qna_seach_text" type="text" name="sk" style="width: 300px;" maxlength="50" value="${searchKeyword }"/>
 <input class="qna_seach_sub" type="submit" name="his_search" value="검색" >
</div>

	</form>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "
	-//W3C//DTDHTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/CSS.css">
<link rel="stylesheet" href="../resources/css/freeboard/nstyle.css">
<title>자유게시판</title>
<script type="text/javascript">
function popup() {
	var url = "/KoreaHistory/login/login";
	var name = "name(popup_login)";
	var option = "width = 517, height = 480, top = 100, left = 600";
	window.open(url, name, option);
}
function question() {
	alert("로그인을 해야 사용할수 있는 기능입니다.");
}
</script>
</head>
<body>
	<div class="body">
<%@ include file="/WEB-INF/views/header.jsp" %>
   <div>
     <h3 class="h1">
     	자유게시판
     </h3>
    </div>
    <div style="padding-bottom: 50px">
     	<hr>
    </div>
    <div class="board_list">
     	&nbsp;
	<table class="board_table">
		<tr class="board_tr">
			<td class="board_t">번호</td>
			<td class="board_t">작성자</td>
			<td class="board_ti">제목</td>
			<td class="board_t">작성일</td>
			<td class="board_t">조회수</td>
			<td class="board_t">댓글수</td>
		</tr>
		<c:forEach items="${historylist }" var="dto">
			<tr class="board_tr">
				<td class="board_td">${dto.hid }</td>
				<td class="board_td">${dto.hname }</td>
				<td class="board_td"><a class="title" href="contentView?hid=${dto.hid }">${dto.htitle }</a></td>
				<td class="board_td">
				<fmt:formatDate value="${dto.hdate }" var="rstDate" pattern="yyyy-MM-dd HH:mm:ss" />
				<%-- ${dto.hdate } --%>
				${rstDate }
				
				</td>
				<td class="board_td">${dto.hhit }</td>
				<td class="board_td">${dto.hindent }</td>
			</tr>
		</c:forEach>
		<tr>
			<c:if test="${id ne null }">
			<td class="board_wri"  colspan="10"><a class="board_wri_bwri" href="historywrite">글쓰기</a></td>
			</c:if>
		</tr>
	</table>
	&nbsp;
     	</div>
     	
	<div style="clear: both;"></div>
	&nbsp;

		<form action="historylist" method="post" id="form1" name="form1">
		<input type="hidden" name="page" value=""/>
		<script type="text/javascript">
			function pageForm(page) {
				document.form1.page.value=page;
				document.form1.submit();
			}
		</script>
		<div>
	<c:if test="${searchVO.totPage>0 }">
	<c:if test="${searchVO.totPage>1 }">
		<a href="historylist?page=1"><img alt="#" src="../resources/img/arrow1.PNG"></a>
		<a href="historylist?page=${searchVO.page-1 }"><img alt="#" src="../resources/img/arrow.PNG"></a>
	</c:if>	
<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
<c:choose>
	<c:when test="${i eq searchVO.page }">
		<c:out value="${i}"></c:out>
	</c:when>
	<c:otherwise>
		<a class="board_page_num" href="javascript:pageForm(${i })"><c:out value="${i}"></c:out></a>
	</c:otherwise>
</c:choose>
</c:forEach>
	<c:if test="${searchVO.totPage>1 }">
		<a href="historylist?page=${searchVO.page+1 }"><img alt="#" src="../resources/img/arrow3.png"></a>
		<a href="historylist?page=${searchVO.totPage }"><img alt="#" src="../resources/img/arrow4.png"></a>
	</c:if>
</c:if>
</div>
</form>
	<form action="historylist" method="post" id="searform">
<div>
		<input type="hidden" name="page" value=""/>

	<c:choose>
		<c:when test="${htitle }">
			 <input id="board_search_check" type="checkbox" name="searchType" value="htitle" checked="checked">
			<label id="board_label_tit"  for="board_search_check"></label>
		</c:when>
		<c:otherwise>
			<input id="board_search_check"  type="checkbox" name="searchType" value="htitle" >
			<label id="board_label_tit"  for="board_search_check"></label>
		</c:otherwise>
	</c:choose>
 <label class="board_search">제목</label>
 <c:choose>
		<c:when test="${hcontent }">
			 <input id="board_search_con"  type="checkbox" name="searchType" value="hcontent" checked="checked">
			<label id="board_label_con" for="board_search_con"></label>
		</c:when>
		<c:otherwise>
			<input id="board_search_con" type="checkbox" name="searchType" value="hcontent">
			<label id="board_label_con"  for="board_search_con"></label>
		</c:otherwise>
	</c:choose>
 <label class="board_search">내용</label>
 <input class="board_search_sub" type="text" name="sk" style="width: 200px;" maxlength="50" value="${searchKeyword }"/>
 <input class="sea" type="submit" name="btn_search" value="검색" >
</div>

</form>
 </div>
<foorter class="footer">
            <div class="copyright">
               <p>All content copyright KoreanHistory co, ltd.</p>
            </div>
</foorter>
</body>
</html>
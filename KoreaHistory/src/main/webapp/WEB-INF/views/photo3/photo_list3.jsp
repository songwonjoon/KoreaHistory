<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link  rel="stylesheet" href="../resources/css/CSS.css"/>
<link  rel="stylesheet" href="../resources/css/gallery/photo_list.css"/>
<script src="../resources/js/login.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
   name = "name(popup_start)"; //로그인창에서 회원가입누르면, 회원가입화면이 여기에서 보이게  해놓음.
</script>
</head>
<body>
   <%@ include file="/WEB-INF/views/header.jsp" %>
     	<div>
     		<h3 class="h1">
     			<a style="text-decoration: none; color: black;" href="photo_list3">동해</a>
     		</h3>
     	</div>
     	<div style="padding-bottom: 50px">
     	<hr>
     	</div>
  <table class="photo_list_table">
	<tr class="photo_list_tr">
		<th class="photo_list_th_img">사진</th>
		<th class="photo_list_th">제목</th>
		<th class="photo_list_th">아이디</th>
		<th class="photo_list_th">날짜</th>
	</tr>
	<c:forEach items="${photo_list3 }" var="photo">
	<tr>
	<td class="photo_list_td" >
	<c:if test="${photo.pfile ne null }">
	<img class="photo_list_img" alt="${photo.pfile }" 
		src="../resources/upload/${photo.pfile }" style="width:150px; height:100px;">
	</c:if>
	<c:if test="${photo.pfile eq null }">
		<strong>사진없음</strong>
	</c:if>
	</td>
			<td class="photo_list_ti">
			<input type="hidden" name="p_num" value="${photo.p_num }">
			<a class="photo_list_tit" href="photo_view3?p_num=${photo.p_num }">
		 ${photo.ptitle }</a>
		 </td>
			<td class="photo_list_td" id="photo_list_pid"> ${photo.pid }</td>
			<td class="photo_list_td" id="photo_list_pdate">${photo.pdate }</td>
		</tr>
	</c:forEach>	
	<tr>
		<c:if test="${id ne null }">
 		<td class="photo_list_wri" colspan="5"><a class="photo_list_wri_pwri" href="photo_write3">글쓰기</a></td>
		</c:if>
 	</tr>
</table>
<div style="clear: both;"></div>
&nbsp;
	<form action="photo_list3" method="post" id="pform" name="pform">
		<input type="hidden" name="page" value=""/>
		<script type="text/javascript">
			function pageForm(page) {
				document.pform.page.value=page;
				document.pform.submit();
			}
		</script>
		<div>
	<c:if test="${searchPhoto.totPage>0 }">
	<c:if test="${searchPhoto.totPage>1 }">
		<a href="photo_list3?page=1"><img alt="#" src="../resources/img/arrow1.PNG"></a>
		<a href="photo_list3?page=${searchPhoto.page-1 }">
		<img alt="#" src="../resources/img/arrow.PNG"></a>
	</c:if>	
<c:forEach begin="${searchPhoto.pageStart }" end="${searchPhoto.pageEnd }" var="i">
<c:choose>
	<c:when test="${i eq searchPhoto.page }">
		<c:out value="${i}"></c:out>
	</c:when>
	<c:otherwise>
		<a class="photo_list_num"  href="javascript:pageForm(${i })"><c:out value="${i}"></c:out></a>
	</c:otherwise>
</c:choose>
</c:forEach>
	<c:if test="${searchPhoto.totPage>1 }">
		<a href="photo_list3?page=${searchPhoto.page+1 }"><img alt="#" src="../resources/img/arrow3.png"></a>
		<a href="photo_list3?page=${searchPhoto.totPage }"><img alt="#" src="../resources/img/arrow4.png"></a>
	</c:if>
</c:if>
</div>
</form>
<form>
<div action="photo_list3" method="post" id="searform">
	<c:choose>
		<c:when test="${ptitle }">
			 <input id="photo_list_check" type="checkbox" name="searchType" value="ptitle" checked="checked"/>
			 <label id="photo_list_search_tit"  for="photo_list_check"></label>
		</c:when>
		<c:otherwise>
			<input id="photo_list_check" type="checkbox" name="searchType" value="ptitle" />
			<label id="photo_list_search_tit"  for="photo_list_check"></label>
		</c:otherwise>
	</c:choose>
 <label class="photo_search">제목</label>
 <c:choose>
		<c:when test="${p_content }">
			 <input id="photo_list_con" type="checkbox" name="searchType" value="p_content" checked="checked"/>
			 <label id="photo_list_search_con"  for="photo_list_con"></label>
		</c:when>
		<c:otherwise>
			<input id="photo_list_con" type="checkbox" name="searchType" value="p_content"/>
			<label id="photo_list_search_con"  for="photo_list_con"></label>
		</c:otherwise>
	</c:choose>
 <label class="photo_search">내용</label>
 <input class="photo_list_text" type="text" name="sw" style="width: 350px;" maxlength="50" value="${sWord }"/>
 <input class="photo_list_sub" type="submit" name="photo_search" value="검색" >
</div>
</form>
</body>
<foorter class="footer">
            <div class="copyright">
               <p>All content copyright KoreanHistory co, ltd.</p>
            </div>
         </foorter>
</html>
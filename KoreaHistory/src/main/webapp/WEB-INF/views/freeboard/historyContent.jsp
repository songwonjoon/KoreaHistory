<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link type="text/css" rel="stylesheet" href="../resources/css/freeboard/modify.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정</title>
<script
	src="https://cdn.ckeditor.com/ckeditor5/15.0.0/classic/ckeditor.js"></script>
<style type="text/css">
.ck.ck-editor{
	max-height: 500px;
}
.ck-editor__editable{
	min-height: 300px;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
   <div>
     <h3 class="h1">
     	자유게시판
     </h3>
    </div>
    <div style="padding-bottom: 50px">
     	<hr>
    </div>
	<div class="modify">
		<table>
			<form action="../modify" method="post" enctype="multipart/form-data">
				<input type="hidden" name="hid" value="${historyContent.hid }">
				<input type="hidden" name="content"
					value="${historyContent.content }">
				<tr class="modify_tr">
					<td class="modify_td">번호</td>
					<td class="modify_td">${historyContent.hid }</td>
				</tr>
				<tr class="modify_tr">
					<td class="modify_td">히트</td>
					<td class="modify_td">${historyContent.hhit }</td>
				</tr>
				<tr class="modify_tr">
					<td class="modify_td">작성자</td>
					<td class="modify_td">${historyContent.hname }</td>
				</tr>
				<tr class="modify_tr">
					<td class="modify_td">제목</td>
					<td class="modify_td"><input type="text" name="htitle"
						value="${historyContent.htitle }" size="50" style="width:700px; height: 25px; font-family: YeonSung; font-size: 20px; " /></td>
				</tr>
				<tr class="modify_tr">
					<td class="modidfy_td">내용</td>
					<td class="modify_td"><textarea type="text" id="hcontent" name="hcontent">${historyContent.hcontent }</textarea></td>
				</tr>
				<tr class="modify_tr">
					<td class="modify_td">첨부파일</td>
					<td class="modify_td">
						<c:if test="${historyContent.hfilesrc =='null' }">
							<input type="file" name="file" id="file" size="50">
						</c:if></td>
				</tr>
				<tr class="modify_tr_btn">
					<td colspan="2"><input class="modify_tr_mo" type="submit" value="저장" />
						&nbsp;&nbsp;<a class="cancle" href="contentView?hid=${historyContent.hid }">취소</a>
				</tr>
			</form>
		</table>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
	<foorter class="footer">
            <div class="copyright">
               <p>All content copyright KoreanHistory co, ltd.</p>
            </div>
    </foorter>
</body>
</html>
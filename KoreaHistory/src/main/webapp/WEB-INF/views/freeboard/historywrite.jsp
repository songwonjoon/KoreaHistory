<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../resources/css/CSS.css">
<link rel="stylesheet" href="../resources/css/freeboard/write.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
<script src="https://cdn.ckeditor.com/ckeditor5/15.0.0/classic/ckeditor.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var num = 0;
	var list = new Array();
	list[0] = '#htitle';
	function btn_write() {
		if (($(list[0]).val() == '')) {

			num++;
			alert("작성 실패.");
			($(list[0]).css('border-color', 'red'));

		} else {
			alert("작성 완료.");
		}
	}
</script>
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
	<div class="write">
	<table>
		<form action="../write" method="post" enctype="multipart/form-data">
			<tr class="write_tr">
				<td class="write_td">작성자</td>
				<td class="write_td"><input type="text" name="hname" size="50" value="${id}" 
				style="width:700px; height: 25px;font-family: YeonSung; font-size: 20px; "></td>
			</tr>
			<tr class="write_tr">
				<td class="write_td">제목</td>
				<td class="write_td"><input type="text" id="htitle" name="htitle" size="50" 
				style="width:700px; height: 25px; font-family: YeonSung; font-size: 20px; "></td>
			</tr>
			<tr class="write_tr">
				<td class="write_td">내용</td>
				<td class="write_td"><textarea type="text" id="hcontent" name="hcontent"
				style="font-family: YeonSung""></textarea></td>
			</tr>
			<tr class="write_tr">
				<td class="write_td">첨부파일</td>
				<td class="write_td"><input  type="file" id=file name="file" size="50"></td>
			</tr>
			<tr class="write_tr_btn">
				<td colspan="2"><input type="submit" value="작성완료"
					onclick="btn_write()" class="write_td_wr"> <a class="list" href="historylist">취소</a></td>


			</tr>

		</form>
	</table>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
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
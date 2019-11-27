<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../resources/Lee/LeeCss/question.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/question/header_question.jsp" %>
	<br><br>
	<div class="question"
		style="border: solid 10px #972722; border-radius: 40px 40px">${getId }님의점수는
		${score }입니다 평균점수는 ${avgScore }입니다.</div>
	<form action="../Html" method="post" class="answer">
		<%-- <input type="hidden" name="id" value="${id }" /> --%>
		<input type="hidden" name="login" value="true" /> <input
			type="submit" value="메인화면" />
	</form>
</body>
</html>
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
	<div class="question" style="border: solid 10px #972722; border-radius: 40px 40px">
	<h3>${OX }</h3>
	<p>정답: ${question_proc.q_answer }</p>
	<p>${ans }</p>
	</div>
	<form action="question_view" class="answer">
		<input type="hidden" name="cnt" value="${cnt }" />
	<%-- 	<input type="hidden" name="id" value="${id }" /> --%>
		<input type="submit" value="다음문제">	
	</form>
</body>
</html>
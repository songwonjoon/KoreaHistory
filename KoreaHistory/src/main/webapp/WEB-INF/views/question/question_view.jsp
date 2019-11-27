<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../resources/Lee/LeeCss/question.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function check() {
		var ans = document.question.answer.value;

		if (ans == "") {
			alert("하나의 답을 체크하셔야 합니다.");
			return false;
		}

		return true;
	}
</script>
<title>Question</title>
</head>
<body>
<%@ include file="/WEB-INF/views/question/header_question.jsp" %>
<br><br>
	<%-- <h3>문제번호: ${question.q_num }</h3> --%>
	<div class="question" style="border: solid 10px #972722; border-radius: 40px 40px">
		 &nbsp;<strong>문제:</strong> ${question.q_content }
	</div>
	<%-- 	<h3>문제답: ${question.q_answer }</h3> --%>
	<br><br><br>

	<form action="question_proc" name="question" onsubmit="return check()">
		<div class="answer">
			<input type="radio" name="answer" value="A">${question.ans1 }<br>
			<input type="radio" name="answer" value="B">${question.ans2 }<br>
			<input type="radio" name="answer" value="C">${question.ans3 }<br>
			<input type="radio" name="answer" value="D">${question.ans4 }<br>
			<input type="submit" value="제출"  class ="qna_seach_sub">
		</div>
		<input type="hidden" name="real_answer" value="${question.q_answer }" />
		<input type="hidden" name="cnt" value="${cnt }" /> 
		<input type="hidden" name="qNum" value="${qNum }" /> 
	</form>
</body>
</html>
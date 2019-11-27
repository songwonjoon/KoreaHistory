<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../resources/Lee/LeeCss/dice.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function check() {
		var ans = document.question.answer.value;

		if (ans == "") {
			alert("답을 체크하셔야 합니다.");
			return false;
		}

		opener.location.reload();

		return true;
	}
</script>
<title>Question</title>
</head>
<body>
	<div class="question">
		<%-- <h3>문제번호: ${question.q_num }</h3> --%>
		<h3>문제: ${question.q_content }</h3>
		<%-- <h3>문제답: ${question.q_answer }</h3> --%>
	</div>
	<div class="answer">
		<form action="dice_turn" name="question" onsubmit="return check()">
			<input type="radio" name="answer" value="A">${question.ans1 }<br>
			<input type="radio" name="answer" value="B">${question.ans2 }<br>
			<input type="radio" name="answer" value="C">${question.ans3 }<br>
			<input type="radio" name="answer" value="D">${question.ans4 }<br>
			<input type="hidden" name="real_answer" value="${question.q_answer }" />
			<input type="submit" value="제출" class ="qna_seach_sub">
		</form>
	</div>
</body>
</html>
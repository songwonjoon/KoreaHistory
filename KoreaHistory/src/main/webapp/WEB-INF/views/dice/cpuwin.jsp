<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../resources/Lee/LeeCss/dice.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="lose">
	<%@ include file="/WEB-INF/views/dice/dice_header.jsp"%>
	<div class="lose_div">
		<p>역사를 잊은 민족에게 미래는 없다<p>
	</div>
	<div class="dice_div">
		<a class="ap" href="dice_game">다시하기</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="ap" href="../Html">메인화면</a>
	
		<p class="ap"><strong>${id }</strong>님의승리횟수:${win } 패배횟수: ${lose }</p>
		<p class="ap">플레이한 횟수: ${count } 승률: ${winshare }%</p>
	</div>
</body>
</html>
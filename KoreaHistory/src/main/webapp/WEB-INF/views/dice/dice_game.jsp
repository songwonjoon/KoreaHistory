<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../resources/Lee/LeeCss/dice.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function dice_question () {
		var userWin = '${userwin}';
		var userturn = ''

		if (userWin == 'win') {
			close();
		} else if (userWin != 'win') {
			var url = "dice_question";
			var name = "popup";
			var option = "width = 850, height = 550, top = 250, left = 550, location = no"
			window.open(url, name, option);
		}
		return true;
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/dice/dice_header.jsp" %>
	<p>
		<c:if test="${dice eq 1}"><img src="../resources/Lee/LeeImg/dice_one.png"></c:if>
		<c:if test="${dice eq 2}"><img src="../resources/Lee/LeeImg/dice_two.png"></c:if>
		<c:if test="${dice eq 3}"><img src="../resources/Lee/LeeImg/dice_three.png"></c:if>
		<c:if test="${dice eq 4}"><img src="../resources/Lee/LeeImg/dice_four.png"></c:if>
		<c:if test="${dice eq 5}"><img src="../resources/Lee/LeeImg/dice_five.png"></c:if>
		<c:if test="${dice eq 6}"><img src="../resources/Lee/LeeImg/dice_six.png"></c:if>
	</p>
	<c:if test="${userturn eq 'true' }">
		<form action="dice_game_proc" onsubmit="return dice_question()">
			<p class="blue">유저차례</p>
			<input type="submit" class ="qna_seach_sub" value="주사위 돌리기"> <br> <br>
		</form>
	</c:if>
	<c:if test="${userturn eq 'false' }">
		<form action="dice_game_proc" name="cputurn">
			<p class="red">컴퓨터 움직이는중...</p>
		</form>
	</c:if>

	<div id="ground">
		<c:if test="${user.ground1 eq 0 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
	<%-- 	<c:if test="${com.ground1 eq 0 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if> --%>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 1 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 1 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 2 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 2 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 3 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 3 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 4 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 4 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 5 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 5 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 6 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 6 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 7 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 7 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 8 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 8 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 9 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 9 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 10 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 10 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 11 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 11 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 12 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 12 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 13 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 13 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 14 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 14 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 15 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 15 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 16 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 16 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 17 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 17 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 18 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 18 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 19 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 19 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 20 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 20 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 21 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 22 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 22 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 22 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 23 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 23 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 24 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 24 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 25 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 25 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 26 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 26 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 27 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 27 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 28 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 28 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 29 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 29 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 30 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 30 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 31 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 31 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 32 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 32 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 33 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 33 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 34 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 34 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 35 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 35 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 36 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 36 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 37 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 37 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 38 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 38 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 39 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 39 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 40 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 40 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 41 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 41 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 42 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 42 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 43 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 43 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 44 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 44 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 45 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 45 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 46 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 46 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 47 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 47 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 48 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 48 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 49 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 49 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<c:if test="${user.ground1 eq 50 }"><img class="ia" src="../resources/Lee/LeeImg/ia.jpg"></c:if>
		<br>
		<c:if test="${com.ground1 eq 50 }"><img class="thresh" src="../resources/Lee/LeeImg/thresh.jpg"></c:if>
	</div>
	<div id="ground">
		<img src="../resources/Lee/LeeImg/Id.jpg">
	</div>
</body>
<script type="text/javascript">
	setTimeout("location.reload()", 1000);
	document.cputurn.submit();
</script>
</html>
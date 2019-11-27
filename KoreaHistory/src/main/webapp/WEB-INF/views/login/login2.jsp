<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<%-- <%
request.setCharacterEncoding("utf-8");
%> --%>
<script src="../resources/js/login.js"></script>
<style type="text/css">
body{
	background-image: url("../resources/img/login/new_login2.png");
	background-size: 100%;
}

.label{
	border-radius: 3px;
	opacity: 1.0;
}

.input_text{
   padding-top: 10px;
   padding-bottom:5px;
   border-radius: 3px;
   border: 0px solid black;
   opacity: 1.0;
}

.input_text:focus{
   padding-top: 10px;
   padding-bottom:5px;
   border-radius: 3px;
   border: 1px solid black;
   opacity: 1.0;
}
.login_button{
   height: 25px;
   margin-bottom: 10px;
   border-radius: 5px;
   border: 1px none black;
   background-color: white;
   font-weight: bold;
   padding-bottom: 2px; 
   
}
.login_button:hover {
   color: white;
   background-color: black;
   opacity: 1.0;
}


</style>
</head>
<body>
 <!-- style="background-image: url('../resources/로그인화면2.jpg'); background-repeat: no-repeat; background-size: 100% " -->
<center>
<div id="wrap" style="margin-top:300px;">
	<form action="../loginProc2" method="post" name="loginInfo" onsubmit="return checkValue()">
	<!-- 여기에 이미지 추가 -->
	<!-- <img alt="로그인 이미지 불러오지 못함" width="412" height="230" src="/KoreaHistory/resources/로그인화면.jpg"> -->
	<!-- <h1>로그인2</h1> -->
	<br><br>
	<br><br>
	<table>
		<tr>
			<th bgcolor="black" class="label" style="color:white;">아이디</th>
			<td>&nbsp;<input type="text" class="input_text" name="nid" id="id" maxlength="50" /> </td>
		</tr>
		<tr>
			<th bgcolor="black" class="label" style="color:white;">비밀번호</th>
			<td>&nbsp;<input type="password" class="input_text" name="npw" id="pw" maxlength="50" /> </td>
		</tr>
	</table>
	<br>
	<input type="submit" class="login_button" value="로그인" />
	<input type="button" class="login_button" value="회원가입" onclick="javascript:goJoinForm()"  />
	</form>
</div>
<!-- 여기 게시판이동 링크 넣을수있음 -->
<!-- <a href="../customer/notice.jsp" >게시판이동</a> -->
<!-- <a href="javascript:goBoard()" >게시판이동</a> -->
<!-- 창닫기 넣을까?-->
</center>
</body>
</html>
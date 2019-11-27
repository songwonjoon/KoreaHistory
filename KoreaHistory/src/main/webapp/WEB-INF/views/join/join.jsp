<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/CSS.css">
<!-- <link type="text/css" rel="stylesheet" href="../resources/css/nstyle.css"> -->
<title>회원가입</title>
<script src="../resources/js/join.js"></script>
<style type="text/css">
 .border {
	border:3px ridge grey;
	position: relative;
	min-width: 390px;
	max-width: 390px; 
	min-height: 500px;
	max-height: 600px;
	padding: 5px; 
	
	border-radius: 50px;
	background-color: #efefef;
	/* background-color: #fff; */
} 
.input_text{
   padding-top: 10px;
   padding-bottom:5px;
   border-radius: 3px;
   border: 1px solid black;
   /* opacity: 0.8; */
}
.button{
   height: 25px;
   margin-bottom: 0px;
   border-radius: 5px;
   border: 1px solid black;
   background-color: white;
   font-weight: bold;
   opacity: 1.0;
   padding-bottom: 2px; 
}
.button:hover {
   color: white;
   background-color: black;
} 
.back{
 	background-image: url("../resources/img/introduce/그림1.png");
	background-repeat: no-repeat;
	background-size: 100%;
}
p {
    display: block;
    margin-block-start: 0em;
    margin-block-end: 0em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.bold{
	font-weight: bold;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/header2.jsp" %>
<div class="back">
<br><br>
<center>
<div class="border">	
<h1>회원가입</h1>
<br>
<form action="../joinProc" name="join" method="post"> <!-- onsubmit="return pwCheck()" -->
<table>
<tr><td colspan="2"><label for="id" class="bold">아이디</label></td></tr>
<tr>
	<td colspan="2"><input type="text" class="input_text" name="id" id="id" maxlength="50" />
	&nbsp;<input type="button" class="button" value="중복확인" name="idCheckBtn" id="idCheckBtn" onclick="idCheck()"/></td>
</tr>
<tr><td colspan="2"><label for="pw" class="bold">비밀번호</label></td></tr>
<tr>
	<td colspan="1"><input type="password" class="input_text" name="pw" id="pw" maxlength="50" /></td>
</tr>
<tr><td colspan="2"><label for="pw2" class="bold">비밀번호 재확인</label></td></tr>
<tr>
	<td colspan="1"><input type="password" class="input_text" name="pw2" id="pw2" maxlength="50" /></td>
</tr>
<tr><td colspan="2"><p id="pwCheckText" style="color:red;"></p></td></tr>
<tr><td colspan="2"><label for="name" class="bold">이름</label></td></tr>
<tr><td colspan="2"><input type="text" class="input_text" name="name" id="name" maxlength="50" /></td></tr>
<tr><td colspan="2"><label for="email" class="bold">이메일</label></td></tr>
<tr>
	<td colspan="2"><input type="email" class="input_text" name="email" id="email"  maxlength="50" placeholder="" />
	&nbsp;<input type="button" class="button" name="ecode" value="이메일 인증하기" onclick="javascript:email_Popup()" /></td>
</tr>
<tr><th colspan="2" style="line-height:10pt;">&nbsp;</th></tr>
<tr><td colspan="2"><input type="button" class="button" value="가입하기" onclick="javascript: return pwCheck()" /> 
<input type="button" class="button" value="취소" onclick="javascript:goHome()" /></td></tr>
</table>

<input type="hidden" id="emCertify" name="emCertify" size="50" />
<input type="hidden" id="lastIdCheck" name="lastIdCheck" size="50" />

</form>

</div>
</center>
<br><br>
</div>
<foorter class="footer">
            <div class="copyright">
               <p>All content copyright KoreanHistory co, ltd.</p>
            </div>
  	</foorter>
</body>
</html>
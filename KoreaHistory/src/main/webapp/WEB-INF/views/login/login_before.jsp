<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>

<%
request.setCharacterEncoding("utf-8");
%>

<script type="text/javascript">
	
	
	
	/* var loginCheck = '<c:out value="${loginCheck}"/>';
	alert(loginCheck); */
	
	/* if (${loginCheck} == null) {
	
	} */ 
	
	function checkValue(){
		inputForm=eval("document.loginInfo");
		if (!inputForm.nid.value) {
			alert("아이디를 입력하세요.");
			inputForm.nid.focus();
			return false;
		}
		if (!inputForm.npw.value) {
			alert("비밀번호를 입력하세요.");
			inputForm.npw.focus();
			return false;
		}
		
		/* 로그인 성공여부 확인 기능 */
		/* if (!(inputForm.id.value == "blue" && inputForm.pw.value == "123")) {
			inputForm.id.value = "";
			inputForm.pw.value = "";			
			inputForm.id.focus();
			alert("아이디 또는 비밀번호를 다시 확인하세요. \n등록되지 않은 "
					+ "아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.");
			return false;
		} else {
			alert("로그인 성공");
			var url = "LoginPopupStart";
			var name = "name(popup_start)";
			window.open(url,name);
			close();
			return true;
		} */
		//alert("이제 리턴 true");
		return true;
	}
	
	
	function goJoinForm(){
		/* location.href="../join/join" */
		var url = "../join/join";
		var name = "name(popup_start)"; // 홈화면(LoginPopupStart)에 name(popup_start) 라고 변수선언해둠.
		var option = "width=2000 ,height=2000, location = no";
		window.open(url,name,option); 
		
		//창닫기 기능
		close();
	}
	
	
	function goBoard(){
		var url = "LoginPopupStart"; //게시판url을 일단 LoginPopupStart로 해두었다.
		var name = "name(popup_start)"; // 홈화면"창"(LoginPopupStart)에 name(popup_start) 라고 변수선언해둠.
		window.open(url,name); 
		
		//창닫기 기능
		close();
	}
	
</script>

</head>
<body>
<center>
<div id="wrap">
	<form action="../loginProc" method="post" name="loginInfo" onsubmit="return checkValue()">
	<br>
	<!-- 여기에 이미지 추가 -->
	<img alt="로그인 이미지 불러오지 못함" width="230" height="230" src="/KoreaHistory/resources/Tulips.jpg">
	<h1>로그인</h1>
	<!-- <br> -->
	<table>
		<tr>
			<th bgcolor="blue" style="color:white;">아이디</th>
			<td><input type="text" name="nid" id="id" maxlength="50" /> </td>
		</tr>
		<tr>
			<th bgcolor="blue" style="color:white;">비밀번호</th>
			<td><input type="password" name="npw" id="pw" maxlength="50" /> </td>
		</tr>
	</table>
	<br>
	<input type="submit" value="로그인" />
	<input type="button" value="회원가입" onclick="javascript:goJoinForm()"  />
	</form>
</div>
<!-- 여기 게시판이동 링크 넣을수있음 -->
<!-- <a href="../customer/notice.jsp" >게시판이동</a> -->
<!-- <a href="javascript:goBoard()" >게시판이동</a> -->
<!-- 창닫기 넣을까?-->
</center>
</body>
</html>
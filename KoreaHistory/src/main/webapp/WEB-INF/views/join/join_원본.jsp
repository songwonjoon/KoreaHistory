<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript" language="javascript">
	
	function pwCheck(){
		var pw = document.getElementById("pw").value;
//		var pw = document.pw.value;
		var pw2 = document.getElementById("pw2").value;
//		var pw2 = document.pw2.value;
		
		/* if (pw == pw2) {
			docuemnt.getElementById("pwCheckText").innerHTML = ""
		} */   
		if (pw != pw2) {
			document.getElementById("pwCheckText").innerHTML = "비밀번호가 일치하지 않습니다.";
		//	alert("비밀번호가 일치하지 않습니다.");  //윗줄을 사용하면 빨간글씨 등장, 이줄을 사용하면 경고메시지 등장
			document.join.pw.value = "";
			document.join.pw2.value = "";
			return false; // form태그의 onsubmit속성의 반환값이 false일 경우 현재페이지에 그대로 머무른다.
		} else if (pw.length < 6 || pw.length > 16) {
			document.getElementById("pwCheckText").innerHTML = "비밀번호는 6자리 이상, 16자리 이하만 가능합니다.";
			return false;
		} else{
			document.getElementById("pwCheckText").innerHTML = "";
			//alert("회원가입이 성공적으로 완료되었습니다.");
		//	return true;
		}
		
	}
/*   	function idCheck(){
		var url="idCheck";
		var name="name(popup_idCheck)";
//		var name= document.join.id.value;
		var option="width = 400 , height = 400 , top = 300 , left = 300";
		window.open(url,name,option);
	}   
		function idCheck2(){
			document.joinID.action="/PROJECT_IOI/join/idCheck";	
			openWindow('','yes','yes','620','400','name(popup_idCheck)','150','150');
			document.joinID.target = "name(popup_idCheck)";
			document.joinID.submit();
	} */
	function email_Popup(){
		var url="../certify/certify";
		var name="name(popup_certify)";
		var option="width = 400 , height = 400 , top = 300 , left = 300";
		window.open(url,name,option);
	}
	function send(){
		// 빈 창으로 팝업을 열어 놓습니다. 
		var option="width = 400 , height = 180 , top = 300 , left = 300";
		window.open('','submitWindow',option);
		// 폼이 전송될 타겟을 팝업창의 이름으로 지정합니다. 
		document.form1.target = 'submitWindow';
		// 폼을 전송합니다. 
		document.form1.submit();
		
//		document.form1.id.value = "";
	}

</script>
</head>
<body>
<h3>join.jsp</h3>
<h1>회원가입</h1>
<%-- <img alt="사과 이미지 불러오지 못함" src="<spring:url value='/img/사과도안3.png'/>"> --%>

<!-- <form action="../login/LoginPopupStart" onsubmit="return pwCheck()" name="join"> -->

<form action="/PROJECT_IOI/join/idCheck" onsubmit="send()" target="_blank" name="form1" >
<!-- <form action="" onsubmit="idCheck(), idCheck2()" name="joinID"> -->
<label for="id">아이디 중복확인</label><br>
<input type="text" name="id" id="id" maxlength="50" required"/>
<%-- <a href="/PROJECT_IOI/join/idCheck?id=${id.value } " target="_blank" > --%><input type="submit" value="중복확인" /><!-- </a> --></form><br>

<form action="../joinProc" onsubmit="return pwCheck()" name="join" method="post">
<label for="id">아이디</label><br>
<input type="text" name="id" id="id" maxlength="50" required"/><br>
<label for="pw">비밀번호</label><br>
<input type="password" name="pw" id="pw" maxlength="50" required/><br> 

<label for="pw2">비밀번호 재확인</label><br>
<input type="password" name="pw2" id="pw2" maxlength="50" required/>
<input type="button" onclick="pwCheck()" value="비밀번호 확인 테스트용 버튼" />  <!-- 비밀번호 확인 테스트용 버튼 -->
<p id="pwCheckText" style="color:red;"></p>

<label for="name">이름</label><br>
<input type="text" name="name" maxlength="50" required/><br>

<label for="email">이메일</label><br>
<input type="email" name="email" maxlength="50" required/>
<input type="button" name="ecode" value="이메일 인증하기" onclick="javascript:email_Popup()" /><br><br>

<input type="submit" value="가입하기" />

</form>




</body>
</html>
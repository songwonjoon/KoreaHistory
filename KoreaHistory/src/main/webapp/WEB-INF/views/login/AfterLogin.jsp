<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
 
 $(document).ready(function(){
	
	 $("#loginCheck").trigger("click");
	 
 });

 function LoginCheck(){
		
		var loginCheck = '<c:out value="${loginCheck}"/>';
		var id = '<c:out value="${id}"/>';
		if (loginCheck=="로그인 가능") {
			//alert(id+"님 환영합니다.");
			//alert("로그인 성공");
			//opener.document.login.action="login/login";
			//alert("과연");
			//opener.document.login.submit();
			var url = "/KoreaHistory/Html";
			var name = "name(popup_start)"; // 홈화면(LoginPopupStart)에 name(popup_start) 라고 변수선언해둠.
			//var option = "width=2000 ,height=2000, location = no";
			//window.open(url,name,option);
			//opener.document.getElementById("id").innerHTML = "${id} 님 환영합니다. ";
			
			var login = document.login
			login.target = name;
			login.action = url;
			login.submit();
			
			close();
			
		}else if (loginCheck=="로그인 불가") {
			alert("아이디 또는 비밀번호를 다시 확인하세요. \n등록되지 않은 "
					+ "아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.");
			location.href="login/login";

		}else{
			alert("???");
		}
		
	}

</script>

</head>
<body>
<h5>&nbsp;&nbsp;&nbsp;AfterLogin.jsp</h5>
<%-- ${loginCheck } --%>
<%-- ${id } --%>
<form name="login" method="post">
&nbsp;&nbsp;&nbsp;<input type="button" id="loginCheck" value="로그인체크" onclick="javascript:LoginCheck()" />
<input type="hidden" name="id" value="${id}" />
<input type="hidden" name="name" value="${name}"> 
</form>
</body>
</html>
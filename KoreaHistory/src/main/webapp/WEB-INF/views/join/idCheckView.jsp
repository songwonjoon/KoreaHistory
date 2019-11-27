<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>idCheckView.jsp</h1>

<form action="/PROJECT_IOI/join/idCheck?id=${id.value }">
<label for="id">확인할 아이디를 입력하세요.</label><br><br>
<input type="text" id="id" name="id" maxlength="50" required/>
<input type="submit" value="확인" >
</form>
</body>
</html>
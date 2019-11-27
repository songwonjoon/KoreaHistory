<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../../resources/Lee/LeeCss/wiki.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	textarea {
		resize: none;
		width: 1400px;
		height: 500px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/wiki/header_wiki.jsp" %>
	<div class="before_body">
		<div class="body">
			<h1>dokdo_modify</h1>
			<p class="blue">*줄바꿈이 필요할때는 &#60;br&#62;를 적어주세요</p>
			<form action="dokdo_modify_proc" method="post">
				<input type="submit" value="저장">
				<c:forEach items="${dokdo }" var="dto">
				<h1>개요</h1>
					<textarea rows="10" cols="50" name="outline"><c:out value="${dto.outline }" /></textarea>
					
				<h1>역사</h1>
					<textarea rows="10" cols="50" name="history"><c:out value="${dto.history }" /></textarea>	
						
				<h1>일본의 영유권 주장</h1>
					<textarea rows="10" cols="50" name="japan"><c:out value="${dto.japan }" /></textarea>
							
				<h1>한국의 대응</h1>
					<textarea rows="10" cols="50" name="korea"><c:out value="${dto.korea }" /></textarea>
						
				<h1>독도의 중요성</h1>	
					<textarea rows="10" cols="50" name="importance"><c:out value="${dto.importance }" /></textarea>	
						
				<h1>세계적 독도의 인식</h1>	
					<textarea rows="10" cols="50" name="recognition"><c:out value="${dto.recognition }" /></textarea>
				</c:forEach>
			</form>
		</div>
	</div>
</body>
</html>
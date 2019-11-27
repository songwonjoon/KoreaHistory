<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../../resources/Lee/LeeCss/wiki.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			<h1>eastSea_modify</h1>
			<p class="blue">*줄바꿈이 필요할때는 &#60;br&#62;를 적어주세요</p>
			<form action="slave_modify_proc" method="post">
				<input type="submit" value="저장">
				<c:forEach items="${slave }" var="dto">
				<h1>1.개요</h1>
					<textarea rows="10" cols="50" name="outline"><c:out value="${dto.outline }" /></textarea>
					
				<h1>2.상세</h1>
					<textarea rows="10" cols="50" name="detail"><c:out value="${dto.detail }" /></textarea>	
						
				<h1>3.피해자 증언</h1>
					<textarea rows="10" cols="50" name="testimony"><c:out value="${dto.testimony }" /></textarea>
							
				<h1>4.현재</h1>
					<textarea rows="10" cols="50" name="present"><c:out value="${dto.present }" /></textarea>
						
				<h1>5.오늘날 일본의 입장</h1>	
					<textarea rows="10" cols="50" name="japan"><c:out value="${dto.japan }" /></textarea>	
				
				<h1>6.부정파의 주장</h1>	
					<textarea rows="10" cols="50" name="denial"><c:out value="${dto.denial }" /></textarea>	
				</c:forEach>
			</form>
		</div>
	</div>
</body>
</html>

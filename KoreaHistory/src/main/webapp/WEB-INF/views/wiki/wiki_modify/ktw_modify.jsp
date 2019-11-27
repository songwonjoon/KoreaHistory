<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<h1>ktw_modify</h1>
			<p class="blue">*줄바꿈이 필요할때는 &#60;br&#62;를 적어주세요</p>
			<form action="ktw_modify_proc" method="post">
				<input type="submit" value="저장">
				<c:forEach items="${ktw }" var="dto">
					<h1>1.개요</h1>
						<textarea rows="10" cols="50" name="outline"><c:out value="${dto.outline }" /></textarea>
					<h1>2.발단</h1>
						<textarea rows="10" cols="50" name="threshold"><c:out value="${dto.threshold }" /></textarea>	
					<h1>3. 원인 (추측)</h1>
						<h3>3.1 한국의 입장</h3>
							<textarea rows="10" cols="50" name="korea"><c:out value="${dto.korea }" /></textarea>
						<h3>3.2 일본의 입장</h3>
							<textarea rows="10" cols="50" name="japan"><c:out value="${dto.japan }" /></textarea>	
					<h1>4. 한국의 대응</h1>
						<textarea rows="10" cols="50" name="response"><c:out value="${dto.response }" /></textarea>	
					<h1>5. 각국의 반응</h1>
						<textarea rows="10" cols="50" name="reaction"><c:out value="${dto.reaction }" /></textarea>
				</c:forEach>
			</form>
		</div>
	</div>
</body>
</html>
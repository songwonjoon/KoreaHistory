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
			<form action="eastsea_modify_proc" method="post">
				<input type="submit" value="저장">
				<c:forEach items="${eastSea }" var="dto">
				<h1>1.개요</h1>
					<textarea style="resize:none;" rows="10" cols="50" name="outline"><c:out value="${dto.outline }" /></textarea>
					
				<h1>2.영토 주권과 호칭의 관계성</h1>
					<textarea rows="10" cols="50" name="territory"><c:out value="${dto.territory }" /></textarea>	
						
				<h1>3.논란발생의 이유</h1>
					<textarea rows="10" cols="50" name="dispute"><c:out value="${dto.dispute }" /></textarea>
							
				<h1>4.명칭의 역사</h1>
					<textarea rows="10" cols="50" name="history"><c:out value="${dto.history }" /></textarea>
						
				<h1>5.국제적 동향</h1>	
					<textarea rows="10" cols="50" name="trend"><c:out value="${dto.trend }" /></textarea>	
				</c:forEach>
			</form>
		</div>
	</div>
</body>
</html>
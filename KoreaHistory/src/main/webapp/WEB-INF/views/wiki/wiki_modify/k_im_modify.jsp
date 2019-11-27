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
			<h1>k_im_modify</h1>
			<p class="blue">*줄바꿈이 필요할때는 &#60;br&#62;를 적어주세요</p>
			<form action="k_im_modify_proc" method="post">
				<input type="submit" value="저장">
				<c:forEach items="${k_im }" var="dto">
				<h1>1.개요</h1>
					<textarea rows="10" cols="50" name="outline"><c:out value="${dto.outline }" /></textarea>
				<h1>2.시대별 독립운동</h1>
					<h3>2.1. 경술국치 이전의 국권 수호 운동</h3>
						<textarea rows="10" cols="50" name="time"><c:out value="${dto.time }" /></textarea>	
					<h3>2.2. 1910년대</h3>
						<textarea rows="10" cols="50" name="time10"><c:out value="${dto.time10 }" /></textarea>
					<h3>2.3. 1920년대</h3>
						<textarea rows="10" cols="50" name="time20"><c:out value="${dto.time20 }" /></textarea>
					<h3>2.4. 1930년대 ~ 광복 직전</h3>
						<textarea rows="10" cols="50" name="time30"><c:out value="${dto.time30 }" /></textarea>	
				<h1>3.분야별 독립운동</h1>
					<h3>3.1. 무장 투쟁 운동</h3>
						<textarea rows="10" cols="50" name="struggle"><c:out value="${dto.struggle }" /></textarea>	
					<h3>3.2. 애국 계몽 운동</h3>
						<textarea rows="10" cols="50" name="enlightenment"><c:out value="${dto.enlightenment }" /></textarea>
					<h3>3.3. 경제적 구국 운동</h3>
						<textarea rows="10" cols="50" name="economy"><c:out value="${dto.economy }" /></textarea>
					<h3>3.4. 민족 문화 수호 운동</h3>
						<textarea rows="10" cols="50" name="culture"><c:out value="${dto.culture }" /></textarea>
				</c:forEach>
			</form>
		</div>
	</div>
</body>
</html>			
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../resources/Lee/LeeCss/ranking.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/question/header_ranking.jsp"%>
	<%-- 	<h1>Ranking</h1>
	<form action="../Html">
		<input type="hidden" name="id" value="${id }" />
		<!-- <input type="hidden" name="login" value="true" /> -->
		<input type="submit" value="메인화면">
	</form> --%>
	<br>
	<br>
	<br>
	<div class="body">
		<c:forEach items="${rank }" var="rank" varStatus="status">
			<c:if test="${status.count eq 1 }">
				<div class="one">
					<strong>${rank.id }: ${rank.score }</strong>
				</div>
			</c:if>
			<c:if test="${status.count eq 2 }">
				<div class="two">
					<strong>${rank.id }: ${rank.score }</strong>
				</div>
			</c:if>
			<c:if test="${status.count eq 3 }">
				<div class="three">
					<strong>${rank.id }: ${rank.score }</strong>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<table border="1">
		<tr>
			<td>등수</td>
			<td>아이디</td>
			<td>점수</td>
		</tr>
		<c:forEach items="${rank }" var="rank" varStatus="status">
			<c:if test="${status.count > 3 }">
			<tr>
				<td>${status.count }</td>
				<td>${rank.id }</td>
				<td>${rank.score }</td>
			</tr>
			</c:if>
		</c:forEach>
	</table>

</body>
</html>
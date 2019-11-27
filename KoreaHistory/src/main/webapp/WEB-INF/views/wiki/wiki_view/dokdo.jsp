<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/Lee/LeeCss/wiki.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/wiki/header_wiki.jsp"%>
	<div class="before_body">
		<div class="body">
			<h1>독도</h1>
			<form action="../wiki_modify/dokdo_modify" method="post">
				<c:choose>
					<c:when test="${admin eq 1 }">
						<p class="blue">관리자 아이디 입니다 자료를 초기화 할수 있습니다.</p>
						<input type="button" value="초기화" class ="qna_seach_sub" onclick="location.href='../wiki_backup/dokdo_backup'" />
						<p class="blue">수정권한이 있습니다.</p>
						<input class ="qna_seach_sub" type="submit" value="수정">
					</c:when>

					<c:when test="${qualification eq 'true' }">
						<p class="blue">수정권한이 있습니다.</p>
						<input class ="qna_seach_sub" class="button" type="submit" value="수정">
					</c:when>

					<c:otherwise>
						<p class="red">수정권한이 없습니다.</p>
					</c:otherwise>
				</c:choose>
			</form>

			<c:forEach items="${dokdo }" var="dto">
				<h1>1.개요</h1>
				<div>${dto.outline }</div>
				<hr>
				<h1>2.역사</h1>
				<div>${dto.history }</div>
				<hr>
				<h1>3.일본의 영유권 주장</h1>
				<div>${dto.japan }</div>
				<hr>
				<h1>4.한국의 대응</h1>
				<div>${dto.korea }</div>
				<hr>
				<h1>5.독도의 중요성</h1>
				<div>${dto.importance }</div>
				<hr>
				<h1>6.세계적 독도의 인식</h1>
				<div>${dto.recognition }</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
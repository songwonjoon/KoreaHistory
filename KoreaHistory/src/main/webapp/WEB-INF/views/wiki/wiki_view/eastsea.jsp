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
			<h1>동해</h1>
			<form action="../wiki_modify/eastsea_modify" method="post">
				<c:choose>
					<c:when test="${admin eq 1 }">
						<p class="blue">관리자 아이디 입니다 자료를 초기화 할수 있습니다.</p>
						<input class ="qna_seach_sub" type="button" value="초기화"
							onclick="location.href='../wiki_backup/eastsea_backup'" />
						<p class="blue">수정권한이 있습니다.</p>
						<input class ="qna_seach_sub" type="submit" value="수정">
					</c:when>

					<c:when test="${qualification eq 'true' }">
						<p class="blue">수정권한이 있습니다.</p>
						<input class ="qna_seach_sub" type="submit" value="수정">
					</c:when>
					<c:otherwise>
						<p class="red">수정권한이 없습니다.</p>
					</c:otherwise>
				</c:choose>
				<c:forEach items="${eastSea }" var="dto">
					<h1>1.개요</h1>
				${dto.outline }
				<hr>
					<h1>2.영토 주권과 호칭의 관계성</h1>
				${dto.territory }
				<hr>
					<h1>3.논란발생의 이유</h1>
				${dto.dispute }
				<hr>
					<h1>4.명칭의 역사</h1>
				${dto.history }
				<hr>
					<h1>5.국제적 동향</h1>
				${dto.trend }
	</c:forEach>
			</form>
		</div>
	</div>
</body>
</html>


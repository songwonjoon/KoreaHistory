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
			<h1>독립운동</h1>
			<form action="../wiki_modify/k_im_modify" method="post">
				<c:choose>
					<c:when test="${admin eq 1 }">
						<p class="blue">관리자 아이디 입니다 자료를 초기화 할수 있습니다.</p>
						<input class ="qna_seach_sub" type="button" value="초기화" onclick="location.href='../wiki_backup/k_im_backup'" />
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
				<c:forEach items="${k_im }" var="dto">
					<h1>1.개요</h1>	
				${dto.outline }
			<hr>
					<h1>2.시대별 독립운동</h1>
					<hr>
					<h3>2.1. 경술국치 이전의 국권 수호 운동</h3>
					${dto.time }
					<hr>
					<h3>2.2. 1910년대</h3>
					${dto.time10 }
					<hr>
					<h3>2.3. 1920년대</h3>
					${dto.time20 }
					<hr>
					<h3>2.4. 1930년대 ~ 광복 직전</h3>
					${dto.time30 }
					<hr>
					<h1>3.분야별 독립운동</h1>
					<hr>
					<h3>3.1. 무장 투쟁 운동</h3>
					${dto.struggle }
					<hr>
					<h3>3.2. 애국 계몽 운동</h3>
					${dto.enlightenment }
					<hr>
					<h3>3.3. 경제적 구국 운동</h3>
					${dto.economy }
					<hr>
					<h3>3.4. 민족 문화 수호 운동</h3>
					${dto.culture }
					<hr>
				</c:forEach>
			</form>
		</div>
	</div>
</body>
</html>
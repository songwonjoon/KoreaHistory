<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Popup 따라해보기</title>
<script type="text/javascript">
	function popup() {
		var url = "/KoreaHistory/login/login";
		var name = "name(popup_login)";
		var option = "width = 517, height = 597, top = 100, left = 600";
		window.open(url,name,option);
	}
	name = "name(popup_start)"; //로그인창에서 회원가입누르면, 회원가입화면이 여기에서 보이게  해놓음.
</script>
</head>
<body>
	<c:choose>
		<c:when test="${login}">
			<a href="/KoreaHistory/modify/modify" target="_self" title="개인정보수정으로 이동" >내정보</a> |
			<a href="/KoreaHistory/login/LoginPopupStart">로그아웃</a> 
		</c:when>
		
		<c:otherwise>
			<a href="javascript:popup()" target="_top" >로그인</a> |
			<a href="/KoreaHistory/join/join" target="_self" >회원가입</a> 
		</c:otherwise>
	</c:choose>
		&nbsp;&nbsp;&nbsp;<label id="id"></label>
		<c:if test="${login}">
			환영합니다. ${id }님!
		</c:if>
		
		&nbsp;&nbsp;&nbsp;<a href="/KoreaHistory">홈으로</a>
</body>
</html>
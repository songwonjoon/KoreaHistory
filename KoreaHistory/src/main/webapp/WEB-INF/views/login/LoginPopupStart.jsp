<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Popup �����غ���</title>
<script type="text/javascript">
	function popup() {
		var url = "/KoreaHistory/login/login";
		var name = "name(popup_login)";
		var option = "width = 517, height = 597, top = 100, left = 600";
		window.open(url,name,option);
	}
	name = "name(popup_start)"; //�α���â���� ȸ�����Դ�����, ȸ������ȭ���� ���⿡�� ���̰�  �س���.
</script>
</head>
<body>
	<c:choose>
		<c:when test="${login}">
			<a href="/KoreaHistory/modify/modify" target="_self" title="���������������� �̵�" >������</a> |
			<a href="/KoreaHistory/login/LoginPopupStart">�α׾ƿ�</a> 
		</c:when>
		
		<c:otherwise>
			<a href="javascript:popup()" target="_top" >�α���</a> |
			<a href="/KoreaHistory/join/join" target="_self" >ȸ������</a> 
		</c:otherwise>
	</c:choose>
		&nbsp;&nbsp;&nbsp;<label id="id"></label>
		<c:if test="${login}">
			ȯ���մϴ�. ${id }��!
		</c:if>
		
		&nbsp;&nbsp;&nbsp;<a href="/KoreaHistory">Ȩ����</a>
</body>
</html>
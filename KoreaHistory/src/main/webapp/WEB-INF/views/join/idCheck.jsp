<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

		/* var idCheck = '<c:out value="${idCheck}"/>';
		var id = '<c:out value="${id}"/>';
		
		if(idCheck=="해당 아이디 &#034;"+id+"&#034;(은)는 &#034;사용할 수 없는 아이디&#034;입니다."){ 
			//opener.document.getElementById("lastIdCheck").value = "사용x";
		} else {
			//opener.document.getElementById("lastIdCheck").value = "사용o";
		}   */ 
	
	
	
	function complete(){
					
		var idCheck = '<c:out value="${idCheck}"/>';
		var id = '<c:out value="${id}"/>';
		//alert(idCheck);
		//해당 아이디 &#034;id&#034;(은)는 사용할 수 없는 아이디 입니다.   &#034; 는큰따옴표(")다.
		//해당 아이디는 사용 가능한 아이디 입니다.
		if(idCheck=="해당 아이디 &#034;"+id+"&#034;(은)는 &#034;사용할 수 없는 아이디&#034;입니다."){ 
			opener.document.getElementById("id").value = "";
		//	opener.document.getElementById("lastIdCheck").value = "사용x";
			close();			
		} else {
			opener.document.getElementById("id").value = "${id}";
			opener.document.getElementById("lastIdCheck").value = "사용o";
			close();
		}   
		
	}
</script>
</head>
<body>
<center>
<!-- <h1>idCheck.jsp</h1> -->
<br>
<h5>${idCheck}</h5><%-- ${id } --%>
<!-- <form action="/PROJECT_IOI/join/idCheckView">
<input type="submit" value="다시 확인하기" />&nbsp;
</form> -->
<input type="button" value="확인" onclick="javascript:complete()" />
</center>
</body>
</html>
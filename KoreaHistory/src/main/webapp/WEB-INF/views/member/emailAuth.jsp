<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check() {
		var form = document.authenform;
		var authNum = ${authNum};
		
		if (!form.authnum.value) {
			alert("인증번호를 입력하세요");
			return false;
		}
		if (form.authnum.value!=authNum) {
			alert("틀린 인증번호입니다. 인증번호를 다시 입력해주세요");
			form.authnum.value="";
			return false;
		}
		if (form.authnum.value==authNum) {
			alert("이메일이 성공적으로 인증되었습니다.");
			//opener.document.userinput.mailCheck.value="인증완료";
			//opener.document.getElementById("email").value = ${email};
			opener.document.getElementById("emCertify").value = "true";
			self.close();
			return false;
		}
		
	}

</script>
<style type="text/css">
@font-face {font-family: 'NanumBrush'; src: url(../resources/font/NanumBrush.ttf) format('truetype');}	
@font-face {font-family: 'NanumGothic'; src: url(../resources/font/NanumGothic.ttf) format('truetype');}	
@font-face {font-family: 'NanumGothicBold'; src: url(../resources/font/NanumGothicBold.ttf) format('truetype');}	
@font-face {font-family: 'NanumGothicExtraBold'; src: url(../resources/font/NanumGothicExtraBold.ttf) format('truetype');}	
@font-face {font-family: 'NanumMyeongjo'; src: url(../resources/font/NanumMyeongjo.ttf) format('truetype');}	
@font-face {font-family: 'NanumMyeongjoBold'; src: url(../resources/font/NanumMyeongjoBold.ttf) format('truetype');}	
@font-face {font-family: 'NanumMyeongjoExtraBold'; src: url(../resources/font/NanumMyeongjoExtraBold.ttf) format('truetype');}	
@font-face {font-family: 'NanumPen'; src: url(../resources/font/NanumPen.ttf) format('truetype');}	
@font-face {font-family: 'Madame'; src: url(../resources/font/Madame.ttf) format('truetype');}	

h1 {/* font-family:NanumPen; */ /* font-size: 40px; */ /* line-height: 25pt; */text-shadow: 2px 2px 1px #eee}
h5 {/* font-family:NanumPen; */ /* font-size: 20px; */ /* line-height: 1pt; */text-shadow: 2px 2px 1px #eee}
/* #btn {font-family:NanumPen; color:black; background-color:white;} */
.input_text{
   padding-top: 10px;
   padding-bottom:5px;
   border-radius: 3px;
   border: 1px solid black;
   /* opacity: 0.8; */
}
#btn{
   height: 25px;
   margin-bottom: 0px;
   border-radius: 5px;
   border: 1px solid black;
   background-color: white;
   font-weight: bold;
   opacity: 1.0;
   padding-bottom: 2px; 
}
#btn:hover {
   color: white;
   background-color: black;
} 
body {background-color:#efefef;}
h1, h5{color:black;}
</style>
</head>
<body>
<center>
<br>
<h1>이메일 인증코드 입력</h1>
<h5>인증 번호 7자리를 입력하세요</h5>
<div class="container">
	<form method="post" name="authenform" onsubmit="return check();" >
		<input type="text" class="input_text" name="authnum">
		<input type="submit" id="btn" class="btn btn-info" value="입력완료">	
	</form>
</div>

</center>

</body>
</html>
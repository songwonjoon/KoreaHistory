<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Image Home</title>
<link rel="stylesheet" href="resources/css/door.css">
<script src="resources/js/login.js"></script>
<script type="text/javascript">
	function go_to(){
		location.href="/KoreaHistory/login/LoginPopupStart";
	}
	function go_to2(){
		location.href="/KoreaHistory/Html";
	}
	function go_to3(){
		location.href="/KoreaHistory/login/login2";
	}
	
	
	const video = document.querySelector("video");
	if (window.matchMedia('(prefers-reduced-motion)').matches) {
	  video.removeAttribute("autoplay");
	  video.pause();
	}
	
</script>
</head>
<body>
<center>
<!-- <h1>KoreaHistory</h1>  -->
<!-- <input type="button" value="로그인 및 회원가입 기능 구현하러가기" onclick="go_to()" /> -->
<header>
	<video autoplay playsinline muted loop preload >
	<!-- poster="https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/oceanshot.jpg" -->
	<source src="resources/video/태극기.mp4" />
	<!-- <source src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/ocean-small.webm" /> -->
    <!-- <source src="http://thenewcode.com/assets/videos/ocean-small.mp4" /> -->
	</video>
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1400 787" preserveAspectRatio="xMidYMid slice">
    <defs>
    <mask id="mask" x="0" y="0" width="100%" height="100%" >
      <rect x="0" y="0" width="100%" height="100%"/>
    <text x="40"  y="300">Korean</text>
    <text x="40"  y="600">History</text>
    </mask>
  	</defs>
 	<rect x="0" y="0" width="100%" height="100%"/>
  </svg>
</header>

<!-- <img alt="이미지를 불러오지 못하였습니다." src="/KoreaHistory/resources/door2.jpg"> -->
<br><br>
<input type="image" src="resources/img/메인페이지버튼.png" alt="버튼이미지 불러오지 못함" onclick="go_to2()" />
<input type="image" src="resources/img/로그인버튼.png" alt="버튼이미지 불러오지 못함" onclick="go_to3()" />
</center>
</body>
</html>





function popup() {
		var url = "/KoreaHistory/login/login";
		var name = "name(popup_login)";
		var option = "width = 470, height = 427, top = 100, left = 700";
		window.open(url, name, option);
	}
	function question() {
		alert("로그인을 해야 사용할수 있는 기능입니다.");
	}
	
	function checkValue(){
		inputForm=eval("document.loginInfo");
		if (!inputForm.nid.value) {
			alert("아이디를 입력하세요.");
			inputForm.nid.focus();
			return false;
		}
		if (!inputForm.npw.value) {
			alert("비밀번호를 입력하세요.");
			inputForm.npw.focus();
			return false;
		}
		
		return true;
	}
	
	
	function goJoinForm(){
		 location.href="../join/join" 
		var url = "../join/join";
		var name = "name(popup_start)"; // 홈화면(LoginPopupStart)에 name(popup_start) 라고 변수선언해둠.
		var option = "width=2000 ,height=2000, location = no";
		window.open(url,name,option); 
		
		//창닫기 기능
		close();
	}

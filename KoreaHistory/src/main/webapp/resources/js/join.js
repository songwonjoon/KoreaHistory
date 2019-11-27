	function pwCheck(){
//		var id = document.getElementById("id").value;
		var id = document.join.id.value;
		var pw = document.getElementById("pw").value;
//		var pw = document.pw.value;
		var pw2 = document.getElementById("pw2").value;
//		var pw2 = document.pw2.value;
		var na = document.getElementById("name").value;
		var em = document.getElementById("email").value;
		var lastIdCheck = document.getElementById("lastIdCheck").value;
		var emCertify = document.getElementById("emCertify").value;
		
		if (id == "") {
			alert("아이디를 입력하세요.");
			return false;
		}else if (pw == "" && pw2 == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		else if (pw != pw2) {
			document.getElementById("pwCheckText").innerHTML = "비밀번호가 일치하지 않습니다.";
		//	alert("비밀번호가 일치하지 않습니다.");  //윗줄을 사용하면 빨간글씨 등장, 이줄을 사용하면 경고메시지 등장
			document.join.pw.value = "";
			document.join.pw2.value = "";
			return false; // form태그의 onsubmit속성의 반환값이 false일 경우 현재페이지에 그대로 머무른다.
		} else if (pw.length < 6 || pw.length > 16) {
			document.getElementById("pwCheckText").innerHTML = "비밀번호는 6자리 이상, 16자리 이하만 가능합니다.";
			return false;
		} else if (pw == pw2) {
			document.getElementById("pwCheckText").innerHTML = "";
			if (na == "") {
				alert("이름을 입력하세요.");
				return false;			
			} 
			else if (em == "") {
//				document.getElementById("pwCheckText").innerHTML = "이메일을 인증하세요.";
				alert("이메일을 입력하세요.");
				return false;
			} 
			else if (emCertify == "") {
				alert("이메일을 인증하세요.");
				return false;
			} else if(id != ""){  //아이디 중복확인을 안할 경우.

				if(lastIdCheck==""){
				alert("아이디 중복 여부를 확인하세요."); //(lastIdCheck에 아무것도 들어가있지 않음.)	
				return false;
				} else if (lastIdCheck=="사용o") { //alert("해당 아이디는 사용가능하므로 넘어가야함.");	
				alert("회원가입이 성공적으로 완료되었습니다.")
				var join = document.join;
				join.target = "_self";
				join.action = "../joinProc";
				join.submit();
				}
				//alert("lastIdCheck를 다 지나옴.");
				//return false;
			}
			/* alert("아이디 중복확인까지 통과");
			return false; */
		}
		
		
	}

	function email_Popup(){
		//window.name = "parentForm";
		var emailValue = document.join.email.value;
		
		if (emailValue == "") {
			alert("이메일을 입력하세요.");
		}
		else if (!emailValue.includes("@") ) {
			alert("이메일 입력칸에 '@'가 입력되지 않았습니다.");
		}
		else if (!emailValue.includes(".") ) {
			alert("올바른 형식이 아닙니다. 이메일을 다시 확인해주세요.");	
		}
		else if (emailValue.length <= 13 ) {
			alert("올바른 형식이 아닙니다. 이메일을 다시 확인해주세요.");	
		}else {
			
			var url="/KoreaHistory/member/emailAuth";
			var name="popupOpener";
			var option="width = 480 , height = 237 , top = 300 , left = 1200";
			var emailPop = window.open("",name,option);
			
			var join = document.join;
			join.target = name;
			join.action = url;
			
			join.submit();
			
		}
		
	}
	function idCheckView(){
		// 빈 창으로 팝업을 열어 놓습니다. 
		var url="/PROJECT_IOI/join/idCheckView";
		var name="name(popup_idCheckView)";
		var option="width = 420 , height = 185 , top = 300 , left = 300";
		var windowObj=window.open(url,name,option);

	}
	function idCheck(){
		
		var value=document.join.id.value
		var url="/KoreaHistory/join/idCheck?id="+value;
		var name="name(popup_idCheck)";
		var option="width = 420 , height = 185 , top = 300 , left = 300";
		var windowObj=window.open(url,name,option);
		
	}
	function popup() {
		var url = "/KoreaHistory/login/login";
		var name = "name(popup_login)";
		var option = "width = 517, height = 480, top = 100, left = 600";
		window.open(url, name, option);
	}
	function goHome() {
		location.href = "../gohome"
	}	
	
	
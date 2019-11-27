function pwCheck2(){
//	var id = document.getElementById("id").value;
	var pw = document.getElementById("pw").value;
//	var pw = document.pw.value;
	var pw2 = document.getElementById("pw2").value;
//	var pw2 = document.pw2.value;
//	var na = document.getElementById("name").value;
	var em = document.getElementById("email").value;
//	var lastIdCheck = document.getElementById("lastIdCheck").value;
	var emCertify = document.getElementById("emCertify").value;
		
	if (pw == "" && pw2 == "") {
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

		alert("회원정보수정이 성공적으로 완료되었습니다.")
		var join = document.join;
		join.target = "_self";
		join.action = "../modifyProc";
		join.submit();
		
	}
	
	
}
	
	
	function email_Popup2() {
		//window.name = "parentForm";
		var emailValue = document.join.email.value;

		if (emailValue == "") {
			alert("이메일을 입력하세요.");
		} else if (!emailValue.includes("@")) {
			alert("이메일 입력칸에 '@'가 입력되지 않았습니다.");
		} else if (!emailValue.includes(".")) {
			alert("올바른 형식이 아닙니다. 이메일을 다시 확인해주세요.");
		} else if (emailValue.length <= 13) {
			alert("올바른 형식이 아닙니다. 이메일을 다시 확인해주세요.");
		} else {

			var url = "/KoreaHistory/member/emailAuth";
			var name = "popupOpener";
			var option = "width = 480 , height = 237 , top = 300 , left = 1200";
			var emailPop = window.open("", name, option);

			var join = document.join;
			join.target = name;
			join.action = url;

			join.submit();

		}

	}

	function goHome2() {
		location.href = "../gohome"  /* Html */
	}
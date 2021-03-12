<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/mcss.css">
<link rel="stylesheet" type="text/css" href="css/logincss.css">
<script type="text/javascript">
	//일반적으로 사용하는 유효성 검사 라이브러리
	//문제가 있으면 true, 없으면 false 반환.

	//<input> 태그에 글자가 있는지 체크하는 기능

	function isEmpty(input) {
		return !input.value;
	}

	//글자 수 체크 기능

	function lessThan(input, length) {
		return input.value.length < length;
	}

	//한글이나 특수문자가 들어있는지 체크하는 기능
	function containKR(input) {
		let ok = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM@!.0123456789";
		for (let i = 0; i < input.value.length; i++) {
			if (ok.indexOf(input.value[i]) == -1) {
				return true;
			}
		}
	}

	//input 두 개의 내용이 서로 다르면 오류를 띄워주는 기능

	function same(a, b) {
		return a.value != b.value;
	}

	//input과 문자열 세트를 파라미터로 넣으면 그 글자가 포함되지 않았을 때 오류를 띄워주는 기능

	function notContains(input, set) {
		for (let i = 0; i < set.length; i++) {
			if (input.value.indexOf(set[i]) != -1) {
				return false;
			}
		}
		return true;
	}

	//input에 숫자를 넣었는지 체크

	function isNotNum(input) {
		return isNaN(input.value);
	}
</script>
<script type="text/javascript">
	function vcheck() {
		let idinput = document.getElementById('id');
		let pwinput = document.getElementById('pw');

		if (isEmpty(idinput)) {
			alert('ID를 입력해주세요');
			idinput.focus;
			return false;
		}
		if (isEmpty(pwinput)) {
			alert('PW를 입력해주세요');
			pwinput.focus;
			return false;
		}
		return true;
	}
</script>
<body>
	<form action="LIConfirmC" name="loginf" id="loginf" method="post"
		class="loginForm">
		<h2>Login</h2>
		<div class="idForm">
			<input type="text" name="id" class="id" id="id" placeholder="ID">
		</div>
		<div class="passForm">
			<input type="password" name="pw" class="pw" id="pw" placeholder="PW">
		</div>
		<button class="btn" onclick="return vcheck();">LOG IN</button>
		<div class="bottomText">
			Don't you have ID? <a href="SIC">sign up</a>
		</div>
	</form>
</body>

</body>
</html>
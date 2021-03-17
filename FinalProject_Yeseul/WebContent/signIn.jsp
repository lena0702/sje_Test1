<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/signIncss.css">
</head>
<script type="text/javascript">
	function isEmpty(input) {
		return !input.value; // 값이 없다는 뜻
	}
	// <input> 글자수 넣으면
	// 그 글자수보다 적으면 true, 아니면 false
	function lessThan(input, length) {
		return input.value.length < length;
	}
	// <input>을 넣으면 : a12ㅋb23
	// 한글/특수문자 들어있으면 true, 아니면 false
	function containKR(input) {
		let ok = "qwepoirutyalskdjfhgzmxncbvQPWOEIRUTYALSKDJFHGZMXNCBV123456789@_.";
		for (let i = 0; i < input.value.length; i++) {
			if (ok.indexOf(input.value[i]) == -1) {
				return true;
			}
		}
	}
	// Test
	// <input> x 2 넣으면 (비밀번호)
	// 내용이 다르면 true, 같으면 false
	function space(input) {
		let ok1 = " ";
		for (let i = 0; i < input.value.length; i++) {
			if (ok1.indexOf(input.value[i]) >= 0) {
				return true;
			}
		}
	}
	function same(Ainput, Binput) {
		return Ainput.value != Binput.value;
	}
	// <input>, 문자열 세트 넣으면
	// 그 문자열 세트 글자가 포함 안돼있으면 true
	// 들어있으면 false
	function notContains(input, set) {
		// input : qwerASD
		// set : 1234567890
		for (let i = 0; i < set.length; i++) {
			if (input.value.indexOf(set[i]) != -1) {
				return false;
			}
		}
		return true;
	}
	// <input>을 넣어서
	// 숫자가 아니면 true, 숫자면 false
	function isNotNumber(input) {
		return isNaN(input.value);
	}

	function check() {
		let idInput = document.f.id;
		let pwInput = document.f.pw;
		let pw2Input = document.f.pw2;
		let name = document.f.name;
		let birth = document.f.birth;
		if (isEmpty(idInput)) {
			alert('ID에러 입력해주세요');
			idInput.value = "";
			idInput.focus();
			return false;
		}
		if (containKR(idInput)) {
			alert('ID에러 한글 입력불가');
			idInput.value = "";
			idInput.focus();
			return false;
		}
		if (lessThan(idInput, 3)) {
			alert('ID에러 3글자 이상');
			idInput.value = "";
			idInput.focus();
			return false;
		}

		if (isEmpty(pwInput)) {
			alert('PW에러 입력해주세요');
			pwInput.value = "";
			pwInput.focus();
			return false;
		}
		if (lessThan(pwInput, 5)) {
			alert('PW에러 5글자 이상');
			pwInput.value = "";
			pwInput.focus();
			return false;
		}
		if (notContains(pwInput, "QWERTYUIOPASDFGHJKLZXCVBNM")
				|| notContains(pwInput, "1234567890")) {
			alert('PW에러 대문자 및 숫자 미포함');
			pwInput.value = "";
			pwInput.focus();
			return false;
		}
		if (space(pwInput)) {
			alert('PW에러 공백 입력불가');
			pwInput.value = "";
			pwInput.focus();
			return false;
		}
		/*	if (space(pwInput)) {
				alert('공백 쓰지마');
				pwInput.value = "";
				pwInput.focus();
				return false;
			}*/
		if (same(pwInput, pw2Input)) {
			alert('비밀번호 불일치');
			pwInput.value = "";
			pw2Input.value = "";
			pwInput.focus();
			return false;
		}
		if (isEmpty(name)) {
			alert('이름을 입력해주세요')
		}

		if (isEmpty(birth)) {
			alert('생일을 입력해주세요')
			return false;
		}
	}
</script>

 <body><!--  width="100%" height="100%" -->
	<form action="SIConfirmC" name="f" onsubmit="return check();" method="post" class="signInForm">
	<h2>SignIn Page</h2>
	<div class="Form" id="gaib">
        <input class="inputtext" id="id" name="id" placeholder="ID)3글자 이상">
      </div>
      <div class="Form" id="gaib">
        <input type="password" id="pw" name="pw" class="inputtext" placeholder="PW)대문자, 숫자, 5글자 이상">
      </div>
      <div class="Form" id="gaib">
        <input type="password" id="pw2" name="pw2" class="inputtext" placeholder="PW재확인">
      </div>
      <div class="Form" id="gaib">
        <input id="name" name="name" class="inputtext" placeholder="이름">
      </div>
      
       <div class="Form" id="gaib"><input type="text" class="inputNtext" placeholder="성별" disabled="disabled">
       <select name="gender"><option value="남자">남자</option>
						<option value="여자">여자</option></select>
      </div>
      
       <div class="Form" id="gaib">
        <input id="birth" name="birth" class="inputtext" placeholder="생년월일 ex)19990909">
      </div>
         <div class="Form" id="gaib"><input type="text" class="inputNNtext" placeholder="좋아하는 장르" disabled="disabled">
         <select id="fav" name="fav">
			 		<option value="1">드라마</option>
			 		<option value="2">판타지</option>
			 		<option value="3">서부</option>
			 		<option value="4">공포</option>
			 		<option value="5">로맨스</option>
			 		<option value="6">모험</option>
			 		<option value="7">스릴러</option>
			 		<option value="8">느와르</option>
			 		<option value="9">컬트</option>
			 		<option value="10">다큐멘터리</option>
			 		<option value="11">코미디</option>
			 		<option value="12">가족</option>
			 		<option value="13">미스터리</option>
			 		<option value="14">전쟁</option>
			 		<option value="15">애니메이션</option>
			 		<option value="16">범죄</option>
			 		<option value="17">뮤지컬</option>
			 		<option value="18">SF</option>
			 		<option value="19">액션</option>
			 		<option value="20">무협</option>
			 		<option value="21">에로</option>
			 		<option value="22">서스펜스</option>
			 		<option value="23">서사</option>
			 		<option value="24">블랙코미디</option>
			 		<option value="25">실험</option>
			 	</select>
      </div>
      <button class="btn">
        SIGN IN
      </button>
	</form>

</body>

</html>
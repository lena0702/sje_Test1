<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/signInConfirmcss.css">
</head>
<%-- <body>
		<table style="width: 300px; height: 500px; align-content: center;"
			border="1">
			<tr>
				<td colspan="2" align="center">회원 가입 확인 페이지</td>
			</tr>
			<tr>
				<td align="center">아이디</td>
				<td>${param.id }</td>
			</tr>
			<tr>
				<td align="center">이름</td>
				<td>${param.name }</td>
			</tr>
			<tr>
				<td align="center">성별</td>
				<td>${param.gender }</td>
			</tr>
			<tr>
				<td align="center">생년월일</td>
				<td>${param.birth }</td>
			</tr>
			<tr>
				<td align="center">좋아하는 장르</td>
				<td><c:choose>
						<c:when test="${param.fav == 1}">드라마</c:when>
						<c:when test="${param.fav == 2}">판타지</c:when>
						<c:when test="${param.fav == 3}">서부</c:when>
						<c:when test="${param.fav == 4}">공포</c:when>
						<c:when test="${param.fav == 5}">로맨스</c:when>
						<c:when test="${param.fav == 6}">모험</c:when>
						<c:when test="${param.fav == 7}">스릴러</c:when>
						<c:when test="${param.fav == 8}">느와르</c:when>
						<c:when test="${param.fav == 9}">컬트</c:when>
						<c:when test="${param.fav == 10}">다큐멘터리</c:when>
						<c:when test="${param.fav == 11}">코미디</c:when>
						<c:when test="${param.fav == 12}">가족</c:when>
						<c:when test="${param.fav == 13}">미스터리</c:when>
						<c:when test="${param.fav == 14}">전쟁</c:when>
						<c:when test="${param.fav == 15}">애니메이션</c:when>
						<c:when test="${param.fav == 16}">범죄</c:when>
						<c:when test="${param.fav == 17}">뮤지컬</c:when>
						<c:when test="${param.fav == 18}">SF</c:when>
						<c:when test="${param.fav == 19}">액션</c:when>
						<c:when test="${param.fav == 20}">무협</c:when>
						<c:when test="${param.fav == 21}">에로</c:when>
						<c:when test="${param.fav == 22}">서스펜스</c:when>
						<c:when test="${param.fav == 23}">서사</c:when>
						<c:when test="${param.fav == 24}">블랙코미디</c:when>
						<c:when test="${param.fav == 25}">실험</c:when>
					</c:choose></td>
			</tr>
			<tr>
				<td><a href="HC" style="color: black;">홈으로</a></td>
				<td><a href="SIC" style="color: black;">회원가입</a></td>
			</tr>
		</table>
</body>
 --%>
<body>
	<form action="HC" class="signInConForm">
	<h2>SignIn Confirm</h2>
	<div class="Form" id="gaib">
        <input class="inputNtext" id="id" name="id" placeholder="ID">${param.id }
      </div>
      <div class="Form" id="gaib">
        <input id="name" name="name" class="inputtext" placeholder="이름">${param.name }
      </div>
      
       <div class="Form" id="gaib"><input type="text" class="inputtext" placeholder="성별" disabled="disabled">
		${param.gender }
      </div>
      
       <div class="Form" id="gaib">
        <input id="birth" name="birth" class="inputtext" placeholder="생년월일">${param.birth }
      </div>
         <div class="Form" id="gaib"><input type="text" class="inputNNtext" placeholder="좋아하는 장르" disabled="disabled">
      <c:choose>
						<c:when test="${param.fav == 1}">드라마</c:when>
						<c:when test="${param.fav == 2}">판타지</c:when>
						<c:when test="${param.fav == 3}">서부</c:when>
						<c:when test="${param.fav == 4}">공포</c:when>
						<c:when test="${param.fav == 5}">로맨스</c:when>
						<c:when test="${param.fav == 6}">모험</c:when>
						<c:when test="${param.fav == 7}">스릴러</c:when>
						<c:when test="${param.fav == 8}">느와르</c:when>
						<c:when test="${param.fav == 9}">컬트</c:when>
						<c:when test="${param.fav == 10}">다큐멘터리</c:when>
						<c:when test="${param.fav == 11}">코미디</c:when>
						<c:when test="${param.fav == 12}">가족</c:when>
						<c:when test="${param.fav == 13}">미스터리</c:when>
						<c:when test="${param.fav == 14}">전쟁</c:when>
						<c:when test="${param.fav == 15}">애니메이션</c:when>
						<c:when test="${param.fav == 16}">범죄</c:when>
						<c:when test="${param.fav == 17}">뮤지컬</c:when>
						<c:when test="${param.fav == 18}">SF</c:when>
						<c:when test="${param.fav == 19}">액션</c:when>
						<c:when test="${param.fav == 20}">무협</c:when>
						<c:when test="${param.fav == 21}">에로</c:when>
						<c:when test="${param.fav == 22}">서스펜스</c:when>
						<c:when test="${param.fav == 23}">서사</c:when>
						<c:when test="${param.fav == 24}">블랙코미디</c:when>
						<c:when test="${param.fav == 25}">실험</c:when>
					</c:choose>
      
      </div>
      <button class="btn">
        확인
      </button>
	</form>

</body>
</html>
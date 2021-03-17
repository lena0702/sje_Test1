<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰 작성</title>
</head>
<body>
	<form action="RRC">
		<table>
			<tr>
				<td colspan="3" align="left">리뷰</td>
			<tr>
			<tr>
				<td>영화 제목</td>
				<td colspan="2">${param.title }</td>
				<td><input type="hidden" value="${param.title }" name="title"></td>
			</tr>
			<tr>
				<td><input value="${sessionScope.accountInfo.u_name}"
					name="userid" type="hidden"></td>
			</tr>
			<tr>
				<td>리뷰 내용</td>
				<td colspan="2"><textarea style="width: 800px; height: 500px"
						name="review"></textarea></td>
			</tr>
			<tr>
				<td>별점</td>
				<td colspan="2"><select name="star">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
				</select></td>
			</tr>
			<tr align="right">
				<td colspan="3"><button>등록</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
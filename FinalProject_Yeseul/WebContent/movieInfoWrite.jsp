<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<form action="RRC" method="post">
		<table>
			<tr>
				<td colspan="3" align="left">리뷰
				<input value="${sessionScope.accountInfo.u_id}"
					name="userid" type="hidden">
					<input value="${sessionScope.accountInfo.u_name}"
					name="username" type="hidden">
				<input type="hidden" name="title" value="${param.title }">
				<input type="hidden" name="image" value="${param.image }">
				<input type="hidden" name="subtitle" value="${param.subtitle }">
				<input type="hidden" name="userRating" value="${param.userRating }">
				<input type="hidden" name="pubDate" value="${param.pubDate }">
				<input type="hidden" name="director" value="${param.director }">
				<input type="hidden" name="actor" value="${param.actor }">
					</td>
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
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/movieInfoWritecss.css">
<body>
<br>
	<form action="RRC" method="post">
		<table id="miwTbl">
			<tr>
				<td colspan="3" align="left"><h3>리뷰 작성
				<input value="${sessionScope.accountInfo.u_id}"
					name="userid" type="hidden">
				<input type="hidden" name="username" value="${sessionScope.accountInfo.u_name }">
				<input type="hidden" name="title" value="${param.title }">
				<input type="hidden" name="image" value="${param.image }">
				<input type="hidden" name="subtitle" value="${param.subtitle }">
				<input type="hidden" name="userRating" value="${param.userRating }">
				<input type="hidden" name="pubDate" value="${param.pubDate }">
				<input type="hidden" name="director" value="${param.director }">
				<input type="hidden" name="actor" value="${param.actor }">
					</h3></td>
			</tr>
			<tr>
				<td class="miwCtg">리뷰 내용</td>
				<td colspan="2"><textarea 
						name="review"></textarea></td>
			</tr>
			<tr>
				<td class="miwCtg">별점</td>
				<td colspan="2"><select name="star">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
				</select></td>
			</tr>
			<tr align="right">
				<td colspan="3"><button id="writeBtn">등록</button></td>
			</tr>
		</table>
	</form>
</body>
</html>

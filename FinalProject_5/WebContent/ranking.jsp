<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1"
		style="width: 70%; height: 1000px; align-content: center;">
		<tr>
			<td colspan="3" style="height: 10%;" align="center">영화랭킹</td>
		</tr>
		<tr>
			<td style="height: 10%" width="10%" align="center">조회순</td>
			<td style="height: 10%; padding: 0px 10px 0px" colspan="2">평점순</td>
		</tr>
		<tr>
			<td style="width: 10%" height="10%" align="center">순위</td>
			<td style="width: 80%" height="10%" align="center">영화명</td>
			<td style="width: 10%" height="10%" align="center">변동폭</td>
		</tr>
		<%--  <c:forEach items="movie" var="m"> --%>
		<tr>
			<td align="center">포이치문으로</td>
			<td align="left" style="padding: 0px 10px 0px">영화 10개씩</td>
			<td align="center">보여줄 예정</td>
		</tr>
		<%-- </c:forEach> --%>
	</table>
</body>
</html>
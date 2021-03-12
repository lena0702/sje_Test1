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
<link rel="stylesheet" type="text/css" href="css/movieInfoCss.css">
<body>
	<table id="miTbl">
		<tr>
			<td colspan="2"><h2>${param.title}</h2> <input type="hidden"
				name="title" value="${param.title }"></td>
			<td rowspan="7" align="center"  id="miTbl_img"><div style="height: 100%;"><img alt="No Photo"
				src="${param.image }" ></div></td>
		</tr>
		<tr>
			<td colspan="2">${param.subtitle }</td>
		</tr>
		<tr>
			<td class="miCtg">유저 평점</td>
			<td>${param.userRating}</td>
		</tr>
		<tr>
			<td class="miCtg">내 평점</td>
			<c:choose>
				<c:when test="${sessionScope.accountInfo != null }">
					<td>${myStar}</td>
				</c:when>
				<c:otherwise>
					<td>로그인해주세요.</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td class="miCtg">개봉일</td>
			<td>${param.pubDate}</td>
		</tr>
		<tr>
			<td class="miCtg">감독</td>
			<td>${param.director}</td>
		</tr>
		<tr>
			<td class="miCtg">배우</td>
			<td>${param.actor}</td>
		</tr>
	</table>
	<c:choose>
		<c:when test="${sessionScope.accountInfo != null }">
			<jsp:include page="${movieReviewWrite }">
				<jsp:param value="${param.title }" name="title" />
				<jsp:param value="${param.image }" name="image" />
				<jsp:param value="${param.subtitle }" name="subtitle" />
				<jsp:param value="${param.userRating }" name="userRating" />
				<jsp:param value="${param.pubDate }" name="pubDate" />
				<jsp:param value="${param.director }" name="director" />
				<jsp:param value="${param.actor }" name="actor" />
			</jsp:include>
		</c:when>
		<c:otherwise>
			<table id="miTbl2">
				<tr>
					<td align="center">리뷰 작성을 위해서는 로그인해주세요.</td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
	<hr>

	<jsp:include page="${movieInfoReviews }">
		<jsp:param name="title" value="${param.title }" />
		<jsp:param name="image" value="${param.image }" />
		<jsp:param name="subtitle" value="${param.subtitle }" />
		<jsp:param name="userRating" value="${param.userRating }" />
		<jsp:param name="pubDate" value="${param.pubDate }" />
		<jsp:param name="director" value="${param.director }" />
		<jsp:param name="actor" value="${param.actor }" />
	</jsp:include>

</body>
</html>
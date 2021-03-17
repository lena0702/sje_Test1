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
	<table border="1"
		style="align-self: center; align-content: center; width: 50%;">
		<tr>
			<td><c:if test="${curPageNo != 1}">
					<form action="MIRC" method="post">
						<input type="hidden" name="title" value="${param.title }">
						<input type="hidden" name="image" value="${param.image }">
						<input type="hidden" name="subtitle" value="${param.subtitle }">
						<input type="hidden" name="userRating"
							value="${param.userRating }"> <input type="hidden"
							name="pubDate" value="${param.pubDate }"> <input
							type="hidden" name="director" value="${param.director }">
						<input type="hidden" name="actor" value="${param.actor }">
						<input type="hidden" name="p" value="${curPageNo - 1 }">
						<button>&lt;</button>
					</form>

				</c:if></td>
			<td>${curPageNo }</td>

			<td><c:if test="${curPageNo != pageCount}">
					<form action="MIRC" method="post">
						<input type="hidden" name="title" value="${param.title }">
						<input type="hidden" name="image" value="${param.image }">
						<input type="hidden" name="subtitle" value="${param.subtitle }">
						<input type="hidden" name="userRating"
							value="${param.userRating }"> <input type="hidden"
							name="pubDate" value="${param.pubDate }"> <input
							type="hidden" name="director" value="${param.director }">
						<input type="hidden" name="actor" value="${param.actor }">
						<input type="hidden" name="p" value="${curPageNo + 1 }">
						<button>&gt;</button>
					</form>
				</c:if></td>
		</tr>
	</table>
	<table border="1">
		<tr>
			<td>등록일</td>
			<td>ID</td>
			<td>한줄 리뷰</td>
			<td>별점</td>
		</tr>
		<c:choose>
			<c:when test="${!empty reviews}">
				<c:forEach var="r" items="${reviews }">
					<tr>
						<td><fmt:formatDate value="${r.r_date }" dateStyle="short" />
						</td>
						<td>${r.r_userid }</td>
						<td>${r.r_review }</td>
						<td>${r.r_star }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="3">아직 리뷰가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>

</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="css/movieInfoReviewcss.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<br>
	<table id="mirTbl">
		<tr>
			<td class="mirCtg">등록일</td>
			<td class="mirCtg">별명</td>
			<td class="mirCtg">한 줄 리뷰</td>
			<td class="mirCtg">별점</td>
		</tr>
		<c:choose>
			<c:when test="${!empty reviews}">
				<c:forEach var="r" items="${reviews }">
					<tr>
						<td class="mirCnt"><fmt:formatDate value="${r.r_date }" dateStyle="short" />
						</td>
						<td class="mirCnt">${r.r_username }</td>
						<td>${r.r_review }</td>
						<td class="mirCnt">${r.r_star }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4" align="center">아직 리뷰가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<table id="lnr">
		<tr>
			<td class="leftRight"><c:if test="${curPageNo != 1}">
					<form action="MIRC" method="post">
						<input type="hidden" name="title" value="${param.title }">
						<input type="hidden" name="image" value="${param.image }">
						<input type="hidden" name="subtitle" value="${param.subtitle }">
						<input type="hidden" name="userRating"
							value="${param.userRating }"> <input type="hidden"
							name="pubDate" value="${param.pubDate }"> <input
							type="hidden" name="director" value="${param.director }">
						<input type="hidden" name="actor" value="${param.actor }">
						<input type="hidden" name="p" value="${curPageNo - 1 }">
						<button>&lt;</button>
					</form>
				</c:if></td>
			<td id="nowNum">${curPageNo }</td>
			<td class="leftRight"><c:if test="${curPageNo != pageCount && pageCount != 1}">
					<form action="MIRC" method="post">
						<input type="hidden" name="title" value="${param.title }">
						<input type="hidden" name="image" value="${param.image }">
						<input type="hidden" name="subtitle" value="${param.subtitle }">
						<input type="hidden" name="userRating"
							value="${param.userRating }"> <input type="hidden"
							name="pubDate" value="${param.pubDate }"> <input
							type="hidden" name="director" value="${param.director }">
						<input type="hidden" name="actor" value="${param.actor }">
						<input type="hidden" name="p" value="${curPageNo + 1 }">
						<button>&gt;</button>
					</form>
				</c:if></td>
		</tr>
	</table>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reviewcss.css">
</head>
<body>
	<table class="bigbigTable">
		<tr>
			<td colspan="5" class="Table_title1"><h2>영화 평점 &amp; 리뷰</h2></td>
		</tr>
		<tr>
			<td class="Table_title2"><h3>전체 리스트</h3></td>
			<td colspan="4" class="titleNum">총 ${reviewsNum}개의 평점이 있습니다.</td>
		</tr>
		<tr>
			<td class="subTitle1"><h3>제목</h3></td>
			<td class="subTitle5"><h3>평점</h3></td>
			<td class="subTitle2"><h3>감상평</h3></td>
			<td class="subTitle3"><h3>글쓴이</h3></td>
			<td class="subTitle4"><h3>날짜</h3></td>
		</tr>
		<tr>
			<td colspan="5" valign="top" class="reviewtd"><c:forEach items="${reviews }"
					var="r">
					<table class="reviewTable">
						<tr>
							<td class="reviewtitle1">${r.r_title }</td>
							<td class="reviewtitle5">${r.r_star }</td>
							<td class="reviewtitle2">${r.r_review }</td>
							<td class="reviewtitle3">${r.r_username }</td>
							<td class="reviewtitle4"><fmt:formatDate
									value="${r.r_date }" dateStyle="short" /></td>
						</tr>
					</table>
				</c:forEach></td>
		</tr>
		<tr>
			<td colspan="5" class="PagingTable"><c:if
					test="${curPageNo != 1 }">
					<a style="color: black;" href="RPC?p=${curPageNo - 1 }">&lt;</a>
				</c:if> ${curPageNo } <c:if test="${curPageNo != pageCount }">
					<a style="color: black;" href="RPC?p=${curPageNo + 1 }">&gt;</a>
				</c:if></td>
		</tr>
	</table>
</body>
</html>
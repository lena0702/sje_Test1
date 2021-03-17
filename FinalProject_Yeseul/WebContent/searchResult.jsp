<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function formSubmit() {
		document.getElementById("frm1").submit();
	}
</script>
<body>
	
	
	
	
	<c:forEach items="${movies }" var="m">
		<form action="MIC" method="post" name="frm1" id="frm1">
			<table border="1"
				style="height: 160px; width: 80%; align-content: center; align-items: center;">
				<tr>
					<td align="center" style="width: 15%">
						<h3>
							<a href=# onclick="formSubmit(); return false;"
								style="color: black;">영화[${m.m_title}]</a>
						</h3> ${m.m_subtitle} <input type="hidden" value="${m.m_title}"
						name="title"> <input type="hidden" value="${m.m_subtitle}"
						name="subtitle">
					</td>
					<td align="center" style="width: 10%"><img src="${m.m_image}">
						<br> <input type="hidden" value="${m.m_image}" name="image"></td>
					<td style="width: 5%">개봉: ${m.m_pubdate} <input type="hidden"
						value="${m.m_pubdate}" name="pubDate">
					</td>
					<td style="width: 10%">감독: ${m.m_director} <input
						type="hidden" value="${m.m_director}" name="director">
					</td>
					<td style="width: 20%">출연: ${m.m_actor} <input type="hidden"
						value="${m.m_actor}" name="actor">
					</td>
					<td style="width: 10%">네티즌 평점: ${m.m_rating} <input
						type="hidden" value="${m.m_rating}" name="userRating">
					</td>
				</tr>
			</table>
		</form>
	</c:forEach>
	
	<table border="1"
		style="align-self: center; align-content: center; width: 50%;">
		<tr>
			<td><c:if test="${curPageNo != 1}">
					<a href="SPC?p=${curPageNo - 1}&movietitle=${movietitle}"
						style="color: salmon;">&lt;</a>
				</c:if></td>
			<td>${curPageNo }</td>

			<td><c:if test="${curPageNo != pageCount}">
					<a href="SPC?p=${curPageNo + 1}&movietitle=${movietitle}"
						style="color: salmon;">&gt;</a>
				</c:if></td>
		</tr>
	</table>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/searchResultCss.css">
<body>
	<br>


	<table id="srCtg">
		<tr>
			<td width="20%" class="tblMid">제목</td>
			<td width="10%" class="tblMid">포스터</td>
			<td width="5%" class="tblMid">개봉일</td>
			<td width="10%" class="tblMid">감독</td>
			<td width="20%" class="tblMid">출연</td>
			<td width="5%" id="tblEnd">네티즌 평점</td>
		</tr>
	</table>
	<c:forEach items="${movies }" var="m">
		<form action="MIC" method="post" name="frm1" id="frm1">
			<table id="srTbl">
				<tr>
					<td align="center" style="width: 20%">
						<h3>
							<button>${m.m_title}</button>
						</h3> ${m.m_subtitle} <input type="hidden" value="${m.m_title}"
						name="title"> <input type="hidden" value="${m.m_subtitle}"
						name="subtitle">
					</td>
					<td align="center" style="width: 10%;" id="sr_img"><img
						style="width: 100%;" src="${m.m_image}"> <input
						type="hidden" value="${m.m_image}" name="image"></td>
					<td style="width: 5%">${m.m_pubdate}<input type="hidden"
						value="${m.m_pubdate}" name="pubDate">
					</td>
					<td style="width: 10%">${m.m_director}<input type="hidden"
						value="${m.m_director}" name="director">
					</td>
					<td style="width: 20%">${m.m_actor}<input type="hidden"
						value="${m.m_actor}" name="actor">
					</td>
					<td style="width: 5%">${m.m_rating}<input type="hidden"
						value="${m.m_rating}" name="userRating">
					</td>
				</tr>
			</table>
		</form>
	</c:forEach>

	<table id="lnr">
		<tr>
			<td class="leftRight"><c:if test="${curPageNo != 1}">
					<a href="SPC?p=${curPageNo - 1}&movietitle=${movietitle}"
						style="color: salmon;">&lt;</a>
				</c:if></td>
			<td id="nowNum">${curPageNo }</td>
			<td class="leftRight"><c:if
					test="${curPageNo != pageCount && pageCount != 1}">
					<a href="SPC?p=${curPageNo + 1}&movietitle=${movietitle}"
						style="color: salmon;">&gt;</a>
				</c:if></td>
		</tr>
	</table>
</body>
</html>
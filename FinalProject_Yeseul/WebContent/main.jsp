<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/maincss.css">
</head>
<body>
	<form action="SC">
		<div class="search__container">
			<p class="search__title">Search Movie</p>
			<input class="search__input" type="text" placeholder="영화 검색"
				name="movietitle">
		</div>
	</form>
	
	
	<table class="type07">
  <thead>
  <tr><th>${dd }</th></tr>
  <tr>
    <th scope="cols">박스오피스 순위</th>
    <th scope="cols">제목</th>
    <th scope="cols">개봉일</th>
    <th scope="cols">누적 관객수</th>
  </tr>
  </thead>
	<c:forEach items="${theaterInfos}" var="t">
  <tbody>
  <tr>
    <th scope="row">${t.t_rank}</th>
   <td>${t.t_movieNm}  </td>
    <td>${t.t_openDt}</td>
    <td>${t.t_audiAcc}</td>
  </tr>
  </tbody>
  </c:forEach>
</table>

</body>
</html>


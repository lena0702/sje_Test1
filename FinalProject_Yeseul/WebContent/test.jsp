<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="mcss.css">
</head>

<header>
		<nav>
			<c:choose>
				<c:when test="${sessionScope.accountInfo != null}">
					${sessionScope.accountInfo.u_name} 님, 안녕하세요.
					
					<!-- <a href="MyC">마이페이지</a> -->
					
					<form action="MyC">
			<input value="${sessionScope.accountInfo.u_fav }" name="genre" type="hidden">
			<button>마이페이지</button>
		</form>
					
				</c:when>
				<c:when test="${sessionScope.accountInfo == null}">
					<a class="topt" href="LIC">로그인</a>&emsp;&emsp;&emsp;
					<a class="topt" href="SIC">회원가입</a>
				</c:when>
				<c:otherwise>
					<a class="topt" href="LIC">로그인</a>&emsp;&emsp;&emsp;
					<a class="topt" href="SIC">회원가입</a>
				</c:otherwise>
			</c:choose>
		</nav>
		
		
	</header>


<body>

<div class="mtable">
		<ul>
			<li class="mtableitem"><a href="HC" class="credits__link">영화홈</a></li>
			<li class="mtableitem"><a href="" class="credits__link">예매</a>
			<ul>
			<li><a href="MovieR" class="credits__link">예매하기</a></li>
		   </ul></li>
					   
			<li class="mtableitem"><a href="" class="credits__link">평점/리뷰</a>
			<ul>
			<li><a href="ReviewC" class="credits__link">네티즌 평점</a></li>
			<li><a href="ReviewC" class="credits__link">네티즌 리뷰</a></li>
			</ul></li>
					
			</ul>	
</div>
			

<div class="search__container">
    <p class="search__title">
        Search Movie
    </p>
    <input class="search__input" type="text" placeholder="영화 검색" name="movietitle">
</div>

<jsp:include page="${contentPage }"></jsp:include>

</body>

<footer>
		<div class="bottom_box">
			<a href="" class="credits__text">이용약관</a> &emsp; <a href="" class="credits__text">개인정보처리방침</a> 
			&emsp; <a href="" class="credits__text">영화
				고객센터</a> &emsp; <a href="" class="credits__text">회사소개</a>
		</div>
</footer>



</html>
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
	<table border="1">
		<tr>
			<td colspan="2"><h2>${param.title}</h2> <input type="hidden"
				name="title" value="${param.title }"></td>
			<td rowspan="7"><img alt="No Photo" src="${param.image }"
				style="max-width: 100%; height: auto;"></td>
		</tr>
		<tr>
			<td colspan="2">${param.subtitle }</td>
		</tr>
		<tr>
			<td>유저 평점</td>
			<td>${param.userRating}</td>
		</tr>
		<tr>
			<td>내 평점</td>
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
			<td>개봉일</td>
			<td>${param.pubDate}</td>
		</tr>
		<tr>
			<td>감독</td>
			<td>${param.director}</td>
		</tr>
		<tr>
			<td>배우</td>
			<td>${param.actor}</td>
		</tr>
	</table>
	<c:choose>
		<c:when test="${sessionScope.accountInfo != null }">
	<jsp:include page="${movieReviewWrite }">
		<jsp:param value="${param.title }" name="title"/>
		<jsp:param value="${param.image }" name="image"/>
		<jsp:param value="${param.subtitle }" name="subtitle"/>
		<jsp:param value="${param.userRating }" name="userRating"/>
		<jsp:param value="${param.pubDate }" name="pubDate"/>
		<jsp:param value="${param.director }" name="director"/>
		<jsp:param value="${param.actor }" name="actor"/>
	</jsp:include>
		</c:when>
		<c:otherwise>
			<td>리뷰 작성을 위해서는 로그인해주세요.</td>
		</c:otherwise>
	</c:choose>
	<hr>
	
	<jsp:include page="${movieInfoReviews }">
		<jsp:param name="title" value="${param.title }"/>
		<jsp:param name="image" value="${param.image }"/>
		<jsp:param name="subtitle" value="${param.subtitle }"/>
		<jsp:param name="userRating" value="${param.userRating }"/>
		<jsp:param name="pubDate" value="${param.pubDate }"/>
		<jsp:param name="director" value="${param.director }"/>
		<jsp:param name="actor" value="${param.actor }"/>
	</jsp:include>
	

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
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
	function sendLink() {
		var _title = "${param.title}";
		var _subtitle = "${param.subtitle}";
		var _director = "${param.director}";
		var _actor = "${param.actor}";
		var _pubDate = "${param.pubDate}";
		var _userRating = "${param.userRating}";
		var _image = "${param.image}";
		//<![CDATA[
		// // 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('c5502e3899c0440083570bc304bc5f22');
		// // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
		Kakao.Link.createDefaultButton({
			container : '#kakao-link-btn',
			objectType : 'feed',
			content : {
				title : '' + _title,
				description : _subtitle + '\n감독: ' + _director + ', 배우: ' + _actor
						+ '\n개봉일: ' + _pubDate,
				imageUrl : _image,
				link : {
					mobileWebUrl : 'http://localhost/FinalProject_5/',
					webUrl : 'http://localhost/FinalProject_5/'
				}
			},
			buttons : [ {
				title : '웹으로 보기',
				link : {
					mobileWebUrl : 'http://localhost/FinalProject_5/',
					webUrl : 'http://localhost/FinalProject_5/'
				}
			} ]
		});
		//]]> 
	}
</script>
</head>
<link rel="stylesheet" type="text/css" href="css/movieInfoCss.css">
<body>
	<table id="miTbl">
		<tr>
			<td colspan="2"><h2>${param.title}</h2> <input type="hidden"
				name="title" value="${param.title }"></td>
				
				<td align="right" width="20%"><a id="kakao-link-btn"
				href="javascript:sendLink()"> <img
					src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
			</a></td>
				
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
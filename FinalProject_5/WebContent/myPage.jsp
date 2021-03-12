<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/mpcss.css">
<title>Insert title here</title>
</head>
<table class="bigTable">
	<tr>
		<td class="MYPAGE__TABLE__TD1" colspan="2"><h2>${sessionScope.accountInfo.u_name}님의
				마이페이지</h2></td>
	</tr>
	<tr>
		<td class="MYPAGE__TABLE__TD2">
			<table class="MYPAGE__TABLE__INFO">
				<tr>
					<td colspan="2" class="TD__INFO"><h3>${sessionScope.accountInfo.u_name }의
							정보</h3></td>
				</tr>
				<tr>
					<td class="TD__INFO2">생일 <br> <fmt:formatDate
							value="${sessionScope.accountInfo.u_birth }" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td class="TD__INFO3">좋아하는 장르<br> <c:choose>
							<c:when test="${sessionScope.accountInfo.u_fav == 1}">드라마</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 2}">판타지</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 3}">서부</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 4}">공포</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 5}">로맨스</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 6}">모험</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 7}">스릴러</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 8}">느와르</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 9}">컬트</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 10}">다큐멘터리</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 11}">코미디</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 12}">가족</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 13}">미스터리</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 14}">전쟁</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 15}">애니메이션</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 16}">범죄</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 17}">뮤지컬</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 18}">SF</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 19}">액션</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 20}">무협</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 21}">에로</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 22}">서스펜스</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 23}">서사</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 24}">블랙코미디</c:when>
							<c:when test="${sessionScope.accountInfo.u_fav == 25}">실험</c:when>
						</c:choose></td>
				</tr>
			</table>
		</td>
		<td rowspan="2">
			<table class="TABLE_REVIEW">
				<tr>
					<td colspan="4" class="TABLE_REVIEW_TITLE"><h3>${sessionScope.accountInfo.u_name }님의
							리뷰 전체 리스트</h3></td>
				</tr>
				<tr>
					<td class="TABLE_REVIEW_TEXT1"><h3>등록일자</h3></td>
					<td class="TABLE_REVIEW_TEXT2"><h3>영화 제목</h3></td>
					<td class="TABLE_REVIEW_TEXT2"><h3>리뷰 내용</h3></td>
					<td class="TABLE_REVIEW_TEXT3"><h3>별점</h3></td>
				</tr>
				<tr>
					<td colspan="4" valign="top"><c:forEach items="${reviews }"
							var="r">
							<table class="TABLE_IN_REVIEW">
								<tr>
									<td class="TABLE_REVIEW_INTEXT"><fmt:formatDate
											value="${r.r_date }" dateStyle="short" /></td>
									<td class="TABLE_REVIEW_INTEXT2">${r.r_title }</td>
									<td class="TABLE_REVIEW_INTEXT2">${r.r_review }</td>
									<td class="TABLE_REVIEW_INTEXT3">${r.r_star }</td>
								</tr>
							</table>
						</c:forEach></td>
				</tr>
				<tr class="PAGING__TR">
					<td colspan="4" align="center">
						<table>
							<tr>
								<td><c:if test="${curPageNo != 1 }">
										<a style="color: black;"
											href="MPC?p=${curPageNo - 1 }&genre=${sessionScope.accountInfo.u_fav}">&lt;</a>
									</c:if></td>
								<td>${curPageNo }</td>
								<td><c:if test="${curPageNo != pageCount }">
										<a style="color: black;"
											href="MPC?p=${curPageNo + 1 }&genre=${sessionScope.accountInfo.u_fav}">&gt;</a>
									</c:if></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	<tr>
		<td class="DOWN__TD"><table class="TABLE__RECOM__TEXT">
				<%-- <tr>
						<td class="MYPAGE__TABLE__TD3" colspan="4"><h3>${sessionScope.accountInfo.u_name}님,
							이런 영화는 어떠세요?</h3></td>
					</tr> --%>
				<tr>
					<td class="MYPAGE__TABLE__TD3" colspan="4"><h3>${sessionScope.accountInfo.u_name}님,
							이런 영화는 어떠세요?<br> <br>
							<c:choose>
								<c:when test="${sessionScope.accountInfo.u_fav == 1}">드라마</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 2}">판타지</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 3}">서부</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 4}">공포</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 5}">로맨스</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 6}">모험</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 7}">스릴러</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 8}">느와르</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 9}">컬트</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 10}">다큐멘터리</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 11}">코미디</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 12}">가족</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 13}">미스터리</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 14}">전쟁</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 15}">애니메이션</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 16}">범죄</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 17}">뮤지컬</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 18}">SF</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 19}">액션</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 20}">무협</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 21}">에로</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 22}">서스펜스</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 23}">서사</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 24}">블랙코미디</c:when>
								<c:when test="${sessionScope.accountInfo.u_fav == 25}">실험</c:when>
							</c:choose>
							카테고리의 신작
						</h3></td>
				</tr>
				<tr>
					<c:forEach items="${mySearchResults }" var="m">
						<td><table class="TABLE__RECOM">
								<tr class="RECOM__IMG__TR">
									<td class="RECOM__IMG__TD"><img src="${m.m_image}"
										class="RECOM__IMG__IMG"></td>
								</tr>
								<tr class="RECOM__IMG__TR2">
									<td class="RECOM__TITLE">
										<div>
											<p>${m.m_title}</p>
										</div>
									</td>
								</tr>
							</table></td>
					</c:forEach>
				</tr>
			</table></td>
	</tr>
</table>
</body>
</html>
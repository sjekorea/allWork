<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<P>  Currnet Page URL is ${currentUrl}. </P>


<table class="table">
	<!--테이블 열 넓이 영역-->
	<colgroup>
		<col width="25%">
		<col width="25%">
		<col width="25%">
		<col width="25%">
	</colgroup>
	<thead>
		<tr>
			<th>testId</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>나이</th>
		</tr>
	</thead><!--테이블 열 옵션 영역 끝-->
	<tbody>
		<c:choose>
			<c:when test="${list.size() > 0 }">
				<c:forEach var="result" items="${list}" varStatus="status">
					<tr>
						<td>${result.testId }</td>
						<td>${result.name }</td>
						<td>${result.mobileNo }</td>
						<td>${result.age }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr><td colspan="4" align="center">등록된 내역이 없습니다.</td></tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
<!--테이블 페이저 영역 시작-->
<ul class="pager">
	${pageMap.pageHtml}
</ul><!--테이블 페이저 영역 끝-->
<!--테이블 영역 끝-->

</body>
</html>

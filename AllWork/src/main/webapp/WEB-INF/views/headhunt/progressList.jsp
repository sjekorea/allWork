<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- (begin) 2020.12.30 by s.yoo	-->
<!-- 
<jsp:include page="/communityHeader.do" />
 -->
<c:choose>
	<c:when test="${SE_LOGIN_STATUS}">
		<c:if test="${SE_USER_TYPE == 'company' }">
			<jsp:include page="/companyHeader.do"/>
		</c:if>

		<c:if test="${SE_USER_TYPE == 'person' }">
			<jsp:include page="/personHeader.do" />
		</c:if>
	</c:when>
	<c:otherwise>
			<jsp:include page="/indexHeader.do" />
	</c:otherwise>
</c:choose>

<link rel="stylesheet" type="text/css" href="/css/customerCenter_board_list.css"/>

<style type="text/css">
	/*현재메뉴 언더라인*/
	<c:if test="${boardCode == 'netfu_52508_48920' }">
		#menuTree ul .menu01{text-decoration: underline;}
	</c:if>
	<c:if test="${boardCode == 'netfu_52508_50000' }">
		#menuTree ul .menu02{text-decoration: underline;}
	</c:if>
	<c:if test="${boardCode == 'netfu_52508_60000' }">
		#menuTree ul .menu03{text-decoration: underline;}
	</c:if>
	<c:if test="${boardCode == 'netfu_52508_70000' }">
		#menuTree ul .menu04{text-decoration: underline;}
	</c:if>
	<c:if test="${boardCode == 'netfu_52508_80000' }">
		#menuTree ul .menu05{text-decoration: underline;}
	</c:if>
	<c:if test="${boardCode == 'netfu_52508_90000' }">
		#menuTree ul .menu06{text-decoration: underline;}
	</c:if>
</style>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
		<jsp:include page="/progressSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="boardPart">
				<h4>${boardName }</h4>
				<table title="${boardName } 테이블">
					<caption>기${boardName }</caption>
					<thead id="boardTitle">
						<tr>
							<th>번호</th>
							<td class="board_Part">제목</td>
							<td class="board_Person">작성자</td>
							<td class="board_date">등록일</td>
							<td class="board_count">조회수</td>
						</tr>
					</thead>
					<tbody>
			<c:choose>
				<c:when test="${item != null && item.size() > 0 }">
					<c:forEach var="result" items="${item}" varStatus="status">
						<tr style="cursor:pointer">
							<th>${result.itemNo}</th>
							<td class="board_Part">
								<a href="javascript:goProgressView('${boardCode}', ${result.id}, ${map.get("pageNo")});">
									${result.subject}
								</a>
							</td>
							<td class="board_Person">${result.nickName}</td>
							<td class="board_date">${result.strWdate}</td>
							<td class="board_count"><fmt:formatNumber value="${result.hit}" pattern="#,###"/></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
						<tr style="cursor:pointer">
							<th colspan=5>데이터가 존재하지 않습니다.</th>
						</tr>
				</c:otherwise>
			</c:choose>
					</tbody>
				</table>
			
				<!-- 게시판에 대해서만 목록화면에서 글쓰기를 허용. -->
			<c:if test="false">
				<a href="javascript:goProgressEdit('${boardCode}', 0, ${map.get("pageNo")});" title="등록"><p class="delete">등록</p></a>
			</c:if>
				
				<div class="numareaWrap">
					<ul class="numArea">
						${pageMap.pageHtml }
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />

<script type="text/javascript">
	
	$(document).ready(function(){
	});	

</script>

<!-- (end) 2020.12.30 by s.yoo	-->

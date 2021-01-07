<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- (begin) 2020.12.30 by s.yoo	-->
<jsp:include page="/communityHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/customerCenter_board_list.css"/>

<style type="text/css">
	/*현재메뉴 언더라인*/
	#menuTree ul .menu01{text-decoration: underline;}
</style>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
		<c:if test="${SE_USER_TYPE == 'person' }">
			<jsp:include page="/headhuntSubMenu.do" />
		</c:if>
		</div>
		<div id="rightPart">
			<div id="boardPart">
				<h4>헤드헌팅</h4>
                <p>아래 채용분야에 해당하시는 분은 <span>mail@allwork.co.kr</span>로 경력 위주의 상세이력서(지원회사 명기)를 보내주시기 바랍니다.</p>
				<table title="헤드헌팅">
					<caption>헤드헌팅</caption>
					<thead id="boardTitle">
						<tr>
							<th>회사명</th>
							<td class="board_Part">채용분야</td>
							<td class="board_Person">인원</td>
							<td class="board_count">근무지</td>
							<td class="board_date">등록일</td>
						</tr>
					</thead>
					<tbody>
			<c:choose>
				<c:when test="${item != null && item.size() > 0 }">
					<c:forEach var="result" items="${item}" varStatus="status">
						<tr style="cursor:pointer">
							<th>${result.companyInitial}사</th>
							<td class="board_Part">
									${result.recruitContents}
							</td>
							<td class="board_Person">${result.men}</td>
							<td class="board_count">${result.placeWork}</td>
							<td class="board_date">${result.strReqDate}</td>
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
				<a href="javascript:goHeadhuntEdit('${boardCode}', 0, ${map.get("pageNo")});" title="등록"><p class="delete">등록</p></a>
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- (begin) 2020.12.30 by s.yoo	-->
<!-- 
<jsp:include page="/introHeader.do" />
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
<!-- (end) 2020.12.30 by s.yoo	-->

<link rel="stylesheet" type="text/css" href="/css/introduction_partnership02.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/introSubMenu.do" />
		</div>
		<div id="rightPart">
			<ul class="tab">
				<li class="a01"><a href="#" title="기술개발전문용역회사">기술개발전문용역회사</a></li>
				<li class="a02"><a href="#" title="기술개발전문용역현황">기술개발전문용역현황</a></li>
			</ul>
			<div id="boardPart">
				<h4>기술개발전문용역현황</h4>
				<table title="이름, 아이디, 비밀번호, 이메일 등의 정보입력">
					<caption>기타 채용정보</caption>
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
						<tr style="cursor: pointer">
							<th>2151</th>
							<td class="board_Part">면접진행(A사,경기 시흥)</td>
							<td class="board_Person">kihmoo</td>
							<td class="board_date">20/10/16</td>
							<td class="board_count">7</td>
						</tr>
						<tr style="cursor: pointer">
							<th>2151</th>
							<td class="board_Part">면접진행(A사,경기 시흥)</td>
							<td class="board_Person">kihmoo</td>
							<td class="board_date">20/10/16</td>
							<td class="board_count">7</td>
						</tr>
						<tr style="cursor: pointer">
							<th>2151</th>
							<td class="board_Part">면접진행(A사,경기 시흥)</td>
							<td class="board_Person">kihmoo</td>
							<td class="board_date">20/10/16</td>
							<td class="board_count">7</td>
						</tr>
						<tr style="cursor: pointer">
							<th>2151</th>
							<td class="board_Part">면접진행(A사,경기 시흥)</td>
							<td class="board_Person">kihmoo</td>
							<td class="board_date">20/10/16</td>
							<td class="board_count">7</td>
						</tr>
						<tr style="cursor: pointer">
							<th>2151</th>
							<td class="board_Part">면접진행(A사,경기 시흥)</td>
							<td class="board_Person">kihmoo</td>
							<td class="board_date">20/10/16</td>
							<td class="board_count">7</td>
						</tr>
						<tr style="cursor: pointer">
							<th>2151</th>
							<td class="board_Part">면접진행(A사,경기 시흥)</td>
							<td class="board_Person">kihmoo</td>
							<td class="board_date">20/10/16</td>
							<td class="board_count">7</td>
						</tr>
						<tr style="cursor: pointer">
							<th>2151</th>
							<td class="board_Part">면접진행(A사,경기 시흥)</td>
							<td class="board_Person">kihmoo</td>
							<td class="board_date">20/10/16</td>
							<td class="board_count">7</td>
						</tr>
						<tr style="cursor: pointer">
							<th>2151</th>
							<td class="board_Part">면접진행(A사,경기 시흥)</td>
							<td class="board_Person">kihmoo</td>
							<td class="board_date">20/10/16</td>
							<td class="board_count">7</td>
						</tr>
						<tr style="cursor: pointer">
							<th>2151</th>
							<td class="board_Part">면접진행(A사,경기 시흥)</td>
							<td class="board_Person">kihmoo</td>
							<td class="board_date">20/10/16</td>
							<td class="board_count">7</td>
						</tr>
						<tr style="cursor: pointer">
							<th>2151</th>
							<td class="board_Part">면접진행(A사,경기 시흥)</td>
							<td class="board_Person">kihmoo</td>
							<td class="board_date">20/10/16</td>
							<td class="board_count">7</td>
						</tr>
						<tr style="cursor: pointer">
							<th>2151</th>
							<td class="board_Part">면접진행(A사,경기 시흥)</td>
							<td class="board_Person">kihmoo</td>
							<td class="board_date">20/10/16</td>
							<td class="board_count">7</td>
						</tr>
						<tr style="cursor: pointer">
							<th>2151</th>
							<td class="board_Part">면접진행(A사,경기 시흥)</td>
							<td class="board_Person">kihmoo</td>
							<td class="board_date">20/10/16</td>
							<td class="board_count">7</td>
						</tr>
						<tr style="cursor: pointer">
							<th>2151</th>
							<td class="board_Part">면접진행(A사,경기 시흥)</td>
							<td class="board_Person">kihmoo</td>
							<td class="board_date">20/10/16</td>
							<td class="board_count">7</td>
						</tr>
						<tr style="cursor: pointer">
							<th>2151</th>
							<td class="board_Part">면접진행(A사,경기 시흥)</td>
							<td class="board_Person">kihmoo</td>
							<td class="board_date">20/10/16</td>
							<td class="board_count">7</td>
						</tr>
						<tr style="cursor: pointer">
							<th>2151</th>
							<td class="board_Part">면접진행(A사,경기 시흥)</td>
							<td class="board_Person">kihmoo</td>
							<td class="board_date">20/10/16</td>
							<td class="board_count">7</td>
						</tr>
					</tbody>
				</table>
				<p class="delete">
					<a href="#none" title="등록">등록</a>
				</p>
				<div class="intro_numareaWrap">
					<ul class="intro_numArea">
						<li><a href="#" title="prev"><i class="fas fa-chevron-left"></i></a></li>
						<li class="p01"><a href="#" title="page1">1</a></li>
						<li><a href="#" title="page2">2</a></li>
						<li><a href="#" title="page3">3</a></li>
						<li><a href="#" title="page4">4</a></li>
						<li><a href="#" title="page5">5</a></li>
						<li><a href="#" title="page6">6</a></li>
						<li><a href="#" title="page7">7</a></li>
						<li><a href="#" title="page8">8</a></li>
						<li><a href="#" title="page9">9</a></li>
						<li><a href="#" title="page10">10</a></li>
						<li><a href="#" title="next"><i class="fas fa-chevron-right"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>


<jsp:include page="/footer.do" />
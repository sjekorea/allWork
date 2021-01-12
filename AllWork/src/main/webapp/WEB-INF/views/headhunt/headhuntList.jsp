<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<!-- (begin) 2020.12.30 by s.yoo	-->
<jsp:include page="/communityHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/headhunting.css"/>

<style type="text/css">
	/*현재메뉴 언더라인*/
	#menuTree ul .menu01{text-decoration: underline;}
</style>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/headhuntSubMenu.do" />
		</div>
		<div id="rightPart">
			<h4>헤드헌팅</h4>
			<p>아래 채용분야에 해당하시는 분은 <span>mail@allwork.co.kr</span>로 경력 위주의 상세이력서(지원회사 명기)를 보내주시기 바랍니다.</p>
			<div id="listPart">
				<table class="list" style="table-layout:fixed;">
					<colgroup>
						<col style="width:20%;">
						<col style="width:30%;">
						<col style="width:20%;">
						<col style="width:15%;">
						<col style="width:15%;">
					</colgroup>
					<caption>리스트</caption>
					<thead>
						<tr>
							<th class="t_desc01">회사명</th>
							<th colspan="3" class="t_desc02">채용공고</th>
							<th class="t_desc03">마감일</th>
						</tr>
					</thead>
			<c:choose>
				<c:when test="${item != null && item.size() > 0 }">
					<c:forEach var="result" items="${item}" varStatus="status">
					<tbody>
						<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
						<tr>
							<td rowspan="2" class="desc01">${result.companyInitial}사</td>
							<td colspan="3" class="desc02">
								${result.recruitContents}
							</td>
							<td rowspan="2" class="desc03">${convert:getEndCond(result.bizIng, result.bizEndType, result.bizEndDay)}</td>
						</tr>
						<tr>
							<td><span class="desc_title">근무지:</span><span class="desc_desc00">${result.placeWork}</span></td>
							<td><span class="desc_title">모집인원:</span><span class="desc_desc00">${result.men}</span></td>
							<td><span class="desc_title">등록일:</span><span class="desc_desc00">${result.strReqDate}</span></td>
						</tr>
						<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
					</tbody>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tbody>
						<tr style="cursor:pointer">
							<th colspan=3>데이터가 존재하지 않습니다.</th>
						</tr>
					</tbody>
				</c:otherwise>
			</c:choose>
					
					<!-- 
					<tbody>
						<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
						<tr>
							<td class="desc01">(주)파인스태프</td>
							<td colspan="3" class="desc02">
							<a href="#none" title="맞춤채용공고">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진레미콘 직영기사 구인 광주/김포/당진</a>
							</td>
							<td class="desc03">상시채용</td>
						</tr>
						<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
					</tbody>
					<tbody>
						<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
						<tr>
							<td rowspan="3" class="desc01">(주)파인스태프</td>
							<td colspan="3" class="desc02">
							<a href="#none" title="맞춤채용공고">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진레미콘 직영기사 구인 광주/김포/당진</a>
							</td>
							<td rowspan="3" class="desc03">상시채용</td>
						</tr>
						<tr>
							<td><span class="desc_title">급여</span><span class="desc_desc00">3000-3500만원</span></td>
							<td><span class="desc_title">경력</span><span class="desc_desc00">무관</span></td>
							<td><span class="desc_title">나이</span><span class="desc_desc00">무관</span></td>
						</tr>
						<tr>
							<td><span class="desc_title">지역</span><span class="desc_desc00">경기 광주시</span></td>
							<td><span class="desc_title">학력</span><span class="desc_desc00">대학졸업(2,3년)</span></td>
							<td><span class="desc_title">성별</span><span class="desc_desc00">무관</span></td>
						</tr>
						<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
					</tbody>
					<tbody>
						<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
						<tr>
							<td rowspan="3" class="desc01">(주)파인스태프</td>
							<td><span class="desc_title">급여</span><span class="desc_desc00">3000-3500만원</span></td>
							<td><span class="desc_title">경력</span><span class="desc_desc00">무관</span></td>
							<td><span class="desc_title">나이</span><span class="desc_desc00">무관</span></td>
							<td rowspan="3" class="desc03">상시채용</td>
						</tr>
						<tr>
							<td><span class="desc_title">지역</span><span class="desc_desc00">경기 광주시</span></td>
							<td><span class="desc_title">학력</span><span class="desc_desc00">대학졸업(2,3년)</span></td>
							<td><span class="desc_title">성별</span><span class="desc_desc00">무관</span></td>
						</tr>
						<tr>
							<td colspan="3" class="desc02">
							<a href="#none" title="맞춤채용공고">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진레미콘 직영기사 구인 광주/김포/당진</a>
							</td>
						</tr>
						<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
					</tbody>
					<tbody>
						<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
						<tr>
							<td rowspan="4" class="desc01">(주)파인스태프</td>
							<td colspan="3" class="desc02">
							<a href="#none" title="맞춤채용공고">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진레미콘 직영기사 구인 광주/김포/당진</a>
							</td>
							<td rowspan="4" class="desc03">상시채용</td>
						</tr>
						<tr>
							<td><span class="desc_title">급여</span><span class="desc_desc00">3000-3500만원</span></td>
							<td><span class="desc_title">경력</span><span class="desc_desc00">무관</span></td>
							<td><span class="desc_title">나이</span><span class="desc_desc00">무관</span></td>
						</tr>
						<tr>
							<td><span class="desc_title">지역</span><span class="desc_desc00">경기 광주시</span></td>
							<td><span class="desc_title">학력</span><span class="desc_desc00">대학졸업(2,3년)</span></td>
							<td><span class="desc_title">성별</span><span class="desc_desc00">무관</span></td>
						</tr>
						<tr>
							<td colspan="3" class="desc02">
							<a href="#none" title="맞춤채용공고">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진레미콘 직영기사 구인 광주/김포/당진</a>
							</td>
						</tr>
						<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
					</tbody>
					 -->
				</table>

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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>


<jsp:include page="/indexHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/indexSearchList.css"/>


	<div id="content01Wrap">
		
		<table class="list" style="table-layout:fixed;">
			<colgroup>
				<col style="width:20%;">
				<col style="width:25%;">
				<col style="width:20%;">
				<col style="width:20%;">
				<col style="width:15%;">
			</colgroup>
			<caption>AI 통합검색 채용정보</caption>
			<thead>
				<tr>
					<th class="t_desc01">회사명</th>
					<th colspan="3" class="t_desc02">채용정보</th>
					<th class="t_desc03">채용마감</th>
				</tr>
			</thead>
<c:choose>
	<c:when test="${item.recruitDataWorknet.size() > 0 }">
		<c:forEach var="result" items="${item.recruitDataWorknet}" varStatus="status">
			<tbody>
				<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
				<tr>
					<td rowspan="3" class="desc01">${result.name }</td>
					<td colspan="3" class="desc02">
						<!-- 
						<a href="http://www.work.go.kr/empInfo/empInfoSrch/detail/empDetailAuthView.do?callPage=detail&wantedAuthNo=${result.recommend_id }" target="_blank">
							${result.title }
						</a>
						 -->
						<a href="javascript:goOtherDetail('${result.recommend_id }');">
							${result.title }
						</a>
					</td>
					<td rowspan="3" class="desc03">
					<c:if test="${result.bizIng ne 'yes' }">
						<span class="state01">${convert:getEndCond(result.bizIng, result.biz_end_type, result.biz_end_day)}</span>
					</c:if>
					<c:if test="${result.bizIng eq 'yes' and result.biz_end_type eq 'often' }">
						<span class="state02">${convert:getEndCond(result.bizIng, result.biz_end_type, result.biz_end_day)}</span>
					</c:if>
					<c:if test="${result.bizIng eq 'yes' and result.biz_end_type eq 'get' }">
						<span class="state03">${convert:getEndCond(result.bizIng, result.biz_end_type, result.biz_end_day)}</span>
					</c:if>
					<c:if test="${result.bizIng eq 'yes' and result.biz_end_type ne 'often'and result.biz_end_type ne 'get' }">
						<span class="state04">${convert:getEndCond(result.bizIng, result.biz_end_type, result.biz_end_day)}</span>
					</c:if>
					</td>
				</tr>
				<tr>
					<td><span class="desc_title">급여:</span><span class="desc_desc00">${result.salary }</span></td>
					<td colspan="2"><span class="desc_title">고용형태:</span><span class="desc_desc00">${result.job_form }</span></td>
				</tr>
				<tr>
					<td><span class="desc_title">등록일:</span><span class="desc_desc00">${result.strWdate }</span></td>
					<td colspan="2"><span class="desc_title">근무지:</span><span class="desc_desc00">${result.loc }</span></td>
				</tr>
				<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
			</tbody>
		</c:forEach>
	</c:when>
	<c:otherwise>
			<tbody>
				<tr><td class="desc00" colspan="5">주어진 조건을 만족하는 기타 채용정보를 찾을 수 없습니다.</td></tr>
			</tbody>
	</c:otherwise>
</c:choose>
		</table>

		<table class="list" style="table-layout:fixed;">
			<colgroup>
				<col style="width:20%;">
				<col style="width:25%;">
				<col style="width:20%;">
				<col style="width:20%;">
				<col style="width:15%;">
			</colgroup>
			<caption>AI 통합검색 회원등록 채용정보</caption>
			<thead>
				<tr>
					<th class="t_desc01">회사명</th>
					<th colspan="3" class="t_desc02">채용정보</th>
					<th class="t_desc03">채용마감</th>
				</tr>
			</thead>
<c:choose>
	<c:when test="${item.recruitDataAllwork.size() > 0 }">
		<c:forEach var="result" items="${item.recruitDataAllwork}" varStatus="status">
			<tbody>
				<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
				<tr>
					<td rowspan="3" class="desc01">${result.name }</td>
					<td colspan="3" class="desc02">
						<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.recommend_id }', '', '${result.bizIng }', '');">
							${result.title }
						</a>
					</td>
					<td rowspan="3" class="desc03">
					<c:if test="${result.bizIng ne 'yes' }">
						<span class="state01">${convert:getEndCond(result.bizIng, result.biz_end_type, result.biz_end_day)}</span>
					</c:if>
					<c:if test="${result.bizIng eq 'yes' and result.biz_end_type eq 'often' }">
						<span class="state02">${convert:getEndCond(result.bizIng, result.biz_end_type, result.biz_end_day)}</span>
					</c:if>
					<c:if test="${result.bizIng eq 'yes' and result.biz_end_type eq 'get' }">
						<span class="state03">${convert:getEndCond(result.bizIng, result.biz_end_type, result.biz_end_day)}</span>
					</c:if>
					<c:if test="${result.bizIng eq 'yes' and result.biz_end_type ne 'often'and result.biz_end_type ne 'get' }">
						<span class="state04">${convert:getEndCond(result.bizIng, result.biz_end_type, result.biz_end_day)}</span>
					</c:if>
					</td>
				</tr>
				<tr>
					<td><span class="desc_title">급여:</span><span class="desc_desc00">${result.salary }</span></td>
					<td colspan="2"><span class="desc_title">고용형태:</span><span class="desc_desc00">${result.job_form }</span></td>
				</tr>
				<tr>
					<td><span class="desc_title">등록일:</span><span class="desc_desc00">${result.strWdate }</span></td>
					<td colspan="2"><span class="desc_title">근무지:</span><span class="desc_desc00">${result.loc }</span></td>
				</tr>
				<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
			</tbody>
		</c:forEach>
	</c:when>
	<c:otherwise>
			<tbody>
				<tr><td class="desc00" colspan="5">주어진 조건을 만족하는 회원등록 채용정보를 찾을 수 없습니다.</td></tr>
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
					<td><span class="desc_title">학력</span><span class="desc_desc00">전문학사</span></td>
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
					<td><span class="desc_title">학력</span><span class="desc_desc00">전문학사</span></td>
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
					<td><span class="desc_title">지역</span><span class="desc_desc00">경기 광주시 경기 광주시 경기 광주시</span></td>
					<td><span class="desc_title">학력</span><span class="desc_desc00">전문학사</span></td>
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
		

		<!-- 
		<table class="list" style="table-layout:fixed;">
				<colgroup>
				<col style="width:25%;">
				<col style="width:25%;">
				<col style="width:15%;">
				<col style="width:15%;">
				<col style="width:20%;">
				</colgroup>
				<caption>AI 통합검색 채용 공고</caption>
				<thead>
				<tr>
					<th class="t_desc01">회사명</th>
					<th colspan="3" class="t_desc02">채용공고</th>
					<th class="t_desc03">마감일</th>
				</tr>
				</thead>
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
					<td><span class="desc_title">학력</span><span class="desc_desc00">전문학사</span></td>
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
					<td><span class="desc_title">학력</span><span class="desc_desc00">전문학사</span></td>
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
					<td><span class="desc_title">지역</span><span class="desc_desc00">경기 광주시 경기 광주시 경기 광주시</span></td>
					<td><span class="desc_title">학력</span><span class="desc_desc00">전문학사</span></td>
					<td><span class="desc_title">성별</span><span class="desc_desc00">무관</span></td>
				</tr>
				<tr>
					<td colspan="3" class="desc02">
					<a href="#none" title="맞춤채용공고">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진레미콘 직영기사 구인 광주/김포/당진</a>
					</td>
				</tr>
				<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
				</tbody>
			</table>
		<table class="list" style="table-layout:fixed;">
				<colgroup>
				<col style="width:25%;">
				<col style="width:25%;">
				<col style="width:15%;">
				<col style="width:15%;">
				<col style="width:20%;">
				</colgroup>
				<caption>AI 통합검색 채용 공고</caption>
				<thead>
				<tr>
					<th class="t_desc01">회사명</th>
					<th colspan="3" class="t_desc02">채용공고</th>
					<th class="t_desc03">마감일</th>
				</tr>
				</thead>
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
					<td><span class="desc_title">학력</span><span class="desc_desc00">전문학사</span></td>
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
					<td><span class="desc_title">학력</span><span class="desc_desc00">전문학사</span></td>
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
					<td><span class="desc_title">지역</span><span class="desc_desc00">경기 광주시 경기 광주시 경기 광주시</span></td>
					<td><span class="desc_title">학력</span><span class="desc_desc00">전문학사</span></td>
					<td><span class="desc_title">성별</span><span class="desc_desc00">무관</span></td>
				</tr>
				<tr>
					<td colspan="3" class="desc02">
					<a href="#none" title="맞춤채용공고">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진레미콘 직영기사 구인 광주/김포/당진</a>
					</td>
				</tr>
				<tr class="margin"><td></td><td></td><td></td><td></td><td></td></tr>
				</tbody>
			</table>
		 -->
	</div>
	
<jsp:include page="/footer.do" />

<form id="searchForm" name="searchForm" method="post" action="/recruitScrapList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="personUid" id="personUid" value="" />
	<input type="hidden" name="companyUid" id="companyUid" value="" />
	<input type="hidden" name="no" id="no" value="" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/personSubMenu.do" />
	<input type="hidden" id="wantedAuthNo" name="wantedAuthNo" value="" />
</form>

<script type="text/javascript">
	
	function goDetail(companyUid, personUid, no, recruitNo, resumeNo, bizIng, detailFlag){
		
		loadingOn();
		//if("yes" != bizIng){
		//	alert("채용을 마감했습니다.");
		//	loadingOff();
		//}else{
			var callback = function(data){
				//if(data.rstCnt <= 0){
				//	alert("이력서를 먼저 작성해 주세요");
				//	loadingOff();
				//}else{
					$("#companyUid").val(companyUid);
					$("#personUid").val(personUid);
					$("#no").val(no);
					$("#recruitNo").val(recruitNo);
					$("#resumeNo").val(resumeNo);
					$("#searchForm").attr("action", "/recruitDetail.do");
					$("#searchForm").submit();
				//}
			};
			var param = {
					
			};
			
			ajax('post', '/selectNetfuItemResumeCnt.ajax', param, callback);
		//}
	}
	
	// 기타 채용정보 상세보기 화면으로 이동.
	function goOtherDetail(wantedAuthNo){
		loadingOn();
		
		$("#wantedAuthNo").val(wantedAuthNo);
		$("#searchForm").attr("action", "/recruitOtherDetail.do");
		$("#searchForm").submit();
	}

</script>
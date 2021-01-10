<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>


<jsp:include page="/indexHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/indexSearchList.css"/>


<div id="containerWrap">
	<div id="content01Wrap">
		<table class="list" style="table-layout:fixed;">
			<colgroup>
				<col style="width:15%;">
				<col style="width:40%;">
				<col style="width:30%;">
				<col style="width:15%;">
			</colgroup>
			<caption>AI 통합검색 인재정보</caption>
			<thead>
				<tr>
					<th class="t_desc01">구직자</th>
					<th colspan="2" class="t_desc02">인재정보</th>
					<th class="t_desc03">등록일</th>
				</tr>
			</thead>
<c:choose>
	<c:when test="${item.resumeDataAllwork.size() > 0 }">
		<c:forEach var="result" items="${item.resumeDataAllwork}" varStatus="status">
			<tbody>
				<tr class="margin"><td></td><td></td><td></td><td></td></tr>
				<tr>
					<td rowspan="3" class="desc01">${convert:getPersonNameHidden(result.name) }</td>
					<td colspan="2" class="desc02">
						<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.recommend_id }', 'no', 'resume');">
							${result.detail }
						</a>
					</td>
					<td rowspan="3" class="desc03">${result.strWdate }</td>
				</tr>
				<tr>
					<td><span class="desc_title">희망급여:</span><span class="desc_desc00">${result.salary }</span></td>
					<td><span class="desc_title">고용형태:</span><span class="desc_desc00">${result.job_form }</span></td>
				</tr>
				<tr>
					<td colspan="2"><span class="desc_title">희망근무지:</span><span class="desc_desc00">${result.loc }</span></td>
				</tr>
				<tr class="margin"><td></td><td></td><td></td><td></td></tr>
			</tbody>
		</c:forEach>
	</c:when>
	<c:otherwise>
			<tbody>
				<tr><td class="desc00" colspan="4">주어진 조건을 만족하는 인재정보를 찾을 수 없습니다.</td></tr>
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
					<td><span class="desc_title">지역</span><span class="desc_desc00">경기 광주시 경기 광주시 경기 광주시</span></td>
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
					<td><span class="desc_title">지역</span><span class="desc_desc00">경기 광주시 경기 광주시 경기 광주시</span></td>
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
					<td><span class="desc_title">지역</span><span class="desc_desc00">경기 광주시 경기 광주시 경기 광주시</span></td>
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
			</table>
		 -->
	</div>
</div>
	
<jsp:include page="/footer.do" />

<form id="searchForm" name="searchForm" method="post" action="/recruitListProgress.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="personUid" id="personUid" value="${map.personUid}" />
	<input type="hidden" name="companyUid" id="companyUid" value="${map.companyUid}" />
	<input type="hidden" name="no" id="no" value="" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="bizIng" id="bizIng" value="${map.bizIng}" />
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/companySubMenu.do" />
</form>

<script type="text/javascript">

	$(document).ready(function(){
		$(".tab li a").click(function(e){
			$(this).parent().parent().find("a").removeClass('selected');
			$(this).addClass('selected');
			var idx = $(this).parent("li").index();
			$(".list").eq(idx).css("display", "block").siblings(".list").css("display", "none");
		});
	});	
	
	
	function goDetail(companyUid, personUid, no, recruitNo, resumeNo, open, detailFlag){
		
		loadingOn();
		
		if("resume" == detailFlag){
			if("no" != open){
				alert("현재 비공개 상태로 설정되어 있습니다.");
				loadingOff();

			}else{
				$("#companyUid").val(companyUid);
				$("#personUid").val(personUid);
				$("#no").val(no);
				$("#recruitNo").val(recruitNo);
				$("#resumeNo").val(resumeNo);
				$("#searchForm").attr("action", "/resumeDetail.do");
				$("#searchForm").submit();
			} 
		}
	}
</script>

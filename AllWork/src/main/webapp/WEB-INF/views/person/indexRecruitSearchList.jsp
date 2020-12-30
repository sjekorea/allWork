<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_home.css"/>

<div id="containerWrap">
	<div id="rightPart" style="width:100%;">
		<div id="listPart">
			<ul class="tab">
				<li><a class="selected" href="#" title="">AI 통합 검색 채용 공고</a></li>
			</ul>
			<table class="list" id="list01">
				<tbody>
					<c:choose>
						<c:when test="${myServiceRecruitList.size() > 0 }">
							<c:forEach var="result" items="${myServiceRecruitList}" varStatus="status">
								<tr class="desc desc0">
									<td rowspan="3" class="desc01">(주)파인스태프</td>
									<td colspan="6" class="desc02">
										<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.open }', '');">
											${result.bizName }
										</a>
									</td>
									<td rowspan="3" class="desc05">${codeConvert:getRecruitStatus(result.bizIng, result.bizEndType, result.bizEndDay) }</td>
								</tr>
								<tr class="desc desc1">
									<td class="desc03">급여</td>
									<td class="desc04">${result.bizPayName }</td>
									<td class="desc03">경력</td>
									<td class="desc04">${codeConvert:getBizCareer(result.bizCareer) }</td>
									<td class="desc03">나이</td>
									<td class="desc04">${result.bizAge }</td>
								</tr>
								<tr class="desc desc2">
									<td class="desc03">지역</td>
									<td class="desc04">${result.bizArea1Name }</td>
									<td class="desc03">학력</td>
									<td class="desc04">${codeConvert:getBizAbility(result.bizAbility) }</td>
									<td class="desc03">성별</td>
									<td class="desc04">${codeConvert:getBizSex(result.bizSex) }</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
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
</form>

<script type="text/javascript">
	
	function goDetail(companyUid, personUid, no, recruitNo, resumeNo, open, detailFlag){
		
		loadingOn();
		if("open" != open){
			alert("현재 비공개 상태로 설정되어 있습니다.");
			loadingOff();

		}else{
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
		}
	}
	
</script>
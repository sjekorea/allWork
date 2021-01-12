<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_connect.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/personSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="detailArea">
				<h4>기업별 채용정보</h4>
			</div>
			<div id="listPart">
				<select id="align">
					<option value="">정렬방식선택</option>
					<option value="wdate desc" <c:if test="${map.orderRule eq 'wdate desc'}">selected</c:if>>등록일순</option>
					<option value="u_wdate desc" <c:if test="${map.orderRule eq 'u_wdate desc'}">selected</c:if>>수정일순</option>
					<option value="biz_end_day desc" <c:if test="${map.orderRule eq 'biz_end_day desc'}">selected</c:if>>마감일순</option>
					<option value="biz_career" <c:if test="${map.orderRule eq 'biz_career'}">selected</c:if>>경력높은순</option>
					<option value="biz_career desc" <c:if test="${map.orderRule eq 'biz_career desc'}">selected</c:if>>경력낮은순</option>
					<option value="biz_ability" <c:if test="${map.orderRule eq 'biz_ability'}">selected</c:if>>학력높은순</option>
					<option value="biz_ability desc" <c:if test="${map.orderRule eq 'biz_ability desc'}">selected</c:if>>학력낮은순</option>
				</select>
				<table class="list">
					<caption>리스트</caption>
					<thead>
						<tr class="list_title">
							<th class="t_desc01">회사명</th>
							<th colspan="3" class="t_desc02">채용정보</th>
							<th class="t_desc03">마감일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${netfuConcernList.size() > 0 }">
								<c:forEach var="result" items="${netfuConcernList}" varStatus="status">
									<tr class="margin"></tr>
									<tr class="desc desc0">
										<td rowspan="3" class="desc01">${result.bizName }</td>
										<td colspan="3" class="desc02">
											<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.bizIng }', '');">
												${convert:compByte(result.bizTitle, 100, "...")}
											</a>
										</td>
										<td rowspan="3" class="desc03">${codeConvert:getRecruitStatus(result.bizIng, result.bizEndType, result.bizEndDay) }</td>
									</tr>
									
									<tr>
                      					<td><span class="desc_title">급여</span><span class="desc_desc00">${result.bizPayName }</span></td>
                      					<td><span class="desc_title">경력</span><span class="desc_desc00">${codeConvert:getBizCareer(result.bizCareer) }</span></td>
                      					<td><span class="desc_title">나이</span><span class="desc_desc00">${result.bizAge }</span></td>
                    				</tr>
                    				<tr>
                      					<td><span class="desc_title">지역</span><span class="desc_desc00">${result.bizArea1Name }</span></td>
                      					<td><span class="desc_title">학력</span><span class="desc_desc00">${codeConvert:getBizAbility(result.bizAbility) }</span></td>
                      					<td><span class="desc_title">성별</span><span class="desc_desc00">${codeConvert:getBizSex(result.bizSex) }</span></td>
                    				</tr>
									<tr class="margin"></tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="desc" style="text-align:center;height:50px;"><td colspan="6">내역이 없습니다.</td></tr>
							</c:otherwise>
						</c:choose>
					</tbody>
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

<form id="searchForm" method="post" action="/recruitByCompanyList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="personUid" id="personUid" value="" />
	<input type="hidden" name="companyUid" id="companyUid" value="${map.companyUid}" />
	<input type="hidden" name="bizIng" id="bizIng" value="yes" />
	<input type="hidden" name="no" id="no" value="" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/personSubMenu.do" />
	<input type="hidden" name="orderRule" id="orderRule" value="" />
</form>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		$(".delete a").click(function(e){
			location.href = "/fitRecruitSetting.do";
		});
		
		$("#align").on("change", function(e){
			loadingOn();
			$("#orderRule").val($("#align option:selected").val());
			$("#searchForm").submit();
		});
		
	});	
	
	
	function goDetail(companyUid, personUid, no, recruitNo, resumeNo, open, detailFlag){
		
		loadingOn();
		if("yes" != open){
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


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert"%>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert"%>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/company_connect.css" />

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/companySubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="detailArea">
				<h4>맞춤 인재정보</h4>
				<p class="delete">
					<a href="/fitResumeSetting.do" title="맞춤설정">맞춤설정</a>
				</p>
				<c:if test="${!myServiceMap.isEmpty()}">
					<table>
						<caption>이력 등록하기</caption>
						<tbody class="tabelArea">
							<tr>
								<th class="table_title">직종</th>
								<th colspan="3" class="table_desc01">
									${myServiceMap.job1Name }
									${convert:checkNull(myServiceMap.job2Name) eq '' ? '' : '>'.concat(myServiceMap.job2Name) }
									${convert:checkNull(myServiceMap.job3Name) eq '' ? '' : '>'.concat(myServiceMap.job3Name) }
									${convert:checkNull(myServiceMap.job4Name) eq '' ? '' : '<br/>'.concat(myServiceMap.job4Name) }
									${convert:checkNull(myServiceMap.job5Name) eq '' ? '' : '>'.concat(myServiceMap.job5Name) }
									${convert:checkNull(myServiceMap.job6Name) eq '' ? '' : '>'.concat(myServiceMap.job6Name) }
									${convert:checkNull(myServiceMap.job7Name) eq '' ? '' : '<br/>'.concat(myServiceMap.job7Name) }
									${convert:checkNull(myServiceMap.job8Name) eq '' ? '' : '>'.concat(myServiceMap.job8Name) }
									${convert:checkNull(myServiceMap.job9Name) eq '' ? '' : '>'.concat(myServiceMap.job9Name) }
								</th>
							</tr>
							<tr>
								<td class="table_title">근무지역</td>
								<td class="table_desc">
									${myServiceMap.areaName }
									${convert:checkNull(myServiceMap.area2Name) eq '' ? '' : '>'.concat(myServiceMap.area2Name) }
									${convert:checkNull(myServiceMap.area3Name) eq '' ? '' : '<br/>'.concat(myServiceMap.area3Name) }
									${convert:checkNull(myServiceMap.area4Name) eq '' ? '' : '>'.concat(myServiceMap.area4Name) }
									${convert:checkNull(myServiceMap.area5Name) eq '' ? '' : '<br/>'.concat(myServiceMap.area5Name) }
									${convert:checkNull(myServiceMap.area6Name) eq '' ? '' : '>'.concat(myServiceMap.area6Name) }
								</td>
								<td class="table_title">성별</td>
								<td class="table_desc">${codeConvert:getBizSex(myServiceMap.sex) }</td>
							</tr>
							<tr>
								<td class="table_title">학력</td>
								<td class="table_desc">${codeConvert:getBizAbility(myServiceMap.school) }</td>
								<td class="table_title">고용형태</td>
								<td class="table_desc">${myServiceMap.formName }</td>
							</tr>
							<tr>
								<td class="table_title">급여정도</td>
								<td class="table_desc">${myServiceMap.payTypeName }/
									${myServiceMap.payName }</td>
								<td class="table_title">경력</td>
								<td class="table_desc">${codeConvert:getBizCareerSplit(myServiceMap.career) }</td>
							</tr>
						</tbody>
					</table>
				</c:if>
			</div>
			<div id="listPart">
				<p class="listTitle">검색된 맞춤인재정보</p>
				<select id="align">
					<option value="">정렬방식선택</option>
					<option value="wdate desc"
						<c:if test="${map.orderRule eq 'wdate desc'}">selected</c:if>>등록일순</option>
					<option value="u_wdate desc"
						<c:if test="${map.orderRule eq 'u_wdate desc'}">selected</c:if>>수정일순</option>
					<option value="biz_end_day desc"
						<c:if test="${map.orderRule eq 'biz_end_day desc'}">selected</c:if>>마감일순</option>
					<option value="biz_career"
						<c:if test="${map.orderRule eq 'biz_career'}">selected</c:if>>경력높은순</option>
					<option value="biz_career desc"
						<c:if test="${map.orderRule eq 'biz_career desc'}">selected</c:if>>경력낮은순</option>
					<option value="biz_ability"
						<c:if test="${map.orderRule eq 'biz_ability'}">selected</c:if>>학력높은순</option>
					<option value="biz_ability desc"
						<c:if test="${map.orderRule eq 'biz_ability desc'}">selected</c:if>>학력낮은순</option>
				</select>
				<table class="list">
					<tbody>
						<tr class="list_title">
							<th class="desc01">이름</th>
							<th class="desc02">이력서</th>
							<th class="desc03">최종학력</th>
							<th class="desc04">경력</th>
						</tr>
						<c:choose>
							<c:when test="${myServiceResumeList.size() > 0 }">
								<c:forEach var="result" items="${myServiceResumeList}"
									varStatus="status">
									<tr class="desc">
										<td class="desc01">
											<c:choose>
												<c:when test='${SE_SERVICE2 eq "Y" and SE_VIEW_COUNT > 0}'>
													${result.name }
												</c:when>
												<c:otherwise>
													${convert:getPersonNameHidden(result.name) }
												</c:otherwise>
											</c:choose>
										</td>
										<td class="desc02"><a
											href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.no }', '${result.inidSecret }', 'resume');">${convert:compByte(result.inidTitle, 80, "...")}</a>
										</td>
										<td class="desc03">${codeConvert:getLastSchool(result.inidLastSchool) }</td>
										<td class="desc04">${codeConvert:getTotalCareer(result.inidCareer) }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" style="text-align: center; height: 80px;">내역이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<ul class="numArea">${pageMap.pageHtml }
				</ul>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />

<form id="searchForm" name="searchForm" method="post"
	action="/fitResumeList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="personUid" id="personUid" value="" /> <input
		type="hidden" name="companyUid" id="companyUid" value="" /> <input
		type="hidden" name="no" id="no" value="" /> <input type="hidden"
		name="recruitNo" id="recruitNo" value="" /> <input type="hidden"
		name="resumeNo" id="resumeNo" value="" /> <input type="hidden"
		name="leftMenuUrl" id="leftMenuUrl" value="/companySubMenu.do" /> <input
		type="hidden" name="orderRule" id="orderRule" value="" />
</form>

<script type="text/javascript">
	$(document).ready(function() {

		$("#align").on("change", function(e) {
			loadingOn();
			$("#orderRule").val($("#align option:selected").val());
			$("#searchForm").submit();
		});

	});

	function goDetail(companyUid, personUid, no, recruitNo, resumeNo, open,
			detailFlag) {

		loadingOn();

		if ("no" != open) {
			alert("현재 비공개 상태로 설정되어 있습니다.");
			loadingOff();

		} else {
			$("#companyUid").val(companyUid);
			$("#personUid").val(personUid);
			$("#no").val(no);
			$("#recruitNo").val(recruitNo);
			$("#resumeNo").val(resumeNo);
			$("#searchForm").attr("action", "/resumeDetail.do");
			$("#searchForm").submit();
		}
	}
</script>
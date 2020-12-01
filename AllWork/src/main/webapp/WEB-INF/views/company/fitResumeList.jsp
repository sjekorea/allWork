<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/company_connect.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/companySubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="detailArea">
				<h4>맞춤 인재정보</h4>
				<p class="delete"><a href="#none" title="맞춤설정">맞춤설정</a></p>
				<div class="tableArea">
					<p class="table_title">직종</p>
					<p class="table_desc table_desc01">
						${myServiceMap.job1Name } 
						${convert:checkNull(myServiceMap.job2Name) eq '' ? '' : '>'.concat(myServiceMap.job2Name) }
						${convert:checkNull(myServiceMap.job3Name) eq '' ? '' : '>'.concat(myServiceMap.job3Name) }
						${convert:checkNull(myServiceMap.job4Name) eq '' ? '' : '<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.concat(myServiceMap.job4Name) }
						${convert:checkNull(myServiceMap.job5Name) eq '' ? '' : '>'.concat(myServiceMap.job5Name) }
						${convert:checkNull(myServiceMap.job6Name) eq '' ? '' : '>'.concat(myServiceMap.job6Name) }
						${convert:checkNull(myServiceMap.job7Name) eq '' ? '' : '<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.concat(myServiceMap.job7Name) }
						${convert:checkNull(myServiceMap.job8Name) eq '' ? '' : '>'.concat(myServiceMap.job8Name) }
						${convert:checkNull(myServiceMap.job9Name) eq '' ? '' : '>'.concat(myServiceMap.job9Name) }
					</p>
					<p class="table_title">근무지역</p>
					<p class="table_desc">
						${myServiceMap.areaName }
						${convert:checkNull(myServiceMap.area2Name) eq '' ? '' : '>'.concat(myServiceMap.area2Name) }
						${convert:checkNull(myServiceMap.area3Name) eq '' ? '' : '<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.concat(myServiceMap.area3Name) }
						${convert:checkNull(myServiceMap.area4Name) eq '' ? '' : '>'.concat(myServiceMap.area4Name) }
						${convert:checkNull(myServiceMap.area5Name) eq '' ? '' : '<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.concat(myServiceMap.area5Name) }
						${convert:checkNull(myServiceMap.area6Name) eq '' ? '' : '>'.concat(myServiceMap.area6Name) }
					</p>
					<p class="table_title">성별</p>
					<p class="table_desc">${codeConvert:getBizSex(myServiceMap.sex) }</p>
					<p class="table_title">학력</p>
					<p class="table_desc">${codeConvert:getBizAbility(myServiceMap.school) }</p>
					<p class="table_title">고용형태</p>
					<p class="table_desc">${myServiceMap.formName }</p>
					<p class="table_title">급여정도</p>
					<p class="table_desc">${myServiceMap.payTypeName } / ${myServiceMap.payName }</p>
					<p class="table_title">경력</p>
					<p class="table_desc">${codeConvert:getBizCareerSplit(myServiceMap.career) }</p>
				</div>
			</div>
			<div id="listPart">
				<p class="listTitle">검색된 맞춤인재정보</p>
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
				<ul class="list">
					<li class="list_title">
						<div class="desc01">이름</div>
						<div class="desc02">이력서</div>
						<div class="desc03">경력</div>
						<div class="desc04">희망급여</div>
					</li>
					<c:choose>
						<c:when test="${myServiceResumeList.size() > 0 }">
							<c:forEach var="result" items="${myServiceResumeList}" varStatus="status">
								<li>
									<div class="desc">
										<p class="desc01">${result.name }</p>
										<p class="desc02">
										<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.no }', '${result.inidSecret }', 'resume');">${convert:compByte(result.inidTitle, 80, "...")}</a>
										</p>
										<p class="desc03">${codeConvert:getLastSchool(result.inidLastSchool) }</p>
										<p class="desc04">${codeConvert:getTotalCareer(result.inidCareer) }</p>
									</div>
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li style="width:100%;"><div class="desc01">내역이 없습니다.</div></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<ul class="numArea">
					${pageMap.pageHtml }
				</ul>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />

<form id="searchForm" name="searchForm" method="post" action="/fitResumeList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="personUid" id="personUid" value="" />
	<input type="hidden" name="companyUid" id="companyUid" value="" />
	<input type="hidden" name="no" id="no" value="" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/companySubMenu.do" />
	<input type="hidden" name="orderRule" id="orderRule" value="" />
</form>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		$(".delete a").click(function(e){
			location.href = "/fitResumeSetting.do";
		});
		
		$("#align").on("change", function(e){
			loadingOn();
			$("#orderRule").val($("#align option:selected").val());
			$("#searchForm").submit();
		});
		
	});	
	
	
	function goDetail(companyUid, personUid, no, recruitNo, resumeNo, open, detailFlag){
		
		loadingOn();
		
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
</script>
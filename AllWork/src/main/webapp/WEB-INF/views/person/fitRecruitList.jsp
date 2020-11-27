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
				<h4>맞춤채용정보</h4>
				<p class="delete"><a href="#" title="맞춤설정">맞춤설정</a></p>
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
				<p class="listTitle">검색된 맞춤채용정보</p>
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
						<div class="desc01">회사명</div>
						<div class="desc02">채용정보</div>
						<div class="desc03">마감일</div>
					</li>
					<c:choose>
						<c:when test="${myServiceRecruitList.size() > 0 }">
							<c:forEach var="result" items="${myServiceRecruitList}" varStatus="status">
								<li>
									<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.open }', '');">
										<p class="title">${result.bizName }</p>
										<div class="desc">
											<p class="desc0">${convert:compByte(result.bizTitle, 100, "...")}</p>
											<p class="desc1"><strong>급여 </strong>${result.bizPayName }</p>
											<p class="desc2"><strong>경력 </strong>${codeConvert:getBizCareer(result.bizCareer) }</p>
											<p class="desc3"><strong>나이 </strong>${result.bizAge }</p>
											<p class="desc1"><strong>지역 </strong>${result.bizArea1Name }</p>
											<p class="desc2"><strong>학력 </strong>${codeConvert:getBizAbility(result.bizAbility) }</p>
											<p class="desc3"><strong>성별 </strong>${codeConvert:getBizSex(result.bizSex) }</p>
										</div>
										${codeConvert:getRecruitStatus(result.bizIng, result.bizEndType, result.bizEndDay) }
									</a>
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li style="width:100%;"><p class="title">내역이 없습니다.</p></li>
						</c:otherwise>
					</c:choose>
				</ul>
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

<form id="searchForm" method="post" action="/fitRecruitList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="personUid" id="personUid" value="" />
	<input type="hidden" name="companyUid" id="companyUid" value="" />
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


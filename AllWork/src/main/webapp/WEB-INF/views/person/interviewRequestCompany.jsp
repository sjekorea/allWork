<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_interview.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/personSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="listPart">
				<h4>면접요청기업</h4>
				<p class="comment"></p>
				<ul class="list">
					<li class="list_title">
						<div class="desc01">회사명</div>
						<div class="desc02">채용정보</div>
						<div class="desc03">마감일</div>
					</li>
					<c:choose>
						<c:when test="${list.size() > 0 }">
							<c:forEach var="result" items="${list}" varStatus="status">
								<li>
									<div class="desc01">
										<a href="#none" title="회사명"><p>${result.bizName }</p></a>
									</div>
									<div class="desc02">
										<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.open }', '');" title="채용공고">
											<p>${convert:compByte(result.bizTitle, 100, "...")}</p>
										</a>
									</div>
									<div class="desc03">
										<p>${codeConvert:getRecruitStatusTextShort(result.bizIng, result.bizEndType, result.bizEndDay) }</p>
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

<form id="searchForm" name="searchForm" method="post" action="/interviewRequestCompanyList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="personUid" id="personUid" value="" />
	<input type="hidden" name="companyUid" id="companyUid" value="" />
	<input type="hidden" name="no" id="no" value="" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/personSubMenu.do" />
</form>

<script type="text/javascript">
	
	$(document).ready(function(){
		
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

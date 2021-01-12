<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/company_recruitmentEnd.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/companySubMenu.do"/>
		</div>
		<div id="rightPart">
			<div id="listPart">
				<h4>마감된 채용정보</h4>
				<ul class="align">
					<li><a href="#" title="등록일순">등록일순&nbsp;&nbsp;|&nbsp;</a></li>
					<li><a href="#" title="등록일순">수정일순&nbsp;&nbsp;|&nbsp;</a></li>
					<li><a href="#" title="등록일순">마감일순</a></li>
				</ul>
				<ul class="lists">
					<c:choose>
						<c:when test="${recruitList.size() > 0 }">
							<c:forEach var="result" items="${recruitList}" varStatus="status">
								<li>
									<p class="state">모집마감</p>
									<div class="desc">
										<p class="desc0"><a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.bizIng }', '');" title="모집공고타이틀">${result.bizTitle }</a></p>
										<div class="desc1">
											<span>${codeConvert:getRecruitStatusText(result.bizIng, result.bizEndType, result.bizEndDay) }</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
											<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.bizIng }', '');" title="공고보기"><span>공고보기</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
											<%-- <a href="javascript:copyRecruit('${result.no }');" title="복사"><span>복사</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; --%>
											<c:choose>
												<c:when test="${result.bizIng eq 'yes' }">
													<a href="javascript:updateBizIng('${result.no }', 'no');" title="비공개"><span>비공개</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
												</c:when>
												<c:otherwise>
													<a href="javascript:updateBizIng('${result.no }', 'yes');" title="공개"><span>공개</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
												</c:otherwise>
											</c:choose>
											<a href="javascript:updateRecruit('${result.no }');" title="수정"><span>수정</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
											<a href="javascript:deleteRecruit('${result.no }');" title="삭제"><span>삭제</span></a>
										</div>
										<div class="desc2">
											<a href="/companyApplicantList.do" title="전체 지원자" class="total">전체 지원자<span>${result.totalApplianceCnt }</span></a>
											<!-- 
											<a href="/companyApplicantList.do" title="전체 지원자" class="total">전체 지원자<span>${result.totalApplianceCnt }</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
											<a href="#" title="미열람">미열람<span>11</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
											<a href="#" title="열람">열람<span>0</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;>
											<a href="#" title="서류합격">서류합격<span>0</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
											<a href="#" title="불합격">불합격<span>0</span></a>
											 -->
										</div>
									</div>
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li style="width:100%;"><div class="desc01" style="text-align:center;">내역이 없습니다.</div></li>
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

<form id="searchForm" name="searchForm" method="post" action="/recruitListClosed.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="personUid" id="personUid" value="${map.personUid}" />
	<input type="hidden" name="companyUid" id="companyUid" value="${map.companyUid}" />
	<input type="hidden" name="no" id="no" value="" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="bizIng" id="bizIng" value="${map.bizIng}" />
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/companySubMenu.do" />
	
	<input type="hidden" name="orderField" id="orderField" value="${map.orderField }"/>
	<input type="hidden" name="orderRule" id="orderRule" value="${map.orderRule }"/>
	<input type="hidden" name="orderRuleWdate" id="orderRuleWdate" value="${map.orderRuleWdate }"/>
	<input type="hidden" name="orderRuleUwdate" id="orderRuleUwdate" value="${map.orderRuleUwdate }"/>
	<input type="hidden" name="orderRuleBizEndDay" id="orderRuleBizEndDay" value="${map.orderRuleBizEndDay }"/>
</form>

<script type="text/javascript">

	$(document).ready(function(){
		
		$(".align a").on("click", function(e){
			
			var idx = $(this).parent().index();
			var orderRuleWdate = $("#orderRuleWdate").val();
			var orderRuleUwdate = $("#orderRuleUwdate").val();
			var orderRuleBizEndDay = $("#orderRuleBizEndDay").val();
			
			switch(idx){
				case 0 : 
					$("#orderField").val("nic.wdate");
					orderRuleWdate = (orderRuleWdate == "desc") ? "" : "desc";
					$("#orderRuleWdate").val(orderRuleWdate);
					$("#orderRule").val(orderRuleWdate);
					break;
				case 1 : 
					$("#orderField").val("nic.u_wdate");
					orderRuleUwdate = (orderRuleUwdate == "desc") ? "" : "desc";
					$("#orderRuleUwdate").val(orderRuleUwdate);
					$("#orderRule").val(orderRuleUwdate);
					break;
				case 2 : 
					$("#orderField").val("nic.biz_end_day");
					orderRuleBizEndDay = (orderRuleBizEndDay == "desc") ? "" : "desc";
					$("#orderRuleBizEndDay").val(orderRuleBizEndDay);
					$("#orderRule").val(orderRuleBizEndDay);
					break;
				default : 
					$("#orderField").val("nic.wdate");
					$("#orderRule").val("desc");
					break;
			}
			loadingOn();
			$("#searchForm").submit();
		});
	});	
	
	
	function updateBizIng(no, bizIng){
		

		loadingOn();
		var callback = function(data){
			alert("설정 되었습니다.");
			$("#personUid").val("");
			$("#companyUid").val("");
			$("#pageNo").val("");
			$("#searchForm").submit();
		};
		var param = {
					bizIng : bizIng
					, no : no
				};
		ajax('post', '/updateNetfuItemCompanyBizIng.ajax', param, callback);
	}
	
	function updateRecruit(no){
		
		$("#no").val(no);
		$("#recruitNo").val(no);
		$("#searchForm").attr("action", "/recruitInfoUpt.do");
		$("#searchForm").submit();
	}

	function deleteRecruit(no){
		//채용공고 삭제에 대한 사용자 확인.
		if(!confirm("채용공고를 삭제할까요?")) return;

		//채용공고 삭제.
		var callback = function(data){
			alert("저장 되었습니다.");
			$("#personUid").val("");
			$("#companyUid").val("");
			$("#pageNo").val("");
			$("#searchForm").submit();
		};
		var param = {
					no : no
				};
		ajax('post', '/deleteRecruitInfo.ajax', param, callback);
	}
	
	
	function goDetail(companyUid, personUid, no, recruitNo, resumeNo, open, detailFlag){
		
		loadingOn();
			
		$("#companyUid").val(companyUid);
		$("#personUid").val(personUid);
		$("#no").val(no);
		$("#recruitNo").val(recruitNo);
		$("#resumeNo").val(resumeNo);
		$("#searchForm").attr("action", "/recruitDetail.do");
		$("#searchForm").submit();
	}
</script>
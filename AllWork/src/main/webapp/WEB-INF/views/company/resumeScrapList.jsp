<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/company_scrap.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/companySubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="listPart">
				<h4>스크랩 인재</h4>
				<p class="delete"><a href="#none" title="선택삭제">선택삭제</a></p>
				<ul class="list">
					<li class="list_title">
						<div class="desc00"><input type="checkbox" name="all"/></div>
						<div class="desc01"></div>
						<div class="desc02">이름/나이</div>
						<div class="desc03">학력/경력</div>
						<div class="desc04">이력서</div>
						<div class="desc05">스크랩일</div>
					</li>
					<c:choose>
						<c:when test="${resumeScrapList.size() > 0 }">
							<c:forEach var="result" items="${resumeScrapList}" varStatus="status">
								<li>
									<div class="desc00"><input type="checkbox" name="chk" value="${result.noTo }" /></div>
									<div class="desc01"><img src="/img/company_home/img00.jpeg" alt="인재사진"/></div>
									<div class="desc02">
										<p class="t_desc01">${result.name }</p>
										<p class="t_desc02"><span>${codeConvert:getBizSex(result.sex)}</span>&nbsp;<span>${convert:calcAge(result.birth)}</span>세</p>
									</div>
									<div class="desc03">
										<p class="t_desc01">${codeConvert:getLastSchool(result.inidLastSchool) }</p>
										<p class="t_desc02">${codeConvert:getTotalCareer(result.inidCareer) }</p>
									</div>
									<div class="desc04">
										<a href="#none" title="채용공고">
											<p class="t_desc01"><a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.no }', '${result.inidSecret }', 'resume');">${convert:compByte(result.inidTitle, 80, "...")}</a></p>
										</a>
									</div>
									<div class="desc05">
										<p class="scrap_day">${result.wdate }</p>
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

<form id="searchForm" name="searchForm" method="post" action="/resumeScrapList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="personUid" id="personUid" value="" />
	<input type="hidden" name="companyUid" id="companyUid" value="" />
	<input type="hidden" name="no" id="no" value="" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/companySubMenu.do" />
</form>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		$(".list_title .desc00 input[type=checkbox]").click(function(e){
			if($(this).prop("checked")) {  
				$("input[type=checkbox]").prop("checked",true); 
			} else { 
				$("input[type=checkbox]").prop("checked",false); 
			}
		});
		
		$(".delete a").click(function(e){
			deleteRecruitScrap();
		});
		
	});	
	
	
	function deleteRecruitScrap(){
		
		if($("input[name=chk]:checked").length <= 0){
			alert("삭제할 항목을 선택하세요.");
			return;
		}
		
		var deleteItemMulti = "";
		
		$("input[name=chk]").each(function() {
		      if(this.checked){
		    	  deleteItemMulti += this.value+",";
		      }
		});
		deleteItemMulti = deleteItemMulti.substring(0, deleteItemMulti.length-1);
		$("#progress_barWrap").css("display", "block");
		var callback = function(data){
			alert("저장 되었습니다.");
			$("#searchForm #pageNo").val("1");
			$("#searchForm").submit();
		};
		var param = {
					deleteItemMulti : deleteItemMulti
				};
		ajax('post', '/deleteRecruitScrapMulti.ajax', param, callback);
	}
	
	
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


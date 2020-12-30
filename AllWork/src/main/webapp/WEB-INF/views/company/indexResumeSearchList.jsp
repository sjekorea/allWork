<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/company_home.css"/>

<div id="containerWrap">
	<div id="rightPart" style="width:100%;">
		<div id="listPart">
			<ul class="tab">
				<li><a class="selected" href="#" title="">AI 통합 검색 인재 정보</a></li>
			</ul>
			<table class="list" id="list01" style="width:100%;">
				<tbody class="tabelArea">
					<c:choose>
						<c:when test="${myServiceResumeList.size() > 0 }">
							<c:forEach var="result" items="${myServiceResumeList}" varStatus="status">
								<tr>
									<td class="desc00">
										<span>${result.name }</span><br/>
										<span>${codeConvert:getBizSex(result.sex)}/${codeConvert:getBirthYear(result.birth)}년생</span><br/>
										<span>${codeConvert:getLastSchool(result.inidLastSchool) }</span>
									</td>
									<td class="desc01">
										<a href="#none">
											<span class="desc01_01">
												${result.inidType1Name }
												${convert:checkNull(result.inidType2Name) eq '' ? '' : '&nbsp;>&nbsp;'.concat(result.inidType2Name) }
												${convert:checkNull(result.inidType3Name) eq '' ? '' : '&nbsp;>&nbsp;'.concat(result.inidType3Name) }
											</span>
										</a>
									</td>
									<td class="desc02">
										<span>
											${result.inidArea1Name }
											${convert:checkNull(result.inidArea2Name) eq '' ? '</span>' : '&nbsp;>&nbsp;'.concat(result.inidArea2Name).concat('</span>') }
											${convert:checkNull(result.inidArea3Name) eq '' ? '</span>' : '<br/><span>'.concat(result.inidArea3Name) }
											${convert:checkNull(result.inidArea4Name) eq '' ? '</span>' : '&nbsp;>&nbsp;'.concat(result.inidArea4Name).concat('</span>') }
											${convert:checkNull(result.inidArea5Name) eq '' ? '</span>' : '<br/><span>'.concat(result.inidArea5Name) }
											${convert:checkNull(result.inidArea6Name) eq '' ? '</span>' : '&nbsp;>&nbsp;'.concat(result.inidArea6Name).concat('</span>') }
									</td>
									<td class="desc03">
										<span>${result.inidJobformName }</span><br/>
										<span>${result.inidPayName }</span>
									</td>
									<td class="date">${result.wdate }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td class="desc00" colspan="5">내역이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
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
		}else{
			
			if("open" != open){
				alert("현재 비공개 상태로 설정되어 있습니다.");
				loadingOff();
		
			}else{
				
				$("#companyUid").val(companyUid);
				$("#personUid").val(personUid);
				$("#no").val(no);
				$("#recruitNo").val(recruitNo);
				$("#resumeNo").val(resumeNo);
				$("#searchForm").attr("action", "/recruitDetail.do");
				$("#searchForm").submit();
			}
		}
	}
</script>


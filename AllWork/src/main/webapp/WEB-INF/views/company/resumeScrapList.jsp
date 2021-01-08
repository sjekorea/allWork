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
				<table class="list">
					<caption>리스트</caption>
					<tbody>
						<tr class="list_title">
							<th class="desc00"><input type="checkbox" name="all"/></th>
							<th class="desc01"></th>
							<th class="desc02">이름/나이</th>
							<th class="desc03">학력/경력</th>
							<th class="desc04">이력서</th>
							<th class="desc05">스크랩일</th>
						</tr>
						<c:choose>
							<c:when test="${resumeScrapList.size() > 0 }">
								<c:forEach var="result" items="${resumeScrapList}" varStatus="status">
									<tr class="desc">
										<td class="desc00"><input type="checkbox" name="chk" value="${result.noTo }" /></td>
										<td class="desc01"><img src="img/userNo.png" alt="인재사진"/></td>
										<td class="desc02">
											${convert:getPersonNameHidden(result.name) }<br/>
											${codeConvert:getBizSex(result.sex)}</span>&nbsp;<span>${convert:calcAge(result.birth)}</span>
										</td>
										<td class="desc03">
											${codeConvert:getLastSchool(result.inidLastSchool) }<br/>
											${codeConvert:getTotalCareer(result.inidCareer) }
										</td>
										<td class="desc04">
											<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.no }', '${result.inidSecret }', 'resume');">${convert:compByte(result.inidTitle, 80, "...")}</a>
										</td>
										<td class="desc05">
											${result.wdate }
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="desc"><td colspan="6">내역이 없습니다.</div></li>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
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


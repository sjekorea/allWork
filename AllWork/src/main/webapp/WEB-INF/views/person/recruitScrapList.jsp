<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_scrap.css"/>
<style type="text/css">
	#menuTree ul .subMenu03_01{text-decoration: underline;}
</style>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/personSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="listPart">
				<h4>스크랩</h4>
				<p class="delete">
					<a href="#" title="선택삭제">선택삭제</a>
				</p>
				<table class="list">
					<caption>리스트</caption>
					<tbody>
						<tr class="list_title">
							<th class="desc00"><input type="checkbox" name="all"/></th>
							<th class="desc01">회사명</th>
							<th class="desc02">채용공고</th>
							<th class="desc03">마감일</th>
							<th class="desc04">스크랩일</th>
						</tr>
						<c:choose>
							<c:when test="${recruitScrapList.size() > 0 }">
								<c:forEach var="result" items="${recruitScrapList}" varStatus="status">
									<tr class="desc">
										<td class="desc00"><input type="checkbox" name="chk" value="${result.noTo }" /></td>
										<td class="desc01">
											${result.bizName }&nbsp;<a href="javascript:goConcernRegist('${result.no }', '${result.uid }');" title="관심기업체크"><i class="fas fa-heart"></i></a>
										</td>
										<td class="desc02">
											<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.bizIng }', '');" title="채용공고">
												${convert:compByte(result.bizTitle, 100, "...")}
											</a>
										</td>
										<td class="desc03">${codeConvert:getRecruitStatusText(result.bizIng, result.bizEndType, result.bizEndDay) }</td>
										<td class="desc04">${result.wdate }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="desc"><td colspan="5">내역이 없습니다.</tr></td>
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

		loadingOn();
		
		var callback = function(data){
			loadingOff();
			alert("항목을 삭제했습니다.");
			$("#searchForm #pageNo").val("1");
			$("#searchForm").submit();
		};
		var param = {
					deleteItemMulti : deleteItemMulti
				};
		ajax('post', '/deleteRecruitScrapMulti.ajax', param, callback);
	}
	
	
	function goDetail(companyUid, personUid, no, recruitNo, resumeNo, bizIng, detailFlag){
		
		loadingOn();
		//if("yes" != bizIng){
		//	alert("채용을 마감했습니다.");
		//	loadingOff();
		//}else{
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
		//}
	}
	
	// 관심기업 등록
	function goConcernRegist(companyNo, companyUid){
		//if($("#resumeCnt").val() <= 0){
		//	alert("이력서를 먼저 작성해 주세요");
		//	return;
		//}else{
			loadingOn();
			var callback = function(data){
				alert("관심기업을 등록했습니다.");
				$("#concernCnt").val(data.rstCnt);
				loadingOff();
			};
			
			var param = {
						no : companyNo
						, type : "job"
						, subType : "company"
						, uid : "${SE_LOGIN_ID}"
						, rUid : companyUid
					};
			ajax('post', '/registNetfuConcern.ajax', param, callback);
		//}
	}
</script>




<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/companyHeader.do"/>

<link rel="stylesheet" type="text/css" href="/css/company_support.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/companySubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="listPart">
				<h4>입사지원자 관리</h4>
				<p class="listTotal">입사지원자관리 총<span>${totalSize }</span>명</p>
				<select id="selRecruitNo" name="selRecruitNo" onchange="javascript:goList();">
					<option value="">진행중인 채용공고</option>
					<c:choose>
						<c:when test="${recruitList.size() > 0 }">
							<c:forEach var="result" items="${recruitList}" varStatus="status">
								<option value="${result.no }" <c:if test="${result.no eq map.recruitNo }">selected</c:if>>${result.bizTitle }</option>
							</c:forEach>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</select>
				<p class="delete"><a href="#" title="선택삭제">선택삭제</a></p>
				<table class="list">
					<caption>리스트</caption>
					<tbody>
						<tr class="list_title">
							<th class="desc00"><input type="checkbox" name="all"/></th>
							<th class="desc01"></th>
							<th class="desc02">이름</th>
							<th class="desc03">이력서</th>
							<th class="desc04">스크랩일</th>
						</tr>
						<c:choose>
							<c:when test="${list.size() > 0 }">
								<c:forEach var="result" items="${list}" varStatus="status">
									<tr class="desc">
										<td class="desc00"><input type="checkbox" name="chk" value="${result.no }" /></td>
										<td class="desc01"><img src="img/userNo.png" alt="인재사진"/></td>
										<td class="desc02">${result.name }</td>
										<td class="desc03">
											<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.no }', '${result.inidSecret }', 'resume');">
												<p class="t_desc01">${result.inidTitle}</p>
											</a>
										</td>
										<td class="desc04">${result.wdate }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="desc"><td colspan="5">내역이 없습니다.</div></li>
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

<form id="searchForm" name="searchForm" method="post" action="/companyApplicantList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="personUid" id="personUid" value=""${map.personUid} />
	<input type="hidden" name="companyUid" id="companyUid" value="${map.companyUid}" />
	<input type="hidden" name="no" id="no" value="${map.no}" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="${map.resumeNo}" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="${map.recruitNo}" />
	<input type="hidden" name="applyType" id="applyType" value="${map.applyType}" />
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
			deleteApply();
		});
	});	

	
	function goDetail(companyUid, personUid, no, recruitNo, resumeNo, open, detailFlag){
		loadingOn();
		$("#companyUid").val(companyUid);
		$("#personUid").val(personUid);
		$("#no").val(no);
		$("#recruitNo").val(recruitNo);
		$("#resumeNo").val(resumeNo);
		
		if(detailFlag == "recruit"){
			$("#searchForm").attr("action", "/recruitDetail.do");	
		}else{
			$("#searchForm").attr("action", "/resumeDetail.do");
		}
		
		$("#searchForm").submit();
	}
	
	
	function deleteApply(){
		
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
			alert("저장 되었습니다.");
			$("#pageNo").val("1");
			$("#searchForm").submit();
		};
		var param = {
					deleteItemMulti : deleteItemMulti
				};
		ajax('post', '/deleteApplyMulti.ajax', param, callback);
	}
	
	function goList(){
		loadingOn();
		$("#recruitNo").val($("#selRecruitNo option:selected").val());
		$("#pageNo").val(1);
		$("#searchForm").submit();
	}
	
</script>

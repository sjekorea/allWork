<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/resume_list.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/personSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="listPart">
				<h4>이력서 목록</h4>
				<p class="upload"><a href="/resumeInfoReg.do" title="이력서등록">이력서등록</a></p>
				<p class="delete"><a href="javascript:deleteResume();" title="선택삭제">선택삭제</a></p>
				<table class="list">
					<caption>리스트</caption>
					<tbody>
						<tr class="list_title">
							<th class="desc00"><input type="checkbox" name="all" id="all"/></th>
							<th class="desc01">이력서</th>
							<th class="desc02">등록일</th>
							<th class="desc03">공개</th>
							<th class="desc04">비공개</th>
							<th class="desc05">이력서 수정</th>
						</tr>
						<c:choose>
							<c:when test="${resumeList.size() > 0 }">
								<c:forEach var="result" items="${resumeList}" varStatus="status">
									<tr class="desc">
										<td class="desc00"><input type="checkbox" name="chk" value="${result.no }" /></td>
										<td class="desc01">
										<!-- 
										<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.no }', '${result.inidSecret }', 'resume');">
										 -->
										<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.no }', 'no', 'resume');">
											${result.inidTitle }
										</a>
										</td>
										<td class="desc02">${result.wdate }</td>
										<td class="desc03"><input type="radio" id="inidSecretRadio${result.no }" name="inidSecretRadio${result.no }" value="no" <c:if test="${result.inidSecret ne 'yes' }">checked</c:if> onclick="javascript:updateSecret('${result.no}');"/></td>
										<td class="desc04"><input type="radio" id="inidSecretRadio${result.no }" name="inidSecretRadio${result.no }" value="yes" <c:if test="${result.inidSecret eq 'yes' }">checked</c:if> onclick="javascript:updateSecret('${result.no}');"/></td>
										<td class="desc05"><a href="javascript:updateResume('${result.no }');" title="수정">수정하기</a></td>
										<input type="hidden" name="inidSecret" id="inidSecret" value="${result.inidSecret}" />
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="desc"><td colspan="5" style="width:100%; height;50px;">내역이 없습니다.</div></li>
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

<form id="searchForm" name="searchForm" method="post" action="/resumeList.do">
	<input type="hidden" name="no" id="no" value="" />
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="personUid" id="personUid" value="${map.personUid}" />
	<input type="hidden" name="companyUid" id="companyUid" value="${map.companyUid}" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="orderField" id="orderField" value="${map.orderField }"/>
	<input type="hidden" name="orderRule" id="orderRule" value="${map.orderRule }"/>
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/personSubMenu.do" />
</form>

<script type="text/javascript">

$(document).ready(function(){
	
	$("#all").click(function(e){
		if($(this).prop("checked")) {  
			$("input[type=checkbox]").prop("checked",true); 
		} else { 
			$("input[type=checkbox]").prop("checked",false); 
		}
	});
	
	$(".delete a").click(function(e){
		deleteRecruitResume();
	});
});	


	function updateSecret(no){
	
		var inidSecret = $("input[name=inidSecretRadio"+no+"]:checked").val(); 

		loadingOn();
		var callback = function(data){
			alert("설정 되었습니다.");
			$("#personUid").val("");
			$("#companyUid").val("");
			$("#pageNo").val("");
			$("#searchForm").submit();
		};
		var param = {
					inidSecret : inidSecret
					, no : no
				};
		ajax('post', '/updateNetfuItemResumeSecret.ajax', param, callback);
	}


	function deleteResume(){
		
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
		
		var callback = function(data){
			alert("항목을 삭제했습니다.");
			$("#personUid").val("");
			$("#companyUid").val("");
			$("#pageNo").val("");
			$("#searchForm").submit();
		};
		var param = {
					deleteItemMulti : deleteItemMulti
				};
		ajax('post', '/deleteResumeMulti.ajax', param, callback);
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
	
	
	function updateResume(no){
		
		$("#no").val(no);
		$("#resumeNo").val(no);
		$("#searchForm").attr("action", "/resumeInfoUpt.do");
		$("#searchForm").submit();
	}

</script>

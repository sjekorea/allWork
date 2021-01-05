<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_interest.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/personSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="listPart">
				<h4>관심기업</h4>
				<p class="delete">
					<a href="#none" title="선택삭제">선택삭제</a>
				</p>
				<table class="list">
					<caption>리스트</caption>
					<tbody>
						<tr class="list_title">
							<th class="desc00"><input type="checkbox" name="all"/></th>
							<th class="desc01">회사명</th>
							<th class="desc02">진행중인 공고</th>
							<th class="desc03">채용소식 알람</th>
						</tr>
						<c:choose>
							<c:when test="${netfuConcernList.size() > 0 }">
								<c:forEach var="result" items="${netfuConcernList}" varStatus="status">
									<tr class="desc">
										<td class="desc00"><input type="checkbox" name="chk" value="${result.rUid }" /></td>
										<td class="desc01">
											<a href="javascript:goRecruitList('${result.rUid }');">${result.bizName }</a>
										</td>
										<td class="desc02">
											<a href="javascript:goRecruitList('${result.rUid }');">채용중 <span>${result.bizIngCnt }</span>건</a>
										</td>
										<td class="desc03"><input type="radio"/></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="desc"><td colspan="4">내역이 없습니다.</td></tr>
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
<form id="searchForm" name="searchForm" method="post" action="/interestCompanyList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="rUid" id="rUid" value="" />
	<input type="hidden" name="companyUid" id="companyUid" value="" />
	<input type="hidden" name="bizIng" id="bizIng" value="" />
</form>
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".delete a").click(function(e){
			deleteConcern();
		});
			
	});	
	
	function deleteConcern(){
		
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
		ajax('post', '/deleteNetfuConcernMulti.ajax', param, callback);
	}
	
	function goRecruitList(companyUid){
		loadingOn();
		$("#companyUid").val(companyUid);
		$("#bizIng").val("no");
		$("#pageNo").val("");
		$("#searchForm").attr("action", "/recruitByCompanyList.do");
		$("#searchForm").submit();
		
	}
</script>


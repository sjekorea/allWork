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
				<ul class="list">
					<li class="list_title">
						<div class="desc00">
							<input type="checkbox" />
						</div>
						<div class="desc01">회사명</div>
						<div class="desc02">진행중인 공고</div>
						<div class="desc03">채용소식 알람</div>
					</li>
					<c:choose>
						<c:when test="${netfuConcernList.size() > 0 }">
							<c:forEach var="result" items="${netfuConcernList}" varStatus="status">
								<li>
									<div class="desc00"><input type="checkbox" name="chk" value="${result.rUid }" /></div>
									<div class="desc01"><a href="javascript:goRecruitList('${result.rUid }', 'yes');"><p>${result.bizName }</p></a></div>
									<div class="desc02"><a href="javascript:goRecruitList('${result.rUid }', '');"><p>채용중 <span>${result.bizIngCnt }</span>건</p></a></div>
									<div class="desc03"><p><input type="radio" /></p></div>
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
	
	function goRecruitList(companyUid, bizIng){
		loadingOn();
		$("#companyUid").val(companyUid);
		$("#bizIng").val(bizIng);
		$("#pageNo").val("");
		$("#searchForm").attr("action", "/recruitByCompanyList.do");
		$("#searchForm").submit();
		
	}
</script>


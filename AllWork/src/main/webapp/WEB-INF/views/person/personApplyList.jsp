<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_apply.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/personSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="listPart">
				<h4>입사지원 현황</h4>
				<ul class="tab">
					<!-- 
					<li><a class="selected" href="#none" title="온라인 입사지원">온라인 입사지원</a></li>
					<li><a href="#" title="이메일 입사지원">이메일 입사지원</a></li>
					<li><a href="#" title="모바일 입사지원">모바일 입사지원</a></li>
					 -->
					<li>온라인 입사지원</li>
					<li></li>
					<li></li>
					<li><a href="#" title="선택삭제">선택삭제</a></li>
				</ul>
				<p class="apply_total">온라인 입사지원 총 <span>${totalSize }</span>건</p>
				<table class="list">
					<caption>리스트</caption>
					<tbody>
						<tr class="list_title">
							<th class="desc00"><input type="checkbox" name="all"/></th>
							<th class="desc01">회사명</th>
							<th class="desc02">채용공고</th>
							<th class="desc03">이력서</th>
							<th class="desc04">마감일</th>
							<th class="desc05">지원일</th>
						</tr>
						<c:choose>
							<c:when test="${list.size() > 0 }">
								<c:forEach var="result" items="${list}" varStatus="status">	
									<tr class="desc">
										<td class="desc00"><input type="checkbox" name="chk" value="${result.no }" /></td>
										<td class="desc01">
											<a href="javascript:goDetail('${result.companyUid }', '${result.personUid }', '${result.no }', '${result.recruitNo }', '${result.resumeNo }', '', 'recruit');">${result.bizName }</a>
										</td>
										<td class="desc02">
										<a href="#none" title="채용공고">
											<a href="javascript:goDetail('${result.companyUid }', '${result.personUid }', '${result.no }', '${result.recruitNo }', '${result.resumeNo }', '', 'recruit');">${result.bizTitle }</a>
										</a>
										</td>
										<td class="desc03">
										<a href="#none" title="채용공고">
											<a href="javascript:goDetail('${result.companyUid }', '${result.personUid }', '${result.no }', '${result.recruitNo }', '${result.resumeNo }', '', 'resume');">${result.inidTitle }</a>
										</a>
										</td>
										<td class="desc04">${codeConvert:getRecruitStatus(result.bizIng, result.bizEndType, result.bizEndDay) }</td>
										<td class="desc05">${result.wdate }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="desc"><td colspan="6">내역이 없습니다.</td></tr>
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
<form id="searchForm" name="searchForm" method="post" action="/personApplyList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="personUid" id="personUid" value="" />
	<input type="hidden" name="companyUid" id="companyUid" value="" />
	<input type="hidden" name="no" id="no" value="" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="applyType" id="applyType" value="${map.applyType}" />
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/personSubMenu.do" />
</form>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		if("${map.applyType}" == "online"){
			$(".tab li").eq(0).find("a").addClass("selected");
			$(".tab li").eq(1).find("a").removeClass("selected");
			$(".tab li").eq(2).find("a").removeClass("selected");
			
		}else if("${map.applyType}" == "email"){
			$(".tab li").eq(0).find("a").removeClass("selected");
			$(".tab li").eq(1).find("a").addClass("selected");
			$(".tab li").eq(2).find("a").removeClass("selected");
			
		}else{
			$(".tab li").eq(0).find("a").removeClass("selected");
			$(".tab li").eq(1).find("a").removeClass("selected");
			$(".tab li").eq(2).find("a").addClass("selected");
		}
		
		$(".list_title .desc00 input[type=checkbox]").click(function(e){
			if($(this).prop("checked")) {  
				$("input[type=checkbox]").prop("checked",true); 
			} else { 
				$("input[type=checkbox]").prop("checked",false); 
			}
		});
		
		$(".tab li:eq(3) a").click(function(e){
			deleteApply();
		});
		
		$(".tab li a").click(function(e){
			
			loadingOn();
			
			$(this).parent().parent().find("a").removeClass('selected');
			$(this).addClass('selected');
			var idx = $(this).parent("li").index();
			
			switch(idx){
				case 1 : 
					$("#applyType").val("email");
					break;
				case 2 : 
					$("#applyType").val("mobile");
					break;
				default : 
					$("#applyType").val("online");
				break;
			}
			
			goList();
		});
	});	

	
	function goDetail(companyUid, personUid, no, recruitNo, resumeNo, bizIng, detailFlag){
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
			alert("항목을 삭제했습니다.");
			$("#pageNo").val("1");
			$("#searchForm").submit();
		};
		var param = {
					deleteItemMulti : deleteItemMulti
				};
		ajax('post', '/deleteApplyMulti.ajax', param, callback);
	}
	
	function goList(){
		$("#pageNo").val(1);
		$("#searchForm").submit();
	}
	
</script>


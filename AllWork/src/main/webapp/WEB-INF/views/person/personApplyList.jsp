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
					<li><a class="selected" href="#none" title="온라인 입사지원">온라인 입사지원</a></li>
					<li><a href="#" title="이메일 입사지원">이메일 입사지원</a></li>
					<li><a href="#" title="모바일 입사지원">모바일 입사지원</a></li>
					<li><a href="#" title="선택삭제">선택삭제</a></li>
				</ul>
				<p class="apply_total">온라인 입사지원 총 <span>${totalSize }</span>건</p>
				<ul class="list">
					<li class="list_title">
						<div class="desc00"><input type="checkbox" name="all"/></div>
						<div class="desc01">지원내역</div>
						<div class="desc02">이력서</div>
						<div class="desc03">마감일</div>
						<div class="desc04">지원일</div>
					</li>
					<c:choose>
						<c:when test="${list.size() > 0 }">
							<c:forEach var="result" items="${list}" varStatus="status">
								<li>
									<div class="desc00"><input type="checkbox" name="chk" value="${result.no }" /></div>
									<div class="desc01">
										<p class="title"><a href="javascript:goDetail('${result.companyUid }', '${result.personUid }', '${result.no }', '${result.recruitNo }', '${result.resumeNo }', '', 'recruit');">${result.bizName }</a></p>
										<p class="t_desc"><a href="javascript:goDetail('${result.companyUid }', '${result.personUid }', '${result.no }', '${result.recruitNo }', '${result.resumeNo }', '', 'recruit');">${result.bizTitle }</a></p>
									</div>
									<div class="desc02">
										<p class="my_resume"><a href="javascript:goDetail('${result.companyUid }', '${result.personUid }', '${result.no }', '${result.recruitNo }', '${result.resumeNo }', '', 'resume');">${result.inidTitle }</a></p>
									</div>
									<div class="desc03">
										<p class="d_day">${result.bizEndDay }</p>
									</div>
									<div class="desc04">
										<p class="apply_date">${result.wdate }</p>
									</div>
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li style="width:100%;"><div class="descBox"><p class="desc02">내역이 없습니다.</p></li>
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
		    	  deleteApplyMulti += this.value+",";
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
		$("#pageNo").val(1);
		$("#searchForm").submit();
	}
	
</script>


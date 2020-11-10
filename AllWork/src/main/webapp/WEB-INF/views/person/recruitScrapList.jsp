<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_scrap.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/personSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="listPart">
				<h4>스크랩한 기업</h4>
				<p class="delete">
					<a href="#" title="선택삭제">선택삭제</a>
				</p>
				<ul class="list">
					<li class="list_title">
						<div class="desc00"><input type="checkbox" name="all"/></div>
						<div class="desc01">채용공고</div>
						<div class="desc02">마감일</div>
						<div class="desc03">스크랩일</div>
					</li>
					
					<c:choose>
						<c:when test="${recruitScrapList.size() > 0 }">
							<c:forEach var="result" items="${recruitScrapList}" varStatus="status">
								<li>
									<div class="desc00"><input type="checkbox" name="chk" value="${result.noTo }" /></div>
									<div class="desc01">
										<p class="title">
											${result.bizName }&nbsp;<a href="#none" title="관심기업체크"><i class="far fa-heart"></i></a>
										</p>
										<a href="javascript:goDetail('${result.no }')" title="채용공고">
											<p class="t_desc01">${convert:compByte(result.bizTitle, 100, "...")}</p>
										</a>
										<p class="t_desc02">${result.bizCareer } | ${result.bizAbility } | ${result.bizArea1Name } | ${result.bizJobfromName }</p>
									</div>
									<div class="desc02"><p class="d_day">${codeConvert:getRecruitStatusText(result.bizIng, result.bizEndType, result.bizEndDay) }</p></div>
									<div class="desc03"><p class="scrap_day">${result.wdate }</p></div>
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li style="width:100%;"><div class="desc01">내역이 없습니다.</div></li>
						</c:otherwise>
					</c:choose>
				</ul>
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
	<input type="hidden" name="no" id="no" value="" />
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
	
	function goDetail(no){
		$("#no").val(no);
		$("#searchForm").attr("action", "/recruitDetail.do");
		$("#searchForm").submit();
	}
	
	
	function goPage(targetPage){
		$("#progress_barWrap").css("display", "block");
		$("#pageNo").val(targetPage);
		$("#searchForm").submit();
	}
		
</script>




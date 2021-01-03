<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_01.css"/>

<div id="containerWrap">
	<div id="leftPart">
		<jsp:include page="/recruitInfoSubMenu.do" />
	</div>
	<div id="rightPart">
		<div id="recruitment">
			<h4>알바 채용 정보 상세검색</h4>
			<div id="part02">
				<form id="keyworkSearchForm" name="keyworkSearchForm" method="post" action="/recruitSearchForFree.do" >
					<fieldset>
						<legend>검색</legend>
						<div>
							<span><input type="radio" id="keywordR" name="keywordR" value="and" checked /></span>&nbsp;‘그리고’(and) 검색
							<span><input type="radio" id="keywordR" name="keywordR" value="or" <c:if test="${map.keywordCondition eq 'or' }">checked</c:if> /></span>&nbsp;‘또는’(or) 검색 
						</div>
						<p><input type="text" id="keyword1" name="keyword1" value="${map.keyword1 }" placeholder="키워드" /></p>
						<p><input type="text" id="keyword2" name="keyword2" value="${map.keyword2 }" placeholder="키워드" /></p>
						<p><input type="text" id="keyword3" name="keyword3" value="${map.keyword3 }" placeholder="키워드" /></p>
						<p class="btnBox"><input id="keyword_search_btn" type="button" name="keyword_search_btn" value="검색" style="cursor:pointer;"/></p>
						<input type="hidden" name="keywordCondition" id="keywordCondition" value="${map.keywordCondition }"/>
						<input type="hidden" name="searchFlag" id="searchFlag" value="keyword"/>
					</fieldset>
				</form>
			</div>	
			<div id="rec_row01_1" style="display:block;">
                <ul class="tab">
                  	<li id="job"><a href="#" title="직무별">직무별</a></li>
                 	<li id="area_job"><a href="#" title="산업별">산업별</a></li>
                  	<li id="area"><a href="#" title="지역별">지역별</a></li>
                  	<li id="others"><a href="#" title="상세조건별"></a></li>
                </ul>
                <div class="descArea" style="display:block;">
                  	<ul class="cate_job">
	                    <c:forEach var="result" items="${jobList}" varStatus="status">
							<li><input id="bizType1" class="on" type="button" name="${result.code}" value="${result.name}"/></li>
						</c:forEach>
                  	</ul>
                  	<ul class="cate_industry">
	                    <c:forEach var="result" items="${areaJobList}" varStatus="status">
							<li><input id="areaJob1" class="on" type="button" name="${result.code}" value="${result.name}"/></li>
						</c:forEach>
                  	</ul>
                  	<ul class="cate_location">
	                    <c:forEach var="result" items="${areaList}" varStatus="status">
							<li><input id="bizArea1" class="on" type="button" name="${result.code}" value="${result.name}"/></li>
						</c:forEach>
                  	</ul>
                	<ul class="cate_ect"></ul>
                </div>
                <div id="cateOn" style="display:none;">
                  	<ul class="select01" id="select01"></ul>
                  	<ul class="select02" id="select02"></ul>
                  	<ul class="select03" id="select03"></ul>
                </div>
			</div>
			<div id="searchBox">
				<p class="keywords">${map.keywordsHtml }</p>
				<p class="reset"><a href="#none" title="초기화">초기화</a></p>
				<p class="goBtn"><input id="search_btn" type="button" value="선택된 조건 검색하기"/></p>
			</div>
		</div>
		<div id="rec_listPart01">
			<div id="rec_titleArea01">
				<h4>채용정보</h4>
				<ul class="rec_align">
					<li><a href="#" title="등록일순">등록일순&nbsp;&nbsp;|&nbsp;</a></li>
					<li><a href="#" title="등록일순">수정일순&nbsp;&nbsp;|&nbsp;</a></li>
					<li><a href="#" title="등록일순">마감일순</a></li>
				</ul>
			</div>
			<table class="list">
				<thead>
					<tr class="list_title">
						<th class="t_desc01">회사명</th>
						<th colspan="3" class="t_desc02">채용정보</th>
						<th class="t_desc03">마감일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${recruitList.size() > 0 }">
							<c:forEach var="result" items="${recruitList}" varStatus="status">
								<tr class="margin"></tr>
								<tr>
									<td rowspan="3" class="desc01">${result.bizName }</td>
									<td colspan="3" class="desc02">
										<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.open }', '');">
											${convert:compByte(result.bizTitle, 100, "...")}
										</a>
									</td>
									<td rowspan="3" class="desc03">${codeConvert:getRecruitStatus(result.bizIng, result.bizEndType, result.bizEndDay) }</td>
									</tr>
									<tr>
									<td><span class="desc_title">급여</span><span class="desc_desc00">${result.bizPayName }</span></td>
									<td><span class="desc_title">경력</span><span class="desc_desc00">${codeConvert:getBizCareer(result.bizCareer) }</span></td>
									<td><span class="desc_title">나이</span><span class="desc_desc00">${codeConvert:getBizAge(result.bizAge) }</span></td>
									</tr>
									<tr>
									<td><span class="desc_title">지역</span>
										<span class="desc_desc00">${result.bizArea1Name }${convert:checkNull(result.bizArea2Name) eq '' ? '' : '>'.concat(result.bizArea2Name) }</span>
									</td>
									<td><span class="desc_title">학력</span><span class="desc_desc00">${result.bizAbility }<%-- ${codeConvert:getBizAbilityShort(result.bizAbility) } --%></span></td>
									<td><span class="desc_title">성별</span><span class="desc_desc00">${codeConvert:getBizSex(result.bizSex) }</span></td>
								</tr>
								<tr class="margin"></tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="desc"><td colspan="8" style="text-align:center;height:80px;">내역이 없습니다.</td></tr>
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
<jsp:include page="/footer.do" />

<form name="searchForm" id="searchForm" method="post" action="/recruitSearchForFree.do">
	<input type="hidden" name="no" id="no" value=""/>
	<input type="hidden" name="uid" id="uid" value=""/>
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo }"/>
	<input type="hidden" name="orderField" id="orderField" value="${map.orderField }"/>
	<input type="hidden" name="orderRule" id="orderRule" value="${map.orderRule }"/>
	<input type="hidden" name="orderRuleWdate" id="orderRuleWdate" value="${map.orderRuleWdate }"/>
	<input type="hidden" name="orderRuleUwdate" id="orderRuleUwdate" value="${map.orderRuleUwdate }"/>
	<input type="hidden" name="orderRuleBizEndDay" id="orderRuleBizEndDay" value="${map.orderRuleBizEndDay }"/>
	
	<input type="hidden" name="personUid" id="personUid" value="" />
	<input type="hidden" name="companyUid" id="companyUid" value="" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/recruitInfoSubMenu.do" />
	
	<input type="hidden" name="searchKind" id="searchKind" value="${map.searchKind }" />
	<input type="hidden" name="bizType3" id="bizType3" value="${map.bizType3 }" />
	<input type="hidden" name="areaJob3" id="areaJob3" value="${map.areaJob3 }" />
	<input type="hidden" name="bizArea2" id="bizArea2" value="${map.bizArea2 }" />
	<input type="hidden" name="keywordsHtml" id="keywordsHtml" value="${map.keywordsHtml }" />
</form>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		loadingOff();
		
		$("#keyword_search_btn").on("click", function(e){
			
			$("#keywordCondition").val($("input[name=keywordR]:checked").val());
			
			if(checkNull($("#keywordCondition").val())){
				alert("검색 조건을 선택하세요.");
				return;
			}
			
			if(checkNull($("#keyword1").val())){
				alertAndFocus("검색 키워드를 입력하세요.", $("#keyword1"));
				return;
			}
			
			if(checkNull($("#keyword1").val()) && checkNull($("#keyword2").val()) && checkNull($("#keyword3").val())){
				alert("검색 키워드를 입력하세요.");
				return;
			}
			loadingOn();
			$("#keyworkSearchForm").submit();
		});
		
		
		// 상단 직무별, 산업별, 지역별, 상세조건별 Tab click
		$(".tab li a").on("click", function(e){
			
			var idx = $(this).parent("li").index();
			$(".tab").find("li").eq(idx).css("background-color", "#000").siblings("li").css("background-color", "#ddd");
			
			var selectedId = $(this).parent("li").attr("id");
			
			if(selectedId == $("#searchKind").val() && $(".descArea").css("display") == "none"){
				$(".descArea").css("display", "block");
				$("#cateOn").css("display", "none");	
			
			}else{
				
				if(idx != 3){
					$(".select01, .select02, .select03").empty();
					switch(idx){
						case 0 : $(".select01").html($(".cate_job").html()); break;
						case 1 : $(".select01").html($(".cate_industry").html()); break;
						case 2 : $(".select01").html($(".cate_location").html()); break;
						default : break;
					}
					$("#searchKind").val(selectedId);
					$(".descArea").css("display", "none");
					$("#cateOn").css("display", "block");	
				}else{
					$(".descArea").css("display", "block");
					$("#cateOn").css("display", "none");
				}
				
			}
		});
		
		// 검색 항목 click
		$(document).on("click", "#rec_row01_1 input:button", function(e){
			
			//alert("UL Class : "+$(this).closest("ul").attr("class")+" || ID : "+$(this).attr("id")+" || VALUE : "+$(this).attr("value")+" || NAME : "+$(this).attr("name")+" || SEARCH_KIND : "+$("#searchKind").val());
			
			var ulClass = $(this).closest("ul").attr("class");
			var selectedId = $(this).attr("id");
			var selectedValue = $(this).attr("value");
			var selectedName = $(this).attr("name");
			
			if("cate_job" == ulClass || "cate_industry" == ulClass || "cate_location" == ulClass){
				
				$(".descArea").css("display", "none");
				$("#cateOn").css("display", "block");
				$(".select01, .select02, .select03").empty();
				
				if("cate_job" == ulClass){ // 직무별
					$("#searchKind").val("job");
					$(".tab").find("li").eq(0).css("background-color", "#000").siblings("li").css("background-color", "#ddd");
					$(".select01").html($(".cate_job").html());
				}
				
				if("cate_industry" == ulClass){ // 산업별
					$("#searchKind").val("areaJob");
					$(".tab").find("li").eq(1).css("background-color", "#000").siblings("li").css("background-color", "#ddd");
					$(".select01").html($(".cate_industry").html());
				}

				if("cate_location" == ulClass){ // 지역별
					$("#searchKind").val("area");
					$(".tab").find("li").eq(2).css("background-color", "#000").siblings("li").css("background-color", "#ddd");
					$(".select01").html($(".cate_location").html());
				}

				getNetfuCateListForUl($("#searchKind").val(), $(this).attr("name"), "select02", $("#searchKind").val()+"2", true);
				
			}else{
				
				if("cate_ect" == ulClass){
					$("#searchKind").val("cate_ect");
					$(".tab").find("li").eq(3).css("background-color", "#000").siblings("li").css("background-color", "#ddd");
				}
				
				if("select01" == ulClass){
					getNetfuCateListForUl($("#searchKind").val(), $(this).attr("name"), "select02", $("#searchKind").val()+"2", true);
				}
				
				if("select02" == ulClass){
					getNetfuCateListForUl($("#searchKind").val(), $(this).attr("name"), "select03", $("#searchKind").val()+"3", true);
				}
				
				$(".descArea").css("display", "none");
				$("#cateOn").css("display", "block");
			}
			
			if($(".keywords span").length >= 10){
				alert("겸색 조건은 10까지만 등록가능합니다.");
			}else{
				if(($("#searchKind").val() == "area" && ulClass == "select02") || ($("#searchKind").val() != "area" && ulClass == "select03")){
					if(!chkSearchConditionExist(selectedName)){
						$(".keywords").append("<span><input id='"+selectedId+"' type='button' name='"+selectedName+"' value='"+selectedValue+"' /><i class='fas fa-times'></i></span>");	
					}	
				}	
			}
		});
		
		
		$(document).on("click", ".keywords .fas", function(e){
			$(this).parents(".keywords").find("span").eq($(this).parents("span").index()).remove();
		});
		
		
		$(".reset").on("click", function(e){
			$(".tab").find("li").css("background-color", "#ddd");
			$(".descArea").css("display", "block");
			$("#cateOn").css("display", "none");
			$(".keywords").empty();
		});
		
		
		$("#search_btn").on("click", function(e){
			//e.prevantDefault();
			recruitSearch();
		});
		
		
		$(".rec_align a").on("click", function(e){
			
			var idx = $(this).parent().index();
			var orderRuleWdate = $("#orderRuleWdate").val();
			var orderRuleUwdate = $("#orderRuleUwdate").val();
			var orderRuleBizEndDay = $("#orderRuleBizEndDay").val();
			
			switch(idx){
				case 0 : 
					$("#orderField").val("wdate");
					orderRuleWdate = (orderRuleWdate == "desc") ? "" : "desc";
					$("#orderRuleWdate").val(orderRuleWdate);
					$("#orderRule").val(orderRuleWdate);
					break;
				case 1 : 
					$("#orderField").val("u_wdate");
					orderRuleUwdate = (orderRuleUwdate == "desc") ? "" : "desc";
					$("#orderRuleUwdate").val(orderRuleUwdate);
					$("#orderRule").val(orderRuleUwdate);
					break;
				case 2 : 
					$("#orderField").val("biz_end_day");
					orderRuleBizEndDay = (orderRuleBizEndDay == "desc") ? "" : "desc";
					$("#orderRuleBizEndDay").val(orderRuleBizEndDay);
					$("#orderRule").val(orderRuleBizEndDay);
					break;
				default : 
					$("#orderField").val("wdate");
					$("#orderRule").val("desc");
					break;
			}
			loadingOn();
			$("#searchForm").submit();
		});
	});	
	
	
	function goDetail(companyUid, personUid, no, recruitNo, resumeNo, open, detailFlag){
		
		loadingOn();
		if("open" != open){
			alert("현재 비공개 상태로 설정되어 있습니다.");
			loadingOff();

		}else{
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
		}
	}
	
	function chkSearchConditionExist(code){
		
		var rtnBoo = false;
		$(".keywords span input:button").each(function(index, item){
			if($(this).attr("name") == code){
				rtnBoo = true;
			}	
		});
		return rtnBoo;
	}
	
	
	function recruitSearch(){
		
		loadingOn();
		
		var spanId = "", bizType = "", areaJob = "", bizArea = "";
		
		$(".keywords span input:button").each(function(index, item){
			spanId = $(this).attr("id");
			if(spanId == "job3"){
				bizType += $(this).attr("name")+","
			}
			if(spanId == "areaJob3"){
				areaJob += $(this).attr("name")+","
			}
			if(spanId == "area2"){
				bizArea += $(this).attr("name")+","
			}
		});
		bizType = bizType.length > 0 ? bizType.substring(0, bizType.length - 1) : "";
		areaJob = areaJob.length > 0 ? areaJob.substring(0, areaJob.length - 1) : "";
		bizArea = bizArea.length > 0 ? bizArea.substring(0, bizArea.length - 1) : "";
		
		$("#bizType3").val(bizType);
		$("#areaJob3").val(areaJob);
		$("#bizArea2").val(bizArea);
		$("#keywordsHtml").val($(".keywords").html());
		
		if(bizType.length <= 0 && areaJob.length <= 0 && bizArea.length <= 0){
			loadingOff();
			alert("검색 조건을 확인하세요.");
		}else{
			$("#searchForm").submit();	
		}
	}
</script>


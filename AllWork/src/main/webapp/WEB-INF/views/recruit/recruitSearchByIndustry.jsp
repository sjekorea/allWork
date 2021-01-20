<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_01_01.css"/>
<!-- (begin) 2020.12.30 by s.yoo	-->
<style type="text/css">
	/*현재메뉴 언더라인*/
	#menuTree ul .subMenu03{text-decoration: underline;}
</style>
<!-- (end) 2020.12.30 by s.yoo	-->

<div id="containerWrap">
	<div id="leftPart">
	<c:if test="${SE_USER_TYPE == 'person' }">
		<jsp:include page="/recruitInfoSubMenu.do" />
	</c:if>
	</div>
	<div id="rightPart">
	<c:if test="${SE_USER_TYPE == 'person' }">
		<div id="recruitment">
			<h4>채용정보 산업별</h4>
			<div id="part02">
				<form id="" name="">
					<fieldset>
						<legend>검색</legend>
						<div>
							<span><input type="radio" id="keywordR" name="keywordR" value="and" checked /></span>&nbsp;‘그리고’(and) 검색
							<span><input type="radio" id="keywordR" name="keywordR" value="or" <c:if test="${map.keywordCondition eq 'or' }">checked</c:if> /></span>&nbsp;‘또는’(or) 검색 
						</div>
						<p><input type="text" id="keywordTxt1" name="keywordTxt1" value="${map.keyword1 }" placeholder="키워드" /></p>
						<p><input type="text" id="keywordTxt2" name="keywordTxt2" value="${map.keyword2 }" placeholder="키워드" /></p>
						<p><input type="text" id="keywordTxt3" name="keywordTxt3" value="${map.keyword3 }" placeholder="키워드" /></p>
						<p class="btnBox"><input id="search_btn" type="button" name="search_btn" value="검색" style="cursor:pointer;"/></p>
						<%-- 
						<input type="hidden" name="searchFlag" id="searchFlag" value="keyword"/> --%>
					</fieldset>
				</form>
			</div>	
			<div id="rec_row01">
				<ul class="tab">
					<li style="background-color:#000;"><a href="#" title="산업별">산업별</a></li>
					<li style="background-color:#ddd;"><a href="#" title="직무별"></a></li>
					<li style="background-color:#ddd;"><a href="#" title="지역별"></a></li>
					<li style="background-color:#ddd;"><a href="#" title="상세조건별"></a></li>
				</ul>
				<div id="cateOn">
					<ul class="select01" id="select01">
	                    <c:forEach var="result" items="${areaJobList}" varStatus="status">
							<li><input id="bizType1" class="on" type="button" name="${result.code}" value="${result.name}"/></li>
						</c:forEach>
                  	</ul>
                  	<ul class="select02" id="select02"></ul>
                  	<ul class="select03" id="select03"></ul>
				</div>
				<div id="searchBox">
					<p class="keywords">${map.keywordsHtml }</p>
					<p class="reset"><a href="#none" title="초기화">초기화</a></p>
					<p class="goBtn"><input id="search_detail_btn" type="button" value="선택된 조건 검색하기"/></p>
				</div>
			</div>
		</div>
	</c:if>
		<div id="rec_listPart01">
			<div id="rec_titleArea01">
				<h4>채용정보(<fmt:formatNumber value="${map.totalSize}" pattern="#,###"/>)</h4>
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
										<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.bizIng }', '');">
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
									<td><span class="desc_title">학력</span><span class="desc_desc00">${codeConvert:getBizAbilityShort(result.bizAbility) }</span></td>
									<td><span class="desc_title">등록일</span><span class="desc_desc00">${result.wdate }</span></td>
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

<form name="searchForm" id="searchForm" method="post" action="/recruitSearchByIndustry.do">
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
	
	<input type="hidden" name="searchKind" id="searchKind" value="area_job" />
	<input type="hidden" name="bizType3" id="bizType3" value="${map.bizType3 }" />
	<input type="hidden" name="areaJob3" id="areaJob3" value="${map.areaJob3 }" />
	<input type="hidden" name="bizArea2" id="bizArea2" value="${map.bizArea2 }" />
	<input type="hidden" name="keywordsHtml" id="keywordsHtml" value="${map.keywordsHtml }" />
	<input type="hidden" name="keyword1" id="keyword1" value="${map.keyword1 }" />
	<input type="hidden" name="keyword2" id="keyword2" value="${map.keyword2 }" />
	<input type="hidden" name="keyword3" id="keyword3" value="${map.keyword3 }" />
	<input type="hidden" name="keywordCondition" id="keywordCondition" value="${map.keywordCondition }"/>
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
		
		// 검색 항목 click
		//(begin)++2021.01.13 by s.yoo.
		var selectedItem = [ "", "", "" ];
		var selectedCode = [ "", "", "" ];
		//(end)++2021.01.13 by s.yoo.
		$(document).on("click", "#cateOn input:button", function(e){
			
			//alert("UL Class : "+$(this).closest("ul").attr("class")+" || ID : "+$(this).attr("id")+" || VALUE : "+$(this).attr("value")+" || NAME : "+$(this).attr("name")+" || SEARCH_KIND : "+$("#searchKind").val());
			
			var ulClass = $(this).closest("ul").attr("class");
			var selectedId = $(this).attr("id");
			var selectedValue = $(this).attr("value");
			var selectedName = $(this).attr("name");
			
			//(begin)++2021.01.13 by s.yoo.
			switch(selectedId) {
			case "bizType1":
			case "areaJob1":
			case "bizArea1":
				selectedItem[0] = selectedValue;
				selectedItem[1] = selectedItem[2] = "";
				selectedCode[0] = selectedName;
				selectedCode[1] = selectedCode[2] = "";
				break;
			case "job2":
			case "area_job2":
			case "area2":
				selectedItem[1] = selectedValue;
				selectedItem[2] = "";
				selectedCode[1] = selectedName;
				selectedCode[2] = "";
				break;
			case "job3":
			case "area_job3":
			case "area3":
				selectedItem[2] = selectedValue;
				selectedCode[2] = selectedName;
				break;
			}
			//(end)++2021.01.13 by s.yoo.

			if("select01" == ulClass){
				$(".select02, .select03").empty();
				getNetfuCateListForUl($("#searchKind").val(), $(this).attr("name"), "select02", $("#searchKind").val()+"2", true);
			}
			
			if("select02" == ulClass){
				$(".select03").empty();
				getNetfuCateListForUl($("#searchKind").val(), $(this).attr("name"), "select03", $("#searchKind").val()+"3", true);
			}
			
			if("select03" == ulClass){
				if($(".keywords span").length >= 10){
					alert("겸색 조건은 10까지만 등록가능합니다.");
				}else{
					if(!chkSearchConditionExist(selectedName)){
						//$(".keywords").append("<span><input id='"+selectedId+"' type='button' name='"+selectedName+"' value='"+selectedValue+"' /><i class='fas fa-times'></i></span>");	
						//(begin)++2021.01.13 by s.yoo.
						var value = "", selName = "";
						for(var i = 0; i < 3; i++) {
							if (selectedItem[i] == null || selectedItem[i].length < 1) continue;
							value = (value.length < 1)? selectedItem[i] : (value + ">" + selectedItem[i]);
							selName = (selName.length < 1)? selectedCode[i] : (selName + "," + selectedCode[i]);
						}
						$(".keywords").append("<span><input id='"+selectedId+"' type='button' name='"+selName+"' value='"+value+"' /><i class='fas fa-times'></i></span>");
						//(end)++2021.01.13 by s.yoo.
					}
				}
			}
		});
		
		
		$(document).on("click", ".keywords .fas", function(e){
			$(this).parents(".keywords").find("span").eq($(this).parents("span").index()).remove();
			
			//키워드 입력창의 내용 삭제.
			var idDel = $(this).parents("span")[0].children[0].id;
			if (idDel == "keywordTxt1Sel") $("#keywordTxt1").val("");
			else if (idDel == "keywordTxt2Sel") $("#keywordTxt2").val("");
			else if (idDel == "keywordTxt3Sel") $("#keywordTxt3").val("");
		});
		
		
		$(".reset").on("click", function(e){
			$(".keywords").empty();
			
			//키워드 입력창의 내용 삭제.
			$("#keywordTxt1").val("");
			$("#keywordTxt2").val("");
			$("#keywordTxt3").val("");
			
			//검색작업 수행.
			recruitSearch(true);
		});
		
		
		$("#keywordTxt1").keydown( function() {
			var kcode = event.keyCode;
			if(kcode == 13) {
				procSearch();
			}
		});
		$("#keywordTxt2").keydown( function() {
			var kcode = event.keyCode;
			if(kcode == 13) {
				procSearch();
			}
		});
		$("#keywordTxt3").keydown( function() {
			var kcode = event.keyCode;
			if(kcode == 13) {
				procSearch();
			}
		});
		
		$("#search_btn").on("click", function(e){
			procSearch();
		});
		$("#search_detail_btn").on("click", function(e){
			procSearch();
		});
		
		function procSearch() {
			//(begin)++2021.01.13 by s.yoo.
			//Keyword를 검색조건에 추가.
			var listKey = [ 'keywordTxt1Sel', 'keywordTxt2Sel', 'keywordTxt3Sel' ];
			var listKeyword = [ $('#keywordTxt1'), $('#keywordTxt2'), $('#keywordTxt3') ];
			for (var i = 0; i < 3; i++) {
				key = listKey[i];
				value = listKeyword[i].val();
				if (value == null || value.length < 1) {
					deleteItem(key);
				} else {
					selectedId = listKey[i]
					selectedName = listKey[i];
					if(chkSearchConditionExist(selectedName)) {
						deleteItem(key);
					}
					$(".keywords").append("<span><input id='"+selectedId+"' type='button' name='"+selectedName+"' value='"+value+"' /><i class='fas fa-times'></i></span>");						
				}				
			}
			//(end)++2021.01.13 by s.yoo.
			
			//e.prevantDefault();
			recruitSearch();
		};
		
		//(begin)++2021.01.13 by s.yoo.
		function deleteItem(key) {
			var count = $(".keywords").find("span").length;
			for(var j = 0; j < count; j++) {
				if ($(".keywords").find("span")[j].children[0].id == key) break;
			}
			if (j >= 0 && j < count)
				$(".keywords").find("span").eq(j).remove();			
		}
		//(end)++2021.01.13 by s.yoo.

		
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
	
	function chkSearchConditionExist(code){
		
		var rtnBoo = false;
		$(".keywords span input:button").each(function(index, item){
			if($(this).attr("name") == code){
				rtnBoo = true;
			}	
		});
		return rtnBoo;
	}
	
	
	function recruitSearch(faurceReset){
		
		loadingOn();

		var spanId = "", bizType = "", areaJob = "", bizArea = "";
		
		$(".keywords span input:button").each(function(index, item){
			spanId = $(this).attr("id");
			/*
			if(spanId == "job3"){
				bizType += $(this).attr("name")+","
			}
			if(spanId == "area_job3"){
				areaJob += $(this).attr("name")+","
			}
			if(spanId == "area2"){
				bizArea += $(this).attr("name")+","
			}
			*/
			//(begin)++2021.01.13 by s.yoo.
			if(spanId == "job3"){
				bizType = (bizType.length < 1)? $(this).attr("name") : (bizType + ";" + $(this).attr("name"));
			}
			if(spanId == "area_job3"){
				areaJob = (areaJob.length < 1)? $(this).attr("name") : (areaJob + ";" + $(this).attr("name"));
			}
			if(spanId == "area2"){
				bizArea = (bizArea.length < 1)? $(this).attr("name") : (bizArea + ";" + $(this).attr("name"));
			}
			//(end)++2021.01.13 by s.yoo.
		});
		/*
		bizType = bizType.length > 0 ? bizType.substring(0, bizType.length - 1) : "";
		areaJob = areaJob.length > 0 ? areaJob.substring(0, areaJob.length - 1) : "";
		bizArea = bizArea.length > 0 ? bizArea.substring(0, bizArea.length - 1) : "";
		*/
		
		$("#bizType3").val(bizType);
		$("#areaJob3").val(areaJob);
		$("#bizArea2").val(bizArea);
		$("#keywordsHtml").val($(".keywords").html());
		$("#keyword1").val($("#keywordTxt1").val());
		$("#keyword2").val($("#keywordTxt2").val());
		$("#keyword3").val($("#keywordTxt3").val());
		$("#keywordCondition").val($("input[name=keywordR]:checked").val());
		
		if(bizType.length <= 0 && areaJob.length <= 0 && bizArea.length <= 0 && $("#keyword1").val() == "" && $("#keyword2").val() == "" && $("#keyword3").val() == ""){
			if (faurceReset == true) {
				$("#searchForm").submit();	
			} else {
				alert("검색 조건이 없습니다. 검색조건을 확인하세요.");
				loadingOff();
			}
		}else{
			$("#searchForm").submit();	
		}
	}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert"%>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert"%>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/company_03_1.css" />
<!-- (begin) 2020.12.30 by s.yoo	-->
<style type="text/css">
	/*현재메뉴 언더라인*/
	#menuTree ul .subMenu02{text-decoration: underline;}
</style>
<!-- (end) 2020.12.30 by s.yoo	-->

<div id="containerWrap">
	<div id="leftPart">
		<jsp:include page="/personInfoSubMenu.do" />
	</div>
	<div id="rightPart">
		<div id="part01">
			<ul class="adPart">
				<li>
					<a href="#none" title="유료인재광고01">
						<div>
							<p class="star"><i class="fas fa-star"></i></p>
							<p class="desc01">함**(남/1962년생)</p>
							<p class="desc02">34년 4개월</p>
							<p class="desc03">회계법인 14년 근무 경험(회계/세무/공무)</p>
							<p class="desc04">국제기구, 사단법인, NGO, 재단법인, 시민단체</p>
						</div>
					</a>
				</li>
				<li>
					<a href="#none" title="유료인재광고02">
						<div>
							<p class="star"><i class="fas fa-star"></i></p>
							<p class="desc01">함**(남/1962년생)</p>
							<p class="desc02">34년 4개월</p>
							<p class="desc03">회계법인 14년 근무 경험(회계/세무/공무)</p>
							<p class="desc04">국제기구, 사단법인, NGO, 재단법인, 시민단체</p>
						</div>
					</a>
				</li>
				<li>
					<a href="#none" title="유료인재광고03">
						<div>
							<p class="star"><i class="fas fa-star"></i></p>
							<p class="desc01">함**(남/1962년생)</p>
							<p class="desc02">34년 4개월</p>
							<p class="desc03">회계법인 14년 근무 경험(회계/세무/공무)</p>
							<p class="desc04">국제기구, 사단법인, NGO, 재단법인, 시민단체</p>
						</div>
					</a>
				</li>
				<li>
					<a href="#none" title="유료인재광고04">
						<div>
							<p class="star"><i class="fas fa-star"></i></p>
							<p class="desc01">함**(남/1962년생)</p>
							<p class="desc02">34년 4개월</p>
							<p class="desc03">회계법인 14년 근무 경험(회계/세무/공무)</p>
							<p class="desc04">국제기구, 사단법인, NGO, 재단법인, 시민단체</p>
						</div>
					</a>
				</li>
			</ul>
		</div>
		<div id="part02">
			<form action="#none" method="get" name="searchForm">
				<fieldset>
					<legend>검색</legend>
					<div>
						<span><input id="checkBox_01" type="radio" name="q" title="체크박스01" /></span><label for="checkBox_01">‘그리고’(and) 검색</label>
						<span><input id="checkBox_02" type="radio" name="q" title="체크박스02" /></span><label for="checkBox_02">‘또는’(or) 검색</label> 
					</div>
					<p><input type="text" id="keyword1" name="keyword1" value="${map.keyword1 }" placeholder="키워드" /></p>
					<p><input type="text" id="keyword2" name="keyword2" value="${map.keyword2 }" placeholder="키워드" /></p>
					<p><input type="text" id="keyword3" name="keyword3" value="${map.keyword3 }" placeholder="키워드" /></p>
					<p class="btnBox"><input id="search_btn" type="button" name="searchBtn" value="검색" /></p>
				</fieldset>
			</form>
		</div>
		
		<div id="part03">
			<div id="row01">
				<ul class="tab">
					<li id="job" style="background-color:#000;"><a href="#" title="직무">직무</a></li>
					<li id="area_job" style="background-color:#ddd;"></li>
					<li id="area" style="background-color:#ddd;"></li>
					<li id="inid_mylskill" style="background-color:#ddd;"></li>
				</ul>
				<div id="cateOn">
					<ul class="select01" id="select01">
						<c:forEach var="result" items="${jobList}" varStatus="status">
							<li><input id="job1" class="on" type="button" name="${result.code}" value="${result.name}"/></li>
						</c:forEach>
					</ul>
					<ul class="select02" id="select02"></ul>
					<ul class="select03" id="select03"></ul>
				</div>
			</div>
			<div id="searchBox">
				<p class="keywords"></p>
				<p class="reset"><a href="#none" title="초기화">초기화</a></p>
				<p class="goBtn"><input id="search_detail_btn" type="button" value="선택된 조건 검색하기"/></p>
			</div>
		</div>
		
		<div id="listPart">
			<h4>인재정보</h4>
			<ul class="rec_align">
				<li><a href="#none" title="등록일순">등록일순&nbsp;&nbsp;|&nbsp;</a></li>
                <li><a href="#none" title="등록일순">수정일순&nbsp;&nbsp;|&nbsp;</a></li>
                <li><a href="#none" title="등록일순">마감일순</a></li>
			</ul>
			<table class="list">
				<caption>리스트</caption>
				<tbody>
					<tr class="list_title">
						<th class="desc00">이름</th>
						<th class="desc01">이력서 정보</th>
						<th class="desc02">희망지역</th>
						<th class="desc03">경력·희망연봉</th>
						<th class="desc04">수정일</th>
					</tr>
					<c:choose>
						<c:when test="${resumeList.size() > 0 }">
							<c:forEach var="result" items="${resumeList}" varStatus="status">
								<tr class="desc">
									<td class="desc00">
										<span>${convert:getPersonNameHidden(result.name) }</span><br/>
										<span>${codeConvert:getBizSex(result.sex)},${codeConvert:getBirthYear(result.birth)}년생</span>
									</td>
									<td class="desc01">
										<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.no }', '${result.inidSecret }', 'resume');">
											<span class="desc01_01">
												${result.inidType1Name }
												${convert:checkNull(result.inidType2Name) eq '' ? '</span>' : '&nbsp;>&nbsp;'.concat(result.inidType2Name).concat('&nbsp;') }
												${convert:checkNull(result.inidType3Name) eq '' ? '</span>' : '>&nbsp;'.concat(result.inidType3Name).concat('</span>') }
												${convert:checkNull(result.inidType4Name) eq '' ? '' : '<br/><span>'.concat(result.inidType4Name).concat('&nbsp;') }
												${convert:checkNull(result.inidType5Name) eq '' ? '</span>' : '>&nbsp;'.concat(result.inidType5Name).concat('&nbsp;') }
												${convert:checkNull(result.inidType6Name) eq '' ? '</span>' : '>&nbsp;'.concat(result.inidType6Name).concat('</span>') }
												${convert:checkNull(result.inidType7Name) eq '' ? '' : '<br/><span>'.concat(result.inidType7Name).concat('&nbsp;') }
												${convert:checkNull(result.inidType8Name) eq '' ? '</span>' : '>&nbsp;'.concat(result.inidType8Name).concat('&nbsp;') }
												${convert:checkNull(result.inidType9Name) eq '' ? '</span>' : '>&nbsp;'.concat(result.inidType9Name).concat('</span>') }
										</a>
									</td>
									<td class="desc02">
										<span>
											${result.inidArea1Name }
											${convert:checkNull(result.inidArea2Name) eq '' ? '</span>' : '&nbsp;>&nbsp;'.concat(result.inidArea2Name).concat('</span>') }
											${convert:checkNull(result.inidArea3Name) eq '' ? '' : '<br/><span>'.concat(result.inidArea3Name).concat('&nbsp;') }
											${convert:checkNull(result.inidArea4Name) eq '' ? '</span>' : '>&nbsp;'.concat(result.inidArea4Name).concat('</span>') }
											${convert:checkNull(result.inidArea5Name) eq '' ? '' : '<br/><span>'.concat(result.inidArea5Name).concat('&nbsp;') }
											${convert:checkNull(result.inidArea6Name) eq '' ? '</span>' : '>&nbsp;'.concat(result.inidArea6Name).concat('</span>') }
									</td>
									<td class="desc03">
										<span>${result.inidJobformName }</span><br/>
										<span>${result.inidPayName }</span>
									</td>
									<td class="desc04">${result.jWdate }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td class="desc01" colspan="5" style="text-align:center;height:80px;">내역이 없습니다.</td></tr>
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

<form id="searchForm" name="searchForm" method="post" action="/resumeSearchByDuty.do">
	<input type="hidden" name="no" id="no" value="" />
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="orderField" id="orderField" value="${map.orderField }"/>
	<input type="hidden" name="orderRule" id="orderRule" value="${map.orderRule }"/>
	<input type="hidden" name="orderRuleWdate" id="orderRuleWdate" value="${map.orderRuleWdate }"/>
	<input type="hidden" name="orderRuleUwdate" id="orderRuleUwdate" value="${map.orderRuleUwdate }"/>
	<input type="hidden" name="orderRuleBizEndDay" id="orderRuleBizEndDay" value="${map.orderRuleBizEndDay }"/>
	
	<input type="hidden" name="personUid" id="personUid" value="${map.personUid}" />
	<input type="hidden" name="companyUid" id="companyUid" value="${map.companyUid}" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/personInfoSubMenu.do" />
	
	<input type="hidden" name="searchKind" id="searchKind" value="job" />
	<input type="hidden" name="inidType" id="inidType" value="${map.inidType }" />
	<input type="hidden" name="inidAreaJob" id="inidAreaJob" value="${map.inidAreaJob }" />
	<input type="hidden" name="inidArea" id="inidArea" value="${map.inidArea }" />
	<input type="hidden" name="inidLicense" id="inidLicense" value="${map.inidLicense }" />
	<input type="hidden" name="inidCareer" id="inidCareer" value="${map.inidCareer }" />
	<input type="hidden" name="inidSchool" id="inidSchool" value="${map.inidSchool }" />
	<input type="hidden" name="inidJobform" id="inidJobform" value="${map.inidJobform }" />
	<input type="hidden" name="inidPay" id="inidPay" value="${map.inidPay }" />
	<input type="hidden" name="keywordsHtml" id="keywordsHtml" value="${map.keywordsHtml }" />
</form>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		// 검색 항목 click
		$(document).on("click", "#row01 input:button", function(e){
			
			var ulClass = $(this).closest("ul").attr("class");
			var selectedId = $(this).attr("id");
			var selectedValue = $(this).attr("value");
			var selectedName = $(this).attr("name");
			
			if("select01" == ulClass){
				$(".select02, .select03").empty();
				getNetfuCateListForUl($("#searchKind").val(), $(this).attr("name"), "select02", $("#searchKind").val()+"2", true);
			}
			
			if("select02" == ulClass){
				$(".select03").empty();
				getNetfuCateListForUl($("#searchKind").val(), $(this).attr("name"), "select03", $("#searchKind").val()+"3", true);
			}
			
			if("select03" == ulClass){
				setCondition(ulClass, selectedId, selectedValue, selectedName);
			}
		});
		
		
		$(document).on("click", ".keywords .fas", function(e){
			$(this).parents(".keywords").find("span").eq($(this).parents("span").index()).remove();
		});
		
		$(".reset").on("click", function(e){
			$(".keywords").empty();
		});
		
		
		$("#search_detail_btn").on("click", function(e){
			resumeSearch();
		});
		
		
		$(".rec_align a").on("click", function(e){
			
			var idx = $(this).parent().index();
			var orderRuleWdate = $("#orderRuleWdate").val();
			var orderRuleUwdate = $("#orderRuleUwdate").val();
			var orderRuleBizEndDay = $("#orderRuleBizEndDay").val();
			
			switch(idx){
				case 0 : 
					$("#orderField").val("nir.wdate");
					orderRuleWdate = (orderRuleWdate == "desc") ? "" : "desc";
					$("#orderRuleWdate").val(orderRuleWdate);
					$("#orderRule").val(orderRuleWdate);
					break;
				case 1 : 
					$("#orderField").val("nir.u_wdate");
					orderRuleUwdate = (orderRuleUwdate == "desc") ? "" : "desc";
					$("#orderRuleUwdate").val(orderRuleUwdate);
					$("#orderRule").val(orderRuleUwdate);
					break;
				case 2 : 
					$("#orderField").val("nir.biz_end_day");
					orderRuleBizEndDay = (orderRuleBizEndDay == "desc") ? "" : "desc";
					$("#orderRuleBizEndDay").val(orderRuleBizEndDay);
					$("#orderRule").val(orderRuleBizEndDay);
					break;
				default : 
					$("#orderField").val("nir.wdate");
					$("#orderRule").val("desc");
					break;
			}
			loadingOn();
			$("#searchForm").submit();
		});
	});	
	
	
	function setCondition(ulClass, selectedId, selectedValue, selectedName){
		
		if($(".keywords span").length >= 10){
			alert("겸색 조건은 10까지만 등록가능합니다.");
		}else{
			if(!chkSearchConditionExist(selectedName)){
				$(".keywords").append("<span><input id='"+selectedId+"' type='button' name='"+selectedName+"' value='"+selectedValue+"' /><i class='fas fa-times'></i></span>");	
			}	
		}
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
	
	function chkSearchConditionExist(code){
		
		var rtnBoo = false;
		$(".keywords span input:button").each(function(index, item){
			if($(this).attr("name") == code){
				rtnBoo = true;
			}	
		});
		return rtnBoo;
	}
	
	
	function resumeSearch(){
		
		var spanId = "";
		var inidType = "", inidAreaJob = "", inidArea = "", inidLicense = "";
		var inidCareer = "", inidSchool = "", inidJobform = "", inidPay = "";

		$(".keywords span input:button").each(function(index, item){
			spanId = $(this).attr("id");
			if(spanId == "job3"){
				inidType += $(this).attr("name")+","
			}
			if(spanId == "area_job3"){
				inidAreaJob += $(this).attr("name")+","
			}
			if(spanId == "area2"){
				inidArea += $(this).attr("name")+","
			}
			if(spanId == "inid_mylskill3"){
				inidLicense += $(this).attr("name")+","
			}
			if(spanId == "job_career"){
				inidCareer += $(this).attr("name")+","
			}
			if(spanId == "job_school"){
				inidSchool += $(this).attr("name")+","
			}
			if(spanId == "job_type"){
				inidJobform += $(this).attr("name")+","
			}
			if(spanId == "job_pay"){
				inidPay += $(this).attr("name")+","
			}
		});
		inidType = inidType.length > 0 ? inidType.substring(0, inidType.length - 1) : "";
		inidAreaJob = inidAreaJob.length > 0 ? inidAreaJob.substring(0, inidAreaJob.length - 1) : "";
		inidArea = inidArea.length > 0 ? inidArea.substring(0, inidArea.length - 1) : "";
		inidLicense = inidLicense.length > 0 ? inidLicense.substring(0, inidLicense.length - 1) : "";
		inidCareer = inidCareer.length > 0 ? inidCareer.substring(0, inidCareer.length - 1) : "";
		inidSchool = inidSchool.length > 0 ? inidSchool.substring(0, inidSchool.length - 1) : "";
		inidJobform = inidJobform.length > 0 ? inidJobform.substring(0, inidJobform.length - 1) : "";
		inidPay = inidPay.length > 0 ? inidPay.substring(0, inidPay.length - 1) : "";
		
		$("#inidType").val(inidType);
		$("#inidAreaJob").val(inidAreaJob);
		$("#inidArea").val(inidArea);
		$("#inidLicense").val(inidLicense);
		$("#inidCareer").val(inidCareer);
		$("#inidSchool").val(inidSchool);
		$("#inidJobform").val(inidJobform);
		$("#inidPay").val(inidPay);
		$("#keywordsHtml").val($(".keywords").html());
		
		if(inidType.length <= 0 && inidAreaJob.length <= 0 && inidArea.length <= 0 && inidLicense.length <= 0 && inidCareer.length <= 0 && inidSchool.length <= 0 && inidJobform.length <= 0 && inidPay.length <= 0){
			alert("검색 조건을 확인하세요.");
		}else{
			$("#searchForm").submit();	
		}
	}
</script>
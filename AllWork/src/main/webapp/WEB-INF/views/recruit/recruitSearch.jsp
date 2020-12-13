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
			<h4>채용정보 상세검색</h4>
			<div id="rec_row01_1">
                <ul class="tab">
                  <li><a href="#" title="직무별">직무별</a></li>
                  <li><a href="#" title="산업별">산업별</a></li>
                  <li><a href="#" title="지역별">지역별</a></li>
                  <li><a href="#" title="상세조건별">상세조건별</a></li>
                </ul>
                <div class="descArea">
                  <ul class="cate_job">
                    <li><input id="column02_btn01" class="on" type="button" name="column02_btn01" value="경영·사무"/></li>
                    <li><input id="column02_btn02" class="on" type="button" name="column02_btn02" value="마케팅·광고·홍보"/></li>
                    <li><input id="column02_btn03" class="on" type="button" name="column02_btn03" value="IT·인터넷"/></li>
                    <li><input id="column02_btn04" class="on" type="button" name="column02_btn04" value="디자인"/></li>
                    <li><input id="column02_btn05" class="on" type="button" name="column02_btn05" value="무역·유통"/></li>
                    <li><input id="column02_btn06" class="on" type="button" name="column02_btn06" value="영업·고객상담"/></li>
                    <li><input id="column02_btn07" class="on" type="button" name="column02_btn07" value="서비스"/></li>
                    <li><input id="column02_btn08" class="on" type="button" name="column02_btn08" value="연구개발·설계"/></li>
                    <li><input id="column02_btn09" class="on" type="button" name="column02_btn09" value="생산·제조"/></li>
                    <li><input id="column02_btn10" class="on" type="button" name="column02_btn10" value="교육"/></li>
                    <li><input id="column02_btn11" class="on" type="button" name="column02_btn11" value="건설"/></li>
                    <li><input id="column02_btn12" class="on" type="button" name="column02_btn12" value="의료"/></li>
                    <li><input id="column02_btn13" class="on" type="button" name="column02_btn13" value="미디어"/></li>
                    <li><input id="column02_btn14" class="on" type="button" name="column02_btn14" value="전문·특수직"/></li>
                  </ul>
                  <ul class="cate_industry">
                    <li><input id="column03_btn01" class="on" type="button" name="column03_btn01" value="서비스업"/></li>
                    <li><input id="column03_btn02" class="on" type="button" name="column03_btn02" value="금융·은행업"/></li>
                    <li><input id="column03_btn03" class="on" type="button" name="column03_btn03" value="IT·정보통신업"/></li>
                    <li><input id="column03_btn04" class="on" type="button" name="column03_btn04" value="판매·유통업"/></li>
                    <li><input id="column03_btn05" class="on" type="button" name="column03_btn05" value="교육업"/></li>
                    <li><input id="column03_btn06" class="on" type="button" name="column03_btn06" value="건설업"/></li>
                    <li><input id="column03_btn07" class="on" type="button" name="column03_btn07" value="의료·제약업"/></li>
                    <li><input id="column03_btn08" class="on" type="button" name="column03_btn08" value="미디어·광고업"/></li>
                    <li><input id="column03_btn09" class="on" type="button" name="column03_btn09" value="문화·예술·디자인업"/></li>
                    <li><input id="column03_btn10" class="on" type="button" name="column03_btn10" value="기관·협회"/></li>
                  </ul>
                  <ul class="cate_location">
                    <li><input id="column01_btn01" class="on" type="button" name="column01_btn01" value="서울특별시"/></li>
                    <li><input id="column01_btn02" class="on" type="button" name="column01_btn02" value="경기도"/></li>
                    <li><input id="column01_btn03" class="on" type="button" name="column01_btn03" value="인천광역시"/></li>
                    <li><input id="column01_btn04" class="on" type="button" name="column01_btn04" value="대전광역시"/></li>
                    <li><input id="column01_btn05" class="on" type="button" name="column01_btn05" value="세종특별자치시"/></li>
                    <li><input id="column01_btn06" class="on" type="button" name="column01_btn06" value="충청남도"/></li>
                    <li><input id="column01_btn07" class="on" type="button" name="column01_btn07" value="충청북도"/></li>
                    <li><input id="column01_btn08" class="on" type="button" name="column01_btn08" value="광주광역시"/></li>
                    <li><input id="column01_btn09" class="on" type="button" name="column01_btn09" value="전라남도"/></li>
                    <li><input id="column01_btn10" class="on" type="button" name="column01_btn10" value="전라북도"/></li>
                    <li><input id="column01_btn11" class="on" type="button" name="column01_btn11" value="대구광역시"/></li>
                    <li><input id="column01_btn12" class="on" type="button" name="column01_btn12" value="경상북도"/></li>
                    <li><input id="column01_btn13" class="on" type="button" name="column01_btn13" value="부산광역시"/></li>
                    <li><input id="column01_btn14" class="on" type="button" name="column01_btn14" value="울산광역시"/></li>
                    <li><input id="column01_btn15" class="on" type="button" name="column01_btn15" value="경상남도"/></li>
                    <li><input id="column01_btn16" class="on" type="button" name="column01_btn16" value="강원도"/></li>
                    <li><input id="column01_btn17" class="on" type="button" name="column01_btn17" value="제주특별자치도"/></li>
                    <li><input id="column01_btn18" class="on" type="button" name="column01_btn18" value="전국"/></li>
                    <li><input id="column01_btn19" class="on" type="button" name="column01_btn19" value="해외"/></li>
                  </ul>
                <ul class="cate_ect">
                  <li><input id="column06_btn01" class="on" type="button" name="column06_btn01" value="해외지역"/></li>
                  <li><input id="column06_btn02" class="on" type="button" name="column06_btn02" value="직급/직책별"/></li>
                  <li><input id="column06_btn03" class="on" type="button" name="column06_btn03" value="전공계열별"/></li>
                  <li><input id="column06_btn04" class="on" type="button" name="column06_btn04" value="우대조건별"/></li>
                  <li><input id="column06_btn05" class="on" type="button" name="column06_btn05" value="자격증별"/></li>
                  <li><input id="column06_btn06" class="on" type="button" name="column06_btn06" value="복리후생별"/></li>
                </ul>
                </div>
                <div id="cateOn">
                  <ul class="select01">
                    <li><input id="column02_btn01" class="on" type="button" name="column02_btn01" value="경영·사무"/></li>
                    <li><input id="column02_btn02" class="on" type="button" name="column02_btn02" value="마케팅·광고·홍보"/></li>
                    <li><input id="column02_btn03" class="on" type="button" name="column02_btn03" value="IT·인터넷"/></li>
                    <li><input id="column02_btn04" class="on" type="button" name="column02_btn04" value="디자인"/></li>
                    <li><input id="column02_btn05" class="on" type="button" name="column02_btn05" value="무역·유통"/></li>
                    <li><input id="column02_btn06" class="on" type="button" name="column02_btn06" value="영업·고객상담"/></li>
                    <li><input id="column02_btn07" class="on" type="button" name="column02_btn07" value="서비스"/></li>
                    <li><input id="column02_btn08" class="on" type="button" name="column02_btn08" value="연구개발·설계"/></li>
                    <li><input id="column02_btn09" class="on" type="button" name="column02_btn09" value="생산·제조"/></li>
                    <li><input id="column02_btn10" class="on" type="button" name="column02_btn10" value="교육"/></li>
                    <li><input id="column02_btn11" class="on" type="button" name="column02_btn11" value="건설"/></li>
                    <li><input id="column02_btn12" class="on" type="button" name="column02_btn12" value="의료"/></li>
                    <li><input id="column02_btn13" class="on" type="button" name="column02_btn13" value="미디어"/></li>
                    <li><input id="column02_btn14" class="on" type="button" name="column02_btn14" value="전문·특수직"/></li>
                  </ul>
                  <ul class="select02">
                    <li><input id="column02_btn011" class="on" type="button" name="column02_btn011" value="자동차·조선·기계"/></li>
                    <li><input id="column02_btn021" class="on" type="button" name="column02_btn021" value="반도체·디스플레이"/></li>
                    <li><input id="column02_btn031" class="on" type="button" name="column02_btn031" value="화학·에너지·환경"/></li>
                    <li><input id="column02_btn041" class="on" type="button" name="column02_btn041" value="전기·전자·제어"/></li>
                    <li><input id="column02_btn051" class="on" type="button" name="column02_btn051" value="기계설계·CAD·CAM"/></li>
                    <li><input id="column02_btn061" class="on" type="button" name="column02_btn061" value="통신기술·네트워크구축"/></li>
                    <li><input id="column02_btn071" class="on" type="button" name="column02_btn071" value="바이오·제약·식품"/></li>
                  </ul>
                  <ul class="select03">
                    <li><input id="column02_btn012" class="on" type="button" name="column02_btn012" value="기계"/></li>
                    <li><input id="column02_btn022" class="on" type="button" name="column02_btn022" value="기구설계"/></li>
                    <li><input id="column02_btn032" class="on" type="button" name="column02_btn032" value="생산기술"/></li>
                    <li><input id="column02_btn042" class="on" type="button" name="column02_btn042" value="제품개발"/></li>
                    <li><input id="column02_btn052" class="on" type="button" name="column02_btn052" value="금형설계"/></li>
                    <li><input id="column02_btn062" class="on" type="button" name="column02_btn062" value="R&D"/></li>
                    <li><input id="column02_btn072" class="on" type="button" name="column02_btn072" value="메카트로닉스"/></li>
                    <li><input id="column02_btn042" class="on" type="button" name="column02_btn042" value="금속"/></li>
                    <li><input id="column02_btn052" class="on" type="button" name="column02_btn052" value="조선/플랜트"/></li>
                    <li><input id="column02_btn062" class="on" type="button" name="column02_btn062" value="건설/건축"/></li>
                    <li><input id="column02_btn072" class="on" type="button" name="column02_btn072" value="철강"/></li>
                  </ul>
                </div>
              </div>
			<div id="searchBox">
				<p class="keywords">
					<span><input type="button" value="서울특별시"/><i class="fas fa-times"></i></span>
					<span><input type="button" value="서울특별시"/><i class="fas fa-times"></i></span>
					<span><input type="button" value="서울특별시"/><i class="fas fa-times"></i></span>
					<span><input type="button" value="서울특별시"/><i class="fas fa-times"></i></span>
					<span><input type="button" value="서울특별시"/><i class="fas fa-times"></i></span>
				</p>
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
			<ul class="rec_title">
				<li class="desc01">업체명</li>
				<li class="desc02">채용정보</li>
				<li class="desc03">경력</li>
				<li class="desc04">학력</li>
				<li class="desc05">등록/수정</li>
				<li class="desc06">마감</li>
			</ul>
			
			<ul class="rec_list">
				<c:choose>
					<c:when test="${recruitList.size() > 0 }">
						<c:forEach var="result" items="${recruitList}" varStatus="status">
							<li>
								<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.open }', '');">
									<p class="list_title">${result.bizName }</p>
									<div class="desc1">
										<p class="desc11">${convert:compByte(result.bizTitle, 100, "...")}</p>
										<p class="desc12"><strong>급여 </strong>${result.bizPayName }</p>
										<p class="desc12">
											<strong>지역 </strong>
												${result.bizArea1Name }
												${convert:checkNull(result.bizArea2Name) eq '' ? '' : '>'.concat(result.bizArea2Name) }
										</p>
									</div>
									<div class="desc2">
										<p class="desc21">${codeConvert:getBizCareer(result.bizCareer) }</p>
										<p class="desc22">${codeConvert:getBizAbilityShort(result.bizAbility) }</p>
									</div>
									<div class="desc3">
										<p class="desc31"><strong>등록 </strong>${result.wdate }</p>
										<p class="desc32"><strong>수정 </strong>${result.uWdate }</p>
									</div>
									${codeConvert:getRecruitStatus(result.bizIng, result.bizEndType, result.bizEndDay) }
								</a>
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
<jsp:include page="/footer.do" />

<form name="searchForm" id="searchForm" method="post" action="/recruitSearch.do">
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
</form>

<script type="text/javascript">
	
	$(document).ready(function(){
		
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
	

</script>


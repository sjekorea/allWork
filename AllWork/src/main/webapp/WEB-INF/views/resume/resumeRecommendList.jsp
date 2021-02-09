<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/company_scrap.css"/>
<style type="text/css">
	/*현재메뉴 언더라인*/
	#menuTree ul .gnb03{text-decoration: underline;}
</style>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/personInfoSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="listPart">
				<h4>우수추천 인재</h4>
				<table class="list">
					<caption>리스트</caption>
					<tbody>
						<tr class="list_title">
							<!-- 
							<th class="desc01"></th>
							 -->
							<th class="desc02">이름/출생년도</th>
							<th class="desc03">최종학력</th>
							<th class="desc04">보유기술</th>
							<th class="desc05">희망근무지</th>
						</tr>
						<c:choose>
							<c:when test="${resumeRecommendList.size() > 0 }">
								<c:forEach var="result" items="${resumeRecommendList}" varStatus="status">
									<tr class="desc">
										<!-- 
									<c:if test="${result.photo == null || result.photo == '' }">
										<td class="desc01"><img src="img/userNo.png" alt="인재사진" width=120 height=142/></td>
									</c:if>
									<c:if test="${result.photo != null && result.photo != '' }">
										<td class="desc01"><img src="allwork/peg/${result.photo}" alt="인재사진" width=120 height=142 /></td>
									</c:if>
										 -->
										<td class="desc02">
											${convert:getPersonNameHidden(result.name, result.paidResume) }<br/>
											${result.birthYear}년생</span>
										</td>
										<td class="desc03">
											${result.schooling }<br/>
										</td>
										<td class="desc04">
											<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.uno }', '${result.inidSecret }', 'resume');">
												${result.inidTitle }<br />
												<span>${convert:compByte(result.careerMain, 150, "...")}</span>
											</a>
										</td>
										<td class="desc05">
											${result.workArea }
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="desc"><td colspan="4">우수추천 인재가 없습니다.</div></li>
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

<form id="searchForm" name="searchForm" method="post" action="/resumeRecommendList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="personUid" id="personUid" value="" />
	<input type="hidden" name="companyUid" id="companyUid" value="" />
	<input type="hidden" name="no" id="no" value="" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/companySubMenu.do" />
</form>

<script type="text/javascript">
	
	$(document).ready(function(){	
	});	
	

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
</script>


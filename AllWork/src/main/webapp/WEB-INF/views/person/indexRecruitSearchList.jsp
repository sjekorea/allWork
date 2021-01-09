<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<!-- 
<jsp:include page="/personHeader.do" />
 -->
<jsp:include page="/indexHeader.do" />

<!-- 
<link rel="stylesheet" type="text/css" href="/css/header_main.css"/>
 -->
<link rel="stylesheet" type="text/css" href="/css/personal_home.css"/>

<div id="containerWrap">
	<div id="rightPart" style="width:100%;">
		<div id="listPart">
			<ul class="tab">
				<li><a class="selected" href="#" title="">AI 통합 검색 채용 공고</a></li>
			</ul>
	       	<!-- (begin) 2020.12.30 by s.yoo -->
			<table class="list" id="list01">
				<tbody>
					<c:choose>
						<c:when test="${item.recruitDataAllwork.size() > 0 }">
							<c:forEach var="result" items="${item.recruitDataAllwork}" varStatus="status">
								<tr class="desc desc0">
									<td rowspan="3" class="desc01">${result.name }</td>
									<td colspan="6" class="desc02">
										<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.recommend_id }', '', 'open', '');">
											${result.title }
										</a>
									</td>
									<td rowspan="3" class="desc05">${result.strEdate }</td>
								</tr>
								<tr class="desc desc1">
									<td class="desc03">급여</td>
									<td class="desc04">${result.salary }</td>
								</tr>
								<tr class="desc desc2">
									<td class="desc03">근무지</td>
									<td class="desc04">${result.loc }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td class="desc00" colspan="5">주어진 조건을 만족하는 기업회원 등록 채용정보를 찾을 수 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

			<table class="list" id="list02">
				<tbody>
					<c:choose>
						<c:when test="${item.recruitDataWorknet.size() > 0 }">
							<c:forEach var="result" items="${item.recruitDataWorknet}" varStatus="status">
								<tr class="desc desc0">
									<td rowspan="3" class="desc01">${result.name }</td>
									<td colspan="6" class="desc02">
										<a href="http://www.work.go.kr/empInfo/empInfoSrch/detail/empDetailAuthView.do?callPage=detail&wantedAuthNo=${result.recommend_id }" target="_blank">
											${result.title }
										</a>
									</td>
									<td rowspan="3" class="desc05">${result.strEdate }</td>
								</tr>
								<tr class="desc desc1">
									<td class="desc03">급여</td>
									<td class="desc04">${result.salary }</td>
								</tr>
								<tr class="desc desc2">
									<td class="desc03">근무지</td>
									<td class="desc04">${result.loc }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td class="desc00" colspan="5">주어진 조건을 만족하는 기타 채용정보를 찾을 수 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
	       	<!-- (end) 2020.12.30 by s.yoo -->
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />

<form id="searchForm" name="searchForm" method="post" action="/recruitScrapList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="personUid" id="personUid" value="" />
	<input type="hidden" name="companyUid" id="companyUid" value="" />
	<input type="hidden" name="no" id="no" value="" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/personSubMenu.do" />
</form>

<script type="text/javascript">
	
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
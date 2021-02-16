<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_03.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
		<c:if test="${SE_USER_TYPE == 'person' }">
			<jsp:include page="/recruitInfoSubMenu.do" />
		</c:if>
		</div>
		<div id="rightPart">
			<div id="listPart">
				<h4>기타 채용정보(<fmt:formatNumber value="${map.totalSize}" pattern="#,###"/>)</h4>
				
			<div>
				<form id="searchForm" name="searchForm" action="/recruitOther.do">
					<fieldset>
						<legend>검색</legend>
						<p><input type="text" id="search_company" name="search_company" value="${map.search_company }" placeholder="회사명" /></p>
						<p><input type="text" id="search_title" name="search_title" value="${map.search_title }" placeholder="채용공고 내용" /></p>
						<p><input type="text" id="search_loc" name="search_loc" value="${map.search_loc }" placeholder="근무지" /></p>
						<p><input type="text" id="search_keyword" name="search_keyword" value="${map.search_keyword }" placeholder="키워드" /></p>
						<p class="btnBox"><input id="search_btn" type="button" name="search_btn" value="검색" style="cursor:pointer;"/></p>
						<p class="btnBox"><input id="reset_btn" type="button" name="reset_btn" value="초기화" style="cursor:pointer;"/></p>
						<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo }"/>
						<input type="hidden" id="no" name="no" value="" />
						<input type="hidden" id="wantedAuthNo" name="wantedAuthNo" value="" />
					</fieldset>
				</form>
			</div>	

				<table class="list">
					<caption>리스트</caption>
					<thead>
						<tr>
							<th class="t_desc01">회사명</th>
							<th colspan="3" class="t_desc02">채용공고</th>
							<th class="t_desc03">마감일</th>
						</tr>
					</thead>
					<c:choose>
						<c:when test="${recruitList.size() > 0 }">
							<c:forEach var="result" items="${recruitList}" varStatus="status">
								<tbody>
									<tr class="margin"></tr>
									<tr>
										<td rowspan="3" class="desc01">${result.companyTitle }</td>
										<td colspan="3" class="desc02">
									       	<!-- (begin) 2020.12.30 by s.yoo -->
									       	<!-- 
											<a href="http://www.work.go.kr/empInfo/empInfoSrch/detail/empDetailAuthView.do?callPage=detail&wantedAuthNo=${result.wantedAuthNo }" target="_blank">
												${result.recruitItem }
											</a>
									       	 -->
											<a href="javascript:goOtherDetail('${result.wantedAuthNo }');">
												${result.recruitItem }
											</a>
									       	<!-- (end) 2020.12.30 by s.yoo -->
										</td>
										<td rowspan="3" class="desc03">
											${convert:getEndCondOther(result.strEdate)}
										</td>
									</tr>
									<tr>
										<td><span class="desc_title">연락처</span><span class="desc_desc00">${result.phone }</span></td>
										<td><span class="desc_title">인원</span><span class="desc_desc00">${result.men }</span></td>
										<td><span class="desc_title">급여</span><span class="desc_desc00">${result.salary }</span></td>
									</tr>
									<tr>
										<td><span class="desc_title">근무처</span><span class="desc_desc00">${result.whereis }</span></td>
										<td><span class="desc_title">등록일</span><span class="desc_desc00">${result.wdate }</span></td>
										<td><span class="desc_title"></span><span class="desc_desc00"></span></td>
									</tr>
									<tr class="margin"></tr>
								</tbody>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tbody>
								<tr class="desc"><td style="text-align:center;height:80px;">내역이 없습니다.</td></tr>
							</tbody>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<div class="numareaWrap">
				<ul class="numArea">
					${pageMap.pageHtml }
				</ul>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />

<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#search_btn").on("click", function(e) {
			$("#searchForm").submit();	
		});

		$("#reset_btn").on("click", function(e) {
			$("#search_company").val("");
			$("#search_title").val("");
			$("#search_loc").val("");
			$("#search_keyword").val("");

			$("#searchForm").submit();	
		});

	});
	
	$("#search_company").keydown( function() {
		var kcode = event.keyCode;
		if(kcode == 13) {
			$("#searchForm").submit();	
		}
	});
	$("#search_title").keydown( function() {
		var kcode = event.keyCode;
		if(kcode == 13) {
			$("#searchForm").submit();	
		}
	});
	$("#search_loc").keydown( function() {
		var kcode = event.keyCode;
		if(kcode == 13) {
			$("#searchForm").submit();	
		}
	});
	$("#search_keyword").keydown( function() {
		var kcode = event.keyCode;
		if(kcode == 13) {
			$("#searchForm").submit();	
		}
	});
	
	// 기타 채용정보 상세보기 화면으로 이동.
	function goOtherDetail(wantedAuthNo){
		loadingOn();
		
		$("#wantedAuthNo").val(wantedAuthNo);
		$("#searchForm").attr("action", "/recruitOtherDetail.do");
		$("#searchForm").submit();
	}

</script>


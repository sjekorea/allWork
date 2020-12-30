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
			<jsp:include page="/recruitInfoSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="listPart">
				<h4>기타 채용공고</h4>
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
											<a href="" title="맞춤채용공고">${result.recruitItem }</a>
										</td>
										<td rowspan="3" class="desc03">${result.strEdate }</td>
									</tr>
									<tr>
										<td><span class="desc_title">연락처</span><span class="desc_desc00">${result.phone }</span></td>
										<td><span class="desc_title">인원</span><span class="desc_desc00">${result.men }</span></td>
										<td><span class="desc_title">급여</span><span class="desc_desc00">${result.salary }</span></td>
									</tr>
									<tr>
										<td><span class="desc_title">근무처</span><span class="desc_desc00">${result.whereis }</span></td>
										<td><span class="desc_title">등록일</span><span class="desc_desc00">${result.beg }</span></td>
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

<form name="searchForm" id="searchForm" method="post" action="/recruitOther.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo }"/>
</form>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		
	});	
	
</script>


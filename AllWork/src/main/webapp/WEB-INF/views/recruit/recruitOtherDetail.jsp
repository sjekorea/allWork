<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<c:choose>
	<c:when test="${SE_USER_TYPE eq 'person' }">
		<jsp:include page="/personHeader.do" />
	</c:when>
	<c:otherwise>
		<jsp:include page="/companyHeader.do" />
	</c:otherwise>
</c:choose>

<link rel="stylesheet" type="text/css" href="/css/company_01_view.css"/>
<style type="text/css">
	/*현재메뉴 언더라인*/
	#menuTree ul .gnb04{text-decoration: underline;}
</style>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
		<c:if test="${SE_USER_TYPE == 'person' }">
			<jsp:include page="/recruitInfoSubMenu.do" />
		</c:if>
		</div>
		<div id="rightPart">
			<div id="regist00">
				<div id="detailArea">
					<p class="detail_title">기본정보</p>
					<p class="company_setting">
						<span>
							<a href="http://www.work.go.kr/empInfo/empInfoSrch/detail/empDetailAuthView.do?callPage=detail&wantedAuthNo=${recruitMap.wantedAuthNo }" target="_blank">
								<i class="fas fa-cog"></i>&nbsp;채용정보 상세보기
							</a>
						</span>
					</p>
					<table>
						<caption>기타채용정보 기본정보</caption>
						<tbody class="tabelArea">
							<tr><th class="table_title">회사명</th><td class="table_desc">${recruitMap.companyTitle }</td></tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="regist02">
				<div id="regForm02">
					<table>
						<caption>모집요강</caption>
						<tbody>
							<tr>
								<th>채용진행상태</th>
								<td>${(recruitMap.prs == 'P')? "채용진행중" : "채용마감" }</td>
							</tr>
							<tr>
								<th>등록일</th>
								<td>등록일: ${recruitMap.wdate }, 최종수정일: ${recruitMap.edate }</td>
							</tr>
							<tr>
								<th>채용정보</th>
								<td>${recruitMap.recruitItem }</td>
							</tr>
							<tr>
								<th>직무</th>
								<td>${recruitMap.jobType }</td>
							</tr>
							<tr>
								<th>근무지역</th>
								<td>${recruitMap.whereis }</td>
							</tr>
							<tr>
								<th>급여조건</th>
								<td>${recruitMap.salary }</td>
							</tr>
							<tr>
								<th>우대조건</th>
								<td>${convert:checkNull(recruitMap.preference) eq "" ? "등록된 우대조건 없음" : recruitMap.preference }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="regist04">
				<div id="regForm04">
					<table>
						<caption>마감일/방법</caption>
						<tbody>
							<tr>
								<th>채용마감</th>
								<td>${recruitMap.strEdate }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="regist05">
				<div id="regForm05">
					<table>
						<caption>담당자정보</caption>
						<tbody>
							<tr>
								<th>연락처</th>
								<td>${recruitMap.phone }</td>
							</tr>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />

<script type="text/javascript">

	$(document).ready(function(){
	});	

</script>
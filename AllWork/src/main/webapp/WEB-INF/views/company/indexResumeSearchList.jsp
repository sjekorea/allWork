<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>


<!-- 
<jsp:include page="/companyHeader.do" />
 -->
<jsp:include page="/indexHeader.do" />

<!-- 
<link rel="stylesheet" type="text/css" href="/css/header_main.css"/>
 -->
<link rel="stylesheet" type="text/css" href="/css/company_home.css"/>

<div id="containerWrap">
	<div id="rightPart" style="width:100%;">
		<div id="listPart">
			<ul class="tab">
				<li><a class="selected" href="#" title="">AI 통합 검색 인재 정보</a></li>
			</ul>
	       	<!-- (begin) 2020.12.30 by s.yoo -->
			<table class="list" id="list01" style="width:100%;">
				<tbody class="tabelArea">
					<c:choose>
						<c:when test="${item.resumeDataAllwork.size() > 0 }">
							<c:forEach var="result" items="${item.resumeDataAllwork}" varStatus="status">
								<tr>
									<td class="desc00">
										<span>${result.name }</span><br/>
									</td>
									<td class="desc01" colspan=2>
										<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.recommend_id }', 'no', 'resume');">
											<span class="desc01_01">
												${result.title }
											</span>
										</a>
										<br />
										<span>
											${result.job_type }
										</span>
									</td>
									<td class="desc02">
										<span>
											${result.loc }
										</span>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td class="desc00" colspan="5">주어진 조건을 만족하는 인재정보를 찾을 수 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
	       	<!-- (end) 2020.12.30 by s.yoo -->
		</div>
	</div>
</div>
	
<jsp:include page="/footer.do" />

<form id="searchForm" name="searchForm" method="post" action="/recruitListProgress.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="personUid" id="personUid" value="${map.personUid}" />
	<input type="hidden" name="companyUid" id="companyUid" value="${map.companyUid}" />
	<input type="hidden" name="no" id="no" value="" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="bizIng" id="bizIng" value="${map.bizIng}" />
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/companySubMenu.do" />
</form>

<script type="text/javascript">

	$(document).ready(function(){
		$(".tab li a").click(function(e){
			$(this).parent().parent().find("a").removeClass('selected');
			$(this).addClass('selected');
			var idx = $(this).parent("li").index();
			$(".list").eq(idx).css("display", "block").siblings(".list").css("display", "none");
		});
	});	
	
	
	function goDetail(companyUid, personUid, no, recruitNo, resumeNo, open, detailFlag){
		
		loadingOn();
		
		if("resume" == detailFlag){
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
	}
</script>


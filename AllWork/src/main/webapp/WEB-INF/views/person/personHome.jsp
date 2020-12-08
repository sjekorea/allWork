<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_home.css"/>

<div id="containerWrap">
	<div id="leftPart">
		<div id="myBox">
			<div class="imgArea">
				<p class="cameraBtn"><a href="#" title="사진등록버튼"><i class="fas fa-camera-retro"></i></a></p>
				<p class="myImg"><img src="/img/person.jpg" alt="본인사진"/></p>
			</div>
			<p class="myName"><strong>${SE_USER_NM }</strong>님</p>
			<p class="myDetail"><a href="#" title="이력서보기버튼">이력서보기</a></p>
		</div>
		<div id="menuTree">
			<ul>
				<li class="gnb"><a href="#" title="이력서관리">이력서관리</a>
					<h3>이력서관리</h3>
					<ol>
						<li><a href="/resumeInfoReg.do" title="이력서등록">이력서등록</a></li>
						<li><a href="#" title="이력서수정">이력서수정</a></li>
						<li><a href="#" title="첨부파일관리">첨부파일관리</a></li>
					</ol>
				</li>
				<li class="gnb"><a href="/personApplicationList.do" title="입사지원관리">입사지원관리</a>
					<h3>입사지원관리</h3>
					<ol>
						<li><a href="/personApplyList.do" title="입사지원현황">입사지원현황</a></li>
					</ol>
				</li>
				<li class="gnb"><a href="/recruitScrapList.do" title="스크랩/관심기업">스크랩/관심기업</a>
					<h3>스크랩/관심기업</h3>
					<ol>
						<li><a href="/recruitScrapList.do" title="스크랩">스크랩한 채용정보</a></li>
						<li><a href="/interestCompanyList.do" title="관심기업">관심기업</a></li>
						<li><a href="/interviewRequestCompany.do" title="면접요청기업">면접요청기업</a></li>
					</ol>
				</li>
				<li class="gnb"><a href="/fitRecruitList.do" title="맞춤서비스 관리">맞춤서비스 관리</a>
					<h3>맞춤서비스 관리</h3>
					<ol>
						<li><a href="/fitRecruitList.do" title="맞춤채용정보">맞춤채용정보</a></li>
						<li><a href="/fitRecruitSetting.do" title="맞춤서비스설정">맞춤서비스설정</a></li>
					</ol>
				</li>
				<li class="gnb payService"><a href="#" title="유료서비스">유료서비스</a>
					<h3>유료서비스</h3>
					<ol>
						<li><a href="#" title="결재내역 조회">결재내역 조회</a></li>
						<li><a href="#" title="유료옵션서비스 신청">유료옵션서비스 신청</a></li>
					</ol>
				</li>
				<li class="gnb"><a href="#" title="회원정보관리">회원정보관리</a></li>
			</ul>
		</div>
	</div>
	<div id="rightPart">
		<div id="reviewPart">
			<ul>
				<li class="review00"><a href="#" title="지원완료"><strong>${onlineRecruitCnt }</strong><span>지원완료</span></a></li>
				<li class="review01"><a href="#" title="이력서열람"><strong>${netfuOpenResumeCnt }</strong><span>이력서열람</span></a></li>
				<li class="review02"><a href="#" title="스크랩공고"><strong>${netfuScrapCnt }</strong><span>스크랩공고</span></a></li>
				<li class="review03"><a href="#" title="관심기업공고"><strong>${netfuConcernCnt }</strong><span>관심기업공고</span></a></li>
			</ul>
		</div>
		<div id="recommendPart">
			<h4>추천채용정보</h4>
			<ul>
				<c:choose>
					<c:when test="${recommandRecruitList.size() > 0 }">
						<c:forEach var="result" items="${recommandRecruitList}" varStatus="status">
							<c:if test="${status.index < 4 }">
								<li>
				                	<a href="#" title="추천채용정보">
				                    	<div class="descBox">
				                      		<p class="desc01">${result.companyTitle }</p>
				                      		<p class="desc02">${convert:compByte(result.recruitItemContents, 30, "...")}</p>
				                     		<span class="desc03">${result.men }</span>
				                    	</div>
				                  	</a>
				                </li>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li style="width:100%;"><div class="descBox"><p class="desc02">내역이 없습니다.</p></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div id="listPart">
			<ul class="tab">
				<li><a class="selected" href="#" title="맞춤채용공고">맞춤채용공고</a></li>
				<li><a href="#" title="스크랩공고">스크랩공고</a></li>
				<li><a href="#" title="최근 본 공고">최근 본 공고</a></li>
			</ul>
			<ul class="list" id="list01">
				<c:choose>
					<c:when test="${myServiceRecruitList.size() > 0 }">
						<c:forEach var="result" items="${myServiceRecruitList}" varStatus="status">
							<li>
								<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.open }', '');">
									<p class="title">${result.bizName }</p>
									<div class="desc">
										<p class="desc0">${convert:compByte(result.bizTitle, 100, "...")}</p>
										<p class="desc1"><strong>급여 </strong>${result.bizPayName }</p>
										<p class="desc2"><strong>경력 </strong>${codeConvert:getBizCareer(result.bizCareer) }</p>
										<p class="desc3"><strong>나이 </strong>${result.bizAge }</p>
										<p class="desc1"><strong>지역 </strong>${result.bizArea1Name }</p>
										<p class="desc2"><strong>학력 </strong>${codeConvert:getBizAbility(result.bizAbility) }</p>
										<p class="desc3"><strong>성별 </strong>${codeConvert:getBizSex(result.bizSex) }</p>
									</div>
									${codeConvert:getRecruitStatus(result.bizIng, result.bizEndType, result.bizEndDay) }
								</a>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li style="width:100%;"><p class="title">내역이 없습니다.</p></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<ul class="list" id="list02" style="display:none;">
				<c:choose>
					<c:when test="${recruitScrapList.size() > 0 }">
						<c:forEach var="result" items="${recruitScrapList}" varStatus="status">
							<li>
								<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.open }', '');">
									<p class="title">${result.bizName }</p>
									<div class="desc">
										<p class="desc0">${convert:compByte(result.bizTitle, 100, "...")}</p>
										<p class="desc1"><strong>급여 </strong>${result.bizPayName }</p>
										<p class="desc2"><strong>경력 </strong>${codeConvert:getBizCareer(result.bizCareer) }</p>
										<p class="desc3"><strong>나이 </strong>${result.bizAge }</p>
										<p class="desc1"><strong>지역 </strong>${result.bizArea1Name }</p>
										<p class="desc2"><strong>학력 </strong>${codeConvert:getBizAbility(result.bizAbility) }</p>
										<p class="desc3"><strong>성별 </strong>${codeConvert:getBizSex(result.bizSex) }</p>
									</div>
									${codeConvert:getRecruitStatus(result.bizIng, result.bizEndType, result.bizEndDay) }
								</a>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li style="width:100%;"><p class="title">내역이 없습니다.</p></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<ul class="list" id="list03" style="display:none;">
				<li>
					<a href="#none" title="최근 본 공고">
						<p class="title">(주)최근 본 공고</p>
						<div class="desc">
							<p class="desc0">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc1"><strong>급여 </strong>3000-3500만원</p>
							<p class="desc2"><strong>경력 </strong>무관</p>
							<p class="desc3"><strong>나이 </strong>무관</p>
							<p class="desc1"><strong>지역 </strong>경기 광주시</p>
							<p class="desc2"><strong>학력 </strong>무관</p>
							<p class="desc3"><strong>성별 </strong>무관</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
					</a>
				</li>
			</ul>
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
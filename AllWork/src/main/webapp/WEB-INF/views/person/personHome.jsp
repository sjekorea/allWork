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
			<p class="myDetail"><a href="/resumeList.do" title="이력서보기버튼">이력서보기</a></p>
		</div>
		<div id="menuTree">
			<ul>
				<li class="gnb"><a href="/resumeList.do" title="이력서관리">이력서관리</a>
					<h3>이력서관리</h3>
					<ol>
						<li><a href="/resumeList.do" title="">이력서목록</a></li>
						<li><a href="/resumeInfoReg.do" title="이력서등록">이력서등록</a></li>
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
				<li class="gnb"><a href="#" title="내가 확인한 채용정보">내가 확인한 채용정보</a></li>
				<li class="gnb"><a href="/fitRecruitList.do" title="맞춤서비스 관리">맞춤서비스 관리</a>
					<h3>맞춤서비스 관리</h3>
					<ol>
						<li><a href="/fitRecruitList.do" title="맞춤채용정보">맞춤채용정보</a></li>
						<li><a href="/fitRecruitSetting.do" title="맞춤서비스설정">맞춤서비스설정</a></li>
					</ol>
				</li>
				<li class="gnb payService"><a href="/resumeApplyForPay.do" title="유료서비스">유료서비스</a>
					<h3>유료서비스</h3>
					<ol>
						<li><a href="/resumeApplyForPay.do" title="이력서 유료 게시 서비스 신청">유료옵션서비스 신청</a></li>
						<li><a href="/resumePaidList.do" title="결재내역 조회">결재내역 조회</a></li>
					</ol>
				</li>
				<!-- (begin) 2021.01.03 by s.yoo	-->
				<!-- 
				<li class="gnb"><a href="/personModify.do" title="회원정보관리">회원정보관리</a></li>
				 -->
				<li class="gnb myPage"><a href="/personModify.do" title="회원정보관리">회원정보관리</a>
					<h3>회원정보관리</h3>
					<ol>
						<li><a href="/personModify.do" title="회원정보관리 ">회원정보관리</a></li>
						<li><a href="/memberUnregister.do" title="회원탈퇴">회원탈퇴</a></li>
					</ol>
				</li>
				<!-- (begin) 2021.01.03 by s.yoo	-->
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
		<!-- (begin) 2020.12.30 by s.yoo -->
		<div id="recommendPart">
			<h4>AI 추천 채용정보</h4>
			<ul>
				<c:choose>
					<c:when test="${recommandRecruitList.size() > 0 }">
						<c:forEach var="result" items="${recommandRecruitList}" varStatus="status">
							<c:if test="${status.index < 4 }">
								<li>
									<c:if test="${result.type == 1 }">
										<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.recommend_id }', '', 'open', '');">
					                    	<div class="descBox">
					                      		<p class="desc01">${result.name }</p>
					                      		<p class="desc02">${convert:compByte(result.title, 30, "...")}</p>
					                     		<span class="desc03">${result.loc }</span>
					                    	</div>
					                  	</a>
									</c:if>
									<c:if test="${result.type == 2 }">
										<a href="http://www.work.go.kr/empInfo/empInfoSrch/detail/empDetailAuthView.do?callPage=detail&wantedAuthNo=${result.recommend_id }" target="_blank">
					                    	<div class="descBox">
					                      		<p class="desc01">${result.name }</p>
					                      		<p class="desc02">${convert:compByte(result.title, 30, "...")}</p>
					                     		<span class="desc03">${result.loc }</span>
					                    	</div>
					                  	</a>
									</c:if>
				                </li>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
								<li style="width:100%; padding:10px">
				                	<a href="#" title="추천채용정보">
				                    	<div>
				                      		<p class="desc01">추천 업체명</p>
				                      		<p class="desc02">추천 채용공고</p>
				                     		<span class="desc03">근무지</span>
				                     		<span class="desc03">내용이 충실한 이력서를 등록하면, AI가 맞춤형 채용정보를 추천해 드립니다.</span>
				                    	</div>
				                  	</a>
				                </li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- (end) 2020.12.30 by s.yoo -->
		<div id="listPart">
			<ul class="tab">
				<!-- (begin) 2020.12.30 by s.yoo -->
				<li><a class="selected" href="#" title="AI 추천 채용정보">AI 추천 채용정보</a></li>
				<li><a href="#" title="맞춤채용공고">맞춤채용공고</a></li>
				<!-- (end) 2020.12.30 by s.yoo -->
				<li><a href="#" title="스크랩공고">스크랩공고</a></li>
				<li><a href="#" title="최근 본 공고">최근 본 공고</a></li>
			</ul>
			<!-- (begin) 2020.12.30 by s.yoo -->
			<table class="list" id="list00">
				<tbody>
					<c:choose>
						<c:when test="${recommandRecruitList.size() > 0 }">
							<c:forEach var="result" items="${recommandRecruitList}" varStatus="status">
								<tr class="desc desc0">
									<td rowspan="3" class="desc01">${result.name }</td>
									<td colspan="6" class="desc02">
										<c:if test="${result.type == 1 }">
											<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.recommend_id }', '', 'open', '');">
												${result.title }
											</a>
										</c:if>
										<c:if test="${result.type == 2 }">
											<a href="http://www.work.go.kr/empInfo/empInfoSrch/detail/empDetailAuthView.do?callPage=detail&wantedAuthNo=${result.recommend_id }" target="_blank">
												${result.title }
											</a>
										</c:if>
									</td>
									<td rowspan="3" class="desc05">${result.strEdate }</td>
								</tr>
								<tr class="desc desc1">
									<td class="desc03">급여</td>
									<td class="desc04">${result.salary }</td>
								</tr>
								<tr class="desc desc2">
									<td class="desc03">지역</td>
									<td class="desc04">${result.loc }</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
			<table class="list" id="list01" style="display:none;">
			<!-- (end) 2020.12.30 by s.yoo -->
				<tbody>
					<c:choose>
						<c:when test="${myServiceRecruitList.size() > 0 }">
							<c:forEach var="result" items="${myServiceRecruitList}" varStatus="status">
								<tr class="desc desc0">
									<td rowspan="3" class="desc01">(주)파인스태프</td>
									<td colspan="6" class="desc02">
										<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.open }', '');">
											${result.bizName }
										</a>
									</td>
									<td rowspan="3" class="desc05">${codeConvert:getRecruitStatus(result.bizIng, result.bizEndType, result.bizEndDay) }</td>
								</tr>
								<tr class="desc desc1">
									<td class="desc03">급여</td>
									<td class="desc04">${result.bizPayName }</td>
									<td class="desc03">경력</td>
									<td class="desc04">${codeConvert:getBizCareer(result.bizCareer) }</td>
									<td class="desc03">나이</td>
									<td class="desc04">${result.bizAge }</td>
								</tr>
								<tr class="desc desc2">
									<td class="desc03">지역</td>
									<td class="desc04">${result.bizArea1Name }</td>
									<td class="desc03">학력</td>
									<td class="desc04">${codeConvert:getBizAbility(result.bizAbility) }</td>
									<td class="desc03">성별</td>
									<td class="desc04">${codeConvert:getBizSex(result.bizSex) }</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
			<table class="list" id="list02" style="display:none;">
				<tbody>
					<c:choose>
						<c:when test="${recruitScrapList.size() > 0 }">
							<c:forEach var="result" items="${recruitScrapList}" varStatus="status">
								<tr class="desc desc0">
									<td rowspan="3" class="desc01">(주)파인스태프</td>
									<td colspan="6" class="desc02">
										<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.open }', '');">
											${result.bizName }
										</a>
									</td>
									<td rowspan="3" class="desc05">${codeConvert:getRecruitStatus(result.bizIng, result.bizEndType, result.bizEndDay) }</td>
								</tr>
								<tr class="desc desc1">
									<td class="desc03">급여</td>
									<td class="desc04">${result.bizPayName }</td>
									<td class="desc03">경력</td>
									<td class="desc04">${codeConvert:getBizCareer(result.bizCareer) }</td>
									<td class="desc03">나이</td>
									<td class="desc04">${result.bizAge }</td>
								</tr>
								<tr class="desc desc2">
									<td class="desc03">지역</td>
									<td class="desc04">${result.bizArea1Name }</td>
									<td class="desc03">학력</td>
									<td class="desc04">${codeConvert:getBizAbility(result.bizAbility) }</td>
									<td class="desc03">성별</td>
									<td class="desc04">${codeConvert:getBizSex(result.bizSex) }</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
			<table class="list" id="list03" style="display:none;">
				<tbody>
					<tr class="desc desc0">
						<td rowspan="3" class="desc01">(주)최근 본 공고</td>
						<td colspan="6" class="desc02">
							[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진
						</td>
						<td rowspan="3" class="desc05">상시채용</td>
					</tr>
					<tr class="desc desc1">
						<td class="desc03">급여</td>
						<td class="desc04">3000-3500만원</td>
						<td class="desc03">경력</td>
						<td class="desc04">무관</td>
						<td class="desc03">나이</td>
						<td class="desc04">무관</td>
					</tr>
					<tr class="desc desc2">
						<td class="desc03">지역</td>
						<td class="desc04">경기 광주시</td>
						<td class="desc03">학력</td>
						<td class="desc04">무관</td>
						<td class="desc03">성별</td>
						<td class="desc04">무관</td>
					</tr>
				</tbody>
			</table>
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
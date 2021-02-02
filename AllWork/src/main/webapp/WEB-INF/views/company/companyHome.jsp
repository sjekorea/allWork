<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/company_home.css"/>

<div id="containerWrap">
	<div id="leftPart">
		<div id="paymentBox">
			<p>총 결제 금액 <strong><fmt:formatNumber value="${paymentTotal}" pattern="#,###.##"/></strong>원 
			<p>유료 만료일 <strong>${SE_SERVICE2_END}</strong></p>
			<p>조회 가능 횟수 <strong><fmt:formatNumber value="${SE_VIEW_COUNT}" pattern="#,###.##"/></strong>회</p>
			<span class="payBtn"><a href="/resumeSearchPaidList.do" title="내역보기">내역보기</a></span></p>
		</div>
		<div id="menuTree">
			<ul>
				<li class="gnb"><a href="/recruitListProgress.do" title="채용관리">채용관리</a>
					<h3>채용관리</h3>
					<ol>
						<li><a href="/recruitListProgress.do" title="진행중인 채용정보">진행중인 채용정보</a></li>
						<li><a href="/recruitInfoReg.do" title="채용공고 등록">채용공고 등록</a></li>
						<li><a href="/recruitListClosed.do" title="마감된 채용정보">마감된 채용정보</a></li>
					</ol>
				</li>
				<li class="gnb"><a href="/resumeScrapList.do" title="인재관리">인재관리</a>
					<h3>인재관리</h3>
					<ol>
						<li><a href="/resumeScrapList.do" title="스크랩인재">스크랩인재</a></li>
						<li><a href="/fitResumeSetting.do" title="맞춤서비스 설정">맞춤서비스 설정</a></li>
						<li><a href="/fitResumeList.do" title="맞춤 인재정보">맞춤 인재정보</a></li>
					</ol>
				</li>
				<li class="gnb"><a href="/companyApplicantList.do" title="입사지원 관리">입사지원 관리</a>
					<h3>입사지원 관리</h3>
					<ol>
						<li><a href="/companyApplicantList.do" title="입사지원 관리">입사지원자 관리</a></li>
						<li><a href="/interviewSuggestList.do" title="면접제의 구직자 목록">면접제의 구직자 목록</a></li>
					</ol>
				</li>
				<li class="gnb payService"><a href="/resumeSearchApplyForPay.do" title="유료서비스">유료서비스</a>
					<h3>유료서비스</h3>
					<ol>
						<li><a href="/recruitApplyForPay.do" title="인재 검색 서비스 신청">유료채용광고 서비스</a></li>
						<li><a href="/resumeSearchApplyForPay.do" title="인재 검색 서비스 신청">인재검색서칭 서비스</a></li>
						<li><a href="/resumeSearchPaidList.do" title="유료채용광고 서비스">결재 내역 조회</a></li>
					</ol>
				</li>
				<!-- (begin) 2021.01.03 by s.yoo	-->
				<!-- 
				<li class="gnb myPage"><a href="/companyModify.do" title="회원정보관리">회원정보관리</a></li>
				 -->
				<li class="gnb myPage"><a href="/updateMyInfo.do" title="회원정보관리">회원정보관리</a>
					<h3>회원정보관리</h3>
					<ol>
						<li><a href="/updateMyInfo.do" title="회원정보관리 ">회원정보관리</a></li>
						<li><a href="/companyModify.do" title="기업정보관리 ">기업정보관리</a></li>
						<li><a href="/memberUnregister.do" title="회원탈퇴">회원탈퇴</a></li>
					</ol>
				</li>
				<!-- (begin) 2021.01.03 by s.yoo	-->
			</ul>
		</div>
	</div>
	<div id="rightPart">
		<div id="part00">
			<h4><a href="#" title="진행중인 채용정보">진행중인 채용정보&nbsp;<span><i class="fas fa-chevron-right"></i></span></a></h4>
			<ul class="list00">
				<c:choose>
					<c:when test="${recruitList.size() > 0 }">
						<c:forEach var="result" items="${recruitList}" varStatus="status">
							<li>
								<p class="state">진행중</p>
								<div class="desc">
									<p class="desc0"><a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.bizIng }', '');" title="모집공고타이틀">${result.bizTitle }</a></p>
									<div class="desc1">
										<!-- 
										<span>${codeConvert:getRecruitStatusText(result.bizIng, result.bizEndType, result.bizEndDay) }</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
										 -->
										<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.bizIng }', '');" title="공고보기"><span>공고보기</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
										<a href="javascript:updateRecruit('${result.no }');" title="수정"><span>수정</span></a>
										<%-- <a href="javascript:copyRecruit('${result.no }');" title="복사"><span>복사</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
										<a href="javascript:deleteRecruit('${result.no }');" title="삭제"><span>삭제</span></a> --%>
									</div>
									<div class="desc2">
										<a href="/companyApplicantList.do" title="전체 지원자" class="total">전체 지원자<span> &nbsp;${result.totalApplianceCnt }명</span></a>
										<!-- 
										<a href="#" title="전체 지원자" class="total">전체 지원자<span>${result.totalApplianceCnt }</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
										<a href="#" title="미열람">미열람<span>11</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
										<a href="#" title="열람">열람<span>0</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;>
										<a href="#" title="서류합격">서류합격<span>0</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
										<a href="#" title="불합격">불합격<span>0</span></a>
										 -->
									</div>
								</div>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li style="width:100%;align:center;"><div class="desc01" style="text-align:center;">내역이 없습니다.</div></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- (begin) 2020.12.30 by s.yoo -->
		<div id="part01">
			<!-- 
			<a href="#" title="AI 추천 맞춤 인재정보">AI 추천 맞춤 인재정보</a>
			 -->
			<h4><a href="#" title="AI 추천 인재정보">AI 추천 맞춤 인재정보&nbsp;<span><i class="fas fa-chevron-right"></i></span></a></h4>
			<ul class="list00">
				<c:choose>
					<c:when test="${recommandResumeList.size() > 0 }">
						<c:forEach var="result" items="${recommandResumeList}" varStatus="status">
							<c:if test="${status.index < 3 }">
								<li>
									<p class="img00"><img src="img/userNo.png" alt="인재사진"/></p>
									<p class="desc00">
										<span class="name">
											<!-- 
											<c:choose>
												<c:when test='${SE_SERVICE2 eq "Y" and SE_VIEW_COUNT > 0}'>
													${result.name }
												</c:when>
												<c:otherwise>
													${convert:getPersonNameHidden(result.name, result.paidResume) }
												</c:otherwise>
											</c:choose>
											 -->
											${convert:getPersonNameHidden(result.name, result.paidResume) }
										</span>
									</p>
									<p class="desc01">
										<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.recommend_id }', '${result.inid_secret }', 'resume');"><span class="detail">${convert:compByte(result.detail, 150, "...")}</span></a>
										<span class="title01">${result.job_form }</span>
										<span class="title01">${result.loc }</span>
										<span class="title01">${result.salary }</span>
									</p>
									<p class="date">${result.strWdate }</p>
								</li>
							</c:if> 
						</c:forEach>
					</c:when>
					<c:otherwise>
								<li>
									<!-- p class="img00"><img src="img/userNo.png" alt="인재사진"/></p -->
									<p class="desc00">
										<span class="name">추천인재 </span><br/>
										<span class="age">**</span>
									</p>
									<p class="desc01">
										<span class="detail">추천 이력서</span>
										<span class="title01">내용이 충실한 채용공고를 등록하면, AI가 맞춤형 인재를 추천해 드립니다.</span>
									</p>
									<p class="date">OOOO-OO-OO</p>
								</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- (end) 2020.12.30 by s.yoo -->
		<div id="listPart">
			<ul class="tab">
				<!-- (begin) 2020.12.30 by s.yoo -->
				<li><a class="selected" href="#listPart" title="AI 추천 인재">AI 추천 인재</a></li>
				<li><a href="#listPart" title="맞춤인재정보">맞춤인재정보</a></li>
				<!-- (end) 2020.12.30 by s.yoo -->
				<li><a href="#listPart" title="스크랩인재">스크랩인재</a></li>
				<li><a href="#listPart" title="최근 본 인재">최근 본 인재</a></li>
			</ul>
			<!-- (begin) 2020.12.30 by s.yoo -->
			<table class="list" id="list00">
				<tbody class="tabelAI">
					<c:choose>
						<c:when test="${recommandResumeList.size() > 0 }">
							<c:forEach var="result" items="${recommandResumeList}" varStatus="status">
								<tr>
									<th></th>
									<td class="desc00">
										<span>
											<!-- 
											<c:choose>
												<c:when test='${SE_SERVICE2 eq "Y" and SE_VIEW_COUNT > 0}'>
													${result.name }
												</c:when>
												<c:otherwise>
													${convert:getPersonNameHidden(result.name, result.paidResume) }
												</c:otherwise>
											</c:choose>
											 -->
											${convert:getPersonNameHidden(result.name, result.paidResume) }
										</span>
									</td>
									<td class="desc01" colspan=3>
										<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.recommend_id }', '${result.inid_secret }', 'resume');" title="AI 추천 인재정보">
											<span class="desc01_01">
												${convert:compByte(result.detail, 100, "...")}
											</span>
										</a>
										<br /><span>${result.job_form }</span>
									</td>
									<td class="desc02">${result.loc }</td>
									<td class="desc03">${result.salary }</td>
									<td class="date">${result.strWdate }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><th></th><td width="790px" style="text-align:center;">내역이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<table class="list" id="list01" style="display:none;">
			<!-- (end) 2020.12.30 by s.yoo -->
				<tbody class="tabelArea">
					<c:choose>
						<c:when test="${myServiceResumeList.size() > 0 }">
							<c:forEach var="result" items="${myServiceResumeList}" varStatus="status">
								<tr>
									<th></th>
									<td class="desc00">
										<span>
											<!-- 
											<c:choose>
												<c:when test='${SE_SERVICE2 eq "Y" and SE_VIEW_COUNT > 0}'>
													${result.name }
												</c:when>
												<c:otherwise>
													${convert:getPersonNameHidden(result.name, result.paidResume) }
												</c:otherwise>
											</c:choose>
											 -->
											${convert:getPersonNameHidden(result.name, result.paidResume) }
										</span><!-- <br/>
										<span>${codeConvert:getBizSex(result.sex)}/${codeConvert:getBirthYear(result.birth)}년생</span><br/>
										<span>${codeConvert:getBizAbility(result.educationDegree) }</span>
										 -->
									</td>
									<td class="desc01">
										<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.no }', '${result.inidSecret }', 'resume');" title="AI 맞춤인재정보">
											<span class="desc01_01">${result.inidTitle }</span><br />
											<span class="desc01_01">
												${result.inidType1Name }
												${convert:checkNull(result.inidType2Name) eq '' ? '' : '&nbsp;>&nbsp;'.concat(result.inidType2Name) }
												${convert:checkNull(result.inidType3Name) eq '' ? '' : '&nbsp;>&nbsp;'.concat(result.inidType3Name) }
											</span>
										</a>
									</td>
									<td class="desc02">
										<span>
											${result.inidArea1Name }
											${convert:checkNull(result.inidArea2Name) eq '' ? '</span>' : '&nbsp;>&nbsp;'.concat(result.inidArea2Name).concat('</span>') }
											${convert:checkNull(result.inidArea3Name) eq '' ? '</span>' : '<br/><span>'.concat(result.inidArea3Name) }
											${convert:checkNull(result.inidArea4Name) eq '' ? '</span>' : '&nbsp;>&nbsp;'.concat(result.inidArea4Name).concat('</span>') }
											${convert:checkNull(result.inidArea5Name) eq '' ? '</span>' : '<br/><span>'.concat(result.inidArea5Name) }
											${convert:checkNull(result.inidArea6Name) eq '' ? '</span>' : '&nbsp;>&nbsp;'.concat(result.inidArea6Name).concat('</span>') }
									</td>
									<td class="desc03">
										<span>${result.inidJobformName }</span><br/>
										<span>${codeConvert:getPayInfo(result.payType, result.payTypeName, result.inidPayName) }</span>
									</td>
									<td class="date">${result.wdate }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><th></th><td width="790px" style="text-align:center;">내역이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<table class="list" id="list02" style="display:none;">
				<tbody class="tabelArea">
					<c:choose>
						<c:when test="${resumeScrapList.size() > 0 }">
							<c:forEach var="result" items="${resumeScrapList}" varStatus="status">
								<tr>
									<th></th>
									<td class="desc00">
										<span>
											<!-- 
											<c:choose>
												<c:when test='${SE_SERVICE2 eq "Y" and SE_VIEW_COUNT > 0}'>
													${result.name }
												</c:when>
												<c:otherwise>
													${convert:getPersonNameHidden(result.name, result.paidResume) }
												</c:otherwise>
											</c:choose>
											 -->
											${convert:getPersonNameHidden(result.name, result.paidResume) }
										</span><!-- <br/>
										<span>${codeConvert:getBizSex(result.sex)}/${codeConvert:getBirthYear(result.birth)}년생</span><br/>
										<span>${codeConvert:getBizAbility(result.educationDegree) }</span>
										 -->
									</td>
									<td class="desc01">
										<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.no }', '${result.inidSecret }', 'resume');" title="스크랩인재정보">
											<span class="desc01_01">${result.inidTitle }</span><br />
											<span class="desc01_01">
												${result.inidType1Name }
												${convert:checkNull(result.inidType2Name) eq '' ? '' : '&nbsp;>&nbsp;'.concat(result.inidType2Name) }
												${convert:checkNull(result.inidType3Name) eq '' ? '' : '&nbsp;>&nbsp;'.concat(result.inidType3Name) }
											</span>
										</a>
									</td>
									<td class="desc02">
										<span>
											${result.inidArea1Name }
											${convert:checkNull(result.inidArea2Name) eq '' ? '</span>' : '&nbsp;>&nbsp;'.concat(result.inidArea2Name).concat('</span>') }
											${convert:checkNull(result.inidArea3Name) eq '' ? '</span>' : '<br/><span>'.concat(result.inidArea3Name) }
											${convert:checkNull(result.inidArea4Name) eq '' ? '</span>' : '&nbsp;>&nbsp;'.concat(result.inidArea4Name).concat('</span>') }
											${convert:checkNull(result.inidArea5Name) eq '' ? '</span>' : '<br/><span>'.concat(result.inidArea5Name) }
											${convert:checkNull(result.inidArea6Name) eq '' ? '</span>' : '&nbsp;>&nbsp;'.concat(result.inidArea6Name).concat('</span>') }
									</td>
									<td class="desc03">
										<span>${result.inidJobformName }</span><br/>
										<span>${codeConvert:getPayInfo(result.payType, result.payTypeName, result.inidPayName) }</span>
									</td>
									<td class="date">${result.wdate }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><th></th><td width="790px" style="text-align:center;">내역이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<table class="list"  id="list03" style="display:none;">
				<tbody class="tabelArea">
					<c:choose>
						<c:when test="${resumeViewList.size() > 0 }">
							<c:forEach var="result" items="${resumeViewList}" varStatus="status">
								<tr>
									<th></th>
									<td class="desc00">
										<span>
											<!-- 
											<c:choose>
												<c:when test='${SE_SERVICE2 eq "Y" and SE_VIEW_COUNT > 0}'>
													${result.name }
												</c:when>
												<c:otherwise>
													${convert:getPersonNameHidden(result.name, result.paidResume) }
												</c:otherwise>
											</c:choose>
											 -->
											${convert:getPersonNameHidden(result.name, result.paidResume) }
										</span><!-- <br/>
										<span>${codeConvert:getBizSex(result.sex)}/${codeConvert:getBirthYear(result.birth)}년생</span><br/>
										<span>${codeConvert:getBizAbility(result.educationDegree) }</span>
										 -->
									</td>
									<td class="desc01">
										<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.no }', '${result.inidSecret }', 'resume');" title="최근본인재정보">
											<span class="desc01_01">${result.inidTitle }</span><br />
											<span class="desc01_01">
												${result.inidType1Name }
												${convert:checkNull(result.inidType2Name) eq '' ? '' : '&nbsp;>&nbsp;'.concat(result.inidType2Name) }
												${convert:checkNull(result.inidType3Name) eq '' ? '' : '&nbsp;>&nbsp;'.concat(result.inidType3Name) }
											</span>
										</a>
									</td>
									<td class="desc02">
										<span>
											${result.inidArea1Name }
											${convert:checkNull(result.inidArea2Name) eq '' ? '</span>' : '&nbsp;>&nbsp;'.concat(result.inidArea2Name).concat('</span>') }
											${convert:checkNull(result.inidArea3Name) eq '' ? '</span>' : '<br/><span>'.concat(result.inidArea3Name) }
											${convert:checkNull(result.inidArea4Name) eq '' ? '</span>' : '&nbsp;>&nbsp;'.concat(result.inidArea4Name).concat('</span>') }
											${convert:checkNull(result.inidArea5Name) eq '' ? '</span>' : '<br/><span>'.concat(result.inidArea5Name) }
											${convert:checkNull(result.inidArea6Name) eq '' ? '</span>' : '&nbsp;>&nbsp;'.concat(result.inidArea6Name).concat('</span>') }
									</td>
									<td class="desc03">
										<span>${result.inidJobformName }</span><br/>
										<span>${codeConvert:getPayInfo(result.payType, result.payTypeName, result.inidPayName) }</span>
									</td>
									<td class="date">${result.wdate }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><th></th><td width="790px" style="text-align:center;">내역이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
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
	
	
	function updateRecruit(no){
		
		$("#no").val(no);
		$("#recruitNo").val(no);
		$("#searchForm").attr("action", "/recruitInfoUpt.do");
		$("#searchForm").submit();
	}

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
		}else{
			
			if("yes" != open){
				alert("현재 비공개 상태로 설정되어 있습니다.");
				loadingOff();
		
			}else{
				
				$("#companyUid").val(companyUid);
				$("#personUid").val(personUid);
				$("#no").val(no);
				$("#recruitNo").val(recruitNo);
				$("#resumeNo").val(resumeNo);
				$("#searchForm").attr("action", "/recruitDetail.do");
				$("#searchForm").submit();
			}
		}
	}
</script>


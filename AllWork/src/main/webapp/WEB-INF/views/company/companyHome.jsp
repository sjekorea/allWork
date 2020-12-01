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
		<div id="mycompanyBox">
			<p class="settingBtn"><a href="#" title="기업정보관리">기업정보관리  <i class="fas fa-cog"></i></a></p>
			<p class="companyName">${SE_USER_NM }</p>
			<p class="uploadApplication"><a href="/recruitInfoReg.do" title="채용공고 등록">채용공고 등록</a></p>
		</div>
		<div id="paymentBox">
			<p>결제하실 금액 <strong>0</strong>원 <span class="payBtn"><a href="#" title="내역보기">내역보기</a></span></p>
			<p>충전금 <strong>0</strong>원</p>
		</div>
		<div id="menuTree">
			<ul>
				<li class="gnb"><a href="/recruitListProgress.do" title="채용관리">채용관리</a>
					<h3>채용관리</h3>
					<ol>
						<li><a href="/recruitInfoReg.do" title="채용공고 등록">채용공고 등록</a></li>
						<li><a href="/recruitListProgress.do" title="진행중인 채용정보">진행중인 채용정보</a></li>
						<li><a href="/recruitListClosed.do" title="마감된 채용정보">마감된 채용정보</a></li>
					</ol>
				</li>
				<li class="gnb"><a href="/resumeScrapList.do" title="인재관리">인재관리</a>
					<h3>인재관리</h3>
					<ol>
						<li><a href="/resumeScrapList.do" title="스크랩인재">스크랩인재</a></li>
						<li><a href="#" title="유료서비스 신청">유료서비스 신청</a></li>
						<li><a href="/fitResumeSetting.do" title="맞춤서비스 설정">맞춤서비스 설정</a></li>
						<li><a href="/fitResumeList.do" title="맞춤 인재정보">맞춤 인재정보</a></li>
					</ol>
				</li>
				<li class="gnb"><a href="/companyApplicantList.do" title="입사지원 관리">입사지원 관리</a>
					<h3>입사지원 관리</h3>
					<ol>
						<li><a href="/companyApplicantList.do" title="입사지원 관리">입사지원자 관리</a></li>
						<li><a href="#" title="입사지원/면접제의 요청관리">면접제의관리</a></li>
					</ol>
				</li>
				<li class="gnb payService"><a href="#" title="유료서비스">유료서비스</a>
					<h3>유료서비스</h3>
					<ol>
						<li><a href="#" title="유료채용광고 서비스">유료채용광고 서비스</a></li>
						<li><a href="#" title="인재검색서칭 서비스">인재검색서칭 서비스</a></li>
					</ol>
				</li>
			</ul>
		</div>
	</div>
	<div id="rightPart">
		<div id="part00">
			<h4><a href="#" title="진행중인 채용정보">진행중인 채용정보<span><i class="fas fa-chevron-right"></i></span></a></h4>
			<ul class="list00">
				<c:choose>
					<c:when test="${recruitList.size() > 0 }">
						<c:forEach var="result" items="${recruitList}" varStatus="status">
							<li>
								<p class="state">진행중</p>
								<div class="desc">
									<p class="desc0"><a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.open }', '');" title="모집공고타이틀">${result.bizTitle }</a></p>
									<div class="desc1">
										<span>${codeConvert:getRecruitStatusText(result.bizIng, result.bizEndType, result.bizEndDay) }</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
										<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.open }', '');" title="공고보기"><span>공고보기</span></a>
										<%-- <a href="javascript:copyRecruit('${result.no }');" title="복사"><span>복사</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
										<a href="javascript:deleteRecruit('${result.no }');" title="삭제"><span>삭제</span></a> --%>
									</div>
									<div class="desc2">
										<a href="#" title="전체 지원자" class="total">전체 지원자<span>${result.totalApplianceCnt }</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
										<!-- <a href="#" title="미열람">미열람<span>11</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
										<a href="#" title="열람">열람<span>0</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; -->
										<a href="#" title="서류합격">서류합격<span>0</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
										<a href="#" title="불합격">불합격<span>0</span></a>
									</div>
								</div>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li style="width:100%;"><div class="desc01">내역이 없습니다.</div></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div id="part01">
			<h4><a href="#" title="맞춤인재 관리">맞춤인재 관리<span><i class="fas fa-chevron-right"></i></span></a></h4>
			<ul class="list00">
				<c:choose>
					<c:when test="${myServiceResumeList.size() > 0 }">
						<c:forEach var="result" items="${myServiceResumeList}" varStatus="status">
							<c:if test="${status.index < 3 }">
								<li>
									<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.no }', '${result.inidSecret }', 'resume');">
										<p class="img00"><img src="/img/company_home/img00.jpeg" alt="인재사진"/></p>
										<p class="desc00">
											<span class="name">${result.name }</span><br/>
											<span class="age">${codeConvert:getBizSex(result.sex)} ${convert:calcAge(result.birth)}</span>
										</p>
										<p class="desc01">
											<span class="detail">${result.inidTitle }</span><br/>
											<span class="title01">${codeConvert:getCondition(result.indiCondition)}</span>
										</p>
										<p class="date">${result.wdate }</p>
									</a>
								</li>
							</c:if> 
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li style="width:100%;"><div class="desc01">내역이 없습니다.</div></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div id="listPart">
			<ul class="tab">
				<li><a class="selected" href="#" title="맞춤채용인재">맞춤채용인재</a></li>
				<li><a href="#" title="스크랩인재">스크랩인재</a></li>
				<li><a href="#" title="최근 본 인재">최근 본 인재</a></li>
			</ul>
			<ul class="list" id="list01" >
				<c:choose>
					<c:when test="${myServiceResumeList.size() > 0 }">
						<c:forEach var="result" items="${myServiceResumeList}" varStatus="status">
							<li>
								<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.no }', '${result.inidSecret }', 'resume');">
									<p class="desc00">
										<span class="desc00_00">${result.name }</span><br/>
										<span class="desc00_01">${codeConvert:getBizSex(result.sex)}/${codeConvert:getBirthYear(result.birth)}년생</span>
									</p>
									<p class="desc01">
										<span class="desc00_02">${result.inidType1Name }</span><br/>
										<span class="desc00_03">
											${convert:checkNull(result.inidType2Name) eq '' ? '' : result.inidType2Name }
											${convert:checkNull(result.inidType3Name) eq '' ? '' : '&nbsp;>&nbsp;'.concat(result.inidType3Name) }
											&nbsp;|&nbsp;${codeConvert:getLastSchool(result.inidLastSchool) }</span>
									</p>
									<p class="desc02">
										<span class="desc00_04">
											${result.inidArea1Name }
									  		${convert:checkNull(result.inidArea2Name) eq '' ? '' : '&nbsp;>&nbsp;&nbsp;'.concat(result.inidArea2Name) }
										</span><br/>
										<span class="desc00_05">
											${result.inidArea3Name }
									  		${convert:checkNull(result.inidArea4Name) eq '' ? '' : '&nbsp;>&nbsp;&nbsp;'.concat(result.inidArea4Name) }
										</span>
									</p>
									<p class="desc03">
										<span class="desc00_06">${result.inidJobformName }</span><br/>
										<span class="desc00_07">${result.inidPayName }</span>
									</p>
									<p class="date">${result.wdate }</p>
								</a>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li style="width:100%;"><div class="desc01">내역이 없습니다.</div></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<ul class="list" id="list02" style="display:none;">
				<c:choose>
					<c:when test="${resumeScrapList.size() > 0 }">
						<c:forEach var="result" items="${resumeScrapList}" varStatus="status">
							<li>
								<a href="javascript:goDetail('${SE_LOGIN_ID }', '${result.uid }', '', '', '${result.no }', '${result.inidSecret }', 'resume');">
									<p class="desc00">
										<span class="desc00_00">${result.name }</span><br/>
										<span class="desc00_01">${codeConvert:getBizSex(result.sex)}/${codeConvert:getBirthYear(result.birth)}년생</span>
									</p>
									<p class="desc01">
										<span class="desc00_02">${result.inidType1Name }</span><br/>
										<span class="desc00_03">
											${convert:checkNull(result.inidType2Name) eq '' ? '' : result.inidType2Name }
											${convert:checkNull(result.inidType3Name) eq '' ? '' : '&nbsp;>&nbsp;'.concat(result.inidType3Name) }
											&nbsp;|&nbsp;${codeConvert:getLastSchool(result.inidLastSchool) }</span>
									</p>
									<p class="desc02">
										<span class="desc00_04">
											${result.inidArea1Name }
									  		${convert:checkNull(result.inidArea2Name) eq '' ? '' : '&nbsp;>&nbsp;&nbsp;'.concat(result.inidArea2Name) }
										</span><br/>
										<span class="desc00_05">
											${result.inidArea3Name }
									  		${convert:checkNull(result.inidArea4Name) eq '' ? '' : '&nbsp;>&nbsp;&nbsp;'.concat(result.inidArea4Name) }
										</span>
									</p>
									<p class="desc03">
										<span class="desc00_06">${result.inidJobformName }</span><br/>
										<span class="desc00_07">${result.inidPayName }</span>
									</p>
									<p class="date">${result.wdate }</p>
								</a>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li style="width:100%;"><div class="desc01">내역이 없습니다.</div></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<ul class="list" id="list03" style="display:none;">
				<li>
					<a href="#" title="맞춤채용인재정보">
						<p class="desc00">
							<span class="desc00_00">김oo</span><br/>
							<span class="desc00_01">남/64년생</span>
						</p>
						<p class="desc01">
							<span class="desc00_02">영업관리</span><br/>
							<span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
						</p>
						<p class="desc02">
							<span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br/>
							<span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
						</p>
						<p class="desc03">
							<span class="desc00_06">신입</span><br/>
							<span class="desc00_07">회사내규에따</span>
						</p>
						<p class="date">2020.08.27</p>
					</a>
				</li>
			</ul>
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
		}else{
			
			if("open" != open){
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


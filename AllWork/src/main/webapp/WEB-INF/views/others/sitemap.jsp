<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- (begin) 2020.12.30 by s.yoo	-->
<!-- 
<jsp:include page="/indexHeader.do" />
 -->
<jsp:include page="/introHeader.do" />
<!-- (end) 2020.12.30 by s.yoo	-->

<link rel="stylesheet" type="text/css" href="/css/sitemap.css"/>

<div id="containerWrap">
	<div id="container">
	<c:if test="${!SE_LOGIN_STATUS or SE_USER_TYPE == 'person'}">
		<div class="sitemap">
			<h4>개인회원</h4>
			<ul>
				<li class="sitemap_depth01"><a href="/resumeList.do" title="이력서관리">이력서관리</a></li>
				<li class="sitemap_depth02"><a href="/resumeList.do" title="이력서목록">이력서목록</a></li>
				<li class="sitemap_depth02"><a href="/resumeInfoReg.do" title="이력서등록">이력서등록</a></li>
				<li class="sitemap_depth01"><a href="/personApplyList.do" title="입사지원관리">입사지원관리</a></li>
				<li class="sitemap_depth02"><a href="/personApplyList.do" title="입사지원현황">입사지원현황</a></li>
				<li class="sitemap_depth01"><a href="/recruitScrapList.do" title="스크랩/관심기업">스크랩/관심기업</a></li>
				<li class="sitemap_depth02"><a href="/recruitScrapList.do" title="스크랩">스크랩</a></li>
				<li class="sitemap_depth02"><a href="/interestCompanyList.do" title="관심기업">관심기업</a></li>
				<li class="sitemap_depth02"><a href="/interviewRequestCompany.do" title="면접을 제의한 기업">면접을 제의한 기업</a></li>
				<li class="sitemap_depth01"><a href="/recruitViewList.do" title="내가 확인한 채용정보">내가 확인한 채용정보</a></li>
				<li class="sitemap_depth01"><a href="/fitRecruitList.do" title="맞춤서비스 관리">맞춤서비스 관리</a></li>
				<li class="sitemap_depth02"><a href="/fitRecruitList.do" title="맞춤채용정보">맞춤채용정보</a></li>
				<li class="sitemap_depth02"><a href="/fitRecruitSetting.do" title="맞춤서비스설정">맞춤서비스설정</a></li>
				<li class="sitemap_depth01"><a href="/resumeApplyForPay.do" title="유료서비스">유료서비스</a></li>
				<li class="sitemap_depth02"><a href="/resumeApplyForPay.do" title="결제내역 조회">결제내역 조회</a></li>
				<li class="sitemap_depth02"><a href="/resumePaidList.do" title="유료옵션서비스 신청">유료옵션서비스 신청</a></li>
				<li class="sitemap_depth01"><a href="/updateMyInfo.do" title="회원정보관리">회원정보관리</a>
				<li class="sitemap_depth02"><a href="/updateMyInfo.do" title="회원정보관리">회원정보관리</a></li>
				<li class="sitemap_depth02"><a href="/memberUnregister.do" title="회원탈퇴">회원탈퇴</a></li>
			</ul>
		</div>
	</c:if>
	<c:if test="${!SE_LOGIN_STATUS or SE_USER_TYPE == 'company'}">
		<div class="sitemap">
			<h4>기업회원</h4>
			<ul>
				<li class="sitemap_depth01"><a href="/recruitListProgress.do" title="채용관리">채용관리</a></li>
				<li class="sitemap_depth02"><a href="/recruitListProgress.do" title="진행중인채용정보">진행중인채용정보</a></li>
				<li class="sitemap_depth02"><a href="/recruitInfoReg.do" title="채용공고등록">채용공고등록</a></li>
				<li class="sitemap_depth02"><a href="/recruitListClosed.do" title="마감된채용정보">마감된채용정보</a></li>
				<li class="sitemap_depth01"><a href="/resumeScrapList.do" title="인재관리">인재관리</a></li>
				<li class="sitemap_depth02"><a href="/resumeScrapList.do" title="스크랩인재">스크랩인재</a></li>
				<li class="sitemap_depth02"><a href="/fitResumeSetting.do" title="맞춤서비스설정">맞춤서비스설정</a></li>
				<li class="sitemap_depth02"><a href="/fitResumeList.do" title="맞춤인재정보">맞춤인재정보</a></li>
				<li class="sitemap_depth01"><a href="/companyApplicantList.do" title="입사지원 관리">입사지원 관리</a></li>
				<li class="sitemap_depth02"><a href="/companyApplicantList.do" title="입사지원자관리">입사지원자관리</a></li>
				<li class="sitemap_depth02"><a href="/interviewSuggestList.do" title="면접제의요청관리">면접제의요청관리</a></li>
				<li class="sitemap_depth01"><a href="/recruitApplyForPay.do" title="유료서비스">유료서비스</a></li>
				<li class="sitemap_depth02"><a href="/recruitApplyForPay.do" title="유료채용광고서비스">유료채용광고서비스</a></li>
				<li class="sitemap_depth02"><a href="/resumeSearchApplyForPay.do" title="인재검색서칭서비스">인재검색서칭서비스</a></li>
				<li class="sitemap_depth02"><a href="/resumeSearchPaidList.do" title="결제 내역 조회">결제 내역 조회</a></li>
				<li class="sitemap_depth01"><a href="/updateMyInfo.do" title="회원정보관리">회원정보관리</a>
				<li class="sitemap_depth02"><a href="/updateMyInfo.do" title="회원정보관리">회원정보관리</a></li>
				<li class="sitemap_depth02"><a href="/companyModify.do" title="기업정보관리">기업정보관리</a></li>
				<li class="sitemap_depth02"><a href="/memberUnregister.do" title="회원탈퇴">회원탈퇴</a></li>
			</ul>
		</div>
	</c:if>
	<c:if test="${!SE_LOGIN_STATUS or SE_USER_TYPE == 'person'}">
		<div class="sitemap">
			<h4>채용정보</h4>
			<ul>
				<li class="sitemap_depth01"><a href="/recruitSearch.do" title="채용정보">채용정보</a>
				<li class="sitemap_depth02"><a href="/recruitSearch.do" title="상세검색">상세검색</a></li>
				<li class="sitemap_depth02"><a href="/recruitSearchByDuty.do" title="직무별">직무별</a></li>
				<li class="sitemap_depth02"><a href="/recruitSearchByIndustry.do" title="산업별">산업별</a></li>
				<li class="sitemap_depth02"><a href="/recruitSearchByArea.do" title="지역별">지역별</a></li>
				<li class="sitemap_depth01"><a href="/recruitSearchForFree.do" title="프리랜서">프리랜서</a></li>
				<li class="sitemap_depth01"><a href="/recruitSearchForAlba.do" title="알바채용">알바채용</a></li>
				<li class="sitemap_depth01"><a href="/recruitOther.do" title="기타채용정보">기타채용정보</a></li>
			</ul>
		</div>
	</c:if>
	<c:if test="${!SE_LOGIN_STATUS or SE_USER_TYPE == 'company'}">
		<div class="sitemap">
			<h4>인재검색</h4>
			<ul>
				<li class="sitemap_depth01"><a href="/resumeSearch.do" title="인재검색">인재검색</a>
				<li class="sitemap_depth02"><a href="/resumeSearch.do" title="상세검색">상세검색</a></li>
				<li class="sitemap_depth02"><a href="/resumeSearchByDuty.do" title="직무별">직무별</a></li>
				<li class="sitemap_depth02"><a href="/resumeSearchByIndustry.do" title="산업별">산업별</a></li>
				<li class="sitemap_depth02"><a href="/resumeSearchByArea.do" title="지역별">지역별</a></li>
				<li class="sitemap_depth01"><a href="/resumeSearchForFree.do" title="프리랜서">프리랜서</a></li>
				<li class="sitemap_depth01"><a href="/resumeSearchForAlba.do" title="알바">알바</a></li>
				<li class="sitemap_depth01"><a href="/resumeScrapList.do" title="스크랩인재">스크랩인재</a></li>
				<li class="sitemap_depth01"><a href="/resumeRecommendList.do" title="우수추천인재">우수추천인재</a></li>
			</ul>
		</div>
	</c:if>
		<div class="sitemap">
			<h4>헤드헌팅</h4>
			<ul>
				<li class="sitemap_depth01"><a href="/headhuntList.do" title="채용정보">채용정보</a>
	<c:choose>
		<c:when test="${SE_LOGIN_STATUS}">
			<c:if test="${SE_USER_TYPE == 'person' }">
				<li class="sitemap_depth01"><a href="https://allwork.officecall.cloud/" target="_blank" title="화상면접">화상면접</a>
			</c:if>

			<c:if test="${SE_USER_TYPE == 'company' }">
				<li class="sitemap_depth01"><a href="https://allwork.officecall.cloud/?user_check=admin" target="_blank" title="화상면접">화상면접</a>
			</c:if>
		</c:when>
		<c:otherwise>
				<li class="sitemap_depth01"><a href="javascript:alert('로그인 이후에 사용할 수 있습니다.');" title="화상면접">화상면접</a>
		</c:otherwise>
	</c:choose>
			</ul>
		</div>
		<div class="sitemap">
			<h4>채용진행현황</h4>
			<ul>
				<li class="sitemap_depth01"><a href="/progressInterview.do" title="면접진행">면접진행</a>
				<li class="sitemap_depth01"><a href="/progressVisitCompany.do" title="기업방문">기업방문</a></li>
				<li class="sitemap_depth01"><a href="/progressProvideResume.do" title="이력서제공">이력서제공</a></li>
				<li class="sitemap_depth01"><a href="/progressSuccess.do" title="재취업성공">재취업성공</a></li>
				<li class="sitemap_depth01"><a href="/progressPreMeeting.do" title="사전면접">사전면접</a></li>
				<li class="sitemap_depth01"><a href="/progressConsulting.do" title="적응컨설팅">적응컨설팅</a></li>
			</ul>
		</div>
		<div class="sitemap">
			<h4>고객센터</h4>
			<ul>
				<li class="sitemap_depth01"><a href="/noticeList.do" title="공지사항">공지사항</a>
				<li class="sitemap_depth01"><a href="/bbsList.do" title="게시판">게시판</a></li>
				<li class="sitemap_depth01"><a href="/faqList.do" title="FAQ">FAQ</a></li>
				<li class="sitemap_depth01"><a href="/paymentGuide.do" title="이용안내">이용안내</a></li>
				<li class="sitemap_depth02"><a href="/paymentGuide.do" title="유료채용광고 문의">유료채용광고 문의</a></li>
				<li class="sitemap_depth01"><a href="/termsOfService.do" title="이용약관">이용약관</a></li>
				<li class="sitemap_depth01"><a href="/privacyPolicy.do" title="개인정보취급방침">개인정보취급방침</a></li>
				<li class="sitemap_depth01"><a href="/customerClaim.do" title="불편 및 신고사항 접수">불편 및 신고사항 접수</a></li>
				<li class="sitemap_depth01"><a href="/mobileGuide.do" title="모바일 서비스">모바일 서비스</a></li>
				<li class="sitemap_depth01"><a href="/libraryList.do" title="자료실">자료실</a></li>
			</ul>
		</div>
		<div class="sitemap">
			<h4>회사소개</h4>
			<ul>
				<li class="sitemap_depth01"><a href="/introAbout.do" title="인사말">인사말</a>
				<li class="sitemap_depth01"><a href="/introBusiness.do" title="사업내역">사업내역</a></li>
				<li class="sitemap_depth01"><a href="/partnership01.do" title="제휴서비스">제휴서비스</a></li>
				<li class="sitemap_depth02"><a href="/partnership01.do" title="제휴단체">제휴단체</a></li>
				<li class="sitemap_depth02"><a href="/partnership02.do" title="기술개발매칭서비스">기술개발매칭서비스</a></li>
				<li class="sitemap_depth02"><a href="/partnership03.do" title="R&D컨설팅서비스">R&D컨설팅서비스</a></li>
				<li class="sitemap_depth02"><a href="/partnership04.do" title="창업컨설팅">창업컨설팅</a></li>
				<li class="sitemap_depth02"><a href="/partnership05.do" title="제휴치과">제휴치과</a></li>
				<li class="sitemap_depth02"><a href="/partnership06.do" title="제휴병원">제휴병원</a></li>
				<li class="sitemap_depth02"><a href="/partnership07.do" title="보험서비스">보험서비스</a></li>
				<li class="sitemap_depth02"><a href="/partnership08.do" title="제휴상조회사">제휴상조회사</a></li>
				<li class="sitemap_depth01"><a href="/introLocation.do" title="찾아오시는길">찾아오시는길</a></li>
			</ul>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />

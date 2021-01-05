<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- (begin) 2020.12.30 by s.yoo	-->
<!-- 
<jsp:include page="/indexHeader.do" />
 -->
<c:choose>
	<c:when test="${SE_LOGIN_STATUS}">
		<c:if test="${SE_USER_TYPE == 'company' }">
			<jsp:include page="/companyHeader.do"/>
		</c:if>

		<c:if test="${SE_USER_TYPE == 'person' }">
			<jsp:include page="/personHeader.do" />
		</c:if>
	</c:when>
	<c:otherwise>
			<jsp:include page="/indexHeader.do" />
	</c:otherwise>
</c:choose>
<!-- (end) 2020.12.30 by s.yoo	-->

<link rel="stylesheet" type="text/css" href="/css/header_main.css"/>
<link rel="stylesheet" type="text/css" href="/css/sitemap.css"/>

<div id="containerWrap">
	<div id="container">
		<div class="sitemap">
			<h4>개인회원</h4>
			<ul>
				<li class="sitemap_depth01"><a href="#" title="회원정보관리">회원정보관리</a>
				<li class="sitemap_depth01"><a href="#" title="이력서관리">이력서관리</a></li>
				<li class="sitemap_depth02"><a href="#" title="이력서등록">이력서등록</a></li>
				<li class="sitemap_depth02"><a href="#" title="이력서수정">이력서수정</a></li>
				<li class="sitemap_depth01"><a href="#" title="입사지원관리">입사지원관리</a></li>
				<li class="sitemap_depth02"><a href="#" title="입사지원현황">입사지원현황</a></li>
				<li class="sitemap_depth01"><a href="#" title="스크랩/관심기업">스크랩/관심기업</a></li>
				<li class="sitemap_depth02"><a href="#" title="스크랩">스크랩</a></li>
				<li class="sitemap_depth02"><a href="#" title="관심기업">관심기업</a></li>
				<li class="sitemap_depth02"><a href="#" title="면접요청기업">면접요청기업</a></li>
				<li class="sitemap_depth01"><a href="#" title="내가 확인한 채용정보">내가
						확인한 채용정보</a></li>
				<li class="sitemap_depth01"><a href="#" title="맞춤서비스 관리">맞춤서비스
						관리</a></li>
				<li class="sitemap_depth02"><a href="#" title="맞춤채용정보">맞춤채용정보</a></li>
				<li class="sitemap_depth02"><a href="#" title="맞춤서비스설정">맞춤서비스설정</a></li>
				<li class="sitemap_depth01"><a href="#" title="유료서비스">유료서비스</a></li>
				<li class="sitemap_depth02"><a href="#" title="결제내역 조회">결제내역
						조회</a></li>
				<li class="sitemap_depth02"><a href="#" title="유료옵션서비스 신청">유료옵션서비스
						신청</a></li>
			</ul>
		</div>
		<div class="sitemap">
			<h4>기업회원</h4>
			<ul>
				<li class="sitemap_depth01"><a href="#" title="회원정보관리">회원정보관리</a>
				<li class="sitemap_depth01"><a href="#" title="채용관리">채용관리</a></li>
				<li class="sitemap_depth02"><a href="#" title="채용공고등록">채용공고등록</a></li>
				<li class="sitemap_depth02"><a href="#" title="진행중인채용정보">진행중인채용정보</a></li>
				<li class="sitemap_depth02"><a href="#" title="마감된채용정보">마감된채용정보</a></li>
				<li class="sitemap_depth01"><a href="#" title="인재관리">인재관리</a></li>
				<li class="sitemap_depth02"><a href="#" title="스크랩인재">스크랩인재</a></li>
				<li class="sitemap_depth02"><a href="#" title="유료서비스신청">유료서비스신청</a></li>
				<li class="sitemap_depth02"><a href="#" title="맞춤서비스설정">맞춤서비스설정</a></li>
				<li class="sitemap_depth02"><a href="#" title="맞춤인재정보">맞춤인재정보</a></li>
				<li class="sitemap_depth01"><a href="#" title="입사지원 관리">입사지원
						관리</a></li>
				<li class="sitemap_depth02"><a href="#" title="입사지원자관리">입사지원자관리</a></li>
				<li class="sitemap_depth02"><a href="#" title="입사지원/면접제의요청관리">입사지원/면접제의요청관리</a></li>
				<li class="sitemap_depth01"><a href="#" title="유료서비스">유료서비스</a></li>
				<li class="sitemap_depth02"><a href="#" title="유료채용광고서비스">유료채용광고서비스</a></li>
				<li class="sitemap_depth01"><a href="#" title="인재검색서칭서비스">인재검색서칭서비스</a></li>
				<li class="sitemap_depth01"><a href="#" title="채용문자">채용문자</a></li>
				<li class="sitemap_depth01"><a href="#" title="FAQ">FAQ</a></li>
			</ul>
		</div>
		<div class="sitemap">
			<h4>채용정보</h4>
			<ul>
				<li class="sitemap_depth01"><a href="#" title="채용정보">채용정보</a>
				<li class="sitemap_depth02"><a href="#" title="상세검색">상세검색</a></li>
				<li class="sitemap_depth02"><a href="#" title="직무별">직무별</a></li>
				<li class="sitemap_depth02"><a href="#" title="산업별">산업별</a></li>
				<li class="sitemap_depth02"><a href="#" title="지역별">지역별</a></li>
				<li class="sitemap_depth02"><a href="#" title="기업별">기업별</a></li>
				<li class="sitemap_depth01"><a href="#" title="프리랜서">프리랜서</a></li>
				<li class="sitemap_depth01"><a href="#" title="알바채용">알바채용</a></li>
				<li class="sitemap_depth01"><a href="#" title="기타채용정보">기타채용정보</a></li>
				<li class="sitemap_depth01"><a href="#" title="모바일채용정보">모바일채용정보</a></li>
			</ul>
		</div>
		<div class="sitemap">
			<h4>인재검색</h4>
			<ul>
				<li class="sitemap_depth01"><a href="#" title="인재검색">인재검색</a>
				<li class="sitemap_depth02"><a href="#" title="상세검색">상세검색</a></li>
				<li class="sitemap_depth02"><a href="#" title="직무별">직무별</a></li>
				<li class="sitemap_depth02"><a href="#" title="산업별">산업별</a></li>
				<li class="sitemap_depth02"><a href="#" title="지역별">지역별</a></li>
				<li class="sitemap_depth02"><a href="#" title="기업별">기업별</a></li>
				<li class="sitemap_depth02"><a href="#" title="프리랜서">프리랜서</a></li>
				<li class="sitemap_depth02"><a href="#" title="알바">알바</a></li>
				<li class="sitemap_depth01"><a href="#" title="스크랩인재">스크랩인재</a></li>
				<li class="sitemap_depth01"><a href="/resumeRecommendList.do" title="우수추천인재">우수추천인재</a></li>
			</ul>
		</div>
		<div class="sitemap">
			<h4>헤드헌팅</h4>
			<ul>
				<li class="sitemap_depth01"><a href="/headhuntList.do" title="채용정보">채용정보</a>
				<li class="sitemap_depth01"><a href="#" title="화상면접">채용정보</a>
			</ul>
		</div>
		<div class="sitemap">
			<h4>채용진행현황</h4>
			<ul>
				<li class="sitemap_depth01"><a href="javascript:goProgressList('netfu_52508_48920', 1);" title="면접진행">면접진행</a>
				<li class="sitemap_depth01"><a href="javascript:goProgressList('netfu_52508_50000', 1);" title="기업방문">기업방문</a></li>
				<li class="sitemap_depth01"><a href="javascript:goProgressList('netfu_52508_60000', 1);" title="이력서제공">이력서제공</a></li>
				<li class="sitemap_depth01"><a href="javascript:goProgressList('netfu_52508_70000', 1);" title="재취업성공">재취업성공</a></li>
				<li class="sitemap_depth01"><a href="javascript:goProgressList('netfu_52508_80000', 1);" title="사전면접">사전면접</a></li>
				<li class="sitemap_depth01"><a href="javascript:goProgressList('netfu_52508_90000', 1);" title="적응컨설팅">적응컨설팅</a></li>
			</ul>
		</div>
		<div class="sitemap">
			<h4>고객센터</h4>
			<ul>
				<li class="sitemap_depth01"><a href="/noticeList.do" title="공지사항">공지사항</a>
				<li class="sitemap_depth01"><a href="javascript:goBoardList('netfu_41549_84812', 1);" title="게시판">게시판</a></li>
				<li class="sitemap_depth01"><a href="/faqList.do" title="FAQ">FAQ</a></li>
				<li class="sitemap_depth01"><a href="/paymentGuide.do" title="이용안내">이용안내</a></li>
				<li class="sitemap_depth02"><a href="/paymentGuide.do" title="유료채용광고 문의">유료채용광고 문의</a></li>
				<li class="sitemap_depth01"><a href="/termsOfService.do" title="이용약관">이용약관</a></li>
				<li class="sitemap_depth01"><a href="/privacyPolicy.do" title="개인정보취급방침">개인정보취급방침</a></li>
				<li class="sitemap_depth01"><a href="javascript:goBoardEdit('netfu_44304_38055', 0, 1);" title="불편 및 신고사항 접수">불편 및 신고사항 접수</a></li>
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


<!-- (begin) 2020.12.30 by s.yoo	-->
<form id="progressForm" name="progressForm" method="post" action="/progressList">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="boardCode" id="boardCode" value="${boardCode}" />
</form>

<form id="communityForm" name="communityForm" method="post" action="/boardList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="boardCode" id="boardCode" value="${boardCode}" />
	<input type="hidden" name="no" id="no" value="" />
</form>

<script type="text/javascript">
	
	$(document).ready(function(){
	});	

	//채용진행현황 관련.
	function goProgressList(boardCode, pageNo){
		$("#progressForm>#pageNo").val(pageNo);
		$("#progressForm>#boardCode").val(boardCode);
		$("#progressForm").attr("action", "/progressList.do");
		$("#progressForm").submit();
	}


	//커뮤니티 & 고객센터 관련.
	function goBoardList(boardCode, pageNo){
		$("#communityForm>#pageNo").val(pageNo);
		//$("#communityForm>#boardType").val(boardType);
		$("#communityForm>#boardCode").val(boardCode);
		$("#communityForm").attr("action", "/boardList.do");
		$("#communityForm").submit();
	}

	function goBoardEdit(boardCode, id, pageNo){
		$("#communityForm>#pageNo").val(pageNo);
		//$("#communityForm>#boardType").val(boardType);
		$("#communityForm>#boardCode").val(boardCode);
		$("#communityForm>#no").val(id);
		$("#communityForm").attr("action", "/boardEdit.do");
		$("#communityForm").submit();
	}

	function goBoardView(boardCode, id, pageNo){
		$("#communityForm>#pageNo").val(pageNo);
		//$("#communityForm>#boardType").val(boardType);
		$("#communityForm>#boardCode").val(boardCode);
		$("#communityForm>#no").val(id);
		$("#communityForm").attr("action", "/boardView.do");
		$("#communityForm").submit();
	}
	
</script>
<!-- (end) 2020.12.30 by s.yoo	-->


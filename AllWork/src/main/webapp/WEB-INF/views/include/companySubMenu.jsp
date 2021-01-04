<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" type="text/css" href="/css/common.css"/>

<div id="menuTree">
	<p class="settingBtn">
		<a href="/companyHome.do" title="기업회원 홈">기업회원 홈</a>
	</p>
	<ul>
		<li class="gnb gnb01"><a href="/recruitListProgress.do" title="채용관리">채용관리</a>
			<h3>채용관리</h3>
			<ol class="subMenu subMenu01">
				<li class="subMenu01_01"><a href="/recruitInfoReg.do" title="채용공고 등록">채용공고 등록</a></li>
				<li class="subMenu01_02"><a href="/recruitListProgress.do" title="진행중인 채용정보">진행중인 채용정보</a></li>
				<li class="subMenu01_03"><a href="/recruitListClosed.do" title="마감된 채용정보">마감된 채용정보</a></li>
			</ol>
		</li>
		<li class="gnb gnb02"><a href="/resumeScrapList.do" title="인재관리">인재관리</a>
			<h3>인재관리</h3>
			<ol class="subMenu subMenu02">
				<li class="subMenu02_01"><a href="/resumeScrapList.do" title="스크랩 인재">스크랩 인재</a></li>
				<li class="subMenu02_03"><a href="/fitResumeSetting.do" title="맞춤서비스 설정">맞춤서비스 설정</a></li>
				<li class="subMenu02_04"><a href="/fitResumeList.do" title="맞춤 인재정보">맞춤 인재정보</a></li>
			</ol>
		</li>
		<li class="gnb gnb03"><a href="/companyApplicantList.do" title="입사지원 관리">입사지원 관리</a>
			<h3>입사지원 관리</h3>
			<ol class="subMenu subMenu03">
				<li class="subMenu03_01"><a href="/companyApplicantList.do" title="입사지원 관리">입사지원자 관리</a></li>
				<li class="subMenu03_02"><a href="/interviewSuggestList.do" title="면접제의 요청관리">면접제의 요청관리</a></li>
			</ol>
		</li>
		<li class="gnb gnb04"><a href="/recruitApplyForPay.do" title="유료서비스">유료서비스</a>
			<h3>유료서비스</h3>
			<ol class="subMenu subMenu04">
				<li class="subMenu04_01"><a href="/recruitApplyForPay.do" title="">유료채용광고 서비스</a></li>
				<li class="subMenu04_02"><a href="/resumeSearchApplyForPay.do" title="">인재검색서칭 서비스</a></li>
				<li class="subMenu04_03"><a href="/resumeSearchPaidList.do" title="">결재 내역 조회</a></li>
			</ol>
		</li>
		<!-- (begin) 2021.01.03 by s.yoo	-->
		<!-- 
        <li class="gnb gnb05"><a href="/companyModify.do" title="회원정보수정">회원정보수정</a></li>
		 -->
		<li class="gnb gnb05"><a href="/companyModify.do" title="회원정보관리">회원정보관리</a>
			<h3>회원정보관리</h3>
			<ol class="subMenu subMenu05">
				<li class="subMenu05_01"><a href="/companyModify.do" title="회원정보관리 ">회원정보관리</a></li>
				<li class="subMenu05_02"><a href="/memberUnregister.do" title="회원탈퇴">회원탈퇴</a></li>
			</ol>
		</li>
		<!-- (begin) 2021.01.03 by s.yoo	-->
	</ul>
</div>
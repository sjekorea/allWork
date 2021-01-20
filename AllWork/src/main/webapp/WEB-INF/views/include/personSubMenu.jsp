<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" type="text/css" href="/css/common.css"/>

<div id="menuTree">
	<p class="settingBtn">
		<a href="/personHome.do" title="개인회원 홈">개인회원 홈</a>
	</p>
	<ul>
		<li class="menu menu01"><a href="/resumeList.do" title="이력서관리">이력서관리</a>
			<h3>이력서관리</h3>
			<ol class="subMenu subMenu01">
				<li class="subMenu01_01"><a href="/resumeList.do" title="이력서목록">이력서목록</a></li>
				<li class="subMenu01_02"><a href="/resumeInfoReg.do" title="이력서등록">이력서등록</a></li>
			</ol>
		</li>
		<li class="menu menu02"><a href="/personApplyList.do" title="입사지원관리">입사지원관리</a>
			<h3>입사지원관리</h3>
			<ol class="subMenu subMenu02">
				<li class="subMenu02_01"><a href="/personApplyList.do" title="입사지원현황">입사 지원 현황</a></li>
			</ol>
		</li>
		<li class="menu menu03"><a href="/recruitScrapList.do" title="스크랩/관심기업">스크랩/관심기업</a>
			<h3>스크랩/관심기업</h3>
			<ol class="subMenu subMenu03">
				<li class="subMenu03_01"><a href="/recruitScrapList.do" title="스크랩">스크랩한 채용정보</a></li>
				<li class="subMenu03_02"><a href="/interestCompanyList.do" title="관심기업">관심기업</a></li>
				<li class="subMenu03_03"><a href="/interviewRequestCompany.do" title="면접요청기업">면접요청기업</a></li>
			</ol></li>
		<li class="menu menu04"><a href="/recruitViewList.do" title="내가 확인한 채용정보">내가 확인한 채용정보</a></li>
		<li class="menu menu05"><a href="/fitRecruitList.do" title="맞춤서비스관리">맞춤서비스관리</a>
			<h3>맞춤서비스관리</h3>
			<ol class="subMenu subMenu05">
				<li class="subMenu05_01"><a href="/fitRecruitList.do" title="맞춤채용정보">맞춤채용정보</a></li>
				<li class="subMenu05_02"><a href="/fitRecruitSetting.do" title="맞춤서비스설정">맞춤서비스설정</a></li>
			</ol></li>
		<li class="menu menu06"><a href="/resumeApplyForPay.do" title="유료서비스">유료서비스</a>
			<h3>유료서비스</h3>
			<ol class="subMenu subMenu06">
				<li class="subMenu06_02"><a href="/resumeApplyForPay.do" title="유료옵션서비스 신청">유료 옵션 서비스 신청</a></li>
				<li class="subMenu06_01"><a href="/resumePaidList.do" title="결제내역조회">결제내역조회</a></li>
			</ol></li>
		<!-- (begin) 2021.01.03 by s.yoo	-->
		<!-- 
		<li class="menu menu07"><a href="/updateMyInfo.do" title="회원정보관리">회원정보관리</a></li>
		 -->
		<li class="menu menu07"><a href="/updateMyInfo.do" title="회원정보관리">회원정보관리</a>
			<h3>회원정보관리</h3>
			<ol class="subMenu subMenu07">
				<li class="subMenu07_01"><a href="/updateMyInfo.do" title="회원정보관리 ">회원정보관리</a></li>
				<li class="subMenu07_03"><a href="/linkSocial.do" title="소셜계정연결 ">소셜계정연결</a></li>
				<li class="subMenu07_02"><a href="/memberUnregister.do" title="회원탈퇴">회원탈퇴</a></li>
			</ol>
		</li>
		<!-- (begin) 2021.01.03 by s.yoo	-->
	</ul>
</div>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
		<title>맞춤채용정보</title>
		<link rel="stylesheet" type="text/css" href="/css/header_company.css" />
		<link rel="stylesheet" type="text/css" href="/css/footer.css" />
		<link rel="stylesheet" type="text/css" href="/css/font.css" />
		<link rel="stylesheet" type="text/css" href="/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="/css/all.css" />
		<link rel="stylesheet" type="text/css" href="/css/popup.css" />
		<script src="/js/jquery-3.3.1.min.js"></script>
		<script src="/js/jquery-ui.min.js"></script>
		<script src="/js/common.js"></script>
		<script src="/js/process.js"></script>
		<script src="/js/code.js"></script>
		<style></style>
	</head>
	<body>
		<div id="progress_barWrap" style="display:none;">
			<p id="progress_bar">
				<img src="/img/main/loading_circle.gif" alt="로딩이미지"/>
			</p>
	    </div>
		<div id="allworkWrap">
			<div id="headerWrap">
				<div id="topWrap">
					<h1><a href="/index.do" title="올워크홈">Allwork</a></h1>
					<ul class="topMenu">
						<li><a href="/noticeList.do" title="고객센터">고객센터&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
						<li><a href="/logout.do" title="로그아웃">로그아웃</a></li>
					</ul>
				</div>
				<div id="head">
					<div id="header">
						<ul class="nav">
							<li class="link02"><a href="#none" title="전체메뉴보기"><i class="fas fa-bars"></i></a></li>
							<li><a href="/resumeSearch.do" title="인재정보">인재정보</a></li>
							<li><a href="/headhuntList.do" title="헤드헌팅">헤드헌팅</a></li>
							<li><a href="/progressList.do" title="채용진행현황">채용진행현황</a></li>
							<li><a href="/noticeList.do" title="커뮤니티">커뮤니티</a></li>
						</ul>
              			<p class="company_name"><a href="/companyHome.do" title="기업홈">${SE_USER_NM }</a></p>
						<p class="link01"><a href="/companyHome.do" title="기업회원 홈">기업회원 홈</a></p>
					</div>
				</div>
				<div id="allMenuWrap">
					<div id="allMenu">
						<p class="close"><a href="/resumeSearch.do" title="채용정보"><i class="fas fa-times"></i></a></p>
						<div class="sitemapArea">
							<div>
								<h4>인재검색</h4>
								<ul>
									<li>
										<a href="#" title="인재검색">인재검색</a>
										<ul class="sub">
											<li><a href="/resumeSearch.do" title="">상세검색</a></li>
											<li><a href="/resumeSearchByDuty.do" title="">직무별</a></li>
											<li><a href="/resumeSearchByIndustry.do" title="">산업별</a></li>
											<li><a href="/resumeSearchByArea.do" title="">지역별</a></li>
											<li><a href="/resumeSearchForFree.do" title="프리랜서">프리랜서</a></li>
											<li><a href="/resumeSearchForAlba.do" title="알바">알바</a></li>
										</ul>
									</li>
									<li><a href="/resumeScrapList.do" title="스크랩인재">스크랩인재</a></li>
									<li><a href="#" title="우수추천인재">우수추천인재</a></li>
									</ul>
								</div>
							<div>
								<h4>헤드헌팅</h4>
								<ul>
									<li class="sitemap_depth01"><a href="/headhuntList.do" title="채용정보">채용정보</a></li>
									<li class="sitemap_depth01"><a href="#" title="화상면접">화상면접</a></li>
								</ul>
							</div>
							<div>
								<h4>채용진행현황</h4>
								<ul>
									<li><a href="#" title="면접진행">면접진행</a></li>
									<li><a href="#" title="기업방문">기업방문</a></li>
									<li><a href="#" title="이력서제공">이력서제공</a></li>
									<li><a href="#" title="재취업성공">재취업성공</a></li>
									<li><a href="#" title="사전면접">사전면접</a></li>
								</ul>
							</div>
							<div>
								<h4>커뮤니티</h4>
								<ul>
									<li class="menu menu01"><a href="/noticeList.do" title="공지사항">공지사항</a></li>
									<li class="menu menu02"><a href="/boardList.do" title="게시판">게시판</a></li>
									<li class="menu menu03"><a href="#" title="FAQ">FAQ</a></li>
									<li class="menu menu04"><a href="#" title="이용안내">이용안내</a>
									<ul class="sub">
										<li><a href="#" title="유료채용광고 문의">유료채용광고 문의</a></li>
									</ul>
									</li>
									<li class="menu menu05"><a href="#" title="이용약관">이용약관</a></li>
									<li class="menu menu06"><a href="#" title="개인정보 취급방침">개인정보 취급방침</a></li>
									<li class="menu menu07"><a href="#" title="불편 및 신고상황 접수">불편 및 신고상황 접수</a></li>
									<li class="menu menu08"><a href="#" title="모바일 서비스">모바일 서비스</a></li>
									<li class="menu menu09"><a href="#" title="자료실">자료실</a></li>
								</ul>
							</div>
						</div>
						<p class="allMenu_ect">
							<span><a href="/noticeList.do" title="고객센터">고객센터</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</span>
							<span><a href="/introAbout.do" title="회사소개">회사소개</a></span>
						</p>
					</div>
				</div>
			</div>
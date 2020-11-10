<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>allwork</title>
<link rel="stylesheet" type="text/css" href="/css/common.css" />
<link rel="stylesheet" type="text/css" href="/css/header_main.css" />
<link rel="stylesheet" type="text/css" href="/css/index.css" />
<link rel="stylesheet" type="text/css" href="/css/footer.css" />
<link rel="stylesheet" type="text/css" href="/css/font.css" />
<link rel="stylesheet" type="text/css" href="/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/css/all.css" />
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/js/jquery-1.12.4.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/index00.js"></script>
<script type="text/javascript" src="/js/moment.min.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/process.js"></script>
<style>
</style>
<script></script>
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
				<ul class="topMenu">
					<c:choose>
						<c:when test="${SE_LOGIN_STATUS}">
							<li><a href="/logout.do" title="로그아웃">로그아웃&nbsp;|&nbsp;</a></li>
							<li><a href="#" title="mypage">mypage</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/login.do" title="로그인">로그인&nbsp;|&nbsp;</a></li>
							<li><a href="/personJoin.do" title="회원가입">회원가입</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div id="head">
				<div id="header">
					<h1>
						<a href="/index.do" title="allwork사이트">Allwork</a>
					</h1>
					<ul class="nav">
						<li><a href="#none" title="전체메뉴보기"><i class="fas fa-bars"></i></a></li>
						<li><a href="/recruitSearch.do" title="채용정보">채용정보</a></li>
						<li><a href="/personSearch.do" title="인재검색">인재검색</a></li>
						<li><a href="#none" title="헤드헌팅">헤드헌팅</a></li>
						<li><a href="#none" title="채용진행현황">채용진행현황</a></li>
						<li><a href="/boardList.do" title="커뮤니티">커뮤니티</a></li>
					</ul>
					<ul class="linkArea">
						<c:choose>
							<c:when test="${SE_LOGIN_STATUS}">
								<c:choose>
									<c:when test="${SE_USER_TYPE eq 'person'}">
										<li class="a01"><a href="/personHome.do" title="개인회원 홈">개인회원 홈</a></li>
									</c:when>
									<c:otherwise>
										<li class="a01"><a href="/companyHome.do" title="기업회원 홈">기업회원 홈</a></li>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<li class="a01"><a href="/login.do?type=person" title="개인회원 로그인">개인회원 로그인</a></li>
								<li class="a02"><a href="/login.do?type=company" title="기업회원 로그인">기업회원 로그인</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
		<div id="allMenuWrap">
			<div id="allMenu">
				<p>
					<a href="#" title="채용정보"><i class="far fa-times-circle"></i></a>
				</p>
				<div class="sitemapArea">
					<div class="sitemap">
						<h4>채용정보</h4>
						<ul>
							<li class="sitemap_depth01"><a href="/recruitSearch.do" title="채용정보">채용정보</a>
							<li class="sitemap_depth02"><a href="/recruitSearch.do" title="상세검색">상세검색</a></li>
							<li class="sitemap_depth02"><a href="/recruitSearchByDuty.do" title="직무별">직무별</a></li>
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
							<li class="sitemap_depth01"><a href="/personSearch.do" title="인재검색">인재검색</a>
							<li class="sitemap_depth02"><a href="/personSearch.do" title="상세검색">상세검색</a></li>
							<li class="sitemap_depth02"><a href="#" title="직무별">직무별</a></li>
							<li class="sitemap_depth02"><a href="#" title="산업별">산업별</a></li>
							<li class="sitemap_depth02"><a href="#" title="지역별">지역별</a></li>
							<li class="sitemap_depth02"><a href="#" title="기업별">기업별</a></li>
							<li class="sitemap_depth02"><a href="#" title="프리랜서">프리랜서</a></li>
							<li class="sitemap_depth02"><a href="#" title="알바">알바</a></li>
							<li class="sitemap_depth01"><a href="/personScrapList.do" title="스크랩인재">스크랩인재</a></li>
							<li class="sitemap_depth01"><a href="#" title="우수추천인재">우수추천인재</a></li>
						</ul>
					</div>
					<div class="sitemap">
						<h4>헤드헌팅</h4>
						<ul>
							<li class="sitemap_depth01"><a href="#" title="채용정보">채용정보</a>
						</ul>
					</div>
					<div class="sitemap">
						<h4>채용진행현황</h4>
						<ul>
							<li class="sitemap_depth01"><a href="#" title="면접진행">면접진행</a>
							<li class="sitemap_depth01"><a href="#" title="기업방문">기업방문</a></li>
							<li class="sitemap_depth01"><a href="#" title="이력서제공">이력서제공</a></li>
							<li class="sitemap_depth01"><a href="#" title="재취업성공">재취업성공</a></li>
							<li class="sitemap_depth01"><a href="#" title="사전면접">사전면접</a></li>
						</ul>
					</div>
				</div>
				<div id="allMenu_ect">
					<span><a href="#" title="고객센터">고객센터</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</span>
					<span><a href="/introAbout.do" title="회사소개">회사소개</a></span>
				</div>
			</div>
		</div>
		<div id="containerWrap">
			<div id="visualWrap">
				<div id="visual">
					<h2>비쥬얼영역</h2>
					<div class="descBox">
						<p class="desc1">
							<span>40세&nbsp;이상&nbsp;구인구직은</span><br />
							<span class="bold">올워크</span>
						</p>
						<div id="searchArea">
							<form action="https://www.mmca.co.kr/search" method="get" name="searchForm">
								<fieldset>
									<legend>검색</legend>
									<p class="textBox">
										<input id="searchText" type="text" name="q" title="allwork 검색" maxlength="100" placeholder="검색어를 입력해주세요" />
									</p>
									<p class="btnBox00">
										<input id="search_btn00" type="button" name="searchBtn00" value="검색" />
									</p>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div id="screen">
				<ul id="film">
					<li class="scene scene0"><img src="/img/main/main00.jpg" alt="이미지00" /></li>
					<li class="scene scene1"><img src="/img/main/main01.jpg" alt="이미지01" /></li>
				</ul>
			</div>
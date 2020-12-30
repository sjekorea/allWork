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
	<link rel="stylesheet" type="text/css" href="/css/header_personal.css" />
	<link rel="stylesheet" type="text/css" href="/css/footer.css" />
	<link rel="stylesheet" type="text/css" href="/css/font.css" />
	<link rel="stylesheet" type="text/css" href="/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="/css/all.css" />
	<link rel="stylesheet" type="text/css" href="/css/common.css" />
	<link rel="stylesheet" type="text/css" href="/css/popup.css" />
	<script src="/js/jquery-3.3.1.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/common.js"></script>
	<script src="/js/process.js"></script>
	<script src="/js/code.js"></script>
	<style></style>
</head>
<body>
	<div id="progress_barWrap">
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
						<li><a href="#none" title="헤드헌팅">헤드헌팅</a></li>
						<li><a href="#none" title="채용진행현황">채용진행현황</a></li>
						<li><a href="/boardList.do" title="커뮤니티">커뮤니티</a></li>
					</ul>
					<ul class="linkArea">
						<li class="a01"><span>${SE_USER_NM }&nbsp;&nbsp;&nbsp;</span><a href="#" title="이력서 관리>">이력서 관리></a></li>
						<li class="a02"><a href="/personHome.do"><span class="fas fa-user-check"></span></a></li>
					</ul>
				</div>
			</div>
			<div id="allMenuWrap">
				<div id="allMenu">
					<p class="close"><a href="#" title="채용정보"><i class="fas fa-times"></i></a></p>
					<div class="sitemapArea">
						<div>
							<h4>채용정보</h4>
							<ul>
								<li class="sitemap_depth01">
									<a href="#" title="채용정보">채용정보</a>
									<ul class="sub">
										<li class="sitemap_depth02"><a href="/recruitSearch.do" title="상세검색">상세검색</a></li>
										<li class="sitemap_depth02"><a href="/recruitSearchByDuty.do" title="직무별">직무별</a></li>
										<li class="sitemap_depth02"><a href="/recruitSearchByIndustry.do" title="산업별">산업별</a></li>
										<li class="sitemap_depth02"><a href="/recruitSearchByArea.do" title="지역별">지역별</a></li>
									</ul>
								</li>
								<li class="sitemap_depth01"><a href="/recruitSearchForFree.do" title="프리랜서">프리랜서</a></li>
								<li class="sitemap_depth01"><a href="/recruitSearchForAlba.do" title="알바채용">알바채용</a></li>
								<li class="sitemap_depth01"><a href="/recruitOther.do" title="기타채용정보">기타채용정보</a></li>
							</ul>
						</div>
						<div>
							<h4>헤드헌팅</h4>
							<ul>
							<li class="sitemap_depth01"><a href="#" title="채용정보">채용정보</a></li>
							<li class="sitemap_depth01"><a href="#" title="채용정보">화상면접</a></li>
							</ul>
						</div>
						<div>
							<h4>채용진행현황</h4>
							<ul>
								<li class="sitemap_depth01"><a href="#" title="면접진행">면접진행</a></li>
								<li class="sitemap_depth01"><a href="#" title="기업방문">기업방문</a></li>
								<li class="sitemap_depth01"><a href="#" title="이력서제공">이력서제공</a></li>
								<li class="sitemap_depth01"><a href="#" title="재취업성공">재취업성공</a></li>
								<li class="sitemap_depth01"><a href="#" title="사전면접">사전면접</a></li>
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
	
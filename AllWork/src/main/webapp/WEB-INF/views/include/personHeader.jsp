<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>채용정보 </title>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
		<link rel="stylesheet" type="text/css" href="/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="/css/header_personal.css"/>
		<link rel="stylesheet" type="text/css" href="/css/footer.css"/>
		<link rel="stylesheet" type="text/css" href="/css/font.css"/>
		<link rel="stylesheet" type="text/css" href="/css/reset.css"/>
		<link  rel="stylesheet" type="text/css" href="/css/all.css"/>
	</head>
	<body>
	<div id="allworkWrap">
		<div id="headerWrap">
			<div id="topWrap">
				<ul class="topMenu">
					<li><a href="#" title="고객센터">고객센터&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
					<li><a href="/logout.do" title="로그아웃">로그아웃</a></li>
				</ul>
			</div>
			<div id="head">
				<div id="header">
					<h1><a href="/index.do" title="allwork사이트">Allwork</a></h1>
					<ul class="nav">
						<li><a href="#" title="전체메뉴보기"><i class="fas fa-bars"></i></a></li>
						<li><a href="/recruitSearch.do" title="채용정보">채용정보</a></li>
						<li><a href="#" title="헤드헌팅">헤드헌팅</a></li>
						<li><a href="#" title="채용진행현황">채용진행현황</a></li>
						<li><a href="/boardList.do" title="커뮤니티">커뮤니티</a></li>
					</ul>
					<ul class="linkArea">
						<li class="a01"><span>${SE_USER_NM }님&nbsp;&nbsp;&nbsp;</span><a href="#" title="이력서 관리>">이력서 관리></a></li>
						<li class="a02"><a href="/personHome.do" title="개인회원 로그인"><span class ="fas fa-user-check"></span></a></li>
					</ul>
				</div>
			</div>
		</div>
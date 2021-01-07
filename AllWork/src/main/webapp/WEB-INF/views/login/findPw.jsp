<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
	<title> 비밀번호 찾기 </title>
	<link rel="stylesheet" type="text/css" href="css/header_mini.css"/>
	<link rel="stylesheet" type="text/css" href="css/findPW.css"/>
	<link rel="stylesheet" type="text/css" href="css/common.css"/>
	<link rel="stylesheet" type="text/css" href="css/footer_white.css"/>
	<link rel="stylesheet" type="text/css" href="css/font.css"/>
	<link rel="stylesheet" type="text/css" href="css/reset.css"/>
	<link	rel="stylesheet" type="text/css" href="css/all.css"/>

	<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"/>
	
	<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/js/moment.min.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/process.js?v=<%=System.currentTimeMillis() %>"></script>
	<script type="text/javascript" src="/js/Cookie.js"></script>
</head>
	
<body>
	<div id="allworkWrap">
		<div id="topmenuWrap">
			<ul class="topMenu">
				<li class="allworkHome"><a href="/index.do" title="allwork사이트">Allwork&nbsp;&nbsp;|&nbsp;</a></li>
				<li><a href="/introAbout.do" title="회사소개">회사소개&nbsp;|&nbsp;</a></li>
				<li><a href="/sitemap.do" title="사이트맵">사이트맵&nbsp;|&nbsp;</a></li>
				<li><a href="/noticeList.do" title="고객센터">고객센터&nbsp;|&nbsp;</a></li>
				<li><a href="/login.do" title="로그인">로그인</a></li>
			</ul>
		</div>
		<div id="loginWrap">
			<div id="loginArea">
			<div class="logintext">
				<h1>비밀번호 찾기</h1>
				<p>
					 회원님의 아이디와 이름, 가입시 작성하신 이메일 주소 또는 전화번호를 입력해주세요.
					<br />회원님의 비밀번호를 초기화하고, 임시 비밀번호를 알려드립니다.
				</p>
			</div>
				<form action="javascript:findPw();" method="post">
					<fieldset>
						<legend>비밀번호 초기화</legend>
						<div class="loginBox">
							<p>
								<input id="uid" type="text" name="uid" title="아이디" placeholder="회원 ID 입력 (예)gdhong"/>
							</p>
							<p>
								<input id="name" type="text" name="name" title="이름" placeholder="회원 이름 입력 (예)홍길동"/>
							</p>
							<div class="tab">
								<span class="btn_persnal"><input id="find_by_email" type="radio" name="searchType" checked="checked" value="1"/>&nbsp;이메일</span>
								<span class="btn_company"><input id="find_by_phone" type="radio" name="searchType" value="2"/>&nbsp;전화번호</span>
							</div>
							<p>
								<input id="email" type="text" name="email" title="이메일 또는 전화번호" placeholder="이메일 또는 전화번호 입력 (예)gdhong@abc.com 또는 010-1234-5678"/>
							</p>
							<p class="button"><input type="submit" value="확인" title="확인"/></p>
							<p class="findArea">
							<span><a href="javascript:goFindId();" title="아이디찾기">아이디찾기&nbsp;&nbsp;|&nbsp;</a></span>
							<span class="register"><a href="javascript:goMemberJoin();" title="회원가입">회원가입</a></span>
							</p>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		
		<jsp:include page="/footer.do" />
<input type="hidden" name="type" id="type" value="${map.type }" />

<script type="text/javascript">

	function goFindId(){
		location.href = "/findId.do";
	}
	
	function goMemberJoin(){
		location.href = "/personJoin.do";
	}
	
	function findPw(){
		
		if(checkNull($("#uid").val())){
			alertAndFocus("아이디를 입력하세요.", $("#uid"));
			return;
		}
		
		if(checkNull($("#name").val())){
			alertAndFocus("이름을 입력하세요.", $("#name"));
			return;
		}
		
		if(checkNull($("#email").val())){
			alertAndFocus("이메일을 입력하세요.", $("#email"));
			return;
		}

		var type = $("input[name=searchType]:checked").val();

		var callback = function(data){
			if(data.rstCnt > 0){
				alert("회원님의 임시 비밀번호는 '" + data.map.passwd + "'입니다.\n로그인 후에 비밀번호를 변경하세요.");
				location.href = "/login.do";
			}else{
				alert("회원정보를 찾을 수 없습니다. ID, 이름과 이메일(또는 전화번호)을 확인해 주세요.");
				loadingOff();
			}
		};
		var param = {
						uid : $("#uid").val()
						, name : $("#name").val()
						, email : $("#email").val()
						, type : type
					};
		ajax('post', '/findPwProcess.ajax', param, callback);
	}
	
</script>
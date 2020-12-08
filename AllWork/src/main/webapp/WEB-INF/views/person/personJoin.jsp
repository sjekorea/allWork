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
<title>개인회원 회원가입</title>
<link rel="stylesheet" type="text/css" href="/css/header_mini.css" />
<link rel="stylesheet" type="text/css" href="/css/register_01.css" />
<link rel="stylesheet" type="text/css" href="/css/footer_white.css" />
<link rel="stylesheet" type="text/css" href="/css/font.css" />
<link rel="stylesheet" type="text/css" href="/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/css/all.css" />
<link rel="stylesheet" type="text/css" href="/css/common.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/js/jquery-1.12.4.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/index00.js"></script>
<script type="text/javascript" src="/js/moment.min.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/process.js"></script>
</head>

<body>
	<div id="progress_barWrap" style="display:none;">
		<p id="progress_bar">
			<img src="/img/main/loading_circle.gif" alt="로딩이미지"/>
		</p>
    </div>
	<div id="allworkWrap">
		<div id="topmenuWrap">
			<ul class="topMenu">
				<li class="allworkHome"><a href="/index.do" title="allwork사이트">Allwork&nbsp;&nbsp;|&nbsp;</a></li>
				<li><a href="#" title="고객센터">고객센터</a></li>
			</ul>
		</div>
		<div id="registerWrap">
			<div id="registerArea">
				<div class="registertext">
					<h4>회원가입</h4>
					<p>올워크 개인회원 가입은 <span class="bold">무료</span>입니다.</p>
				</div>
				<form action="#none" method="post">
					<fieldset>
						<legend>회원가입</legend>
						<div class="tab">
							<span class="btn_persnal"><input id="persnal_register" type="radio" name="persnal_register" onClick="location.href='/personJoin.do'" checked="checked"/><label for="persnal_register">&nbsp;개인회원</label></span>
							<span class="btn_company"><input id="company_register" type="radio" name="company_register"/><label for="company_register">&nbsp;기업회원</label></span>
						</div>
						<div class="descBox">
							<p class="title">일반 개인회원<br/>혜택</p>
							<p class="desc">
								<span><i class="far fa-check-circle"></i>입사지원 기업보기</span>
								<span><i class="far fa-check-circle"></i>입사요청 기업보기</span>
								<span><i class="far fa-check-circle"></i>채용정보 메일링 서비스</span>
								<span><i class="far fa-check-circle"></i>무료 채용정보 열람</span>
							</p>
							<p class="title">개인유료회원<br/>혜택</p>
							<p class="desc">
								<span><i class="far fa-check-circle"></i>올워크 구인정보 무제한 검색</span>
								<span><i class="far fa-check-circle"></i>기업의 채용대행, 헤드헌팅 우선추천</span>
								<span><i class="far fa-check-circle"></i>정회원 전용 프리미엄좀 운영</span>
								<span><i class="far fa-check-circle"></i>기타 정회원 우선 정책 유지</span>
							</p>
						</div>
						<div class="snsRegister">
							<p>소셜 회원가입</p>
							<ul>
								<li><a href="#none" title="네이버 회원가입"><img src="/img/login/sns01.png" alt="이미지00"/>&nbsp;&nbsp;&nbsp;&nbsp;네이버 회원가입</a></li>
								<li><a href="#none" title="카카오 회원가입"><img src="/img/login/sns02.png" alt="이미지00"/>&nbsp;&nbsp;&nbsp;&nbsp;카카오 회원가입</a></li>
								<li><a href="#none" title="구글 회원가입"><img src="/img/login/sns03.jpg" alt="이미지00"/>&nbsp;&nbsp;&nbsp;&nbsp;구글 회원가입</a></li>
							</ul>
						</div>
						<div class="registerBox">
							<table>
								<caption>모집요강</caption>
								<tbody>
									<tr>
										<th>이름<span class="necessary">*</span></th>
										<td><input id="name" type="text" name="name" title="이름" value="테스트"/></td>
									</tr>
									<tr>
										<th>아이디<span class="necessary">*</span></th>
										<td>
											<input id="uid" type="text" name="uid" title="아이디" value="test01"/>
											<input id="btuChkDupUid" type="submit" value="중복확인" title="중복확인" />
											<span class="comment">영문과 숫자를 조합하여 4~20자 이내로 입력하세요.</span>
										</td>
									</tr>
									<tr>
										<th>비밀번호<span class="necessary">*</span></th>
										<td>
											<input id="passwd" type="password" name="passwd" value="1111" title="비밀번호"/>
											<span class="comment">비밀번호는 6~16자 영문, 숫자를 조합하여 사용할 수 있습니다.</span>
										</td>
									</tr>
									<tr>
										<th>비밀번호 확인<span class="necessary">*</span></th>
										<td>
											<input id="passwdConfirm" type="password" name="passwdConfirm" title="비밀번호확"/>
											<span class="comment">비밀번호 확인을 위해 다시 한 번 입력해 주시기 바랍니다.</span>
										</td>
									</tr>
									<tr>
										<th>생년월일<span class="necessary">*</span></th>
										<td>
											<span><input id="year" type="text" name="year" value="1950"/><label for="year">&nbsp;년</label></span>
											<span><input id="month" type="text" name="month" value="12"/><label for="month">&nbsp;월</label></span>
											<span><input id="day" type="text" name="day" value="10"/><label for="day">&nbsp;일</label></span>
											<span class="comment">40세 이상만 가입이 가능합니다.</span>
											<input type="hidden" name="birth" id="birth" value="" />
										</td>
									</tr>
									<tr>
										<th>성별<span class="necessary">*</span></th>
										<td>
											<span class="male"><input id="gender_male" type="radio" name="gender_male" checked="checked"/><label for="gender_male">남자</label></span>
											<span class="female"><input id="gender_female" type="radio" name="gender_female"/><label for="gender_female">여자</label></span>
										</td>
									</tr>
									<tr class="email">
										<th>이메일<span class="necessary">*</span></th>
										<td>
											<span><input id="email" type="text" name="email" value="test01" title="아이디만 입력"/></span>
											<span>&nbsp;@&nbsp;</span><span><input id="emailHost" type="text" name="emailHost" value="test.com" title="이메일 주소 선택"/></span>
											<span>
												<select id="selEmailHost" name="selEmailHost" title="이메일 선택">
													<option value="direct">직접입력</option>
													<option value="gmail.com">gmail.com</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="nate.com">nate.com</option>
												</select>
											</span>
										</td>
									</tr>
									<tr class="phone">
										<th>휴대폰 인증<span class="necessary">*</span></th>
										<td>
											<p>
												<label for="phoneNum">휴대폰 번호</label>
												<input id="hphone" type="text" name="hphone" value="010-1111-1111" title="휴대폰번호"/>
												<input type="submit" value="인증번호 전송" title="인증번호 전송"/>
											</p>
											<p>
												<label for="confirmNum">인증번호 입력</label>
												<input id="confirmNum" type="text" name="confirmNum" title="인증번호"/>
												<input class="ok" type="submit" value="확인" title="확인"/>
												<input type="submit" value="재전송" title="재전송"/>
											</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="agreement">
							<p class="comment01">필수동의 항목과 마케팅 정보 수신(선택)에 모두 동의합니다.</p>
								<ol>
									<li>
										<span><input id="agree00" type="checkbox" name="agree00"/>&nbsp;<label for="agree00">전체동의</label></span>
									</li>
									<li class="descArea">
										<span class="desc"><input id="agree01" type="checkbox" name="agree01"/>&nbsp;<label for="agree01">[필수] 이용약관 동의</label></span>
										<span class="descBtn"><input id="desc_Btn" type="button" name="desc_Btn" value=""/></span>
										<span class="agreeDesc01">
                    						<jsp:include page="/memberAgree1.do" />
										</span>
									</li>
									<li class="descArea">
										<span class="desc"><input id="agree02" type="checkbox" name="agree02"/>&nbsp;<label for="agree02">[필수] 개인정보 수집 및 이용 동의</label></span>
										<span class="descBtn"><input id="desc_Btn" type="button" name="desc_Btn" value=""/></span>
										<span class="agreeDesc02">
											<jsp:include page="/memberAgree2.do" />
										</span>
									</li>
									<li><span><input id="agree03" type="checkbox" name="agree03"/>&nbsp;<label for="agree03">[선택] 마케팅 정보 이메일 수신 동의</label></span></li>
									<li><span><input id="agree04" type="checkbox" name="agree04"/>&nbsp;<label for="agree04">[선택] 마케팅 정보 SMS 수신 동의</label></span></li>
								</ol>
							</div>
						</fieldset>
					</form>
					<div class="agree_ok">
						<ul>
							<li><a href="#" title="취소">취소</a></li>
							<li><a href="#" title="가입하기">가입하기</a></li>
						</ul>
					</div>
				</div>
			</div>  

<jsp:include page="/footer.do" />

<script type="text/javascript">
	
	$(document).ready(function(){
		
		$(".agree_ok").find("a:eq(0)").on("click", function(e){
			location.href = "/index.do";
		});
		
		$(".agree_ok").find("a:eq(1)").on("click", function(e){
			goRegistMember();
		});
		
		$("#btuChkDupUid").on("click", function(e){
			e.preventDefault();
			chkDupUid();
		});
		
	});	
	
	
	function chkDupUid(){
		alert("chkDupUid");
	}
	
	
	// 회원정보 등록
	function goRegistMember(){
		
		var sex = "man";
		
		loadingOn();
		
		var callback = function(data){
			alert("저장 되었습니다.");
			location.href = "/login.do";
		};
		
		var param = {
					uid : $("#uid").val()
					, passwd : $("#passwd").val()
					, name : $("#name").val()
					, hphone : $("#hphone").val()
					, birth : $("#year").val()+"-"+$("#month").val()+"-"+$("#day").val()
					, sex : sex
					, useMail : "no"
					, useSms : "no"
					, email : $("#email").val()+"@"+$("#emailHost").val()
					, pChk : "yes"
					, type : "1"
					, hit : 0
					, useMail : "yes"
					, useSms : "yes"
					, memo : ""
					, addrCoord : ""
					, memoCoord : ""
					, typeR2 : ""
					, aInsert : "no"
				};
		ajax('post', '/registNetfuMember.ajax', param, callback);
	}
</script>

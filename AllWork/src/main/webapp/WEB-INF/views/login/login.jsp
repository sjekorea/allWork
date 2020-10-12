<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"/>

<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/moment.min.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/Cookie.js"></script>

<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8"/>
  <title> 개인회원 로그인 </title>
  <link rel="stylesheet" type="text/css" href="/css/header.css"/>
  <link rel="stylesheet" type="text/css" href="/css/footer_white.css"/>
	<link rel="stylesheet" type="text/css" href="/css/font.css"/>
  <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
  <link  rel="stylesheet" type="text/css" href="/css/all.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
  <style>


  /*###################################   Header    ###################################*/
  #allworkWrap{width:100%;font-family:"NotoSansKR-Regular";}

  /*###################################   topmenuWrap    ###################################*/
  #topmenuWrap{width:100%;overflow: hidden;border-bottom:1px solid #ccc;}
  #topmenuWrap .topMenu{width:1280px;height:40px;line-height:40px;text-align:right;font-size:12px;margin: 0 auto;}
  #topmenuWrap .topMenu li{display: inline-block;}
  #topmenuWrap .topMenu .allworkHome{font-family:"NotoSansKR-Bold";}

  /*###################################   loginWrap    ###################################*/
  #loginWrap{width:100%;overflow:hidden;}
  #loginArea{width:1280px;margin: 0 auto;}
  #loginArea .logintext{width:500px;margin: 0 auto;text-align:center;padding-top: 100px;padding-bottom:50px;font-size:20px;line-height: 46px;color:#666;}
  #loginArea .logintext h1{font-size:45px;font-family:"NotoSansKR-Bold";color:#4F60E3;}
  #loginArea Form{width:500px;margin: 0 auto;}
  #loginArea fieldset{width:100%;border:none;}
  #loginArea legend{display:none;}
  #loginArea .tab{width:100%;font-size:14px;}
  #loginArea .tab span{display:inline-block;padding-right:10px;}
  #loginArea .loginBox{width:100%;height:300px;}
  #loginArea .loginBox p{width:498px;height:48px;border:1px solid #ccc;margin:10px 0;}
  #loginArea .loginBox p input{display:block;width:100%;height:100%;border:none;background-color:#fff;text-indent:10px;}
  #loginArea .loginBox p input::placeholder{color:#ccc;font-size:18px;}
  #loginArea .loginBox p.button{border:none;margin-bottom:0;}
  #loginArea .loginBox p.button input{display:inline;;width:500px;height:50px;background-color:#4F60E3;color:#fff;font-size:18px;}

  #loginArea .loginBox p.checkbox{width:50%;height:50px;text-align:left;border:none;float:left;}
  #loginArea .loginBox p.checkbox input{display:inline;;width:20px;height:20px;vertical-align:bottom;}
  #loginArea .loginBox p.checkbox label{font-size:12px;padding-left:10px;}
  #loginArea .loginBox p.findArea{width:50%;height:50px;text-align:right;border:none;font-size:12px;float:left;}
  #loginArea .loginBox p.findArea .register a{color:#4F60E3;font-family:"NotoSansKR-Bold";}

  #loginArea .snsLogin{width:900px;height: 40px;margin:0 auto 100px;}
  #loginArea .snsLogin li{width:288px;height:38px;border:1px solid #333;margin-right:10px;line-height:38px;text-align: center;float:left;}
  #loginArea .snsLogin li:last-child{margin-right:0;}

              #loginArea .snsLogin li:hover{border:1px solid #ccc}

  #loginArea .snsLogin li a{display:block;width:100%;height:100%;font-size:12px;}
  #loginArea .snsLogin li a img{width:20px;vertical-align:middle;}


	 </style>
</head>

<body>
	<div id="allworkWrap">
		<div id="topmenuWrap">
			<ul class="topMenu">
				<li class="allworkHome"><a href="/index.do" title="allwork사이트">Allwork&nbsp;&nbsp;|&nbsp;</a></li>
				<li><a href="#none" title="고객센터">고객센터</a></li>
			</ul>
		</div>
		<div id="loginWrap">
			<div id="loginArea">
				<div class="logintext">
					<h1>Allwork</h1>
					시니어를 위한 재취업 포털
				</div>
				<form action="javascript:goLogin();" method="post">
					<fieldset>
						<legend>로그인</legend>
						<div class="tab">
							<span class="btn_persnal"><input id="persnal_login" type="radio" name="persnal_login" checked="checked"/><label for="persnal_login">&nbsp;개인회원</label></span>
							<span class="btn_company"><input id="company_login" type="radio" name="company_login"/><label for="company_login">&nbsp;기업회원</label></span>
						</div>
						<div class="loginBox">
							<p><input id="loginId" type="text" name="loginId" title="아이디" placeholder=" 아이디"/></p>
							<p><input id="loginPw" type="password" name="loginPw" title="비밀번호" placeholder=" 비밀번호"/></p>
							<p class="button"><input type="submit" value="로그인" title="로그인"/></p>
							<p class="checkbox"><input id="idSaveCheck" type="checkbox" name="idSaveCheck"/><label for="loginOn"><span>아이디 저장</span></label></p>
							<p class="findArea">
								<span><a href="#none" title="아이디찾기">아이디찾기&nbsp;&nbsp;|&nbsp;</a></span>
								<span><a href="#none" title="비밀번호찾기">비밀번호찾기&nbsp;&nbsp;|&nbsp;</a></span>
								<span class="register"><a href="#none" title="회원가입">회원가입</a></span>
							</p>
						</div>
					</fieldset>
				</form>
				<ul class="snsLogin">
					<li><a href="#none" title="네이버 로그인"><img src="/img/login/sns01.png" alt="이미지00"/>&nbsp;&nbsp;&nbsp;&nbsp;네이버 로그인</a></li>
					<li><a href="#none" title="카카오 로그인"><img src="/img/login/sns02.png" alt="이미지00"/>&nbsp;&nbsp;&nbsp;&nbsp;카카오 로그인</a></li>
					<li><a href="#none" title="구글 로그인"><img src="/img/login/sns03.jpg" alt="이미지00"/>&nbsp;&nbsp;&nbsp;&nbsp;구글 로그인</a></li>
				</ul>
			</div>
		</div>
		<div id="footerWrap">
		<div id="footer">
			<h2>Allwork정보 및 이용약관</h2>
			<p class="footLogo">Allwork</p>
			<div id="copyArea">
				<ul class="menuArea">
					<li><a href="#" title="회사소개">회사소개</a></li>
					<li><a href="#" title="고객센터">고객센터</a></li>
					<li><a href="#" title="개인정보처리방침">개인정보처리방침</a></li>
					<li><a href="#" title="사이트맵">사이트맵</a></li>
				</ul>
				<ul class="linkArea">
					<li><a href="#" title="인스타페이지"><i class="fab fa-instagram"></i></a></li>
					<li><a href="#" title="유투브페이지"><i class="fab fa-youtube"></i></a></li>
					<li><a href="#" title="페이스북페이지"><i class="fab fa-facebook"></i></a></li>
				</ul>
				<div class="address">
					<span>상호 : (주)올워크 | 직업정보제공사업등록번호 : 서울청 제2019-2호 | 대표이사 : 김봉갑 | 평일 : am 09:00 ~ pm 06:00 | 토요일, 일요일, 공휴일 휴무</span><br/>
					<span>E-mail : mail@allwork.co.kr Tel. 02-585-0108 | 주소 : 06640 서울특별시 서초구 서초중앙로 52 (서초동, 영진빌딩) 3층</span><br/>
					<span>Copyright ⓒ allwork.co.kr all rights reserved.</span>
				</div>
			</div>
		</div>
		</div>
	</div>
</body>
	
	
<script type="text/javascript">

	window.onkeydown = function() {
		var kcode = event.keyCode;
		if(kcode == 13){
			goLogin();
		}
	}
	
	
	$(document).ready(function(){
		
		if("${map.type}" == "company"){
			$("input:radio[id='company_login']").prop("checked", true);  
			$("input:radio[id='persnal_login']").prop("checked", false);
			$(".snsLogin").css("display", "none");
		}else{
			$("input:radio[id='company_login']").prop("checked", false);  
			$("input:radio[id='persnal_login']").prop("checked", true); 
			$(".snsLogin").css("display", "block");
		}
		
		$("input:radio[id='company_login']").click(function(){
			$("input:radio[id='persnal_login']").prop("checked", false);
			$(".snsLogin").css("display", "none");
		});
		
		$("input:radio[id='persnal_login']").click(function(){
			$("input:radio[id='company_login']").prop("checked", false);
			$(".snsLogin").css("display", "block");
		});
		
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("allworkId");
	    $("#loginId").val(key); 
	     
	    if($("#loginId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("allworkId", $("#loginId").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("allworkId");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#loginId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("allworkId", $("#loginId").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });
	    
	    $("persnal_login").click(function(){
	    	
	    });
	});
	
	
	function goLogin(){
		
		if(checkNull($("#loginId").val())){
			alertAndFocus("로그인 ID를 입력하세요.", $("#loginId"));
			return;
		}
		
		if(checkNull($("#loginPw").val())){
			alertAndFocus("비밀번호를 입력하세요.", $("#loginPw"));
			return;
		}
		
		var callback = function(data){
			if(data.rstCnt > 0){
				if($("#requestUri").val() != null && $("#requestUri").val() != ""){
					location.href = $("#requestUri").val();
				}else{
					
					if(data.memberInfoMap.type == 1){
						location.href="/personalHome.do";	
					}else{
						location.href="/companyHome.do";
					}
				}
				
			}else{
				alert("ID, 비밀번호를 확인하세요.");
			}
		};
		var param = {
				loginId : $("#loginId").val()
						, loginPw : $("#loginPw").val()
					};
		ajax('post', '/loginProcess.ajax', param, callback);
	}
	
</script>


</html>
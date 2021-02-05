<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="ko">
<head>
	<title>로그인</title>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
	
	<!-- 소셜 로그인 -->
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="${googleClientId}">
	
	<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"/>
	<link rel="stylesheet" type="text/css" href="/css/common.css"/>
	<link rel="stylesheet" type="text/css" href="/css/header_mini.css"/>
	<link rel="stylesheet" type="text/css" href="/css/login_01.css"/>
	<link rel="stylesheet" type="text/css" href="/css/footer_white.css"/>
	<link rel="stylesheet" type="text/css" href="/css/font.css"/>
	<link rel="stylesheet" type="text/css" href="/css/reset.css"/>
	<link  rel="stylesheet" type="text/css" href="/css/all.css"/>
	
	<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/js/moment.min.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/process.js?v=<%=System.currentTimeMillis() %>"></script>
	<script type="text/javascript" src="/js/Cookie.js"></script>
	
	<!-- 소셜 로그인 -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script> 
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
				<li><a href="/introAbout.do" title="회사소개">회사소개&nbsp;|&nbsp;</a></li>
				<li><a href="/sitemap.do" title="사이트맵">사이트맵&nbsp;|&nbsp;</a></li>
				<li><a href="/noticeList.do" title="고객센터">고객센터&nbsp;|&nbsp;</a></li>
				<li><a href="/personJoin.do" title="회원가입">회원가입</a></li>
			</ul>
		</div>
		<div id="loginWrap">
			<div id="loginArea">
				<div class="logintext">
					<a href="/index.do">
						<h1>Allwork</h1>
						시니어를 위한 재취업 포털
					</a>
				</div>
				<form action="javascript:goLogin();" method="post">
					<fieldset>
						<legend>로그인</legend>
						<div class="tab">
							<span class="btn_persnal"><input id="persnal_login" type="radio" name="loginType" checked="checked" value="1"/>&nbsp;개인회원</span>
							<span class="btn_company"><input id="company_login" type="radio" name="loginType" value="2"/>&nbsp;기업회원</span>
						</div>
						<div class="loginBox">
							<p><input id="loginId" type="text" name="loginId" title="아이디" placeholder="아이디" /></p>
							<p><input id="loginPw" type="password" name="loginPw" title="비밀번호" placeholder="비밀번호" /></p>
							<p class="button"><input type="submit" value="로그인" title="로그인"/></p>
							<p class="checkbox"><input id="idSaveCheck" type="checkbox" name="idSaveCheck"/><label for="loginOn"><span>아이디 저장</span></label></p>
							<p class="findArea">
								<span><a href="javascript:findId();" title="아이디찾기">아이디찾기&nbsp;&nbsp;|&nbsp;</a></span>
								<span><a href="javascript:findPw();" title="비밀번호찾기">비밀번호찾기&nbsp;&nbsp;|&nbsp;</a></span>
								<span class="register"><a href="javascript:memberJoin();" title="회원가입">회원가입</a></span>
							</p>
						</div>
					</fieldset>
				</form>
				<!-- 소셜 Login -->
				<!-- 
				<div class="logintextsub">
					<h4>[주의] 개인 PC가 아니면 , 절대로 소셜 Login을 사용하지 마세요. 개인정보 유출위험이 있습니다.</h4>
				</div>
				 -->
				<ul class="snsLogin">
					<!-- 
					<li id="naverIdLogin">
						<a id="naverIdLogin_loginButton" href="#"> <img src="img/login/sns01.png"></a>
					</li>
					<li>
						<a id="kakao-login-btn" class="btn kakao font-mgb"><img id="kakao-login-btn" src="img/login/sns02.png"></a>
					</li>
					 -->
					<!-- 
					<li class="g-signin2" data-onsuccess="onSignIn" data-theme="dark">
						<a><img src="img/login/sns03.png"></a>
					</li>
					 -->
				</ul>
			</div>
		</div>
		
		<jsp:include page="/footer.do" />
	</div>
	
	
	<form name="snsInfoForm" id="snsInfoForm" action = ""/>
		<input type="hidden" name="name" id="name" value="" />
		<input type="hidden" name="ciKey" id="ciKey" value="" />
		<input type="hidden" name="email" id="email" value="" />
		<input type="hidden" name="snsLoginType" id="snsLoginType" value="" />
		<input type="hidden" name="snsLoginEnt" id="snsLoginEnt" value="login" />
	</form>
	
</body>
	
<script type="text/javascript">
      (function() {
       var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
       po.src = 'https://apis.google.com/js/client.js?onload=onLoadCallback';
       var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
     })();
</script>

<script type="text/javascript">


	window.onkeydown = function() {
		var kcode = event.keyCode;
		if(kcode == 13){
			goLogin();
		}
	}
	
	//(1) 소셜 Login - Naver.
	//alert('URL=${contextPath}');
	var requetUrl = "${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${contextPath}/naverLogin.do";
	var naverLogin = new naver.LoginWithNaverId(
		{
			//clientId: "Dwg08lyiUIJtmpURlfNJ",
			//callbackUrl: "http://localhost:8080/naverLogin.do",
			clientId: "${naverClientId}",
			callbackUrl: requetUrl,
			isPopup: true, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 2, height: 50} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
	
	//(2) 소셜 Login - Kakao
	// kakao 로그인 설정
	Kakao.init('${kakaoClientId}');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
		container: '#kakao-login-btn',
		size: "small",		// "small", "medium", "large"
		success: function(authObj) {
			///*
        	// 로그인 성공시, API를 호출합니다.
        	Kakao.API.request({
          		url: '/v2/user/me',
          		success: function(res) {
	          		var kakaoInfo = JSON.stringify(res);
	          		console.log(kakaoInfo);
	            	console.log("id =====> "+res.id);
	            	console.log("properties.nickname =====> "+res.properties.nickname);
	            	console.log("kakao_account.email =====> "+res.kakao_account.email);
	            	
	            	goKakaoLogin(res.kakao_account.email, res.properties.nickname, res.id);
	            	
	          	},
	          	fail: function(error) {
	          		console.log(JSON.stringify(error));
	          	}
	        });
			//*/
			/*
			Kakao.Auth.logout();
			Kakao.Auth.cleanup();
		    Kakao.Auth.login({
		    	persistAccessToken: true,
		    	  success: function(response) {
		    	    console.log(response);
		    	  },
		    	  fail: function(error) {
		    	    console.log(error);
		    	  },
		    	});
		    */
		},
		fail: function(err) {
	        alert(JSON.stringify(err));
	    }
	});
	
    
    
	$(document).ready(function(){
		
		if("${map.type}" == "company"){
			$("input:radio[id='company_login']").prop("checked", true);  
			$("input:radio[id='persnal_login']").prop("checked", false);
			$(".logintextsub").css("display", "none");
			$(".snsLogin").css("display", "none");
		}else{
			$("input:radio[id='company_login']").prop("checked", false);  
			$("input:radio[id='persnal_login']").prop("checked", true); 
			$(".logintextsub").css("display", "block");
			$(".snsLogin").css("display", "block");
		}
		
		$("input:radio[id='company_login']").click(function(){
			$("input:radio[id='persnal_login']").prop("checked", false);
			$(".logintextsub").css("display", "none");
			$(".snsLogin").css("display", "none");
		});
		
		$("input:radio[id='persnal_login']").click(function(){
			$("input:radio[id='company_login']").prop("checked", false);
			$(".logintextsub").css("display", "block");
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
	});
	
	
	//소셜 Login - Kakao
	function goKakaoLogin(email, name, id){
		var callback = function(data){
			if(data.rstCnt > 0){
				location.href = "/index.do";
			}else{
				if (!confirm('회원가입이 되어있지 않습니다. 먼저 회원가입을 해 주세요.\n회원가입이 된 경우에는 로그인 후에, 마이페이지에서 소셜계정을 설정하세요.\n회원가입 화면으로 이동할까요?')) return;
				$("#ciKey").val(id);
				$("#email").val(email);
				$("#name").val(name);
				$("#snsLoginType").val("kakao");
				$("#snsInfoForm").attr("action", "/personJoin.do");
				$("#snsInfoForm").submit();
			}
		};
		var param = {
						id : id
						, type : "1"
						, snsLoginType : "kakao"
					};
		ajax('post', '/snsLoginProcess.ajax', param, callback);
	}
	
	
	
	//소셜 Login - Google
	// google 로그인 처리
	function onSignIn(googleUser) {
       
		// Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
        
        
        var callback = function(data){
			//alert(data.rstCnt);
			if(data.rstCnt > 0){
				//alert('OK');
				//window.opener.location.href = "/index.do";
				location.href = "/index.do";
			}else{
				if (!confirm('회원가입이 되어있지 않습니다. 먼저 회원가입을 해 주세요.\n회원가입이 된 경우에는 로그인 후에, 마이페이지에서 소셜계정을 설정하세요.\n회원가입 화면으로 이동할까요?')) return;
				$("#ciKey").val(profile.getId());
				$("#email").val(profile.getEmail());
				$("#snsLoginType").val("google");
				$("#snsInfoForm").attr("action", "/personJoin.do");
				$("#snsInfoForm").submit();
			}
			window.close();
		};
		var param = {
						id : profile.getId()
						, type : "1"
						, snsLoginType : "google"
					};
		ajax('post', '/snsLoginProcess.ajax', param, callback);
    };
	
	
	function goLogin(){
		
		if(checkNull($("#loginId").val())){
			alertAndFocus("로그인 ID를 입력하세요.", $("#loginId"));
			return;
		}
		
		if(checkNull($("#loginPw").val())){
			alertAndFocus("비밀번호를 입력하세요.", $("#loginPw"));
			return;
		}
		
		loadingOn();
		
		var type = $("input[name=loginType]:checked").val();
		
		var callback = function(data){
			if(data.rstCnt > 0){
				if($("#requestUri").val() != null && $("#requestUri").val() != ""){
					location.href = $("#requestUri").val();
				}else{
					//Login 사용자의 홈페이지로 이동.
					if(data.memberInfoMap.type == 1){
						//location.href="/personHome.do";		//개인회원 홈페이지.
						location.href="/index.do";				//사이트 홈페이지.
					}else{
						location.href="/companyHome.do";		//기업회원 홈페이지.
					}
				}
				
			}else{
				alert("ID, 비밀번호를 확인하세요.");
				loadingOff();
			}
		};
		var param = {
						loginId : $("#loginId").val()
						, loginPw : $("#loginPw").val()
						, type : type
					};
		ajax('post', '/loginProcess.ajax', param, callback);
	}
	
	function findId(){
		location.href = "/findId.do";
	}
	
	function findPw(){
		location.href = "/findPw.do";
	}

	function memberJoin(){
		 if($("input:radio[id='company_login']").is(':checked')){
			 location.href = "/companyJoin.do";
		 }else{
			 location.href = "/personJoin.do";
		 }
	}
</script>


</html>


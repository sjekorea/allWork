<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	
	<!-- 소셜 로그인 -->
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="296410191449-eh2l0asvq7kuf738k9v50jh039ik0tj3.apps.googleusercontent.com">

	<!-- 소셜 로그인 -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script> 

<c:choose>
	<c:when test="${SE_LOGIN_STATUS}">
		<c:if test="${SE_USER_TYPE == 'company' }">
			<jsp:include page="/companyHeader.do"/>
		</c:if>

		<c:if test="${SE_USER_TYPE == 'person' }">
			<jsp:include page="/personHeader.do" />
		</c:if>
	</c:when>
	<c:otherwise>
			<jsp:include page="/indexHeader.do" />
	</c:otherwise>
</c:choose>

	<!-- 
	<link rel="stylesheet" type="text/css" href="/css/login_01.css"/>
	 -->
	<link rel="stylesheet" type="text/css" href="/css/myPage.css"/>


<style type="text/css">
	/*현재메뉴 언더라인*/
	<c:if test="${SE_USER_TYPE == 'person' }">
		#menuTree ul .subMenu07_03{text-decoration: underline;}
	</c:if>
	<c:if test="${SE_USER_TYPE == 'company' }">
	</c:if>
</style>


	<div id="allworkWrap">
		<div id="containerWrap">
			<div id="container">
				<div id="leftPart">
					<c:choose>
						<c:when test="${SE_LOGIN_STATUS}">
							<c:if test="${SE_USER_TYPE == 'company' }">
								<jsp:include page="/companySubMenu.do"/>
							</c:if>
					
							<c:if test="${SE_USER_TYPE == 'person' }">
								<jsp:include page="/personSubMenu.do" />
							</c:if>
						</c:when>
					</c:choose>
				</div>
				<div id="rightPart">
					<h4>소셜계정 연결<span>연결하려는 소셜 계정을 입력하세요.</span></h4>
					<h4>[주의] <span>개인 PC가 아니면 , 절대로 소셜 Login을 사용하지 마세요. 개인정보 유출위험이 있습니다.</span></h4>
					<div style="margin-bottom: 20px"></div>
					<!-- 소셜 Login -->
					<ul class="snsLogin">
						<li id="naverIdLogin">
							<a id="naverIdLogin_loginButton" href="#"> <img src="img/login/sns01.png"></a>
						</li>
						<li>
							<a id="kakao-login-btn" class="btn kakao font-mgb"><img id="kakao-login-btn" src="img/login/sns02.png"></a>
						</li>
						<!-- 
						<li class="g-signin2" data-onsuccess="onSignIn" data-theme="dark">
							<a><img src="img/login/sns03.png"></a>
						</li>
						 -->
					</ul>
					<div class="agree_ok">
						<ul>
							<!-- 
							<li><a href="#none" title="취소">취소</a></li>
							 -->
							<li><a href="javascript:unlinkSocial();" title="소셜계정 연결끊기">소셜계정 연결끊기</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>	
	</div>
<jsp:include page="/footer.do" />

	
	<form name="snsInfoForm" id="snsInfoForm" action = ""/>
		<input type="hidden" name="name" id="name" value="" />
		<input type="hidden" name="ciKey" id="ciKey" value="" />
		<input type="hidden" name="email" id="email" value="" />
		<input type="hidden" name="snsLoginType" id="snsLoginType" value="" />
		<input type="hidden" name="snsLoginEnt" id="snsLoginEnt" value="login" />
	</form>

<script type="text/javascript">
	//(1) 소셜 Login - Naver.
	//alert('URL=${contextPath}');
	var requetUrl = "${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${contextPath}/naverUpdate.do";
	var naverUpdate = new naver.LoginWithNaverId(
		{
			//clientId: "Dwg08lyiUIJtmpURlfNJ",
			//callbackUrl: "http://localhost:8080/naverUpdate.do",
			clientId: "${naverClientId}",
			callbackUrl: requetUrl,
			isPopup: true, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 2, height: 50} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverUpdate.init();
	
	
	//(2) 소셜 Login - Kakao
	// kakao 로그인 설정
	Kakao.init('${kakaoClientId}');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
		container: '#kakao-login-btn',
		size: "small",		// "small", "medium", "large"
		success: function(authObj) {
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
		},
		fail: function(err) {
	        alert(JSON.stringify(err));
	    }
	});
	
	
	//소셜 Login - Kakao
	function goKakaoLogin(email, name, id){
		var callback = function(data){
			if(data.rstCnt > 0){
				alert("소셜계정에 연결했습니다.\n이제부터 소셜 로그인 기능을 사용할 수 있습니다.");
			}else{
				alert("오류가 발생해서 소셜계정에 연결하지 못했습니다.");
			}
		};
		var param = {
						id : id
						, type : "1"
						, snsLoginType : "kakao"
						, uid : "${SE_LOGIN_ID}"
					};
		ajax('post', '/snsUpdateProcess.ajax', param, callback);
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
			if(data.rstCnt > 0){
				alert("소셜계정에 연결했습니다.\n이제부터 소셜 로그인 기능을 사용할 수 있습니다.");
			}else{
				alert("오류가 발생해서 소셜계정에 연결하지 못했습니다.");
			}
		};
		var param = {
						id : profile.getId()
						, type : "1"
						, snsLoginType : "google"
						, uid : "${SE_LOGIN_ID}"
					};
		ajax('post', '/snsUpdateProcess.ajax', param, callback);
    };

    
	$(document).ready(function(){
	    
	});
	
	//소셜계정 연결끊기.
	function unlinkSocial() {
		var callback = function(data){
			if(data.rstCnt > 0){
				alert("소셜계정에 연결을 해제했습니다.\n이제부터 소셜 로그인 기능을 사용할 수 없습니다.");
			}else{
				alert("오류가 발생해서 소셜계정 연결을 끊지 못했습니다.");
			}
		};
		var param = {
						id : ""
						, type : "1"
						, snsLoginType : ""
						, uid : "${SE_LOGIN_ID}"
					};
		ajax('post', '/snsUpdateProcess.ajax', param, callback);
	}
	
</script>

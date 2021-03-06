<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="kr">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NaverLoginSDK</title>
</head>

<body>

	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/js/process.js?v=<%=System.currentTimeMillis() %>"></script>


	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		var requetUrl = "${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${contextPath}/naverLogin.do";
		var naverLogin = new naver.LoginWithNaverId(
			{
				//clientId: "Dwg08lyiUIJtmpURlfNJ",
				//callbackUrl: "http://localhost:8080/naverLogin.do",
				clientId: "${naverClientId}",
				callbackUrl: requetUrl,
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var email = naverLogin.user.getEmail();
					var age = naverLogin.user.getAge();
					var id = naverLogin.user.getId();
					var name = naverLogin.user.getName();
					
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}
					
					if( name == undefined || name == null) {
						alert("성명은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}
					
					if( age == undefined || age == null) {
						alert("연령대는 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}
					
					var callback = function(data){
						if(data.rstCnt > 0){
							window.opener.location.href = "/index.do";
							
						}else{
							if (!confirm('회원가입이 되어있지 않습니다. 먼저 회원가입을 해 주세요.\n회원가입이 된 경우에는 로그인 후에, 마이페이지에서 소셜계정을 설정하세요.\n회원가입 화면으로 이동할까요?')) return;
						
							if($(opener.document).find("#snsLoginEnt").val() == "login"){
								$(opener.document).find("#ciKey").val(id);
								$(opener.document).find("#name").val(name);
								$(opener.document).find("#email").val(email);
								$(opener.document).find("#snsLoginType").val("naver");
								$(opener.document).find("#snsInfoForm").attr("action", "/personJoin.do");
								$(opener.document).find("#snsInfoForm").submit();
							
							}else if($(opener.document).find("#snsLoginEnt").val() == "join"){
								$(opener.document).find("#ciKey").val(id);
								$(opener.document).find("#name").val(name);
								$(opener.document).find("#email").val(email);
								$(opener.document).find("#name").readonly(true);
								$(opener.document).find("#name").css("background-color", "#A2A2A2");
								$(opener.document).find("#snsLoginType").val("naver");
							
							}else{
								
							}
						}
						window.close();
					};
					var param = {
									id : id
									, type : "1"
									, snsLoginType : "naver"
								};
					ajax('post', '/snsLoginProcess.ajax', param, callback);
					
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
</body>

</html>
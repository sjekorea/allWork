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
		var requetUrl = "${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${contextPath}/naverUpdate.do";
		var naverUpdate = new naver.LoginWithNaverId(
			{
				//clientId: "Dwg08lyiUIJtmpURlfNJ",
				//callbackUrl: "http://localhost:8080/naverUpdate.do",
				clientId: "${naverClientId}",
				callbackUrl: requetUrl,
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverUpdate.init();

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverUpdate.getLoginStatus(function (status) {
				
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var email = naverUpdate.user.getEmail();
					var age = naverUpdate.user.getAge();
					var id = naverUpdate.user.getId();
					var name = naverUpdate.user.getName();
					
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverUpdate.reprompt();
						return;
					}
					
					if( name == undefined || name == null) {
						alert("성명은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverUpdate.reprompt();
						return;
					}
					
					if( age == undefined || age == null) {
						alert("연령대는 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverUpdate.reprompt();
						return;
					}
					
					var callback = function(data){
						alert("소셜계정에 연결했습니다.\n이제부터 소셜 로그인 기능을 사용할 수 있습니다.");

						if(data.rstCnt > 0){
							alert("소셜계정에 연결했습니다.\n이제부터 소셜 로그인 기능을 사용할 수 있습니다.");
						}else{
							alert("오류가 발생해서 소셜계정에 연결하지 못했습니다.");
						}
						window.close();
					};
					var param = {
									id : id
									, type : "1"
									, snsLoginType : "naver"
									, uid : "${SE_LOGIN_ID}"
						};
					ajax('post', '/snsUpdateProcess.ajax', param, callback);
					
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
</body>

</html>
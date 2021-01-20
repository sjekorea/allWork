<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

	<!-- 소셜 로그인 -->
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="296410191449-eh2l0asvq7kuf738k9v50jh039ik0tj3.apps.googleusercontent.com">

	<!-- 소셜 로그인 -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script> 

<!-- (begin) 2020.12.30 by s.yoo	-->
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

<link rel="stylesheet" type="text/css" href="/css/widthdrawal.css"/>


<style type="text/css">
	/*현재메뉴 언더라인*/
	<c:if test="${SE_USER_TYPE == 'person' }">
		#menuTree ul .subMenu07_02{text-decoration: underline;}
	</c:if>
	<c:if test="${SE_USER_TYPE == 'company' }">
		#menuTree ul .subMenu05_02{text-decoration: underline;}
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
					<h4>회원탈퇴</h4>
					<p>
						그동안 저희 40세 이상 무료구인구직 사이트 - 올워크 이용해주셔서 감사합니다.<br/>
						고객님께서 회원탈퇴를 하신다니 무척 안타깝습니다!<br/>
						보다 나은 서비스를 위해 그동안 불편하셨던 점이나 불만사항을 알려주시면 적극 반영하여 향후 개선하도록 하겠습니다.
					</p>
					<form action="javascript:goUnregister();" method="post">
						<fieldset>
						<legend>회원탈퇴</legend>
						<div class="registerBox">
							<table>
								<caption>회원탈퇴</caption>
								<tbody>
									<tr>
										<th>이름</th>
										<td>${SE_USER_NM }</td>
									</tr>
									<tr>
										<th>아이디</th>
										<td>${SE_LOGIN_ID }	</td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td>
											<input id="passwd" type="password" name="passwd" title="비밀번호"/>
										</td>
									</tr>
									<tr>
										<th>비밀번호 확인</th>
										<td>
											<input id="passwd_re" type="password" name="passwd_re" title="비밀번호확"/>
											<span class="comment">비밀번호 재입력</span>
										</td>
									</tr>
									<tr class="message">
										<th>남기고 싶은 말</th>
										<td>
											<textarea id="secession" name="secession:"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						</fieldset>
					</form>
					<div class="agree_ok">
						<ul>
							<!-- 
							<li><a href="#none" title="취소">취소</a></li>
							 -->
							<li><a href="javascript:goUnregister();" title="탈퇴하기">탈퇴하기</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/footer.do" />


<script type="text/javascript">
	
	function goUnregister(){
		
		if(checkNull($("#passwd").val())){
			alertAndFocus("비밀번호를 입력하세요.", $("#passwd"));
			return;
		}
		if($("#passwd").val() != $("#passwd_re").val()){
			alertAndFocus("비밀번호가 일치하지 않습니다.", $("#passwd_re"));
			return;
		}
		
		if(checkNull($("#secession").val())){
			alertAndFocus("남기는 메시지를 입력하세요.", $("#secession"));
			return;
		}

		var callback = function(data){
			if(data.rstCnt > 0){
				alert("회원 탈퇴를 수행했습니다.\n그동안 이용해 주셔서 감사합니다.");
				location.href = "/logout.do";
				//procLogout();
				//return;
			}else{
				alert("회원정보를 찾을 수 없습니다. 비밀번호를 확인해 주세요.");
				loadingOff();
			}
		};
		var param = {
						uid : '${SE_LOGIN_ID }'
						, passwd : $("#passwd").val()
						, secession : $("#secession").val()
					};
		ajax('post', '/memberUnregisterProcess.ajax', param, callback);
	}
	
	function procLogout() {
		//Naver, Kakao, Google에 대한 logout 처리.
		Kakao.init('${kakaoClientId}');
		if (!Kakao.Auth.getAccessToken()) {
			console.log('Not logged in.');
			return;
		}
		Kakao.API.request({
			url: '/v1/user/unlink',
			success: function(response) {
		    	console.log(response);
				//Logout 처리.
				location.href = "/logout.do";
			},
			fail: function(error) {
		    	console.log(error);
				//Logout 처리.
				location.href = "/logout.do";
			},
		});
	}

</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-190487852-1"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'UA-190487852-1');
	</script>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<title>allwork</title>
	<link rel="stylesheet" type="text/css" href="/css/header_main.css"/>
	<link rel="stylesheet" type="text/css" href="/css/popup.css"/>
	<link rel="stylesheet" type="text/css" href="/css/index.css"/>
	<link rel="stylesheet" type="text/css" href="/css/common.css"/>
	<link rel="stylesheet" type="text/css" href="/css/footer.css"/>
	<link rel="stylesheet" type="text/css" href="/css/font.css"/>
	<link rel="stylesheet" type="text/css" href="/css/reset.css"/>
	<link rel="stylesheet" type="text/css" href="/css/all.css"/>
	<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/js/jquery-1.12.4.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/index00.js"></script>
	<script type="text/javascript" src="/js/moment.min.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/process.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		
		loadingOff();

		//alert("${SE_SERVICE1}"+" || "+"${SE_SERVICE1_END}" + " || " + "${SE_SERVICE2}"+" || "+"${SE_SERVICE2_END}"+" || "+"${SE_VIEW_COUNT}");
		
		function procSemanticSearch() {
		   	//(begin) 2020.12.30 by s.yoo
		   	if (!$("#searchText").val()) {
		   		alert('검색할 키워드를 입력하세요.');
		   		return false;
		   	}
			//alert("${SE_USER_TYPE}");
			if("${SE_USER_TYPE}" == "company") {
				//기업회원은 인재검색.
				$("#aiSearchForm").attr("action", "/indexResumeSearchList.do");
			}else{
				//개인회원 또는 Login을 하지 않았다면, 채용정보 검색.
				$("#aiSearchForm").attr("action", "/indexRecruitSearchList.do");
			}
			
			loadingOn();
			$("#aiSearchForm").submit();
		   	//(end) 2020.12.30 by s.yoo
		};

		$("#searchText").keydown( function() {
			var kcode = event.keyCode;
			if(kcode == 13) {
				procSemanticSearch();
			}
		});

		$("#search_btn00").click(function(e) {
			procSemanticSearch();
		});
	});
	
	function openPop(code){
		var openPop = window.open("","_blank","top=200,left=0,width=400,height=445,resizable=1,scrollbars=yes");
		$("#code").val(code);
		$("#openPopForm").action = "/mainWinPop.do" ;
		$("#openPopForm").target = openPop ;
		$("#openPopForm").submit() ;
	}
	
	function openWindow(code){
		var popupList = "${popupList}"[0];
		console.log(JSON.stringify($(popupList)[0]));
		alert("popupList.length : "+popupList.length);
		for(var i = 0 ; i < popupList[0].length ; i++){
			$("#code").val(popupList[0][i][code]);
			alert($("#code").val()); 
		}
	}
	 function openWindow(code){
		// alert(code);
		//window.open("/mainWinPop.do","_blank","top=200,left=0,width=400,height=445,resizable=1,scrollbars=yes");
	}
	 

	
	 <c:forEach var="result" items="${popupList}" varStatus="status">
	 	//오늘 하루 보지않기 처리.
	 	var popupCookie = getCookie("netfu_popup_" + "${result.code}");
	 	//alert(popupCookie);
	 	if (popupCookie == null || popupCookie.length < 1) {
	 		var nWidth = parseInt("${result.width}") + 14;
	 		var nHeight = parseInt("${result.height}") + 112;
	 		var nLeft = parseInt("${result.left}");
	 		var nTop = parseInt("${result.top}");
	 		
	 		//브라우저 특성 적용.
			var agt = navigator.userAgent.toLowerCase();
			//alert(agt)
			if (agt.indexOf("msie") != -1 || agt.indexOf("edg") != -1) {
				//alert("Edge");
				nWidth -= 63;
				nHeight -= 35;
			}
			else if (agt.indexOf("chrome") != -1) {
				//alert( 'Chrome');
			}


			//window.open("/mainWinPop.do?code=${result.code}","_blank","top=200,left=0,width=400,height=445,resizable=1,scrollbars=yes");	 		
			window.open("/mainWinPop.do?code=${result.code}","_blank",
							"top=" + nTop + ",left=" + nLeft
							+ ",width=" + nWidth + ",height=" + nHeight + ",resizable=1,scrollbars=yes");	 		
	 	}
	 </c:forEach>
	 
</script>

</head>

<body>

	<div id="progress_barWrap" style="display:none;">
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
				<c:if test="${SE_USER_TYPE == 'person' }">
					<li><a href="https://allwork.officecall.cloud/" target="_blank" title="화상면접"><i class="fas fa-desktop"></i>&nbsp;화상면접&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				</c:if>
	
				<c:if test="${SE_USER_TYPE == 'company' }">
					<li><a href="https://allwork.officecall.cloud/?user_check=admin" target="_blank" title="화상면접"><i class="fas fa-desktop"></i>&nbsp;화상면접&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				</c:if>
			</c:when>
			<c:otherwise>
					<li><a href="javascript:alert('로그인 이후에 사용할 수 있습니다.');" title="화상면접"><i class="fas fa-desktop"></i>&nbsp;화상면접&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			</c:otherwise>
		</c:choose>
					<c:if test='${SE_SERVICE1 eq "Y" or (SE_SERVICE2 eq "Y" and SE_VIEW_COUNT > 0)}'>
						<li style="font-weight:bold;color:red;">&nbsp;유료서비스 사용중&nbsp;&nbsp;&nbsp;&nbsp;</li>
					</c:if> 
					<c:choose>
						<c:when test="${SE_LOGIN_STATUS}">
							<li><a href="/logout.do" title="로그아웃">로그아웃&nbsp;|&nbsp;</a></li>
							<li><a href="/updateMyInfo.do" title="마이페이지">마이페이지</a></li>
						</c:when>
						<c:otherwise>
							<li class="allworkHome"><a href="/index.do" title="allwork사이트">Allwork&nbsp;&nbsp;|&nbsp;</a></li>
							<li><a href="/introAbout.do" title="회사소개">회사소개&nbsp;|&nbsp;</a></li>
							<li><a href="/sitemap.do" title="사이트맵">사이트맵&nbsp;|&nbsp;</a></li>
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
<c:choose>
	<c:when test="${SE_LOGIN_STATUS}">
		<c:if test="${SE_USER_TYPE == 'person' }">
						<li><a href="/recruitSearch.do" title="채용정보">채용정보</a></li>
		</c:if>

		<c:if test="${SE_USER_TYPE == 'company' }">
						<li><a href="/resumeSearch.do" title="인재검색">인재검색</a></li>
		</c:if>
	</c:when>
	<c:otherwise>
						<li><a href="/recruitSearch.do" title="채용정보">채용정보</a></li>
						<li><a href="/resumeSearch.do" title="인재검색">인재검색</a></li>
	</c:otherwise>
</c:choose>
						<li><a href="/headhuntList.do" title="헤드헌팅">헤드헌팅</a></li>
						<li><a href="/progressList.do" title="채용진행현황">채용진행현황</a></li>
						<li><a href="/noticeList.do" title="고객센터">고객센터</a></li>
					</ul>
					<ul class="linkArea">
						<c:choose>
							<c:when test="${SE_LOGIN_STATUS}">
								<c:choose>
									<c:when test="${SE_USER_TYPE eq 'person'}">
										<li class="a01"><a href="/personHome.do" title="개인회원 홈">개인회원 홈</a></li>
									</c:when>
									<c:otherwise>
										<li class="a02"><a href="/companyHome.do" title="기업회원 홈">기업회원 홈</a></li>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<li class="a01"><a href="/login.do?type=person" title="개인회원 로그인">개인회원 로그인</a></li>
								<li class="a02"><a href="/login.do?type=company" title="기업회원 로그인">기업회원 로그인</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
		<div id="allMenuWrap">
			<div id="allMenu">
				<p class="close"><a href="#" title="메뉴창 닫기"><i class="fas fa-times"></i></a></p>
				<div class="sitemapArea">
<c:choose>
	<c:when test="${SE_LOGIN_STATUS}">
		<c:if test="${SE_USER_TYPE == 'person' }">
						<div class="sitemap">
							<h4>채용정보</h4>
							<ul>
								<li class="sitemap_depth01"><a href="/recruitSearch.do" title="채용정보">채용정보</a>
								<ul class="sub">
									<li class="sitemap_depth02"><a href="/recruitSearch.do" title="상세검색">상세검색</a></li>
									<li class="sitemap_depth02"><a href="/recruitSearchByDuty.do" title="직무별">직무별</a></li>
									<li class="sitemap_depth02"><a href="/recruitSearchByIndustry.do" title="산업별">산업별</a></li>
									<li class="sitemap_depth02"><a href="/recruitSearchByArea.do" title="지역별">지역별</a></li>
								</ul>
								<li class="sitemap_depth01"><a href="/recruitSearchForFree.do" title="프리랜서">프리랜서</a></li>
								<li class="sitemap_depth01"><a href="/recruitSearchForAlba.do" title="알바채용">알바채용</a></li>
								<li class="sitemap_depth01"><a href="/recruitOther.do" title="일반채용정보">일반채용정보</a></li>
							</ul>
						</div>
		</c:if>

		<c:if test="${SE_USER_TYPE == 'company' }">
						<div class="sitemap">
							<h4>인재검색</h4>
							<ul>
								<li class="sitemap_depth01"><a href="/resumeSearch.do" title="인재검색">인재검색</a>
								<ul class="sub">
									<li class="sitemap_depth02"><a href="/resumeSearch.do" title="상세검색">상세검색</a></li>
									<li class="sitemap_depth02"><a href="/resumeSearchByDuty.do" title="직무별">직무별</a></li>
									<li class="sitemap_depth02"><a href="/resumeSearchByIndustry.do" title="산업별">산업별</a></li>
									<li class="sitemap_depth02"><a href="/resumeSearchByArea.do" title="지역별">지역별</a></li>
								</ul>
								<li class="sitemap_depth01"><a href="/resumeSearchForFree.do" title="프리랜서">프리랜서</a></li>
								<li class="sitemap_depth01"><a href="/resumeSearchForAlba.do" title="알바">알바</a></li>
								<li class="sitemap_depth01"><a href="/resumeScrapList.do" title="스크랩인재">스크랩인재</a></li>
								<li class="sitemap_depth01"><a href="/resumeRecommendList.do" title="우수추천인재">우수추천인재</a></li>
							</ul>
						</div>
		</c:if>
	</c:when>
	<c:otherwise>
						<div class="sitemap">
							<h4>채용정보</h4>
							<ul>
								<li class="sitemap_depth01"><a href="/recruitSearch.do" title="채용정보">채용정보</a>
								<ul class="sub">
									<li class="sitemap_depth02"><a href="/recruitSearch.do" title="상세검색">상세검색</a></li>
									<li class="sitemap_depth02"><a href="/recruitSearchByDuty.do" title="직무별">직무별</a></li>
									<li class="sitemap_depth02"><a href="/recruitSearchByIndustry.do" title="산업별">산업별</a></li>
									<li class="sitemap_depth02"><a href="/recruitSearchByArea.do" title="지역별">지역별</a></li>
								</ul>
								<li class="sitemap_depth01"><a href="/recruitSearchForFree.do" title="프리랜서">프리랜서</a></li>
								<li class="sitemap_depth01"><a href="/recruitSearchForAlba.do" title="알바채용">알바채용</a></li>
								<li class="sitemap_depth01"><a href="/recruitOther.do" title="일반채용정보">일반채용정보</a></li>
							</ul>
						</div>
						<div class="sitemap">
							<h4>인재검색</h4>
							<ul>
								<li class="sitemap_depth01"><a href="/resumeSearch.do" title="인재검색">인재검색</a>
								<ul class="sub">
									<li class="sitemap_depth02"><a href="/resumeSearch.do" title="상세검색">상세검색</a></li>
									<li class="sitemap_depth02"><a href="/resumeSearchByDuty.do" title="직무별">직무별</a></li>
									<li class="sitemap_depth02"><a href="/resumeSearchByIndustry.do" title="산업별">산업별</a></li>
									<li class="sitemap_depth02"><a href="/resumeSearchByArea.do" title="지역별">지역별</a></li>
								</ul>
								<li class="sitemap_depth01"><a href="/resumeSearchForFree.do" title="프리랜서">프리랜서</a></li>
								<li class="sitemap_depth01"><a href="/resumeSearchForAlba.do" title="알바">알바</a></li>
								<li class="sitemap_depth01"><a href="/resumeScrapList.do" title="스크랩인재">스크랩인재</a></li>
								<li class="sitemap_depth01"><a href="/resumeRecommendList.do" title="우수추천인재">우수추천인재</a></li>
							</ul>
						</div>
	</c:otherwise>
</c:choose>
					<div class="sitemap">
						<h4>헤드헌팅</h4>
						<ul>
							<li class="sitemap_depth01"><a href="/headhuntList.do" title="채용정보">채용정보</a>
					<c:choose>
						<c:when test="${SE_LOGIN_STATUS}">
							<c:if test="${SE_USER_TYPE == 'person' }">
								<li class="sitemap_depth01"><a href="https://allwork.officecall.cloud/" target="_blank" title="화상면접">화상면접</a>
							</c:if>
				
							<c:if test="${SE_USER_TYPE == 'company' }">
								<li class="sitemap_depth01"><a href="https://allwork.officecall.cloud/?user_check=admin" target="_blank" title="화상면접">화상면접</a>
							</c:if>
						</c:when>
						<c:otherwise>
								<li class="sitemap_depth01"><a href="javascript:alert('로그인 이후에 사용할 수 있습니다.');" title="화상면접">화상면접</a>
						</c:otherwise>
					</c:choose>
						</ul>
					</div>
					<div class="sitemap">
						<h4>채용진행현황</h4>
						<ul>
							<li class="sitemap_depth01"><a href="/progressInterview.do" title="면접진행">면접진행</a>
							<li class="sitemap_depth01"><a href="/progressVisitCompany.do" title="기업방문">기업방문</a></li>
							<li class="sitemap_depth01"><a href="/progressProvideResume.do" title="이력서제공">이력서제공</a></li>
							<li class="sitemap_depth01"><a href="/progressSuccess.do" title="재취업성공">재취업성공</a></li>
							<li class="sitemap_depth01"><a href="/progressPreMeeting.do" title="사전면접">사전면접</a></li>
							<li class="sitemap_depth01"><a href="/progressConsulting.do" title="적응컨설팅">적응컨설팅</a></li>
						</ul>
					</div>
					<div>
						<h4>고객센터</h4>
						<ul>
							<li class="menu menu01"><a href="/noticeList.do" title="공지사항">공지사항</a></li>
							<li class="menu menu02"><a href="/bbsList.do" title="게시판">게시판</a></li>
							<li class="menu menu03"><a href="/faqList.do" title="FAQ">FAQ</a></li>
							<li class="menu menu04"><a href="/paymentGuide.do" title="이용안내">이용안내</a>
								<ul class="sub">
									<li><a href="/paymentGuide.do" title="유료채용광고 문의">유료채용광고 문의</a></li>
								</ul>
							</li>
							<li class="menu menu05"><a href="/termsOfService.do" title="이용약관">이용약관</a></li>
							<li class="menu menu06"><a href="/privacyPolicy.do" title="개인정보 취급방침">개인정보 취급방침</a></li>
							<li class="menu menu07"><a href="/customerClaim.do" title="불편 및 신고사항 접수">불편 및 신고사항 접수</a></li>
							<li class="menu menu08"><a href="/mobileGuide.do" title="모바일 서비스">모바일 서비스</a></li>
							<li class="menu menu09"><a href="/libraryList.do" title="자료실">자료실</a></li>
						</ul>
					</div>
				</div>
				<p class="allMenu_ect">
					<span><a href="/sitemap.do" title="사이트맵">사이트맵</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</span>
					<span><a href="/introAbout.do" title="회사소개">회사소개</a></span>
				</p>
			</div>
		</div>
		<div id="containerWrap">
			<div id="visualWrap">
				<div id="visual">
					<h2>비쥬얼영역</h2>
					<div class="descBox">
						<p class="desc1"><span>40세 이상 구인구직은 올워크</span></p>
						</p>
						<div id="searchArea">
							<form name="aiSearchForm" id="aiSearchForm" method="post">
								<fieldset>
									<legend>검색</legend>
									<p class="textBox">
										<input id="searchText" type="text" name="q" title="allwork 검색" maxlength="100" placeholder="검색어를 입력해주세요" value="${map.q }" />
									</p>
									<p class="btnBox00">
										<input id="search_btn00" type="button" name="searchBtn00" value="검색" />
									</p>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div id="screen">
				<ul id="film">
					<li class="scene scene0"><img src="/img/main/main00.jpg" alt="이미지00" /></li>
					<li class="scene scene1"><img src="/img/main/main01.jpg" alt="이미지01" /></li>
				</ul>
			</div>

<script type="text/javascript">
	
	function procLogout() {
		//Naver, Kakao, Google에 대한 logout 처리.
		Kakao.init('${kakaoClientId}');
		if (!Kakao.Auth.getAccessToken()) {
			console.log('Not logged in.');
			return;
		}
		///*
		Kakao.Auth.logout(function() {
			console.log(Kakao.Auth.getAccessToken());
			//Logout 처리.
			location.href = "/logout.do";

			/*
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
			*/
		});
		//*/
		/*
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
		*/

		////Logout 처리.
		//location.href = "/logout.do";
	}
	
</script>
			
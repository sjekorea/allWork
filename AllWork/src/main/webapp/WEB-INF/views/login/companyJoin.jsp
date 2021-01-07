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
	<title>기업회원 회원가입</title>
	<link rel="stylesheet" type="text/css" href="/css/header_mini.css" />
	<link rel="stylesheet" type="text/css" href="/css/register_02.css" />
	<link rel="stylesheet" type="text/css" href="/css/footer_white.css" />
	<link rel="stylesheet" type="text/css" href="/css/font.css" />
	<link rel="stylesheet" type="text/css" href="/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="/css/all.css" />
	<link rel="stylesheet" type="text/css" href="/css/common.css"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/js/jquery-1.12.4.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/index00.js"></script>
	<script type="text/javascript" src="/js/moment.min.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/process.js"></script>
	<!-- Daum 주소검색 사용. -->
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<!-- Smart Editor 2 사용. -->
	<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
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
				<li><a href="/login.do" title="로그인">로그인</a></li>
			</ul>
		</div>
		<div id="registerWrap">
			<div id="registerArea">
				<div class="registertext">
					<h4>기업회원 가입</h4>
					<p>
						올워크 모든회원의 가입은 <span class="bold">무료</span>입니다.
					</p>
				</div>
				<form id="mainForm" name="mainForm" action="javascript:goRegistMember();" method="post" enctype="multipart/form-data" >
					<fieldset>
						<legend>회원가입</legend>
						<div class="tab">
							<span class="btn_persnal"><input id="memberJoinPerson" type="radio" name="memberJoin" onClick="location.href='personJoin.do'" /><label for="memberJoinPerson">&nbsp;개인회원</label></span>
							<span class="btn_company"><input id="memberJoinCompany" type="radio" name="memberJoin" checked="checked" /><label for="memberJoinCompany">&nbsp;기업회원</label></span>
						</div>
						<div class="descBox">
							<p class="title">
								일반 기업회원<br />혜택
							</p>
							<p class="desc">
								<span><i class="far fa-check-circle"></i>입사지원자 이력서 관리</span>
								<span><i class="far fa-check-circle"></i>관심인재 스크랩 및 관리</span>
								<span><i class="far fa-check-circle"></i>지원자 통계정보 제공</span>
							</p>
							<p class="title">
								기업유료회원<br />혜택
							</p>
							<p class="desc">
								<span><i class="far fa-check-circle"></i>올워크 구직정보 무제한 검색</span>
								<span><i class="far fa-check-circle"></i>채용공고 최대노출, 효과극대화 혜택</span>
								<span><i class="far fa-check-circle"></i>맞춤인재 추천</span>
							</p>
						</div>
						<div class="registerBox01">
							<table>
								<caption>기업정보</caption>
								<tbody>
								<c:if test="${rstCnt < 1 }">
									<tr>
										<th colspan=2><span class="necessary">오류가 발생해서 회원등록에 실패했습니다.</span></th>
									</tr>
								</c:if>
									<tr>
										<th>대표자명(CEO)<span class="necessary">*</span></th>
										<td><input id="bizRecharger" type="text" name="bizRecharger" title="이름" maxlength=100 /></td>
									</tr>
									<tr>
										<th>회사명<span class="necessary">*</span></th>
										<td><input id="bizName" type="text" name="bizName" title="아이디" maxlength=100 /></td>
									</tr>
									<tr class="companyNum">
										<th>사업자번호<span class="necessary">*</span></th>
										<td>
											 <select id="bizCopy" name="bizCopy">
												<option value="">-- 기업종류 --</option>
												<option value="N">개인사업자</option>
												<option value="Y">법인사업자</option>
											</select>
											<span><input type="text" id="bizNo" name="bizNo" maxlength=20 /></span>
											<span><input type="submit" id="btuChkDupBizNo" name="btuChkDupBizNo" value="중복확인" title="중복확인" /></span>
										</td>
									</tr>
									<tr>
										<th>업종<span class="necessary">*</span></th>
										<td>
											<select id="bizCategory" name="bizCategory">
												<option value="">-- 업종 선택 --</option>
												<c:forEach var="result" items="${businesstypeList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
									<th>상장여부</th>
										<td>
											<select id="bizList" name="bizList">
												<option value="">-- 상장여부 선택 --</option>
												<c:forEach var="result" items="${bizList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th>기업형태</th>
										<td>
											<select id="bizForm" name="bizForm">
												<option value="">-- 기업형태 선택 --</option>
												<c:forEach var="result" items="${bizFormList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr class="businessDesc">
										<th>주요사업내용<span class="necessary">*</span></th>
										<td><input type="text" name="bizSubject" id="bizSubject" maxlength=20 value="" /> <span class="comment">예 : 네트워크 트래픽 관리제품 개발 및 판매</span></td>
									</tr>
									<tr class="companyPhone">
										<th>대표번호<span class="necessary">*</span></th>
										<td>
											<span><input id="bizPhone01" type="text" name="bizPhone01" numberOnly maxlength=3 /><label for="bizPhone01">&nbsp;-</label></span>
											<span><input id="bizPhone02" type="text" name="bizPhone02" numberOnly maxlength=4 /><label for="bizPhone02">&nbsp;-</label></span>
											<span><input id="bizPhone03" type="text" name="bizPhone03" numberOnly maxlength=4 /><label for="bizPhone03"></label></span>
										</td>
									</tr>
									<tr class="companyFax">
										<th>팩스번호</th>
										<td>
											<span><input id="bizFax01" type="text" name="bizFax01" numberOnly maxlength=3 /></span><span>&nbsp;-</span>
											<span><input id="bizFax02" type="text" name="bizFax02" numberOnly maxlength=4 /></span><span>&nbsp;-</span>
											<span><input id="bizFax03" type="text" name="bizFax03" numberOnly maxlength=4 /></span>
										</td>
									</tr>
									<tr class="email">
										<th>이메일<span class="necessary">*</span></th>
										<td>
											<span><input id="bizEmailId" type="text" name="bizEmailId" value="" title="아이디만 입력" maxlength=20 /></span>
											<span>&nbsp;@&nbsp;</span><span><input id="bizEmailHost" type="text" name="bizEmailHost" value="" title="이메일 주소 선택" maxlength=30 /></span>
											<span>
												<select id="selBizEmailHost" name="selBizEmailHost" title="이메일 선택">
													<option value="">직접입력</option>
													<option value="gmail.com">gmail.com</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="nate.com">nate.com</option>
												</select>
											</span>
										</td>
									</tr>
									<tr>
										<th>홈페이지</th>
										<td>
											<span><input type="text" id="bizHome" name="bizHome" maxlength=100 /></span>
										</td>
									</tr>
									<tr class="address">
										<th>회사주소<span class="necessary">*</span></th>
										<td>
											<p class="postNumber">
												<input id="bizPost" type="text" name="bizPost" title="우편번호01" readonly maxlength=7 />&nbsp;<input type="submit" id="searchBizAddress" value="주소찾기" title="주소찾기" />
											</p>
											<p>
												<input id="bizAddress1" type="text" name="bizAddress1" title="주소01" readonly maxlength=100 />
											</p>
											<p>
												<input id="bizAddress2" type="text" name="bizAddress2" title="주소02" maxlength=100 />
											</p>
										</td>
									</tr>
									<tr>
										<th>설립년도</th>
										<td>
											<span><input type="text" id="bizFonundation" name="bizFonundation" numberOnly maxlength=5 /></span>&nbsp;년 설립
										</td>
									</tr>
									<tr>
										<th>사원수</th>
										<td>
											<span><input type="text" id="bizMen" name="bizMen" numberOnly /></span>&nbsp;명 (예:200)
										</td>
									</tr>
									<tr>
										<th>자본금</th>
										<td>
											<span><input type="text" id="bizCapital" name="bizCapital" maxlength=50 /></span>&nbsp;원 (예:3억5천만)
										</td>
									</tr>
									<tr>
										<th>매출액</th>
										<td>
											<span><input type="text" id="bizSelling" name="bizSelling" maxlength=50 /></span>&nbsp;원 (예:3억5천만)
										</td>
									</tr>
									<tr class="logoArea">
										<th>회사로고</th>
										<td>
											<p class="imgPart"><img id="logoImg" name="logoImg" src="/img/myCompany/noimage.jpg" alt="회사로고"/></p>
											<p class="descPart">
												<!-- 
												<form name="fileUploadForm0" id="fileUploadForm0" method="post" enctype="multipart/form-data" accept-charset="EUC-KR">
													<span><input type="file" id="attachFile0" name="attachFile0" accept="image/gif, image/png, image/jpeg" onchange="javascript:fileUpload('bizLogo', 'logoImg', 'fileUploadForm0');"></span>
												</form>
												<input type="hidden" name="bizLogo" id="bizLogo" value=""/>
												<br/>
												 -->
												<span><input type="file" id="fileLogo" name="fileLogo" ><label for="fileLogo">파일선택</label></span><br/>
												<span>
													※ 이미지 파일형식은 확장자 *.jpg, *.gif만 가능합니다.<br/>
													※ 로고 이미지 권장사이즈는 가로120 * 세로34입니다.
												</span>
											</p>
										</td>
									</tr>
									<tr class="comPhoto">
										<th>회사사진</th>
										<td>
											<ul class="imgArea">
												<li><img id="photoImg1" src="/img/myCompany/noimage.jpg" alt="회사이미지1"/></li>
												<li><img id="photoImg2" src="/img/myCompany/noimage.jpg" alt="회사이미지2"/></li>
												<li><img id="photoImg3" src="/img/myCompany/noimage.jpg" alt="회사이미지3"/></li>
												<li><img id="photoImg4" src="/img/myCompany/noimage.jpg" alt="회사이미지4"/></li>
											</ul>
											<ul class="upLoadArea">
												<li>
													<span>
														<!-- 
														<form name="fileUploadForm1" id="fileUploadForm1" method="post" enctype="multipart/form-data" accept-charset="EUC-KR">
															<span><input type="file" id="attachFile1" name="attachFile1" accept="image/gif, image/png, image/jpeg" onchange="javascript:fileUpload('photo1', 'photoImg1', 'fileUploadForm1');"></span>
														</form>
														<input type="hidden" name="photo1" id="photo1" value=""/>
														 -->
														<input type="file" id="filePhoto1" name="filePhoto1" ><label for="filePhoto1">파일선택</label>
													</span>
												</li>
												<li>
													<span>
														<!-- 
														<form name="fileUploadForm2" id="fileUploadForm2" method="post" enctype="multipart/form-data" accept-charset="EUC-KR">
															<span><input type="file" id="attachFile2" name="attachFile2" accept="image/gif, image/png, image/jpeg" onchange="javascript:fileUpload('photo2', 'photoImg2', 'fileUploadForm2');"></span>
														</form>
														<input type="hidden" name="photo2" id="photo2" value=""/>
														 -->
														<input type="file" id="filePhoto2" name="filePhoto2" ><label for="filePhoto2">파일선택</label>
													</span>
												</li>
												<li>
													<span>
														<!-- 
														<form name="fileUploadForm3" id="fileUploadForm3" method="post" enctype="multipart/form-data" accept-charset="EUC-KR">
															<span><input type="file" id="attachFile3" name="attachFile3" accept="image/gif, image/png, image/jpeg" onchange="javascript:fileUpload('photo3', 'photoImg3', 'fileUploadForm3');"></span>
														</form>
														<input type="hidden" name="photo3" id="photo3" value=""/>
														 -->
														<input type="file" id="filePhoto3" name="filePhoto3" ><label for="filePhoto3">파일선택</label>
													</span>
												</li>
												<li>
													<span>
														<!-- 
														<form name="fileUploadForm4" id="fileUploadForm4" method="post" enctype="multipart/form-data" accept-charset="EUC-KR">
															<span><input type="file" id="attachFile4" name="attachFile4" accept="image/gif, image/png, image/jpeg" onchange="javascript:fileUpload('photo4', 'photoImg4', 'fileUploadForm4');"></span>
														</form>
														<input type="hidden" name="photo4" id="photo4" value=""/>
														 -->
														<input type="file" id="filePhoto4" name="filePhoto4" ><label for="filePhoto4">파일선택</label>
													</span>
												</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th>기업개요/비전</th>
										<td>
											<textarea id="bizVision" name="bizVision"></textarea>
										</td>
									</tr>
									<tr class="history">
										<th>연혁/실적</th>
										<td>
											<textarea id="bizHistory" name="bizHistory"></textarea>
											<span>
											[입력예]<br/>
											2008.12 웹어워드위원회 주최,"2008 웹어워드코리아 대상"2년 연속 수상<br/>
											2008.11 방송통신위원회 주최,"대학민국 인터넷대상 국무총리상 수상"<br/>
											2008.10 한국능률협회컨설팅 주관,"2008 한국의 경영대상 마케팅 대상"6년 연속 수상<br/>
											한국소비자포럼 주최,"2008 올해의 브랜드 대상"4년 연속 수상<br/>
											브랜드스톡 주최,"2008 올해의 하이스트 브랜드"부문 1위 수상<br/>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="registerBox02">
							<table>
								<caption>담당자 정보</caption>
								<tbody>
									<tr>
										<th>이름<span class="necessary">*</span></th>
										<td><input id="name" type="text" name="name" title="이름" maxlength=20 /></td>
									</tr>
									<tr>
										<th>아이디<span class="necessary">*</span></th>
										<td>
											<input id="uid" type="text" name="uid" title="아이디" maxlength=20 value=""/>
											<input id="btuChkDupUid" type="submit" value="중복확인" title="중복확인"/>
											<span class="comment">영문과 숫자를 조합하여 4~16자 이내로 입력하세요.</span>
										</td>
									</tr>
									<tr>
										<th>비밀번호<span class="necessary">*</span></th>
										<td><input id="passwd" type="password" name="passwd" title="비밀번호" maxlength=20 /> <span class="comment">비밀번호는 6~16자 영문, 숫자를 조합하여 사용할 수 있습니다.</span></td>
									</tr>
									<tr>
										<th>비밀번호 확인<span class="necessary">*</span></th>
										<td><input id="passwdRe" type="password" name="passwdRe" title="비밀번호확" /> <span class="comment">비밀번호 확인을 위해 다시 한 번 입력해 주시기 바랍니다.</span></td>
									</tr>
								<tr class="logoArea">
									<th>이력서 사진</th>
									<td>
										<p class="imgPart"><img id="photoImg" name="photoImg" src="img/myCompany/noimage.jpg" alt="이력서 사진"/></p>
										<p class="descPart">
											<span><input type="file" id="filePhoto" name="filePhoto" ><label for="filePhoto">파일선택</label></span><br/>
											 <!-- 
											<form name="fileUploadForm0" id="fileUploadForm0" method="post" enctype="multipart/form-data" accept-charset="EUC-KR">
												<span><input type="file" id="attachFile0" name="attachFile0" accept="image/gif, image/png, image/jpeg" onchange="javascript:fileUpload('photo', 'photoImg', 'fileUploadForm0');"></span>
											</form>
											<input type="hidden" name="photo" id="photo" value=""/>
											<br/>
											  -->
											<span>
												※ 이미지 파일형식은 확장자 *.jpg, *.gif만 가능합니다.<br/>
												※ 이력서 사진 권장사이즈는 가로 120 * 세로 142 입니다.
											</span>
										</p>
									</td>
								</tr>
									<!-- 
									<tr class="birthday">
										<th>생년월일<span class="necessary">*</span></th>
										<td>
											<span><input id="year" type="text" name="year" value="" maxlength="4" numberOnly /><label for="year">&nbsp;년</label></span>
											<span><input id="month" type="text" name="month" value="" maxlength="2" numberOnly /><label for="month">&nbsp;월</label></span>
											<span><input id="day" type="text" name="day" value="" maxlength="2" numberOnly /><label for="day">&nbsp;일</label></span>
											<input type="hidden" name="birth" id="birth" value="" />
										</td>
									</tr>
									 -->
								<tr class="birthday">
									<th>생년월일<span class="necessary">*</span></th>
									<td>
										<span>
											<select id="year" name="year" title="출생년도 선택"></select>
										</span>
										<span>
											<select id="month" name="month" title="출생월 선택"></select>
										</span>
										<span>
											<select id="day" name="day" title="출생일 선택"></select>
										</span>
									</td>
								</tr>

									<tr>
										<th>성별<span class="necessary">*</span></th>
										<td>
											<span>&nbsp;<input id="man" type="radio" name="sex" value="man" checked="checked"/><label for="man">&nbsp;남자</label></span>
											<span>&nbsp;<input id="woman" type="radio" name="sex" value="woman" /><label for="woman">&nbsp;여자</label></span>
										</td>
									</tr>
									<tr class="email">
										<th>이메일<span class="necessary">*</span></th>
										<td>
											<span><input id="emailId" type="text" name="emailId" value="" title="아이디만 입력" maxlength=20 /></span>
											<span>&nbsp;@&nbsp;</span><span><input id="emailHost" type="text" name="emailHost" maxlength=30 value="" title="이메일 주소 선택"/></span>
											<span>
												<select id="selEmailHost" name="selEmailHost" title="이메일 선택">
													<option value="">직접입력</option>
													<option value="gmail.com">gmail.com</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="nate.com">nate.com</option>
												</select>
											</span>
										</td>
									</tr>
									<tr>
										<th>이메일 수신여부<span class="necessary">*</span></th>
										<td>
											<span><input type="radio" id="useMailYes" name="useMail" value="yes" checked="checked"/><label for="useMailYes">&nbsp;예</label></span>
											<span><input type="radio" id="useMailNo" name="useMail" value="no"/><label for="useMailNo">&nbsp;아니오</label></span>
										</td>
									</tr>
									<!-- 
									<tr class="phoneConfirm">
										<th>휴대폰 인증<span class="necessary">*</span></th>
										<td>
											<p>
												<label for="phoneNum">휴대폰 번호</label>
												<input id="hphone" type="text" name="hphone" title="휴대폰번호"/>
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
									 -->
									<tr class="phone">
										<th>휴대폰 번호<span class="necessary">*</span></th>
										<td>
											<span><input type="text" id="phone1" name="phone1" maxlength=3 /></span><span>&nbsp;-</span>
											<span><input type="text" id="phone2" name="phone2" maxlength=4 /></span><span>&nbsp;-</span>
											<span><input type="text" id="phone3" name="phone3" maxlength=4 /></span>
										</td>
									</tr>
									<tr>
										<th>SMS 수신여부</th>
										<td>
											<span><input type="radio" id="useSmsYes" name="useSms" value="yes" checked="checked"/><label for="useSmsYes">&nbsp;예</label></span>
											<span><input type="radio" id="useSmsNo" name="useSms" value="no"/><label for="useSmsNo">&nbsp;아니오</label></span>
										</td>
									</tr>
								<tr>
									<th>Push 수신동의<span class="necessary">*</span></th>
									<td>
										<span class="male"><input id="usePushYes" type="radio" name="usePush" value="yes" checked="checked" /><label for="usePushYes">&nbsp;예</label></span>
										<span class="female"><input id="usePushNo" type="radio" name="usePush" value="no" /><label for="usePushNo">&nbsp;아니오</label></span>
									</td>
								</tr>
									<tr class="address">
										<th>주소<span class="necessary">*</span></th>
										<td>
											<p class="postNumber"><input id="post" type="text" name="post" title="우편번호01" maxlength=10 readonly/>&nbsp;<input type="submit" id="searchAddress" value="주소찾기" title="주소찾기"/></p>
											<p><input id="address1" type="text" name="address1" title="주소01" maxlength=100 readonly/></p>
											<p><input id="address2" type="text" name="address2" title="주소02" maxlength=100 /></p>
										</td>
									</tr>
																		
								</tbody>
							</table>
						</div>
						<div class="agreement">
							<p class="comment01">필수동의 항목과 마케팅 정보 수신(선택)에 모두 동의합니다.</p>
							<ol>
								<li><span><input id="agree00" type="checkbox" name="agree00" />&nbsp;<label for="agree00">전체동의</label></span></li>
								<li class="descArea">
									<span class="desc"><input id="agree01" type="checkbox" name="agree01" />&nbsp;<label for="agree01">[필수] 이용약관 동의</label></span>
									<span class="descBtn"><input id="desc_Btn01" type="button" name="desc_Btn01" value="내용보기 ∨" /></span>
									<span class="agreeDesc01">${item.agreement3}</span>
								</li>
								<li class="descArea"><span class="desc">
									<input id="agree02" type="checkbox" name="agree02" />&nbsp;<label for="agree02">[필수] 개인정보 수집 및 이용 동의</label></span>
									<span class="descBtn"><input id="desc_Btn02" type="button" name="desc_Btn02" value="내용보기 ∨" /></span>
									<span class="agreeDesc02">${item.privacy3}</span>
								</li>
								<!-- 
								<li><span><input id="agree03" type="checkbox" name="agree03" />&nbsp;<label for="agree03">[선택] 마케팅 정보 이메일 수신 동의</label></span></li>
								<li><span><input id="agree04" type="checkbox" name="agree04" />&nbsp;<label for="agree04">[선택] 마케팅 정보 SMS 수신 동의</label></span></li>
								 -->
							</ol>
						</div>
						
						<input type="hidden" name="type" id="type" value="2" />
						<input type="hidden" name="chkDupBizNoChk" id="chkDupBizNoChk" value="N" />
						<input type="hidden" name="chkDupChk" id="chkDupChk" value="N" />
						
						<input type="hidden" name="bizPhone" id="bizPhone" value="" />
						<input type="hidden" name="bizFax" id="bizFax" value="" />
						<input type="hidden" name="bizEmail" id="bizEmail" value="" />

						<input type="hidden" name="birth" id="birth" value="" />
						<input type="hidden" name="email" id="email" value="" />
						<input type="hidden" name="hphone" id="hphone" value="" />
					</fieldset>
				</form>
				<div class="agree_ok">
					<ul>
						<li><a href="/index.do" title="취소">취소</a></li>
						<li><a href="javascript:goRegistMember();" title="가입하기">가입하기</a></li>
					</ul>
				</div>
			</div>
		</div>
<jsp:include page="/footer.do" />

<script type="text/javascript">

	var bizVision_object = [];
	var bizHistory_object = [];
	
	$(document).ready(function(){
		
		nhn.husky.EZCreator.createInIFrame({
	        oAppRef: bizVision_object,
	        elPlaceHolder: "bizVision",
	        sSkinURI: "/smartEditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	        }
	    });
		 
		nhn.husky.EZCreator.createInIFrame({
	        oAppRef: bizHistory_object,
	        elPlaceHolder: "bizHistory",
	        sSkinURI: "/smartEditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	        }
	    });
		
		$("input:text[numberOnly]").on("keypress", function(e){
			if (!(event.which && (event.which  > 47 && event.which  < 58 || event.which == 8))){
				event.preventDefault();
			}
		});
		
		$("#bizNo").on("focus", function(e){
			$("#btuChkDupBizNo").css("display", "inline-block");
			$("#chkDupBizNoChk").val("N");
		});
		
		$("#btuChkDupBizNo").on("click", function(e){
			e.preventDefault();
			chkDupBizNo();
		});
		
		$("#selBizEmailHost").on("change", function(e){
			if($(this).val() == ""){
				$("#bizEmailHost").css("background-color", "#FFFFFF");
				$("#bizEmailHost").attr("readonly",false);
			}else{
				$("#bizEmailHost").css("background-color", "#EAEAEA");
				$("#bizEmailHost").attr("readonly",true);
			}
			$("#bizEmailHost").val($(this).val());
		});

		$("#searchBizAddress").on("click", function(e){
			e.preventDefault();
			execDaumPostcode($("#bizPost"), $("#bizAddress1"), $("#bizAddress2"));
		});
		
		$("#uid").on("focus", function(e){
			$("#btuChkDupUid").css("display", "inline-block");
			$("#chkDupChk").val("N");
		});
				
		$("#btuChkDupUid").on("click", function(e){
			e.preventDefault();
			chkDupUid();
		});
		
		$("#selEmailHost").on("change", function(e){
			if($(this).val() == ""){
				$("#emailHost").css("background-color", "#FFFFFF");
				$("#emailHost").attr("readonly",false);
			}else{
				$("#emailHost").css("background-color", "#EAEAEA");
				$("#emailHost").attr("readonly",true);
			}
			$("#emailHost").val($(this).val());
		});

		$("#searchAddress").on("click", function(e){
			e.preventDefault();
			execDaumPostcode($("#post"), $("#address1"), $("#address2"));
		});
				
		$("#agree00").on("click", function(e){
			$("#agree01").prop("checked", $("#agree00").is(":checked"));
			$("#agree02").prop("checked", $("#agree00").is(":checked"));
			$("#agree03").prop("checked", $("#agree00").is(":checked"));
			$("#agree04").prop("checked", $("#agree00").is(":checked"));
		});
		
		$("#desc_Btn01").on("click", function(e){
			$(".agreeDesc01").toggle();
			$(".agreeDesc02").css("display", "none");
		});
		
		$("#desc_Btn02").on("click", function(e){
			$(".agreeDesc01").css("display", "none");
			$(".agreeDesc02").toggle();
		});
		
		/*
		$(".agree_ok").find("a:eq(0)").on("click", function(e){
			e.preventDefault();
			location.href = "/index.do";
		});
		
		$(".agree_ok").find("a:eq(1)").on("click", function(e){
			e.preventDefault();
			goRegistMember();
		});
		*/


		//생년월일 combobox 생성.
		var thisYear = new Date().getFullYear();
		var minYear = thisYear - 100,
			maxYear = thisYear,
			select = document.getElementById('year');
		for (var i = minYear; i<=maxYear; i++){
			var opt = document.createElement('option');
			opt.value = i;
			opt.innerHTML = i;
			select.appendChild(opt);
		}

		var minMonth = 1,
			maxMonth = 12,
			select = document.getElementById('month');
		for (var i = minMonth; i<=maxMonth; i++){
			var opt = document.createElement('option');
			opt.value = (i < 10)? ("0" + i) : ("" + i);
			opt.innerHTML = i;
			select.appendChild(opt);
		}
		
		var minDay = 1,
			maxDay = 31,
			select = document.getElementById('day');
		for (var i = minDay; i<=maxDay; i++){
			var opt = document.createElement('option');
			opt.value = (i < 10)? ("0" + i) : ("" + i);
			opt.innerHTML = i;
			select.appendChild(opt);
		}
		
		//ComboBox 선택.
		$("#year").val("1965").prop("selected", true);
		$("#month").val("06").prop("selected", true);
		$("#day").val("15").prop("selected", true);

		
		//작업결과 Popup.
	<c:if test="${rstCnt == 1 }">
		alert("회원가입이 되었습니다.\n로그인 이후에 사용해 주십시오.");
		
		//로그인 화면으로 이동.
		location.href = "/login.do";
	</c:if>
	});	

	
	// 사업자 번호 복 확인
	function chkDupBizNo(){

		if($("#bizNo").val().length <= 0){
			alertAndFocus("사업자 번호를 입력하세요.", $("#bizNo"));
			return;
		}
		
		loadingOn();
		
		var callback = function(data){
			if(data.rstCnt > 0){
				alert("등록된 사업자 번호 입니다.");
				$("#chkDupBizNoChk").val("N");
			}else{
				alert("사용가능한 사업자 번호 입니다.");
				$("#btuChkDupBizNo").css("display", "none");
				$("#chkDupBizNoChk").val("Y");
			}
			loadingOff();
		};
		
		var param = {
					bizNo : $("#bizNo").val()
				};
		ajax('post', '/chkDupBizNo.ajax', param, callback);
	}

	
	// 아이디 중복 확인
	function chkDupUid(){

		if(checkNull($("#uid").val())){
			alertAndFocus("아이디를 입력하세요.", $("#uid"));
			return;
		}
		
		loadingOn();
		
		var callback = function(data){
			if(data.rstCnt > 0){
				alert("사용중인 아이디 입니다.");
				$("#chkDupChk").val("N");
			}else{
				alert("사용가능한 아이디 입니다.");
				$("#btuChkDupUid").css("display", "none");
				$("#chkDupChk").val("Y");
			}
			loadingOff();
		};
		
		var param = {
					uid : $("#uid").val()
				};
		ajax('post', '/chkDupUid.ajax', param, callback);
	}
	
	// 회원정보 등록
	function goRegistMember(){

		if(checkNull($("#bizRecharger").val())){
			alertAndFocus("대표자 이름을 입력하세요.", $("#bizRecharger"));
			return;
		}
		if(checkNull($("#bizName").val())){
			alertAndFocus("회사이름을 입력하세요.", $("#bizName"));
			return;
		}
		if(checkNull($("#bizCopy").val())){
			alertAndFocus("기업종류를 선택하세요.", $("#bizCopy"));
			return;
		}
		if(checkNull($("#bizNo").val())){
			alertAndFocus("사업자등록번호를 입력하세요.", $("#bizNo"));
			return;
		}
		if($("#chkDupBizNoChk").val() != "Y"){
			alert("사업자등록번호 중복확인은 필수 입니다.");
			return;
		}
		if(checkNull($("#bizCategory").val())){
			alertAndFocus("업종을 선택하세요.", $("#bizCategory"));
			return;
		}
		if(checkNull($("#bizSubject").val())){
			alertAndFocus("주요사업내용을 입력하세요.", $("#bizSubject"));
			return;
		}
		if(checkNull($("#bizPhone01").val()) || checkNull($("#bizPhone02").val()) || checkNull($("#bizPhone03").val())){
			alertAndFocus("회사 대표연락처 번호를 입력하세요.", $("#bizPhone01"));
			return;
		}
		var bizPhone = $("#bizPhone01").val() + "-" + $("#bizPhone02").val() + "-" + $("#bizPhone03").val();
		var bizFax = $("#bizFax01").val() + "-" + $("#bizFax02").val() + "-" + $("#bizFax03").val();

		if(checkNull($("#bizEmailId").val()) || checkNull($("#bizEmailHost").val())){
			alertAndFocus("회사 이메일을 입력하세요.", $("#bizEmailId"));
			return;
		}
		var bizEmail = $("#bizEmailId").val() + "@" + $("#bizEmailHost").val();

		if(checkNull($("#bizPost").val()) || checkNull($("#bizAddress1").val())){
			alertAndFocus("회사 주소를 입력하세요.", $("#bizPost"));
			return;
		}
		
		if(checkNull($("#name").val())){
			alertAndFocus("담당자 이름을 입력하세요.", $("#name"));
			return;
		}
		if(checkNull($("#uid").val())){
			alertAndFocus("회원 ID를 입력하세요.", $("#uid"));
			return;
		}
		if($("#chkDupChk").val() != "Y"){
			alert("ID 중복확인은 필수 입니다.");
			return;
		}
		if(checkNull($("#passwd").val())){
			alertAndFocus("비밀번호를 입력하세요.", $("#passwd"));
			return;
		}
		if($("#passwd").val().length < 4){
			alertAndFocus("비밀번호는 4~16자 영문, 숫자를 조합하여 사용할 수 있습니다.\n비밀번호를 확인하세요.", $("#passwd"));
			return;
		}
		if($("#passwd").val() != $("#passwdRe").val()){
			alertAndFocus("비밀번호와 비밀번호 확인정보가 일치하지 않습니다.", $("#passwdRe"));
			return;
		}
		if(checkNull($("#year").val()) || checkNull($("#month").val()) || checkNull($("#day").val())){
			alertAndFocus("채용 담당자 생년월일을 입력하세요.", $("#year"));
			return;
		}
		var birth = $("#year").val() + "-" + $("#month").val() + "-" + $("#day").val();

		var sex = $("input[name=sex]:checked").val();
		if(checkNull(sex)){
			alertAndFocus("담당자 성별을 선택하세요.", $("#man"));
			return;
		}
		
		if(checkNull($("#emailId").val()) || checkNull($("#emailHost").val())){
			alertAndFocus("담당자 이메일을 입력하세요.", $("#emailId"));
			return;
		}	
		var email = $("#emailId").val() + "@" + $("#emailHost").val();

		var useMail = $("input[name=useMail]:checked").val();
		if(checkNull(useMail)){
			alertAndFocus("이메일 수신동의를 선택하세요.", $("#useMailYes"));
			return;
		}
		
		if(checkNull($("#phone1").val()) || checkNull($("#phone2").val()) || checkNull($("#phone3").val())){
			alertAndFocus("담당자 휴대폰 번호를 입력하세요.", $("#phone1"));
			return;
		}
		var hphone = $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val();
		var useSms = $("input[name=useSms]:checked").val();
		if(checkNull(useSms)){
			alertAndFocus("SMS 수신동의를 선택하세요.", $("#useSmsYes"));
			return;
		}
		var usePush = $("input[name=usePush]:checked").val();
		if(checkNull(usePush)){
			alertAndFocus("Push 수신동의를 선택하세요.", $("#usePushYes"));
			return;
		}

		if(checkNull($("#post").val()) || checkNull($("#address1").val())){
			alertAndFocus("담당자 주소를 입력하세요.", $("#post"));
			return;
		}

		if(!$("#agree01").is(":checked")){
			alert("[필수]이용약관에 동의 하셔야 합니다.");
			return;
		}
		
		if(!$("#agree02").is(":checked")){
			alert("[필수]개인정보 수집 및 이용에 동의 하셔야 합니다.");
			return;
		}
		
		loadingOn();
		
		bizVision_object.getById["bizVision"].exec("UPDATE_CONTENTS_FIELD", []);
		bizHistory_object.getById["bizHistory"].exec("UPDATE_CONTENTS_FIELD", []);
		
		/*
		var callback = function(data){
			alert("회원가입이 되었습니다.\n로그인 이후에 사용해 주십시오.");
			location.href = "/login.do";
		};
		
		var param = {
					bizRecharger : $("#bizRecharger").val()
					, bizName : $("#bizName").val()
					, bizNo : $("#bizNo").val()
					, bizCategory : $("#bizCategory option:selected").val()
					, bizSubject : $("#bizSubject").val()
					, bizPhone : $("#bizPhone01").val()+"-"+$("#bizPhone02").val()+"-"+$("#bizPhone03").val()
					, bizEmail : $("#bizEmail").val() 
					, bizPost : $("#bizPost").val()
					, bizAddress1 : $("#bizAddress1").val()
					, bizAddress2 : $("#bizAddress2").val()
					, bizCopy : $("#bizCopy").val()
					, bizFonundation : $("#bizFonundation").val()
					, bizMen : $("#bizMen").val()
					, bizList : $("#bizList").val()
					, bizForm : $("#bizForm").val()
					, bizCapital : $("#bizCapital").val()
					, bizSelling : $("#bizSelling").val()
					, bizVision : $("#bizVision").val()
					, bizHistory : $("#bizHistory").val()
					, bizFax : $("#bizFax01").val()+"-"+$("#bizFax02").val()+"-"+$("#bizFax03").val()
					, bizHome : $("#bizHome").val()
					, bizLogo : $("#bizLogo").val()
					, photo1 : $("#photo1").val()
					, photo2 : $("#photo2").val()
					, photo3 : $("#photo3").val()
					, photo4 : $("#photo4").val()
					, manager : "yes"
					, lat : ""
					, lng : ""
					, admit : "0"
					, orderView : "128"
					, kind : "G"
					, uid : $("#uid").val()
					, passwd : $("#passwd").val()
					, name : $("#name").val()
					, hphone : hphone
					, birth : ""
					, sex : sex
					, useMail : useMail
					, useSms : useSms
					, email : $("#email").val()
					, pChk : "yes"
					, type : "2"
					, hit : 0
					, memo : ""
					, addrCoord : ""
					, memoCoord : ""
					, typeR2 : ""
					, aInsert : "no"
					, phone : $("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val()
					, post : $("#post").val()
					, address1 : $("#address1").val()
					, address2 : $("#address2").val()
				};
		ajax('post', '/registNetfuMember.ajax', param, callback);
		*/
		
		$("#bizEmail").val(bizEmail);
		$("#bizPhone").val(bizPhone);
		$("#bizFax").val(bizFax);
		if (!$("#bizMen").val())	$("#bizMen").val(0);

		$("#email").val(email);
		$("#birth").val(birth);
		$("#hphone").val(hphone);

		$("#mainForm").attr("action", "/registNetfuCompanyProcess.do");
		$("#mainForm").submit();
	}
	
	
	function fileUpload(uploadFileName, uploadImgName, formName){
		
		var formData = new FormData($("#"+formName)[0]);
		var callback = function(data){

			$("#"+uploadFileName).val(data.attachFileName);
			
			$("#"+uploadImgName).attr("src", "peg/"+data.attachFileName);
			
		};
		ajaxFileUpload('post', '/fileUplad.ajax', formData, callback);
	}
</script>



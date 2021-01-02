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
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<style></style>
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
				<li><a href="#none" title="고객센터">고객센터</a></li>
			</ul>
		</div>
		<div id="registerWrap">
			<div id="registerArea">
				<div class="registertext">
					<h4>기업회원가입</h4>
					<p>
						올워크 모든회원의 가입은 <span class="bold">무료</span>입니다.
					</p>
				</div>
					<fieldset>
						<legend>회원가입</legend>
						<div class="tab">
							<span class="btn_persnal"><input id="memberJoin" type="radio" name="memberJoin" onClick="location.href='personJoin.do'" />&nbsp;개인회원</span>
							<span class="btn_company"><input id="memberJoin" type="radio" name="memberJoin" checked="checked" />&nbsp;기업회원</label></span>
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
									<tr>
										<th>대표자명(CEO)<span class="necessary">*</span></th>
										<td><input id="bizRecharger" type="text" name="bizRecharger" title="이름" /></td>
									</tr>
									<tr>
										<th>회사명<span class="necessary">*</span></th>
										<td><input id="bizName" type="text" name="bizName" title="아이디" /></td>
									</tr>
									<tr class="companyNum">
										<th>사업자번호<span class="necessary">*</span></th>
										<td>
											 <select id="bizCopy" name="bizCopy">
												<option value="N">개인사업자</option>
												<option value="Y">법인사업자</option>
											</select>
											<span><input type="text" id="bizNo" name="bizNo" /></span>
											<span><input type="submit" id="btuChkDupBizNo" name="btuChkDupBizNo" value="중복확인" title="중복확인" /></span>
										</td>
									</tr>
									<tr>
										<th>업종<span class="necessary">*</span></th>
										<td>
											<select id="bizCategory" name="bizCategory">
												<option value="">선택</option>
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
												<option value="">선택</option>
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
												<option value="">선택</option>
												<c:forEach var="result" items="${bizFormList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr class="businessDesc">
										<th>주요사업내용<span class="necessary">*</span></th>
										<td><input type="text" name="bizSubject" id="bizSubject" value="" /> <span class="comment">예 : 네트워크 트래픽 관리제품 개발 및 판매</span></td>
									</tr>
									<tr class="companyPhone">
										<th>대표번호<span class="necessary">*</span></th>
										<td>
											<span><input id="bizPhone1" type="text" name="bizPhone1" numberOnly /><label for="bizPhone1">&nbsp;-</label></span>
											<span><input id="bizPhone2" type="text" name="bizPhone2" numberOnly /><label for="bizPhone2">&nbsp;-</label></span>
											<span><input id="bizPhone3" type="text" name="bizPhone3" numberOnly /><label for="bizPhone3"></label></span>
											<input type="hidden" name="bizPhone" id="bizPhone" value="" />
										</td>
									</tr>
									<tr class="companyFax">
										<th>팩스번호</th>
										<td>
											<span><input id="bizFax1" type="text" name="bizFax1" numberOnly /></span><span>&nbsp;-</span>
											<span><input id="bizFax2" type="text" name="bizFax2" numberOnly /></span><span>&nbsp;-</span>
											<span><input id="bizFax3" type="text" name="bizFax3" numberOnly /></span>
											<input type="hidden" name="bizFax" id="bizFax" value="" />
										</td>
									</tr>
									<tr class="email">
										<th>이메일<span class="necessary">*</span></th>
										<td>
											<span><input id="bizEmailId" type="text" name="bizEmailId" value="" title="아이디만 입력"/></span>
											<span>&nbsp;@&nbsp;</span><span><input id="bizEmailHost" type="text" name="bizEmailHost" value="" title="이메일 주소 선택"/></span>
											<span>
												<select id="selBizEmailHost" name="selBizEmailHost" title="이메일 선택">
													<option value="">직접입력</option>
													<option value="gmail.com">gmail.com</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="nate.com">nate.com</option>
												</select>
											</span>
											<input type="hidden" name="bizEmail" id="bizEmail" value="" />
										</td>
									</tr>
									<tr>
										<th>홈페이지</th>
										<td>
											<span><input type="text" id="bizHome" name="bizHome"/></span>
										</td>
									</tr>
									<tr class="address">
										<th>회사주소<span class="necessary">*</span></th>
										<td>
											<p class="postNumber">
												<input id="bizPost" type="text" name="bizPost" title="우편번호01" readonly />&nbsp;<input type="submit" id="searchBizAddress" value="주소찾기" title="주소찾기" />
											</p>
											<p>
												<input id="bizAddress1" type="text" name="bizAddress1" title="주소01" readonly />
											</p>
											<p>
												<input id="bizAddress2" type="text" name="bizAddress2" title="주소02" />
											</p>
										</td>
									</tr>
									<tr>
										<th>설립년도</th>
										<td>
											<span><input type="text" id="bizFonundation" name="bizFonundation" numberOnly /></span>&nbsp;년 설립
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
											<span><input type="text" id="bizCapital" name="bizCapital" /></span>&nbsp;원 (예:3억5천만)
										</td>
									</tr>
									<tr>
										<th>매출액</th>
										<td>
											<span><input type="text" id="bizSelling" name="bizSelling" /></span>&nbsp;원 (예:3억5천만)
										</td>
									</tr>
									<tr class="logoArea">
										<th>회사로고</th>
										<td>
											<p class="imgPart"><img id="logoImg" name="logoImg" src="/img/myCompany/noimage.jpg" alt="회사로고"/></p>
											<p class="descPart">
												<form name="fileUploadForm0" id="fileUploadForm0" method="post" enctype="multipart/form-data" accept-charset="EUC-KR">
													<span><input type="file" id="attachFile0" name="attachFile0" accept="image/gif, image/png, image/jpeg" onchange="javascript:fileUpload('bizLogo', 'logoImg', 'fileUploadForm0');"></span>
												</form>
												<input type="hidden" name="bizLogo" id="bizLogo" value=""/>
												<br/>
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
												<li>회사사진1
													<span>
														<form name="fileUploadForm1" id="fileUploadForm1" method="post" enctype="multipart/form-data" accept-charset="EUC-KR">
															<span><input type="file" id="attachFile1" name="attachFile1" accept="image/gif, image/png, image/jpeg" onchange="javascript:fileUpload('photo1', 'photoImg1', 'fileUploadForm1');"></span>
														</form>
														<input type="hidden" name="photo1" id="photo1" value=""/>
													</span>
												</li>
												<li>회사사진2
													<span>
														<form name="fileUploadForm2" id="fileUploadForm2" method="post" enctype="multipart/form-data" accept-charset="EUC-KR">
															<span><input type="file" id="attachFile2" name="attachFile2" accept="image/gif, image/png, image/jpeg" onchange="javascript:fileUpload('photo2', 'photoImg2', 'fileUploadForm2');"></span>
														</form>
														<input type="hidden" name="photo2" id="photo2" value=""/>
													</span>
												</li>
												<li>회사사진3
													<span>
														<form name="fileUploadForm3" id="fileUploadForm3" method="post" enctype="multipart/form-data" accept-charset="EUC-KR">
															<span><input type="file" id="attachFile3" name="attachFile3" accept="image/gif, image/png, image/jpeg" onchange="javascript:fileUpload('photo3', 'photoImg3', 'fileUploadForm3');"></span>
														</form>
														<input type="hidden" name="photo3" id="photo3" value=""/>
													</span>
												</li>
												<li>회사사진4
													<span>
														<form name="fileUploadForm4" id="fileUploadForm4" method="post" enctype="multipart/form-data" accept-charset="EUC-KR">
															<span><input type="file" id="attachFile4" name="attachFile4" accept="image/gif, image/png, image/jpeg" onchange="javascript:fileUpload('photo4', 'photoImg4', 'fileUploadForm4');"></span>
														</form>
														<input type="hidden" name="photo4" id="photo4" value=""/>
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
										<td><input id="name" type="text" name="name" title="이름" /></td>
									</tr>
									<tr>
										<th>아이디<span class="necessary">*</span></th>
										<td>
											<input id="uid" type="text" name="uid" title="아이디" value=""/>
											<input id="btuChkDupUid" type="submit" value="중복확인" title="중복확인"/>
											<span class="comment">영문과 숫자를 조합하여 4~20자 이내로 입력하세요.</span>
										</td>
									</tr>
									<tr>
										<th>비밀번호<span class="necessary">*</span></th>
										<td><input id="passwd" type="password" name="passwd" title="비밀번호" /> <span class="comment">비밀번호는 6~16자 영문, 숫자를 조합하여 사용할 수 있습니다.</span></td>
									</tr>
									<tr>
										<th>비밀번호 확인<span class="necessary">*</span></th>
										<td><input id="passwdConfirm" type="password" name="passwdConfirm" title="비밀번호확" /> <span class="comment">비밀번호 확인을 위해 다시 한 번 입력해 주시기 바랍니다.</span></td>
									</tr>
									<tr class="birthday">
										<th>생년월일<span class="necessary">*</span></th>
										<td>
											<span><input id="year" type="text" name="year" value="" maxlength="4" numberOnly /><label for="year">&nbsp;년</label></span>
											<span><input id="month" type="text" name="month" value="" maxlength="2" numberOnly /><label for="month">&nbsp;월</label></span>
											<span><input id="day" type="text" name="day" value="" maxlength="2" numberOnly /><label for="day">&nbsp;일</label></span>
											<input type="hidden" name="birth" id="birth" value="" />
										</td>
									</tr>
									<tr>
										<th>성별<span class="necessary">*</span></th>
										<td>
											<span>&nbsp;<input id="man" type="radio" name="sex" value="man" checked="checked"/>남자</span>
											<span>&nbsp;<input id="woman" type="radio" name="sex" value="woman" />여자</span>
										</td>
									</tr>
									<tr class="email">
										<th>이메일<span class="necessary">*</span></th>
										<td>
											<span><input id="emailId" type="text" name="emailId" value="" title="아이디만 입력"/></span>
											<span>&nbsp;@&nbsp;</span><span><input id="emailHost" type="text" name="emailHost" value="" title="이메일 주소 선택"/></span>
											<span>
												<select id="selEmailHost" name="selEmailHost" title="이메일 선택">
													<option value="">직접입력</option>
													<option value="gmail.com">gmail.com</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="nate.com">nate.com</option>
												</select>
											</span>
											<input type="hidden" name="email" id="email" value="" />
										</td>
									</tr>
									<tr>
										<th>이메일 수신여부<span class="necessary">*</span></th>
										<td>
											<span><input type="radio" id="useMail" name="useMail" value="yes" checked="checked"/>예</span>
											<span><input type="radio" id="useMail" name="useMail" value="no"/>아니오</span>
										</td>
									</tr>
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
									<tr>
										<th>SNS 수신여부</th>
										<td>
											<span><input type="radio" id="useSms" name="useSms" value="yes" checked="checked"/>예</span>
											<span><input type="radio" id="useSms" name="useSms" value="no"/>아니오</span>
										</td>
									</tr>
									<tr class="phone">
									<th>연락처</th>
										<td>
											<span><input type="text" id="phone1" name="phone1"/></span><span>&nbsp;-</span>
											<span><input type="text" id="phone2" name="phone2"/></span><span>&nbsp;-</span>
											<span><input type="text" id="phone3" name="phone3"/></span>
										</td>
									</tr>
									<tr class="address">
									<th>주소<span class="necessary">*</span></th>
										<td>
											<p class="postNumber"><input id="post" type="text" name="post" title="우편번호01" readonly/>&nbsp;<input type="submit" id="searchAddress" value="중복확인" title="중복확인"/></p>
											<p><input id="address1" type="text" name="address1" title="주소01" readonly/></p>
											<p><input id="address2" type="text" name="address2" title="주소02"/></p>
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
									<span class="agreeDesc01"><jsp:include page="/memberAgree1.do" /></span>
								</li>
								<li class="descArea"><span class="desc">
									<input id="agree02" type="checkbox" name="agree02" />&nbsp;<label for="agree02">[필수] 개인정보 수집 및 이용 동의</label></span>
									<span class="descBtn"><input id="desc_Btn02" type="button" name="desc_Btn02" value="내용보기 ∨" /></span>
									<span class="agreeDesc02"><jsp:include page="/memberAgree2.do" /></span>
								</li>
								<li><span><input id="agree03" type="checkbox" name="agree03" />&nbsp;<label for="agree03">[선택] 마케팅 정보 이메일 수신 동의</label></span></li>
								<li><span><input id="agree04" type="checkbox" name="agree04" />&nbsp;<label for="agree04">[선택] 마케팅 정보 SMS 수신 동의</label></span></li>
							</ol>
						</div>
					</fieldset>
				<div class="agree_ok">
					<ul>
						<li><a href="#" title="취소">취소</a></li>
						<li><a href="#" title="가입하기">가입하기</a></li>
					</ul>
				</div>
			</div>
		</div>
<input type="hidden" name="chkDupChk" id="chkDupChk" value="N" />
<input type="hidden" name="chkDupBizNoChk" id="chkDupBizNoChk" value="N" />
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
		
		$(".agree_ok").find("a:eq(0)").on("click", function(e){
			e.preventDefault();
			location.href = "/index.do";
		});
		
		$(".agree_ok").find("a:eq(1)").on("click", function(e){
			e.preventDefault();
			goRegistMember();
		});
		
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
			alertAndFocus("이름을 입력하세요.", $("#bizRecharger"));
			return;
		}
		
		if(checkNull($("#bizName").val())){
			alertAndFocus("회사명을 입력하세요.", $("#bizName"));
			return;
		}
		
		if(checkNull($("#bizNo").val())){
			alertAndFocus("사업자 번호를 입력하세요.", $("#bizNo"));
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
		
		if(checkNull($("#bizPhone1").val())){
			alertAndFocus("대표번호를 입력하세요.", $("#bizPhone1"));
			return;
		}
		
		if(checkNull($("#bizPhone2").val())){
			alertAndFocus("대표번호를 입력하세요.", $("#bizPhone2"));
			return;
		}
		
		if(checkNull($("#bizPhone3").val())){
			alertAndFocus("대표번호를 입력하세요.", $("#bizPhone3"));
			return;
		}
		
		if(checkNull($("#bizEmailId").val())){
			alertAndFocus("기업 이메일 ID를 입력하세요.", $("#bizEmailId"));
			return;
		}
		
		if(checkNull($("#bizEmailHost").val())){
			alertAndFocus("기업 이메일 종류를 입력하세요.", $("#bizEmailHost"));
			return;
		}
		
		$("#bizEmail").val($("#bizEmailId").val()+"@"+$("#bizEmailHost").val());
		
		if(!validateEmail($("#bizEmail").val())){
			alertAndFocus("기업 이메일 정보를 확인하세요.", $("#bizEmailId"));
			return;
		}
		
		if(checkNull($("#bizEmailHost").val())){
			alertAndFocus("기업 이메일 종류를 입력하세요.", $("#bizEmailHost"));
			return;
		}
		
		if(checkNull($("#bizPost").val())){
			alertAndFocus("회사 주소를 선택하세요.", $("#bizPost"));
			return;
		}
		
		if(checkNull($("#bizAddress1").val())){
			alertAndFocus("회사 주소를 선택하세요.", $("#bizAddress1"));
			return;
		}
		
		if(checkNull($("#uid").val())){
			alertAndFocus("아이디를 입력하세요.", $("#uid"));
			return;
		}
		
		if($("#chkDupChk").val() != "Y"){
			alert("아이디 중복확인은 필수 입니다.");
			return;
		}
		
		if(checkNull($("#passwd").val())){
			alertAndFocus("비밀번호를 입력하세요.", $("#passwd"));
			return;
		}
		
		if(checkNull($("#passwdConfirm").val())){
			alertAndFocus("비밀번호 확인을 입력하세요.", $("#passwdConfirm"));
			return;
		}
		
		/* if(!chkPwd($("#passwd").val())){
			alertAndFocus("비밀번호는 6~16자 영문, 숫자를 조합하여 사용할 수 있습니다.\n비밀번호를 확인하세요.", $("#passwd"));
			return;
		} */
		
		if($("#passwd").val() != $("#passwdConfirm").val()){
			alertAndFocus("비밀번호와 비밀번호 확인정보가 일치하지 않습니다.", $("#passwdConfirm"));
			return;
		}
		
		if(checkNull($("#year").val())){
			alertAndFocus("출생년도를 입력하세요.", $("#year"));
			return;
		}
		
		if($("#year").val().length != 4){
			alertAndFocus("출생년도를 확인하세요.", $("#year"));
			return;
		}
		
		if(checkNull($("#month").val())){
			alertAndFocus("출생월를 입력하세요.", $("#month"));
			return;
		}
		
		if($("#month").val().length == 1){
			$("#month").val(fillZero($("#month").val(), 2));
		}
		
		if(checkNull($("#day").val())){
			alertAndFocus("출생일를 입력하세요.", $("#day"));
			return;
		}
		
		if($("#day").val().length == 1){
			$("#day").val(fillZero($("#day").val(), 2));
		}
		
		var sex = $("input[name=sex]:checked").val();
		sex = (isEmpty(sex) ? "man" : sex);
		
		if(checkNull($("#emailId").val())){
			alertAndFocus("이메일 ID를 입력하세요.", $("#emailId"));
			return;
		}
		
		if(checkNull($("#emailHost").val())){
			alertAndFocus("이메일 종류를 입력하세요.", $("#emailHost"));
			return;
		}
		
		$("#email").val($("#emailId").val()+"@"+$("#emailHost").val());
		
		if(!validateEmail($("#email").val())){
			alertAndFocus("이메일 정보를 확인하세요.", $("#emailId"));
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
		
		var useMail = $("input[name=useMail]:checked").val();
		useMail = (isEmpty(useMail) ? "yes" : useMail);
		
		var useSms = $("input[name=useSms]:checked").val();
		useSms = (isEmpty(useSms) ? "yes" : useSms);
		
		loadingOn();
		
		bizVision_object.getById["bizVision"].exec("UPDATE_CONTENTS_FIELD", []);
		bizHistory_object.getById["bizHistory"].exec("UPDATE_CONTENTS_FIELD", []);
		
		var callback = function(data){
			alert("저장 되었습니다.");
			location.href = "/login.do";
		};
		
		var param = {
					bizRecharger : $("#bizRecharger").val()
					, bizName : $("#bizName").val()
					, bizNo : $("#bizNo").val()
					, bizCategory : $("#bizCategory option:selected").val()
					, bizSubject : $("#bizSubject").val()
					, bizPhone : $("#bizPhone1").val()+"-"+$("#bizPhone2").val()+"-"+$("#bizPhone3").val()
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
					, bizFax : $("#bizFax1").val()+"-"+$("#bizFax2").val()+"-"+$("#bizFax3").val()
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
					, hphone : $("#hphone").val()
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
	}
	
	
	function fileUpload(uploadFileName, uploadImgName, formName){
		
		var formData = new FormData($("#"+formName)[0]);
		var callback = function(data){

			$("#"+uploadFileName).val(data.attachFileName);
			
			$("#"+uploadImgName).attr("src", "/peg/"+data.attachFileName);
			
		};
		ajaxFileUpload('post', '/fileUplad.ajax', formData, callback);
	}
</script>



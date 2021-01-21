<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/myCompany.css"/>

<!-- Daum 주소검색 사용. -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<!-- Smart Editor 2 사용. -->
<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/companySubMenu.do" />
		</div>
		<div id="rightPart">
			<h4>기업정보수정</h4>
			<form id="mainForm" name="mainForm" action="javascript:goUpdateCompanyInfo();" method="post" enctype="multipart/form-data" >
				<fieldset>
				<legend>기업정보수정</legend>
				<div class="myCompanyBox01">
					<table>
						<caption>기업정보<span>*표시는 필수 입력사항</span></caption>
						<tbody>
							<c:if test="${rstCnt < 1 }">
								<tr>
									<th colspan=2><span class="necessary">오류가 발생해서 기업정보를 수정하지 못했습니다.</span></th>
								</tr>
							</c:if>

							<tr>
								<th>대표자 이름(CEO)<span class="necessary">*</span></th>
								<td><input id="bizRecharger" type="text" name="bizRecharger" title="대표자 이름" maxlength=100 value="${map.bizRecharger}" /></td>
							</tr>
							<tr>
								<th>회사명<span class="necessary">*</span></th>
								<td>
									<input id="bizName" type="text" name="bizName" title="회사명" maxlength=100 value="${map.bizName}" />
								</td>
							</tr>
							<tr class="companyNum">
								<th>사업자번호<span class="necessary">*</span></th>
								<td>
									<select id="bizCopy" name="bizCopy" value="${map.bizCopy}" >
										<option value="">-- 기업종류 --</option>
										<option value="N">개인사업자</option>
										<option value="Y">법인사업자</option>
									</select>
									<span><input type="text" id="bizNo" name="bizNo" maxlength=20 value="${map.bizNo}" /></span>
								</td>
							</tr>
							<tr>
								<th>업종<span class="necessary">*</span></th>
								<td>
									<select id="bizCategory" name="bizCategory" style="width: 300px">
										<option value="">-- 업종 선택 --</option>
										<c:forEach var="result" items="${businesstypeList}" varStatus="status">
											<option value="${result.code}">${result.name}</option>
										</c:forEach>
										<!-- 
										<option value="IA000000">제조·생산·화학업</option>
										<option value="IB000000">IT·정보통신업</option>
										<option value="IC000000">건설유통·무역·판매현장</option>
										<option value="ID000000">의료·제약</option>
										<option value="IE000000">미디어·광고·디자인</option>
										<option value="IF000000">금융·교육업</option>
										<option value="IG000000">건설·건축</option>
										<option value="IH000000">서비스업</option>
										<option value="II000000">기관·협회</option>
										<option value="IJ000000">기타</option>
										<option value="PA000000">건설현장</option>
										<option value="PB000000">물류/택배/배송</option>
										<option value="PC000000">운전</option>
										<option value="PD000000">경비/주차</option>
										<option value="PE000000">IT 프로그래머</option>
										<option value="PF000000">카페/베이커리</option>
										<option value="PG000000">음식점 주방/서빙</option>
										<option value="PH000000">음식배달</option>
										<option value="PI000000">사무/회계</option>
										<option value="PJ000000">간병</option>
										<option value="PK000000">강사/교육</option>
										<option value="PL000000">판매/도소매</option>
										<option value="PM000000">창고관리</option>
										<option value="PN000000">호텔/숙박업</option>
										<option value="PO000000">생산/제조</option>
										<option value="PP000000">영업/상담</option>
										<option value="PQ000000">농업/임업/축산업</option>
										<option value="PR000000">단순노무/기타 서비스</option>
										 -->
									</select>
								</td>
							</tr>
							<tr>
								<th>상장여부</th>
								<td>
									<select id="bizList" name="bizList" style="width: 300px">
										<option value="">-- 상장여부 선택 --</option>
										<c:forEach var="result" items="${bizList}" varStatus="status">
											<option value="${result.code}">${result.name}</option>
										</c:forEach>
										<!-- 
										<option value="netfu_93272_44768">비상장</option>
										<option value="netfu_90584_92914">주권(유가증권) 상장</option>
										<option value="netfu_77922_41446">코스닥 상장</option>
										<option value="netfu_25081_13044">해외상장</option>
										<option value="netfu_36795_32453">해외상장법인 자회사</option>
										 -->
									</select>
								</td>
							</tr>
							<tr>
								<th>기업형태</th>
								<td>
									<select id="bizForm" name="bizForm" style="width: 300px">
										<option value="">-- 기업형태 선택 --</option>
										<c:forEach var="result" items="${bizFormList}" varStatus="status">
											<option value="${result.code}">${result.name}</option>
										</c:forEach>
										<!-- 
										<option value="netfu_35327_71639">중소기업(300명이하)</option>
										<option value="netfu_16206_44500">중견기업(300명이상)</option>
										<option value="netfu_50679_24887">대기업</option>
										<option value="netfu_33402_91408">대기업 자회사·계열사</option>
										<option value="netfu_80712_79474">벤처기업</option>
										<option value="netfu_51332_72999">외국계(외국 투자기업)</option>
										<option value="netfu_98124_19689">외국계(외국 법인기업)</option>
										<option value="netfu_38681_98483">국내공공기관·공기업</option>
										<option value="netfu_86919_52911">국내 비영리단체·협회·교육재단</option>
										<option value="netfu_35587_23806">외국기관·비영리기구·단체</option>
										 -->
									</select>
								</td>
							</tr>
							<tr class="businessDesc">
								<th>주요사업내용<span class="necessary">*</span></th>
								<td>
									<input type="text" id="bizSubject" name="bizSubject" maxlength=20 value="${map.bizSubject }"/>
									<span class="comment">&nbsp;&nbsp;&nbsp;예 : 네트워크 트래픽 관리제품 개발 및 판매</span>
								</td>
							</tr>
							<tr class="companyPhone">
								<th>대표번호<span class="necessary">*</span></th>
								<td>
									<span><input type="text" id="bizPhone01" name="bizPhone01" maxlength=3 /></span><span>&nbsp;-</span>
									<span><input type="text" id="bizPhone02" name="bizPhone02" maxlength=4 /></span><span>&nbsp;-</span>
									<span><input type="text" id="bizPhone03" name="bizPhone03" maxlength=4 /></span>
								</td>
							</tr>
							<tr class="companyFax">
								<th>팩스번호</th>
								<td>
									<span><input type="text" id="bizFax01" name="bizFax01" maxlength=3 /></span><span>&nbsp;-</span>
									<span><input type="text" id="bizFax02" name="bizFax02" maxlength=4 /></span><span>&nbsp;-</span>
									<span><input type="text" id="bizFax03" name="bizFax03" maxlength=4 /></span>
								</td>
							</tr>
							<tr class="email">
								<th>이메일<span class="necessary">*</span></th>
								<td>
									<span><input id="bizEmailId" type="text" name="bizEmailId" title="아이디만 입력" maxlength=20 /></span>
									<span>&nbsp;@&nbsp;</span><span><input id="bizEmailHost" type="text" name="bizEmailHost" title="이메일 주소 선택" maxlength=30 /></span>
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
							<tr>
								<th>홈페이지</th>
								<td>
									<span><input type="text" id="bizHome" name="bizHome" maxlength=100 value="${map.bizHome }" /></span>
								</td>
							</tr>
							<tr class="address">
								<th>회사주소<span class="necessary">*</span></th>
								<td>
									<p class="postNumber">
										<input id="bizPost" type="text" name="bizPost" title="우편번호01" readonly maxlength=7 value="${map.bizPost }" />&nbsp;<input type="submit" id="searchAddress" value="주소찾기" title="주소찾기" />
									</p>
									<p>
										<input id="bizAddress1" type="text" name="bizAddress1" title="주소01" readonly maxlength=100 value="${map.bizAddress1 }" />
									</p>
									<p>
										<input id="bizAddress2" type="text" name="bizAddress2" title="주소02" maxlength=100 value="${map.bizAddress2 }" />
									</p>
								</td>
							</tr>
							<tr>
								<th>설립년도</th>
								<td>
									<span><input type="text" id="bizFonundation" name="bizFonundation" maxlength=5 value="${map.bizFonundation }"/></span>&nbsp;년 설립
								</td>
							</tr>
							<tr>
								<th>사원수</th>
								<td>
									<span><input type="text" id="bizMen" name="bizMen" value="${map.bizMen }"/></span>&nbsp;명 (예:200)
								</td>
							</tr>
							<tr>
							<th>자본금</th>
								<td>
									<span><input type="text" id="bizCapital" name="bizCapital" maxlength=50 value="${map.bizCapital}"/></span>&nbsp;원 (예:3억5천만)
								</td>
							</tr>
							<tr>
								<th>매출액</th>
								<td>
									<span><input type="text" id="bizSelling" name="bizSelling" maxlength=50 value="${map.bizSelling }"/></span>&nbsp;원 (예:3억5천만)
								</td>
							</tr>
							<tr class="logoArea">
								<th>회사로고</th>
								<td>
								<c:if test="${map.bizLogo == null || map.bizLogo == '' }">
									<p class="imgPart"><img src="img/myCompany/noimage.jpg" alt="회사로고"/></p>
								</c:if>
								<c:if test="${map.bizLogo != null && map.bizLogo != '' }">
									<p class="imgPart"><img src="allwork/peg/${map.bizLogo}" alt="회사 로고"/></p>
								</c:if>
									<p class="descPart">
										<span><input type="file" id="fileLogo" name="fileLogo" /></span><br/>
										<span>
											※ 이미지 파일형식은 확장자 *.jpg, *.gif만 가능합니다.<br/>
											※ 로고 이미지 권장사이즈는 가로120 * 세로 134입니다.
										</span>
									</p>
								</td>
							</tr>
							<tr class="comPhoto">
							<th>회사사진</th>
								<td>
									<ul class="imgArea">
									<c:if test="${map.photo1 == null || map.photo1 == '' }">
										<li><img src="img/myCompany/noimage.jpg" alt="회사 이미지 1"/></li>
									</c:if>
									<c:if test="${map.photo1 != null && map.photo1 != '' }">
										<li><img src="allwork/peg/${map.photo1}" alt="회사 이미지 1" /></li>
									</c:if>
									
									<c:if test="${map.photo2 == null || map.photo2 == '' }">
										<li><img src="img/myCompany/noimage.jpg" alt="회사 이미지 2"/></li>
									</c:if>
									<c:if test="${map.photo2 != null && map.photo2 != '' }">
										<li><img src="allwork/peg/${map.photo2}" alt="회사 이미지 2" /></li>
									</c:if>
									
									<c:if test="${map.photo3 == null || map.photo3 == '' }">
										<li><img src="img/myCompany/noimage.jpg" alt="회사 이미지 3"/></li>
									</c:if>
									<c:if test="${map.photo3 != null && map.photo3 != '' }">
										<li><img src="allwork/peg/${map.photo3}" alt="회사 이미지 3" /></li>
									</c:if>
									
									<c:if test="${map.photo4 == null || map.photo4 == '' }">
										<li><img src="img/myCompany/noimage.jpg" alt="회사 이미지 4"/></li>
									</c:if>
									<c:if test="${map.photo4 != null && map.photo4 != '' }">
										<li><img src="allwork/peg/${map.photo4}" alt="회사 이미지 4" /></li>
									</c:if>
									</ul>
									<ul class="upLoadArea">
										<li>
										회사사진1<span><input type="file" id="filePhoto1" name="filePhoto1" /></span>
										</li>
										<li>
										회사사진2<span><input type="file" id="filePhoto2" name="filePhoto2" /></span>
										</li>
										<li>
										회사사진3<span><input type="file" id="filePhoto3" name="filePhoto3" /></span>
										</li>
										<li>
										회사사진4<span><input type="file" id="filePhoto4" name="filePhoto4" /></span>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th>기업개요/비전</th>
								<td>
									<textarea id="bizVision" name="bizVision">${map.bizVision}</textarea>
								</td>
							</tr>
							<tr class="history">
								<th>연혁/실적</th>
								<td>
									<textarea id="bizHistory" name="bizHistory">${map.bizHistory}</textarea>
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
					<input type="hidden" name="uid" id="uid" value="${SE_LOGIN_ID }" />
					<input type="hidden" name="bizEmail" id="bizEmail" value="${map.bizEmail}" />
					<input type="hidden" name="bizPhone" id="bizPhone" value="${map.bizPhone}" />
					<input type="hidden" name="bizFax" id="bizFax" value="${map.bizFax}" />
					<input type="hidden" name="bizLogo" id="bizLogo" value="${map.bizLogo}" />
					<input type="hidden" name="photo1" id="photo1" value="${map.photo1}" />
					<input type="hidden" name="photo2" id="photo2" value="${map.photo2}" />
					<input type="hidden" name="photo3" id="photo3" value="${map.photo3}" />
					<input type="hidden" name="photo4" id="photo4" value="${map.photo4}" />
				</fieldset>
			</form>
			<div class="agree_ok">
				<ul>
					<!-- 
					<li><a href="#none" title="취소">취소</a></li>
					 -->
					<li><a href="javascript:goUpdateCompanyInfo();" title="수정하기">수정하기</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />

<script type="text/javascript">

	var bizVision_object = [];
	var bizHistory_object = [];

	$(document).ready(function(){
		//Smart Editor
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
	        }, 
	        fOnAppLoad : function(){
	            //textarea 내용을 에디터상에 바로 뿌려주고자 할때 사용
	            //bizVision_object.getById["bizVision"].exec("PASTE_HTML", [ "{map.bizVision}" ]);
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
	        }, 
	        fOnAppLoad : function(){
	            //textarea 내용을 에디터상에 바로 뿌려주고자 할때 사용
	            try {
		            //bizHistory_object.getById["bizHistory"].exec("PASTE_HTML", [ "{map.bizHistory}" ]);	            	
	            } catch(error) {
	            	console.log(error);
	            }
	        }
	    });

		//Daum 주소검색.
		$("#selEmailHost").on("change", function(e){
			if($(this).val() == ""){
				$("#bizEmailHost").css("background-color", "#FFFFFF");
				$("#bizEmailHost").attr("readonly",false);
			}else{
				$("#bizEmailHost").css("background-color", "#EAEAEA");
				$("#bizEmailHost").attr("readonly",true);
			}
			$("#bizEmailHost").val($(this).val());
		});

		$("#searchAddress").on("click", function(e){
			e.preventDefault();
			execDaumPostcode();
		});

		//이메일, 전화번호, FAX의 초기값 설정.
		var bizEmail = "${map.bizEmail}";
		if (bizEmail != null && bizEmail.length > 0) {
			var listEmail = bizEmail.split("@");
			if (listEmail.length > 0)	$("#bizEmailId").val(listEmail[0]);
			if (listEmail.length > 1)	$("#bizEmailHost").val(listEmail[1]);		
		}
		
		var bizPhone = "${map.bizPhone}";
		if (bizPhone != null && bizPhone.length > 0) {
			var listPhone = bizPhone.split("-");
			if (listPhone.length > 0)	$("#bizPhone01").val(listPhone[0]);
			if (listPhone.length > 1)	$("#bizPhone02").val(listPhone[1]);		
			if (listPhone.length > 2)	$("#bizPhone03").val(listPhone[2]);		
		}
		var bizFax = "${map.bizFax}";
		if (bizFax != null && bizFax.length > 0) {
			var listFax = bizFax.split("-");
			if (listFax.length > 0)	$("#bizFax01").val(listFax[0]);
			if (listFax.length > 1)	$("#bizFax02").val(listFax[1]);		
			if (listFax.length > 2)	$("#bizFax03").val(listFax[2]);		
		}
		
		//ComboBox 선택.
		$("#bizCopy").val("${map.bizCopy}").prop("selected", true);
		$("#bizCategory").val("${map.bizCategory}").prop("selected", true);
		$("#bizList").val("${map.bizList}").prop("selected", true);
		$("#bizForm").val("${map.bizForm}").prop("selected", true);

		//작업결과 Popup.
	<c:if test="${rstCnt == 1 }">
		alert("성공적으로 회원정보를 수정했습니다.");
		
		/*
		//홈 화면으로 이동.
		location.href = "/companyHome.do";
		*/
	</c:if>
	});

	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}

				if(data.userSelectedType === 'R'){
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraAddr += data.bname;
					}
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					if(extraAddr !== ''){
						extraAddr = ' (' + extraAddr + ')';
					}
				} else {
					//document.getElementById("sample6_extraAddress").value = '';
				}
				$("#bizPost").val(data.zonecode);
				$("#bizAddress1").val(addr);
				$("#bizAddress2").focus();
			}
		}).open();
	}

	function goUpdateCompanyInfo(){

		bizVision_object.getById["bizVision"].exec("UPDATE_CONTENTS_FIELD", []);
		bizHistory_object.getById["bizHistory"].exec("UPDATE_CONTENTS_FIELD", []);

		var bizEmail = $("#bizEmailId").val() + "@" + $("#bizEmailHost").val();
		var bizPhone = $("#bizPhone01").val() + "-" + $("#bizPhone02").val() + "-" + $("#bizPhone03").val();
		var bizFax = $("#bizFax01").val() + "-" + $("#bizFax02").val() + "-" + $("#bizFax03").val();

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
		if(checkNull($("#bizCategory").val())){
			alertAndFocus("업종을 선택하세요.", $("#bizCategory"));
			return;
		}
		if(checkNull($("#bizSubject").val())){
			alertAndFocus("주요사업내용을 입력하세요.", $("#bizSubject"));
			return;
		}
		if(checkNull($("#bizPhone01").val()) || checkNull($("#bizPhone02").val()) || checkNull($("#bizPhone03").val())){
			alertAndFocus("대표연락처 번호를 입력하세요.", $("#bizPhone01"));
			return;
		}
		if(checkNull($("#bizEmailId").val()) || checkNull($("#bizEmailHost").val())){
			alertAndFocus("이메일을 입력하세요.", $("#bizEmailId"));
			return;
		}
		if(checkNull($("#bizPost").val()) || checkNull($("#bizAddress1").val())){
			alertAndFocus("주소를 입력하세요.", $("#bizPost"));
			return;
		}

		//$("#uid").val("${SE_LOGIN_ID }");
		$("#bizEmail").val(bizEmail);
		$("#bizPhone").val(bizPhone);
		$("#bizFax").val(bizFax);
		if (!$("#bizMen").val())	$("#bizMen").val(0);

		$("#mainForm").attr("action", "/companyModifyProcess.do");
		$("#mainForm").submit();
	}
	
</script>

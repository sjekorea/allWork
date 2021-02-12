<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!-- (begin) 2021.01.04 by s.yoo	-->
<link rel="stylesheet" type="text/css" href="/css/myPage.css"/>
<c:choose>
	<c:when test="${SE_LOGIN_STATUS}">
		<c:if test="${SE_USER_TYPE == 'company' }">
			<jsp:include page="/companyHeader.do"/>
			<style type="text/css">
				/*현재메뉴 언더라인*/
				#menuTree ul .subMenu05_01{text-decoration: underline;}
			</style>
		</c:if>

		<c:if test="${SE_USER_TYPE == 'person' }">
			<jsp:include page="/personHeader.do" />
			<style type="text/css">
				/*현재메뉴 언더라인*/
				#menuTree ul .subMenu07_01{text-decoration: underline;}
			</style>
		</c:if>
	</c:when>
	<c:otherwise>
			<jsp:include page="/indexHeader.do" />
	</c:otherwise>
</c:choose>
<!-- (end) 2021.01.04 by s.yoo	-->


<!-- Daum 주소검색 사용. -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
		<c:if test="${SE_USER_TYPE == 'company' }">
			<jsp:include page="/companySubMenu.do" />
		</c:if>
		<c:if test="${SE_USER_TYPE == 'person' }">
			<jsp:include page="/personSubMenu.do" />
		</c:if>
		</div>
		<div id="rightPart">
			<h4>회원정보수정<span>*표시는 필수 입력사항</span></h4>
			<form id="mainForm" name="mainForm" action="javascript:goUpdateMyInfo();" method="post" enctype="multipart/form-data" >
				<fieldset>
					<legend>회원정보 수정</legend>
					<div class="registerBox">
						<table>
							<caption>회원정보 수정</caption>
							<tbody>
							<c:if test="${rstCnt < 1 }">
								<tr>
									<th colspan=2><span class="necessary">오류가 발생해서 회원정보를 수정하지 못했습니다.</span></th>
								</tr>
							</c:if>

								<tr>
									<th>아이디</th>
									<td>${SE_LOGIN_ID }</td>
								</tr>
								<tr>
									<th>이름<span class="necessary">*</span></th>
									<td><input id="name" type="text" name="name" title="이름" placeholder="홍길동" maxlength=20 value="${map.name}" /></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td>
										<input id="passwd" type="password" name="passwd" title="비밀번호" maxlength=16 placeholder="********" />
										<span class="comment">비밀번호는 4~16자 영문, 숫자를 조합</span>
									</td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td>
										<input id="passwdRe" type="password" name="passwdRe" title="비밀번호확" placeholder="********" />
										<span class="comment">비밀번호 재입력</span>
									</td>
								</tr>
								<tr class="logoArea">
									<th>이력서 사진</th>
									<td>
									<c:if test="${map.photo == null || map.photo == '' }">
										<p class="imgPart"><img src="img/myCompany/noimage.jpg" alt="이력서 사진"/></p>
									</c:if>
									<c:if test="${map.photo != null && map.photo != '' }">
										<p class="imgPart"><img src="allwork/peg/${map.photo}" alt="이력서 사진" width=120 height=142/></p>
									</c:if>
										<p class="descPart">
											<span><input type="file" id="filePhoto" name="filePhoto" /><label for="filePhoto">파일선택</label></span><br/>
											<span>
												※ 이미지 파일형식은 확장자 *.jpg, *.gif만 가능합니다.<br/>
												※ 이력서 사진 권장사이즈는 가로 120 * 세로 142 입니다.
											</span>
										</p>
									</td>
								</tr>
	
								<!-- 
								<tr>
									<th>생년월일<span class="necessary">*</span></th>
									<td>
										<span><input id="year" type="text" name="year" /><label for="year">&nbsp;년</label></span>
										<span><input id="month" type="text" name="month"/><label for="month">&nbsp;월</label></span>
										<span><input id="day" type="text" name="day"/><label for="day">&nbsp;일</label></span>
									</td>
								</tr>
								 -->
								<tr>
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
										<th>직무<span class="necessary">*</span></th>
										<td>
											<select id="bizCategory" name="bizCategory">
												<option value="">-- 직무 선택 --</option>
												<c:forEach var="result" items="${businesstypeList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach>
											</select>
										</td>
									</tr>

								<tr>
									<th>성별<span class="necessary">*</span></th>
									<td>
									<c:if test="${map.sex == 'woman' }">
										<span class="male"><input id="gender_male" type="radio" name="sex" value="man" /><label for="gender_male">남자</label></span>
										<span class="female"><input id="gender_female" type="radio" name="sex" value="woman" checked="checked" /><label for="gender_female">여자</label></span>
									</c:if>
									<c:if test="${map.sex != 'woman' }">
										<span class="male"><input id="gender_male" type="radio" name="sex" value="man" checked="checked" /><label for="gender_male">남자</label></span>
										<span class="female"><input id="gender_female" type="radio" name="sex" value="woman" /><label for="gender_female">여자</label></span>
									</c:if>
									</td>
								</tr>
								<tr class="email">
									<th>이메일<span class="necessary">*</span></th>
									<td>
										<span><input id="emailId" type="text" name="emailId" title="아이디만 입력" maxlength=20 /></span>
										<span>&nbsp;@&nbsp;</span><span><input id="emailHost" type="text" name="emailHost" title="이메일 주소 선택" maxlength=30 /></span>
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
								<tr class="phone">
									<th>휴대폰 번호<span class="necessary">*</span></th>
									<!-- 
									<td><input id="hphone" type="text" name="hphone" title="휴대폰 번호" placeholder="010-1234-5678" value="${map.hphone}" /></td>
									 -->
									<td>
										<span><input type="text" id="phone1" name="phone1" maxlength=3 /></span><span>&nbsp;-</span>
										<span><input type="text" id="phone2" name="phone2" maxlength=4 /></span><span>&nbsp;-</span>
										<span><input type="text" id="phone3" name="phone3" maxlength=4 /></span>
									</td>
								</tr>
								<tr class="address">
									<th>주소<span class="necessary">*</span></th>
									<td>
										<p class="postNumber">
											<input id="post" type="text" name="post" title="우편번호01" readonly maxlength=10 value="${map.post }" />&nbsp;<input type="submit" id="searchAddress" value="주소찾기" title="주소찾기" />
										</p>
										<p>
											<input id="address1" type="text" name="address1" title="주소01" readonly maxlength=100 value="${map.address1 }" />
										</p>
										<p>
											<input id="address2" type="text" name="address2" title="주소02" maxlength=100 value="${map.address2 }" />
										</p>
									</td>
								</tr>
								<tr>
									<th>이메일 수신동의<span class="necessary">*</span></th>
									<td>
									<c:if test="${map.useMail == 'no' }">
										<span class="male"><input id="useMailYes" type="radio" name="useMail" value="yes" /><label for="useMailYes">예</label></span>
										<span class="female"><input id="useMailNo" type="radio" name="useMail" value="no" checked="checked" /><label for="useMailNo">아니오</label></span>
									</c:if>
									<c:if test="${map.useMail != 'no' }">
										<span class="male"><input id="useMailYes" type="radio" name="useMail" value="yes" checked="checked" /><label for="useMailYes">예</label></span>
										<span class="female"><input id="useMailNo" type="radio" name="useMail" value="no" /><label for="useMailNo">아니오</label></span>
									</c:if>
									</td>
								</tr>
								<tr>
									<th>SMS 수신동의<span class="necessary">*</span></th>
									<td>
									<c:if test="${map.useSms == 'no' }">
										<span class="male"><input id="useSmsYes" type="radio" name="useSms" value="yes" /><label for="useSmsYes">예</label></span>
										<span class="female"><input id="useSmsNo" type="radio" name="useSms" value="no" checked="checked" /><label for="useSmsNo">아니오</label></span>
									</c:if>
									<c:if test="${map.useSms != 'no' }">
										<span class="male"><input id="useSmsYes" type="radio" name="useSms" value="yes" checked="checked" /><label for="useSmsYes">예</label></span>
										<span class="female"><input id="useSmsNo" type="radio" name="useSms" value="no" /><label for="useSmsNo">아니오</label></span>
									</c:if>
									</td>
								</tr>
								<tr>
									<th>Push 수신동의<span class="necessary">*</span></th>
									<td>
									<c:if test="${map.usePush == 'no' }">
										<span class="male"><input id="usePushYes" type="radio" name="usePush" value="yes" /><label for="usePushYes">예</label></span>
										<span class="female"><input id="usePushNo" type="radio" name="usePush" value="no" checked="checked" /><label for="usePushNo">아니오</label></span>
									</c:if>
									<c:if test="${map.usePush != 'no' }">
										<span class="male"><input id="usePushYes" type="radio" name="usePush" value="yes" checked="checked" /><label for="usePushYes">예</label></span>
										<span class="female"><input id="usePushNo" type="radio" name="usePush" value="no" /><label for="usePushNo">아니오</label></span>
									</c:if>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<input type="hidden" name="uid" id="uid" value="${SE_LOGIN_ID }" />
					<input type="hidden" name="birth" id="birth" value="${map.birth}" />
					<input type="hidden" name="email" id="email" value="${map.email}" />
					<input type="hidden" name="hphone" id="hphone" value="${map.hphone}" />
					<input type="hidden" name="photo" id="photo" value="${map.photo}" />
				</fieldset>
			</form>
			<div class="agree_ok">
				<ul>
					<!-- 
					<li><a href="#none" title="취소">취소</a></li>
					 -->
					<li><a href="javascript:goUpdateMyInfo();" title="가입하기">수정하기</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />

<script type="text/javascript">

	$(document).ready(function(){
		
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
			execDaumPostcode();
		});

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

		//생년월일, 이메일, 전화번호의 초기값 설정.
		var email = "${map.email}";
		if (email != null && email.length > 0) {
			var listEmail = email.split("@");
			if (listEmail.length > 0)	$("#emailId").val(listEmail[0]);
			if (listEmail.length > 1)	$("#emailHost").val(listEmail[1]);		
		}
		
		var birth = "${map.birth}";
		if (birth != null && birth.length > 0) {
			var listBirth = birth.split("-");
			if (listBirth.length > 0)	$("#year").val(listBirth[0]);
			if (listBirth.length > 1) {
				listBirth[1] = (listBirth[1].length < 2)? ("0" + listBirth[1]) : ("" + listBirth[1]);
				$("#month").val(listBirth[1]);		
			}
			if (listBirth.length > 2) {
				listBirth[2] = (listBirth[2].length < 2)? ("0" + listBirth[2]) : ("" + listBirth[2]);
				$("#day").val(listBirth[2]);		
			}
		}
		
		var hphone = "${map.hphone}";
		if (hphone != null && hphone.length > 0) {
			var listPhone = hphone.split("-");
			if (listPhone.length > 0)	$("#phone1").val(listPhone[0]);
			if (listPhone.length > 1)	$("#phone2").val(listPhone[1]);		
			if (listPhone.length > 2)	$("#phone3").val(listPhone[2]);		
		}
		
		//직무
		$("#bizCategory").val("${map.bizCategory}");
		
		//작업결과 Popup.
	<c:if test="${rstCnt == 1 }">
		alert("성공적으로 회원정보를 수정했습니다.");
		
		/*
		//홈 화면으로 이동.
		<c:if test="${SE_USER_TYPE == 'company' }">
		location.href = "/companyHome.do";
		</c:if>

		<c:if test="${SE_USER_TYPE == 'person' }">
		location.href = "/personHome.do";
		</c:if>
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
				$("#post").val(data.zonecode);
				$("#address1").val(addr);
				$("#address2").focus();
			}
		}).open();
	}

	function goUpdateMyInfo(){

		var birth = $("#year").val() + "-" + $("#month").val() + "-" + $("#day").val();
		var email = $("#emailId").val() + "@" + $("#emailHost").val();
		var sex = $("input[name=sex]:checked").val();
		var hphone = $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val();
		var useMail = $("input[name=useMail]:checked").val();
		var useSms = $("input[name=useSms]:checked").val();
		var usePush = $("input[name=usePush]:checked").val();

		if(checkNull($("#name").val())){
			alertAndFocus("이름을 입력하세요.", $("#name"));
			return;
		}
		if(!checkNull($("#passwd").val()) && ( checkNull($("#passwd").val()) != checkNull($("#passwdRe").val()) )){
			alertAndFocus("비밀번호가 일치하지 않습니다.", $("#passwd"));
			return;
		}
		if(!checkNull($("#passwd").val()) && $("#passwd").val().length < 4){
			alertAndFocus("비밀번호는 4~16자 영문, 숫자를 조합하여 사용할 수 있습니다.\n비밀번호를 확인하세요.", $("#passwd"));
			return;
		}
		if(checkNull($("#year").val()) || checkNull($("#month").val()) || checkNull($("#day").val())){
			alertAndFocus("생년월일을 입력하세요.", $("#year"));
			return;
		}
		if((getNowYear() - $("#year").val() + 1) < 40){
			alert("개인회원은 40세 이상만 가입이 가능합니다.");
			return;
		}	
		if(checkNull($("#bizCategory").val())){
			alertAndFocus("직무를 선택하세요.", $("#bizCategory"));
			return;
		}
		if(checkNull(sex)){
			alertAndFocus("성별을 선택하세요.", $("#man"));
			return;
		}
		if(checkNull($("#emailId").val()) || checkNull($("#emailHost").val())){
			alertAndFocus("이메일을 입력하세요.", $("#emailId"));
			return;
		}
		if(checkNull($("#phone1").val()) || checkNull($("#phone2").val()) || checkNull($("#phone3").val())){
			alertAndFocus("휴대폰 번호를 입력하세요.", $("#phone1"));
			return;
		}
		if(checkNull(useSms)){
			alertAndFocus("SMS 수신동의를 선택하세요.", $("#useSmsYes"));
			return;
		}
		if(checkNull(usePush)){
			alertAndFocus("Push 수신동의를 선택하세요.", $("#usePushYes"));
			return;
		}
		if(checkNull($("#post").val()) || checkNull($("#address1").val())){
			alertAndFocus("주소를 입력하세요.", $("#post"));
			return;
		}

		//$("#uid").val("${SE_LOGIN_ID }");
		$("#email").val(email);
		$("#birth").val(birth);
		$("#hphone").val(hphone);
		$("#mainForm").attr("action", "/updateMyInfoProcess.do");
		$("#mainForm").submit();
	}
	
</script>

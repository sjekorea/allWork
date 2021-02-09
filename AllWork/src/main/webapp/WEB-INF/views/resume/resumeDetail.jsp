<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert"%>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert"%>

<c:choose>
	<c:when test="${SE_USER_TYPE eq 'person' }">
		<jsp:include page="/personHeader.do" />
	</c:when>
	<c:otherwise>
		<jsp:include page="/companyHeader.do" />
	</c:otherwise>
</c:choose>

<link rel="stylesheet" type="text/css" href="/css/resume_view.css" />

<div id="popupWrap_applyWrap" style="display: none;">
	<div id="popupWrap_apply">
		<div class="topArea">
			<p class="close_btn">
				<i class="fas fa-times"></i>
			</p>
			<p class="email_img">
				<i class="fas fa-envelope-open-text"></i>
			</p>
			<p>면접제의</p>
		</div>
		<div class="descArea">
			<p>구직자에게 ${SE_USER_NM }님의 채용공고가 전송됩니다.</p>
			<form>
			</form>
				<fieldset>
					<legend>면접 제의</legend>
					<ul class="title">
						<li>보내는 사람</li>
						<li>구직자</li>
						<li>면접요청 메시지</li>
						<li>채용공고</li>
						<!-- <li>첨부파일</li> -->
					</ul>
					<ul class="desc">
						<li>${companyMap.name }(${companyMap.email })</li>
						<li>${convert:getPersonNameHidden(memberMap.name, resumeMap.paidResume) }(${convert:getEmailHidden(memberMap.email, resumeMap.paidResume) })</li>
						<li><input type="text" id="resumeTitle" name="resumeTitle" value="" /></li>
						<li><select id="resumeSel" name="resumeSel">
								<c:forEach var="result" items="${recruitList}"
									varStatus="status">
									<option value="${result.no }">${result.bizTitle }</option>
								</c:forEach>
						</select></li>
						<!-- <li>
							<input id="res09_desc01"/><label for="res09_desc01_1">파일첨부</label><input id="res09_desc01_1" type="file"/>
						</li> -->
					</ul>
				</fieldset>
		</div>
		<div class="btnArea">
			<p class="a01">
				<a href="#" title="취소">취소</a>
			</p>
			<p class="a02">
				<a href="#" title="면접요청">면접요청</a>
			</p>
		</div>
	</div>
</div>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<div id="menuTree">
				<c:choose>
					<c:when test="${SE_USER_TYPE eq 'person' }">
						<jsp:include page="/personSubMenu.do" />
					</c:when>
					<c:otherwise>
						<jsp:include page="/companySubMenu.do" />
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div id="rightPart">
			<div id="resume00">
				<div id="detailArea">
					<p class="detail_title">기본정보</p>
					<div id="imgArea">
					<c:choose>
						<c:when test="${memberMap.photo != null and memberMap.photo != '' and SE_SERVICE2 eq 'Y' and resumeMap.paidResume == 1  }">
							<p>
								<img src="/allwork/peg/${memberMap.photo}" alt="이력서 사진" />
							</p>
						</c:when>
						<c:otherwise>
							<p>
								<img src="img/userNo.png" alt="본인사진" />
							</p>
						</c:otherwise>
					</c:choose>
					</div>
					<table>
						<caption>이력 등록하기</caption>
						<tbody class="tabelArea">
							<tr>
								<th class="table_title">이름</th>
								<td class="table_desc">
									<c:choose>
										<c:when test='${SE_LOGIN_ID eq resumeMap.uid}'>
											${memberMap.name} (${codeConvert:getBizSex(memberMap.sex)},${codeConvert:getBirthYear(memberMap.birth)}년생)/${memberMap.uid }
										</c:when>
										<c:otherwise>
											${convert:getPersonNameHidden(memberMap.name, resumeMap.paidResume) }(${codeConvert:getBizSex(memberMap.sex)},${codeConvert:getBirthYear(memberMap.birth)}년생)/${convert:getUidHidden(memberMap.uid, resumeMap.paidResume) }
										</c:otherwise>
									</c:choose>
									<!-- 
									${convert:getPersonNameHidden(memberMap.name, resumeMap.paidResume) }(${codeConvert:getBizSex(memberMap.sex)},${codeConvert:getBirthYear(memberMap.birth)}년생)/${convert:getUidHidden(memberMap.uid, resumeMap.paidResume) }
									 -->
								</td>
							</tr>
							<tr>
								<th class="table_title">이메일</th>
								<td class="table_desc">
									<c:choose>
										<c:when test='${SE_LOGIN_ID eq resumeMap.uid}'>
											${memberMap.email }
										</c:when>
										<c:otherwise>
											${convert:getEmailHidden(memberMap.email, resumeMap.paidResume) }
										</c:otherwise>
									</c:choose>
									<!-- 
									${convert:getEmailHidden(memberMap.email, resumeMap.paidResume) }
									 -->
								</td>
							</tr>
							<tr>
								<th class="table_title">휴대폰</th>
								<td class="table_desc">
									<c:choose>
										<c:when test='${SE_LOGIN_ID eq resumeMap.uid}'>
											${memberMap.hphone }
										</c:when>
										<c:otherwise>
											${convert:getPhoneNoHidden(memberMap.hphone, resumeMap.paidResume) }
										</c:otherwise>
									</c:choose>
									<!-- 
									${convert:getPhoneNoHidden(memberMap.hphone, resumeMap.paidResume) }
									 -->
								</td>
							</tr>
							<tr>
								<th class="table_title">연락처</th>
								<td class="table_desc">
									<c:choose>
										<c:when test='${SE_LOGIN_ID eq resumeMap.uid}'>
											${memberMap.phone }
										</c:when>
										<c:otherwise>
											${convert:getPhoneNoHidden(memberMap.phone, resumeMap.paidResume) }
										</c:otherwise>
									</c:choose>
									<!-- 
									${convert:getPhoneNoHidden(memberMap.phone, resumeMap.paidResume) }
									 -->
								</td>
							</tr>
							<tr>
								<th class="table_title">주소</th>
								<!-- 
								<td class="table_desc"><p>[${memberMap.post }] ${memberMap.address1 } ${memberMap.address2 }</p></td>
								 -->
								<td class="table_desc">
									<p>
										<c:choose>
											<c:when test='${SE_LOGIN_ID eq resumeMap.uid}'>
												[${memberMap.post }] ${memberMap.address1 } ${memberMap.address2 }
											</c:when>
											<c:otherwise>
												${convert:getAddressHidden(memberMap.post, memberMap.address1, memberMap.address2, resumeMap.paidResume) }
											</c:otherwise>
										</c:choose>
										<!-- 
										${convert:getAddressHidden(memberMap.post, memberMap.address1, memberMap.address2, resumeMap.paidResume) }
										 -->
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="resume02">
				<div id="resForm02">
					<table>
						<caption>희망구직 정보</caption>
						<tbody>
							<tr>
								<th>이력서 공개</th>
								<td>${(resumeMap.inidSecret == 'yes')? "비공개" : "공개"}</td>
							</tr>
							<tr>
								<th>등록일</th>
								<td><p>등록일: ${resumeMap.wdate }, 최종수정일: ${resumeMap.uWdate }</p></td>
							</tr>
							<tr>
								<th>이력서 제목</th>
								<td>${resumeMap.inidTitle }</td>
							</tr>
							<tr>
								<th>현재상태</th>
								<td>${codeConvert:getCondition(resumeMap.indiCondition)}</td>
							</tr>
							<tr>
								<th>희망근무지</th>
								<td class="workPlace">
									<p>${resumeMap.inidArea1Name }&nbsp;
										${convert:checkNull(resumeMap.inidArea2Name) eq '' ? '</p>' : '>&nbsp;'.concat(resumeMap.inidArea2Name) }</p>
									${convert:checkNull(resumeMap.inidArea3Name) eq '' ? '' : '<p>'.concat(resumeMap.inidArea3Name).concat('&nbsp;') }
									${convert:checkNull(resumeMap.inidArea4Name) eq '' ? '</p>' : '>&nbsp;'.concat(resumeMap.inidArea4Name).concat('</p>') }
									${convert:checkNull(resumeMap.inidArea5Name) eq '' ? '' : '<p>'.concat(resumeMap.inidArea5Name).concat('&nbsp;') }
									${convert:checkNull(resumeMap.inidArea6Name) eq '' ? '</p>' : '>&nbsp;'.concat(resumeMap.inidArea6Name).concat('</p>') }
								</td>
							</tr>
							<tr>
								<th>직무</th>
								<td>
									<p>${resumeMap.inidType1Name }&nbsp;
										${convert:checkNull(resumeMap.inidType2Name) eq '' ? '</p>' : '>&nbsp;'.concat(resumeMap.inidType2Name).concat('&nbsp;') }
										${convert:checkNull(resumeMap.inidType3Name) eq '' ? '</p>' : '>&nbsp;'.concat(resumeMap.inidType3Name).concat('</p>') }
										${convert:checkNull(resumeMap.inidType4Name) eq '' ? '' : '<p>'.concat(resumeMap.inidType4Name).concat('&nbsp;') }
										${convert:checkNull(resumeMap.inidType5Name) eq '' ? '</p>' : '>&nbsp;'.concat(resumeMap.inidType5Name).concat('&nbsp;') }
										${convert:checkNull(resumeMap.inidType6Name) eq '' ? '</p>' : '>&nbsp;'.concat(resumeMap.inidType6Name).concat('</p>') }
										${convert:checkNull(resumeMap.inidType7Name) eq '' ? '' : '<p>'.concat(resumeMap.inidType7Name).concat('&nbsp;') }
										${convert:checkNull(resumeMap.inidType8Name) eq '' ? '</p>' : '>&nbsp;'.concat(resumeMap.inidType8Name).concat('&nbsp;') }
										${convert:checkNull(resumeMap.inidType9Name) eq '' ? '</p>' : '>&nbsp;'.concat(resumeMap.inidType9Name).concat('</p>') }
									
								</td>
							</tr>
							<tr>
								<th>산업분야</th>
								<td>
									<p>${resumeMap.inidAreaJob1Name }&nbsp;
										${convert:checkNull(resumeMap.inidAreaJob2Name) eq '' ? '</p>' : '>&nbsp;'.concat(resumeMap.inidAreaJob2Name).concat('&nbsp;') }
										${convert:checkNull(resumeMap.inidAreaJob3Name) eq '' ? '</p>' : '>&nbsp;'.concat(resumeMap.inidAreaJob3Name).concat('</p>') }
										${convert:checkNull(resumeMap.inidAreaJob4Name) eq '' ? '' : '<p>'.concat(resumeMap.inidAreaJob4Name).concat('&nbsp;') }
										${convert:checkNull(resumeMap.inidAreaJob5Name) eq '' ? '</p>' : '>&nbsp;'.concat(resumeMap.inidAreaJob5Name).concat('&nbsp;') }
										${convert:checkNull(resumeMap.inidAreaJob6Name) eq '' ? '</p>' : '>&nbsp;'.concat(resumeMap.inidAreaJob6Name).concat('</p>') }
										${convert:checkNull(resumeMap.inidAreaJob7Name) eq '' ? '' : '<p>'.concat(resumeMap.inidAreaJob7Name).concat('&nbsp;') }
										${convert:checkNull(resumeMap.inidAreaJob8Name) eq '' ? '</p>' : '>&nbsp;'.concat(resumeMap.inidAreaJob8Name).concat('&nbsp;') }
										${convert:checkNull(resumeMap.inidAreaJob9Name) eq '' ? '</p>' : '>&nbsp;'.concat(resumeMap.inidAreaJob9Name).concat('</p>') }
									
								</td>
							</tr>
							<tr>
								<th>희망근무형태</th>
								<td><p>${resumeMap.inidJobformName }</p></td>
							</tr>
							<tr>
								<th>희망연봉</th>
								<td><p>${codeConvert:getPayInfo(resumeMap.payType, resumeMap.payTypeName, resumeMap.inidPayName) }</p></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="resume03">
				<div id="resForm03">
					<h4>학력사항</h4>
					<p class="final_education">
						<span>최종학력</span><span class="edu_result">${resumeEducation.strFinal_degree }</span>
					</p>
					<ul>
						<li class="edu_title">
							<p class="edu_desc01">재학기간</p>
							<p class="edu_desc02">학교명</p>
							<p class="edu_desc03">학과/전공</p>
							<p class="edu_desc04">학위</p>
							<p class="edu_desc05">졸업상태</p>
						</li>
						<c:forEach var="result" items="${resumeEducation.data}"
							varStatus="status">
							<li class="edu_desc">
								<p class="edu_desc01">${result.lesson_sdate}.${result.lesson_sdate2}~${result.lesson_edate}.${result.lesson_edate2}</p>
								<p class="edu_desc02">${result.school}</p>
								<p class="edu_desc03">${result.lesson2}/${result.lesson}</p>
								<p class="edu_desc04">${result.strDegree}</p>
								<p class="edu_desc05">${result.strState}</p>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div id="resume04">
				<div id="resForm04">
					<h4>경력사항</h4>
					<p class="final_education">
						<span>총 경력년수</span><span class="edu_result">${resumeCareer.total_year }년
							${resumeCareer.total_month }개월</span>
					</p>
					<ul>
						<li class="edu_title">
							<p class="edu_desc01">재직기간</p>
							<p class="edu_desc02">회사명</p>
							<p class="edu_desc03">담당업무</p>
						</li>
						<c:forEach var="result" items="${resumeCareer.data}"
							varStatus="status">
							<li class="edu_desc">
								<p class="edu_desc01">${result.hold_sdate}.${result.hold_sdate2}
									~ ${result.hold_edate}.${result.hold_edate2}</p>
								<p class="edu_desc02">${result.company}</p>
								<p class="edu_desc03">${result.business}</p>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div id="resume05">
				<div id="resForm05">
					<h4>보유기술</h4>
					<p>${resumeMap.inidMylskill eq '' ? '-' : convert:convertEnterToBr(resumeMap.inidMylskill) }</p>
				</div>
			</div>
			<div id="resume06">
				<div id="resForm06">
					<h4>자격사항</h4>
					<ul>
						<li class="edu_title">
							<p class="edu_desc01">취득일자</p>
							<p class="edu_desc02">자격증명</p>
							<p class="edu_desc03">발행처</p>
						</li>
						<c:forEach var="result" items="${resumeLicense.data}"
							varStatus="status">
							<li class="edu_desc">
								<p class="edu_desc01">${result.obtain_date}</p>
								<p class="edu_desc02">${result.qualification}</p>
								<p class="edu_desc03">${result.public_place}</p>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div id="resume07">
				<div id="resForm07">
					<h4>외국어</h4>
					<ul>
						<li class="edu_title">
							<p class="edu_desc01">취득일자</p>
							<p class="edu_desc02">외국어명</p>
							<p class="edu_desc03">수준</p>
							<p class="edu_desc04">점수</p>
							<p class="edu_desc05">발행처</p>
						</li>
						<c:forEach var="result" items="${resumeLanguage.data}"
							varStatus="status">
							<li class="edu_desc">
								<p class="edu_desc01">${result.ex_obtain_date}</p>
								<p class="edu_desc02">${result.language}</p>
								<p class="edu_desc03">${result.level}</p>
								<p class="edu_desc04">${result.point}</p>
								<p class="edu_desc05">${result.examination}</p>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div id="resume08">
				<div id="resForm08">
					<h4>자기소개서</h4>
					<p>${resumeMap.inidIntroduce }</p>
				</div>
			</div>
			<c:if test="${SE_USER_TYPE == 'company' || SE_LOGIN_ID eq resumeMap.uid }">
				<ul class="buttons">
					<ul>
						<c:if test="${resumeMap.portfolioFile != null and resumeMap.portfolioFile.length() > 0 }">
							<li><a href="/allwork/peg/${resumeMap.portfolioFile}" title="포트폴리오 다운로드">포트폴리오 다운로드</a></li>
						</c:if>
					<c:if test="${SE_USER_TYPE == 'company'}">
						<c:if test="${scrapCnt <= 0 }">
							<li id="scrapBtn"><a href="javascript:goScrapRegist();" title="스크랩">스크랩</a></li>
						</c:if>
						<c:if test="${interviewCnt <= 0 }">
							<li id="btn_reg_ok" class="reg_ok"><a href="javascript:applyPopup();" title="면접제의">면접제의</a></li>
						</c:if>
						
						<c:if test='${SE_SERVICE2 eq "Y" and SE_VIEW_COUNT > 0 and resumeMap.paidResume != 1}'>
							<li id="pay_info" class="pay_info"><a href="javascript:payInfoPopup('${SE_LOGIN_ID }', '${resumeMap.no}');" title="유료열람서비스 사용">유료열람서비스 사용</a></li>
						</c:if>
					</c:if>

					</ul>
				</ul>
			</c:if>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />

<form id="registForm" name="registForm" method="post">
	<input type="hidden" name="no" id="no" value="${map.no}" /> <input
		type="hidden" name="uid" id="uid" value="${SE_LOGIN_ID }"> <input
		type="hidden" name="rUid" id="rUid" value="${resumeMap.uid }">
	<input type="hidden" name="scrapCnt" id="scrapCnt" value="${scrapCnt }">
	<input type="hidden" name="interviewCnt" id="interviewCnt"
		value="${interviewCnt }"> <input type="hidden"
		name="recruitCnt" id="recruitCnt" value="${recruitCnt }">
</form>


<form id="searchForm" name="searchForm" method="post" action="/resumeDetail.do">
	<input type="hidden" name="no" id="no" value="" />
	<input type="hidden" name="personUid" id="personUid" value="${map.personUid}" />
	<input type="hidden" name="companyUid" id="companyUid" value="${map.companyUid}" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/personInfoSubMenu.do" />
</form>


<script type="text/javascript">
	$("#resumeTitle").keydown( function() {
		var kcode = event.keyCode;
		if(kcode == 13) {
			registApply();
		}
	});

	$(document).ready(function() {

		$(".close_btn, .btnArea .a01").on("click", function(e) {
			$("#resumeSel").val("");
			$("#popupWrap_applyWrap").css("display", "none");
		});

		$(".btnArea .a02").on("click", function(e) {
			registApply();
		});

	});

	// 스크랩 등록
	function goScrapRegist() {

		//if($("#recruitCnt").val() <= 0){
		//	alert("채용공고를 먼저 작성해 주세요");
		//	return;
		//}else{
		loadingOn();
		var callback = function(data) {
			alert("스크랩 했습니다.");
			$("#scrapBtn").hide();
			loadingOff();
		};

		var param = {
			no : $("#no").val(),
			type : "job",
			subType : "indi",
			uid : $("#uid").val(),
			rUid : $("#rUid").val()
		};
		ajax('post', '/registScrap.ajax', param, callback);
		//}
	}

	// 입사지원 popup
	function applyPopup() {

		if ($("#recruitCnt").val() <= 0) {
			alert("채용공고를 먼저 작성해 주세요");
			return;
		} else {
			var callback = function(data) {
				if (data.rstCnt > 0) {
					alert("이미 지원 하셨습니다.");
					loadingOff();

				} else {
					$("html").scrollTop(0);
					$("#popupWrap_applyWrap").css("display", "inline-block");
				}
			};

			var param = {
				toType : "interview",
				type : "job",
				subType : "company",
				uid : $("#uid").val(),
				toUid : $("#rUid").val(),
				toNo : $("#no").val()
			};
			ajax('post', '/getNetfuOnlineRecruitRegistCnt.ajax', param,
					callback);
		}
	}

	// 유료정보 보기 popup
	function payInfoPopup(uid, resumeNo) {

		if (!confirm("유료열람서비스를 사용할까요?")) {
			return;
		} else {
			var callback = function(data) {
				/*
				if (data.paidResume) {
					alert("이미 유료열람서비스를 사용하고 있습니다.");
					loadingOff();
					return;
				}
				*/
				//유료열람서비스 버튼 감추기.
				$("#pay_info").css("display", "none");
				
				//이력서 화면 갱신.
				$("#companyUid").val('${SE_LOGIN_ID }');
				$("#personUid").val('${resumeMap.uid }');
				$("#no").val('');
				$("#recruitNo").val('');
				$("#resumeNo").val('${resumeMap.no }');
				$("#searchForm").attr("action", "/resumeDetail.do");
				$("#searchForm").submit();
			};

			var param = {
				uid : uid,
				resumeNo : resumeNo
			};
			ajax('post', '/insertPaidResumeSearch.ajax', param, callback);
		}
	}

	// 면접제의 등록
	function registApply() {
		if(checkNull($("#resumeTitle").val())){
			alert("면접제의 메시지를 입력해 주세요.");
			return;
		}
		if(checkNull($("#resumeSel").val())){
			alert("구직자에게 제의하려는 채용정보를 선택해 주세요.");
			return;
		}
		
		loadingOn();
		var callback = function(data) {
			loadingOff();
			//$("#resumeSel").val("");
			$("#popupWrap_applyWrap").css("display", "none");
			$("#btn_reg_ok").css("display", "none");
			alert("면접제의가 완료 되었습니다.");
		};

		//사용자가 선택한 채용공고 제목.
		var targetResumeSel = document.getElementById("resumeSel");
		var recruitTitle = targetResumeSel.options[targetResumeSel.selectedIndex].text;
		
		//Ajax를 통해 면접요청 전달.
		var param = {
			toType : "interview",
			type : "job",
			subType : "company",
			uid : $("#uid").val(),
			toUid : $("#rUid").val(),
			toNo : $("#no").val(),
			fromNo : $("#resumeSel option:selected").val(),
			opened : "no",
			senderName: "${companyMap.name }",
			senderTitle: recruitTitle,
			jobDetail : $("#resumeTitle").val()
		};
		ajax('post', '/insertNetfuOnlineRecruit.ajax', param, callback);
	}
</script>


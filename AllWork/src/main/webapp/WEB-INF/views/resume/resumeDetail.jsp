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

<div id="popupWrap_applyWrap" style="display:none;">
	<div id="popupWrap_apply">
		<div class="topArea">
			<p class="close_btn"><i class="fas fa-times"></i></p>
			<p class="email_img"><i class="fas fa-envelope-open-text"></i></p>
			<p>이메일 입사지원</p>
		</div>
		<div class="descArea">
			<p>
				구작자의 이메일로 ${SE_USER_NM }님의 채용공고가 전송됩니다.
			</p>
			<form>
				<fieldset>
					<legend>면접 제의</legend>
					<ul class="title">
						<li>보내는 사람</li>
						<li>구직자</li>
						<li>이메일 제목</li>
						<li>지원 이력서</li>
						<!-- <li>첨부파일</li> -->
					</ul>
					<ul class="desc">
						<li>${companyMap.name }(${companyMap.email })</li>
						<li>${memberMap.name }(${memberMap.email })</li>
						<li><input type="text" id="resumeTitle" name="resumeTitle" value="" /></li>
						<li>
						<select id="resumeSel" name="resumeSel">
							<c:forEach var="result" items="${recruitList}" varStatus="status">
								<option value="${result.no }">${result.bizTitle }</option>
							</c:forEach>
						</select>
						</li>
						<!-- <li>
							<input id="res09_desc01"/><label for="res09_desc01_1">파일첨부</label><input id="res09_desc01_1" type="file"/>
						</li> -->
					</ul>
				</fieldset>
			</form>
		</div>
		<div class="btnArea">
			<p class="a01"><a href="#" title="취소">취소</a></p>
			<p class="a02"><a href="#" title="면접요청">면접요청</a></p>
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
						<p><img src="img/userNo.png" alt="본인사진"/></p>
					</div>
					<table>
						<caption>이력 등록하기</caption>
						<tbody class="tabelArea">
							<tr>
								<th class="table_title">이름</th>
								<td class="table_desc">${convert:getPersonNameHidden(memberMap.name) }(${codeConvert:getBizSex(memberMap.sex)},${codeConvert:getBirthYear(memberMap.birth)}년생)/${memberMap.uid }</td>
							</tr>
							<tr>
								<th class="table_title">이메일</th>
								<td class="table_desc">${convert:getEmailHidden(memberMap.email) }</td>
							</tr>
							<tr>
								<th class="table_title">휴대폰</th>
								<td class="table_desc">${convert:getPhoneNoHidden(memberMap.hphone) }</td>
							</tr>
							<tr>
								<th class="table_title">연락처</th>
								<td class="table_desc">${convert:getPhoneNoHidden(memberMap.phone) }</td>
							</tr>
							<tr>
								<th class="table_title">주소</th>
								<!-- 
								<td class="table_desc"><p>[${memberMap.post }] ${memberMap.address1 } ${memberMap.address2 }</p></td>
								 -->
								<td class="table_desc"><p>${convert:getAddressHidden(memberMap.post, memberMap.address1, memberMap.address2) }</p></td>
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
								<th>이력서 제목</th>
								<td>${resumeMap.inidTitle }</td>
							</tr>
							<tr>
								<th>현재상태</th>
								<td>${codeConvert:getCondition(resumeMap.indiCondition)}</td>
							</tr>
							<tr>
								<th>근무지역</th>
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
								<th>직무분야</th>
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
								<td><p>${resumeMap.payTypeName } / ${resumeMap.inidPayName }</p></td>
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
							<p class="edu_desc03">전공</p>
							<p class="edu_desc04">졸업상태</p>
						</li>
						<c:forEach var="result" items="${resumeEducation.data}" varStatus="status">
							<li class="edu_desc">
								<p class="edu_desc01">${result.lesson_sdate}.${result.lesson_sdate2} ~ ${result.lesson_edate}.${result.lesson_edate2}</p>
								<p class="edu_desc02">${result.school}</p>
								<p class="edu_desc03">${result.lesson}</p>
								<p class="edu_desc04">${result.strState}</p>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div id="resume04">
				<div id="resForm04">
					<h4>경력사항</h4>
					<p class="final_education">
						<span>총 경력년수</span><span class="edu_result">${resumeCareer.total_year }년  ${resumeCareer.total_month }개월</span>
					</p>
					<ul>
						<li class="edu_title">
							<p class="edu_desc01">재직기간</p>
							<p class="edu_desc02">회사명</p>
							<p class="edu_desc03">담당업무</p>
						</li>
						<c:forEach var="result" items="${resumeCareer.data}" varStatus="status">
							<li class="edu_desc">
								<p class="edu_desc01">${result.hold_sdate}.${result.hold_sdate2} ~ ${result.hold_edate}.${result.hold_edate2}</p>
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
						<c:forEach var="result" items="${resumeLicense.data}" varStatus="status">
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
						<c:forEach var="result" items="${resumeLanguage.data}" varStatus="status">
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
			<ul class="buttons">
				<ul>
					<li><a href="#none" title="포트폴리오 다운로드">포트폴리오 다운로드</a></li>
					<c:if test="${scrapCnt <= 0 }">
						<li><a href="javascript:goScrapRegist();" title="스크랩">스크랩</a></li>
					</c:if>
					<c:if test="${interviewCnt <= 0 }">
						<li class="res_ok"><a href="javascript:applyPopup();" title="면접제의">면접제의</a></li>
					</c:if>
				</ul>
			</ul>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />

<form id="registForm" name="registForm" method="post">
	<input type="hidden" name="no" id="no" value="${map.no}" />
	<input type="hidden" name="uid" id="uid" value="${SE_LOGIN_ID }">
	<input type="hidden" name="rUid" id="rUid" value="${resumeMap.uid }">
	<input type="hidden" name="scrapCnt" id="scrapCnt" value="${scrapCnt }">
	<input type="hidden" name="interviewCnt" id="interviewCnt" value="${interviewCnt }">
	<input type="hidden" name="recruitCnt" id="recruitCnt" value="${recruitCnt }">
</form>


<script type="text/javascript">
	
	$(document).ready(function(){
		
		$(".close_btn, .btnArea .a01").on("click", function(e){
			$("#resumeSel").val("");
			$("#popupWrap_applyWrap").css("display", "none");
		});
		
		$(".btnArea .a02").on("click", function(e){
			registApply();
		});
		
	});	

	// 스크랩 등록
	function goScrapRegist(){
		
		if($("#recruitCnt").val() <= 0){
			alert("채용공고를 먼저 작성해 주세요");
			return;
		}else{
			loadingOn();
			var callback = function(data){
				alert("저장 되었습니다.");
				$("#scrapBtn").hide();
				loadingOff();
			};
			
			var param = {
						no : $("#no").val()
						, type : "job"
						, subType : "indi"
						, uid : $("#uid").val()
						, rUid : $("#rUid").val()
					};
			ajax('post', '/registScrap.ajax', param, callback);
		}
	}
	
	// 입사지원 popup
	function applyPopup(){
		
		if($("#resumeCnt").val() <= 0){
			alert("이력서를 먼저 작성해 주세요");
			return;
		
		}else{
			var callback = function(data){
				if(data.rstCnt > 0){
					alert("이미 지원 하셨습니다.");
					loadingOff();
				
				}else{
					$("html").scrollTop(0);
					$("#popupWrap_applyWrap").css("display", "inline-block");
				}
			};
			
			var param = {
						toType : "interview"
						, type : "job"
						, subType : "company"
						, uid : $("#uid").val()
						, toUid : $("#rUid").val()
						, toNo : $("#no").val()
					}; 
			ajax('post', '/getNetfuOnlineRecruitRegistCnt.ajax', param, callback);
		}		
	}
	
	// 입사지원 등록
	function registApply(){
		loadingOn();
		var callback = function(data){
			loadingOff();
			$("#resumeSel").val("");
			$("#popupWrap_applyWrap").css("display", "none");
			alert("면접제의가 완료 되었습니다.");
		};
		
		var param = {
					toType : "interview"
					, type : "job"
					, subType : "company"
					, uid : $("#uid").val()
					, toUid : $("#rUid").val()
					, toNo : $("#no").val()
					, fromNo : $("#resumeSel option:selected").val()
					, opened : "no"
					, jobDetail : $("#resumeTitle").val()
				}; 
		ajax('post', '/insertNetfuOnlineRecruit.ajax', param, callback);
	}
	
</script>


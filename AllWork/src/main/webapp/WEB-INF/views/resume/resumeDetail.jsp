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
				<div id="imgArea">
					<p>
						<img src="/img/person.jpg" alt="본인사진" />
					</p>
				</div>
				<div id="detailArea">
					<p class="detail_title">기본정보</p>
					<div class="tabelArea">
						<p class="table_title">이름</p>
						<p class="table_desc">${memberMap.name }(${codeConvert:getBizSex(memberMap.sex)},${codeConvert:getBirthYear(memberMap.birth)}년생)/${memberMap.uid }</p>
						<p class="table_title">이메일</p>
						<p class="table_desc">${memberMap.email }</p>
						<p class="table_title">휴대폰</p>
						<p class="table_desc">${memberMap.hphone }</p>
						<p class="table_title">연락처</p>
						<p class="table_desc">${memberMap.phone }</p>
						<p class="table_title">주소</p>
						<p class="table_desc01">[${memberMap.post }] ${memberMap.address1 } ${memberMap.address2 }</p>
					</div>
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
										${convert:checkNull(resumeMap.inidArea2Name) eq '' ? '' : '>&nbsp;'.concat(resumeMap.inidArea2Name) }</p>
									${convert:checkNull(resumeMap.inidArea3Name) eq '' ? '' : '<p>&nbsp;'.concat(resumeMap.inidArea3Name) }
									${convert:checkNull(resumeMap.inidArea4Name) eq '' ? '' : '>&nbsp;'.concat(resumeMap.inidArea4Name).concat('</p>') }
									${convert:checkNull(resumeMap.inidArea5Name) eq '' ? '' : '<p>&nbsp;'.concat(resumeMap.inidArea5Name) }
									${convert:checkNull(resumeMap.inidArea6Name) eq '' ? '' : '>&nbsp;'.concat(resumeMap.inidArea6Name).concat('</p>') }
								</td>
							</tr>
							<tr>
								<th>직무분야</th>
								<td>경영.기획.사무 > 총무.법무.사무 > 일반관리직 ????</td>
							</tr>
							<tr>
								<th>산업분야</th>
								<td>${resumeMap.inidType1Name }
									${convert:checkNull(resumeMap.inidType2Name) eq '' ? '' : '>'.concat(resumeMap.inidType2Name) }
									${convert:checkNull(resumeMap.inidType3Name) eq '' ? '' : '>'.concat(resumeMap.inidType3Name) }
									${convert:checkNull(resumeMap.inidType4Name) eq '' ? '' : '<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.concat(resumeMap.inidType4Name) }
									${convert:checkNull(resumeMap.inidType5Name) eq '' ? '' : '>'.concat(resumeMap.inidType5Name) }
									${convert:checkNull(resumeMap.inidType6Name) eq '' ? '' : '>'.concat(resumeMap.inidType6Name) }
									${convert:checkNull(resumeMap.inidType7Name) eq '' ? '' : '<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.concat(resumeMap.inidType7Name) }
									${convert:checkNull(resumeMap.inidType8Name) eq '' ? '' : '>'.concat(resumeMap.inidType8Name) }
									${convert:checkNull(resumeMap.inidType9Name) eq '' ? '' : '>'.concat(resumeMap.inidType9Name) }</td>
							</tr>
							<tr>
								<th>선택적 직무</th>
								<td>운전전문직군 ???</td>
							</tr>
							<tr>
								<th>희망근무형태</th>
								<td>${resumeMap.inidJobformName }</td>
							</tr>
							<tr>
								<th>희망연봉</th>
								<td>${resumeMap.inidPayName }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="resume03">
				<div id="resForm03">
					<h4>학력사항</h4>
					<p class="final_education">
						<span>최종학력</span><span class="edu_result">${codeConvert:getLastSchool(resumeMap.inidLastSchool) }</span>
					</p>
					<ul>
						<li class="edu_title">
							<p class="edu_desc01">재학기간</p>
							<p class="edu_desc02">학교명</p>
							<p class="edu_desc03">전공</p>
							<p class="edu_desc04">졸업상태</p>
						</li>
						<li class="edu_desc">
							<p class="edu_desc01">2004.3.1 ~ 2008.2.20</p>
							<p class="edu_desc02">oo대학교</p>
							<p class="edu_desc03">oo과</p>
							<p class="edu_desc04">졸업</p>
						</li>
					</ul>
				</div>
			</div>
			<div id="resume04">
				<div id="resForm04">
					<h4>학력사항</h4>
					<p class="final_education">
						<span>총 경력년수</span><span class="edu_result">${codeConvert:getTotalCareer(resumeMap.inidCareer) }</span>
					</p>
					<ul>
						<li class="edu_title">
							<p class="edu_desc01">재직기간</p>
							<p class="edu_desc02">회사명</p>
							<p class="edu_desc03">담당업무</p>
						</li>
						<li class="edu_desc">
							<p class="edu_desc01">2004.3.1 ~ 2008.2.20</p>
							<p class="edu_desc02">(주)00</p>
							<p class="edu_desc03">[현장파견]정규직 채용(전기공사. 통신공사)</p>
						</li>
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
						<li class="edu_desc">
							<p class="edu_desc01">2004.3.1</p>
							<p class="edu_desc02">중급전기공사</p>
							<p class="edu_desc03">한국전기공사협회</p>
						</li>
						<li class="edu_desc">
							<p class="edu_desc01">2008.3.1</p>
							<p class="edu_desc02">2급소방안전관리자</p>
							<p class="edu_desc03">한국소방안전원</p>
						</li>
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
						<li class="edu_desc">
							<p class="edu_desc01">2004.3.1</p>
							<p class="edu_desc02">TOEIC</p>
							<p class="edu_desc03">-</p>
							<p class="edu_desc04">600</p>
							<p class="edu_desc05">ETC</p>
						</li>
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
						<li class="res_ok"><a href="#none" title="면접제의">면접제의</a></li>
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
	<input type="hidden" name="rUid" id="rUid" value="">
	<input type="hidden" name="scrapCnt" id="scrapCnt" value="${scrapCnt }">
	<input type="hidden" name="interviewCnt" id="interviewCnt" value="${interviewCnt }">
	<input type="hidden" name="recruitCnt" id="recruitCnt" value="${recruitCnt }">
</form>


<script type="text/javascript">
	
	$(document).ready(function(){
		
		
	});	

	// 스크랩 등록
	function goScrapRegist(){
		
		//if($("#resumeCnt").val() <= 0){
		//	alert("이력서를 먼저 작성해 주세요");
		//	return;
		//}else{
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
		//}
	}
	
	// 입사지원 popup
	function applyPopup(applyType){
		
		if($("#resumeCnt").val() <= 0){
			alert("이력서를 먼저 작성해 주세요");
			return;
		
		}else{
			var callback = function(data){
				if(data.rstCnt > 0){
					alert("이미 지원 하셨습니다.");
					loadingOff();
				}else{
					// 입사 지원 popup];
				}
			};
			
			var param = {
						toType : applyType
						, type : "job"
						, subType : "company"
						, uid : $("#uid").val()
						, toUid : $("#rUid").val()
						, toNo : $("#no").val()
					}; 
			ajax('post', '/selectNetfuOnlineRecruitRegistCnt.ajax', param, callback);
		}		
	}
	
	// 입사지원 등록
	function registApply(applyType){
		
		
	}
	
</script>


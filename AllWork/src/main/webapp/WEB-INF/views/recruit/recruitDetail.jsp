<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<c:choose>
	<c:when test="${SE_USER_TYPE eq 'person' }">
		<jsp:include page="/personHeader.do" />
	</c:when>
	<c:otherwise>
		<jsp:include page="/companyHeader.do" />
	</c:otherwise>
</c:choose>

<link rel="stylesheet" type="text/css" href="/css/company_01_view.css"/>

<div id="popupWrap_applyWrap" style="display:none;">
	<div id="popupWrap_apply">
		<div class="topArea">
			<p class="close_btn"><i class="fas fa-times"></i></p>
			<p class="email_img"><i class="fas fa-envelope-open-text"></i></p>
			<p>온라인 입사지원</p>
		</div>
		<div class="descArea">
			<p>
				채용 담당자에게 ${SE_USER_NM }님의 이력서가 전송됩니다.
			</p>
			<form>
				<fieldset>
					<legend>이메일 입사지원</legend>
					<ul class="title">
						<li>보내는 사람</li>
						<li>채용 담당자</li>
						<li>입사지원 메시지</li>
						<li>입사지원 이력서</li>
						<!-- <li>첨부파일</li> -->
					</ul>
					<ul class="desc">
						<li>${personMap.name }(${personMap.email })</li>
						<li>${recruitMap.bizPerson }(${recruitMap.bizPemail })</li>
						<li><input type="text" id="resumeTitle" name="resumeTitle" value="" /></li>
						<li>
						<select id="resumeSel" name="resumeSel">
							<c:forEach var="result" items="${resumeList}" varStatus="status">
								<option value="${result.no }">${result.inidTitle }</option>
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
			<p class="a02"><a href="#" title="지원하기">지원하기</a></p>
		</div>
	</div>
</div>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
		<c:if test="${SE_USER_TYPE == 'person' || companyMap.uid == SE_LOGIN_ID }">
			<jsp:include page="${map.leftMenuUrl }" />
		</c:if>
		</div>
		<div id="rightPart">
			<div id="regist00">
				<div id="company_detail">
					<p class="company_name">${companyMap.bizName }</p>
					<p class="company_hp"><a href="#none" title="기업홈페이지">${companyMap.bizHome }</a></p>
					<p class="company_logo"><img src="${convert:checkNull(companyMap.bizLogo) eq '' ? '/img/logoNo.jpg' : '/allwork/peg/'.concat(companyMap.bizLogo) }" alt="로고"  /></p>
				</div>
				<div id="detailArea">
					<p class="detail_title">기본정보</p>
					<p class="company_setting">
						<c:if test="${concernCnt <= 0 && SE_LOGIN_ID != companyMap.uid }">
							<a href="javascript:goConcernRegist();" title="관심기업등록"><i class="far fa-heart"></i>&nbsp;관심기업등록</a>
						</c:if>
						<span><a href="javascript:detailPopup();" title="기업정보 상세보기"><i class="fas fa-cog"></i>&nbsp;기업정보 상세보기</a></span>
					</p>
					<table>
						<caption>채용공고 등록하기</caption>
						<tbody class="tabelArea">
							<tr><th class="table_title">대표자</th><td class="table_desc">${companyMap.bizRecharger }</td></tr>
							<tr><th class="table_title">기업형태</th><td class="table_desc">${companyMap.bizFormName }</td></tr>
							<tr><th class="table_title">자본금</th><td class="table_desc">${companyMap.bizCapital }</td></tr>
							<tr><th class="table_title">설립년도</th><td class="table_desc">${companyMap.bizFonundation }년</td></tr>
							<tr><th class="table_title">사원수</th><td class="table_desc">${companyMap.bizMen }명</td></tr>
							<tr><th class="table_title">상장여부</th><td class="table_desc">${companyMap.bizListName }</td></tr>
							<tr><th class="table_title">홈페이지</th><td class="table_desc">${companyMap.bizHome }</td></tr>
							<tr><th class="table_title">업종</th><td class="table_desc">${companyMap.bizCategoryName }</td></tr>
							<tr><th class="table_title">사업내용</th><td class="table_desc">${companyMap.bizSubject }</td></tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="regist02">
				<div id="regForm02">
					<table>
						<caption>모집요강</caption>
						<tbody>
							<tr>
								<th>채용진행상태</th>
								<td>${(recruitMap.bizIng == 'yes')? "채용진행중" : "채용마감" }</td>
							</tr>
							<tr>
								<th>공고제목</th>
								<td>${recruitMap.bizTitle }</td>
							</tr>
							<tr>
								<th>직무</th>
								<td>${recruitMap.bizType1Name } 
									${convert:checkNull(recruitMap.bizType2Name) eq '' ? '' : '>'.concat(recruitMap.bizType2Name) }
									${convert:checkNull(recruitMap.bizType3Name) eq '' ? '' : '>'.concat(recruitMap.bizType3Name) }
									${convert:checkNull(recruitMap.bizType4Name) eq '' ? '' : '<br/>'.concat(recruitMap.bizType4Name) }
									${convert:checkNull(recruitMap.bizType5Name) eq '' ? '' : '>'.concat(recruitMap.bizType5Name) }
									${convert:checkNull(recruitMap.bizType6Name) eq '' ? '' : '>'.concat(recruitMap.bizType6Name) }
									${convert:checkNull(recruitMap.bizType7Name) eq '' ? '' : '<br/>'.concat(recruitMap.bizType7Name) }
									${convert:checkNull(recruitMap.bizType8Name) eq '' ? '' : '>'.concat(recruitMap.bizType8Name) }
									${convert:checkNull(recruitMap.bizType9Name) eq '' ? '' : '>'.concat(recruitMap.bizType9Name) }
								</td>
							</tr>
							<tr>
								<th>산업분야</th>
								<td>${recruitMap.bizAreaJob1Name } 
									${convert:checkNull(recruitMap.bizAreaJob2Name) eq '' ? '' : '>'.concat(recruitMap.bizAreaJob2Name) }
									${convert:checkNull(recruitMap.bizAreaJob3Name) eq '' ? '' : '>'.concat(recruitMap.bizAreaJob3Name) }
									${convert:checkNull(recruitMap.bizAreaJob4Name) eq '' ? '' : '<br/>'.concat(recruitMap.bizAreaJob4Name) }
									${convert:checkNull(recruitMap.bizAreaJob5Name) eq '' ? '' : '>'.concat(recruitMap.bizAreaJob5Name) }
									${convert:checkNull(recruitMap.bizAreaJob6Name) eq '' ? '' : '>'.concat(recruitMap.bizAreaJob6Name) }
									${convert:checkNull(recruitMap.bizAreaJob7Name) eq '' ? '' : '<br/>'.concat(recruitMap.bizAreaJob7Name) }
									${convert:checkNull(recruitMap.bizAreaJob8Name) eq '' ? '' : '>'.concat(recruitMap.bizAreaJob8Name) }
									${convert:checkNull(recruitMap.bizAreaJob9Name) eq '' ? '' : '>'.concat(recruitMap.bizAreaJob9Name) }
								</td>
							</tr>
							<tr>
								<th>근무지역</th>
								<td>${recruitMap.bizArea1Name }
									${convert:checkNull(recruitMap.bizArea2Name) eq '' ? '' : '>'.concat(recruitMap.bizArea2Name) }
									${convert:checkNull(recruitMap.bizArea3Name) eq '' ? '' : '<br/>'.concat(recruitMap.bizArea3Name) }
									${convert:checkNull(recruitMap.bizArea4Name) eq '' ? '' : '>'.concat(recruitMap.bizArea4Name) }
									${convert:checkNull(recruitMap.bizArea5Name) eq '' ? '' : '<br/>'.concat(recruitMap.bizArea5Name) }
									${convert:checkNull(recruitMap.bizArea6Name) eq '' ? '' : '>'.concat(recruitMap.bizArea6Name) }
								</td>
							</tr>
							<tr>
								<th>담당업무</th>
								<td>${recruitMap.bizBusiness }</td>
							</tr>
							<tr>
								<th>고용형태</th>
								<td>${recruitMap.bizJobfromName }</td>
							</tr>
							<tr>
								<th>모집인원</th>
								<td>${recruitMap.bizMen }명</td>
							</tr>
							<tr>
								<th>경력사항</th>
								<td>${codeConvert:getBizCareer(recruitMap.bizCareer) }</td>
							</tr>
							<tr>
								<th>급여조건</th>
								<td>${recruitMap.bizPayName }</td>
							</tr>
							<tr>
								<th>우대조건</th>
								<td>${convert:checkNull(recruitMap.bizPreferential) eq "" ? "등록된 우대조건 없음" : recruitMap.bizPreferentialName }</td>
							</tr>
							<tr>
								<th>최종학력</th>
								<td>${codeConvert:getBizAbility(recruitMap.bizAbility) }</td>
							</tr>
							<tr>
								<th>나이제한</th>
								<td>${codeConvert:getBizAge(recruitMap.bizAge) }</td>
							</tr>
							<tr>
								<th>성별</th>
								<td>${codeConvert:getBizSex(recruitMap.bizSex) }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="regist03">
				<div id="regForm03">
					<h4>상세요강</h4>
					<p>${convert:checkNull(recruitMap.bizDetail) ? "<b>등록된 상세모집내용이 없습니다.</b>" : recruitMap.bizDetail }</p>
				</div>
			</div>
			<div id="regist04">
				<div id="regForm04">
					<table>
						<caption>마감일/방법</caption>
						<tbody>
							<tr>
								<th>마감일</th>
								<c:set var="finishedStatus" value="${codeConvert:getRecruitStatusText(recruitMap.bizIng, recruitMap.bizEndType, recruitMap.bizEndDay)}" />
								<td><c:out value="${finishedStatus}" /></td>
							</tr>
							<tr>
								<th>제출서류</th>
								<td>${recruitMap.bizPaperName }</td>
							</tr>
							<tr>
								<th>접수방법</th>
								<td>${recruitMap.bizForm eq 'online' ? "온라인 입사지원" : "자사 입사지원서" }</td>
							</tr>
							<c:if test="${recruitMap.bizForm eq 'confirm' }">
								<tr>
									<th>이력서 양식</th>
									<td><a href='/peg/netfu_83986_35291.hwp'>자사 입사지원서 양식 다운로드</a></td>
								</tr>
							</c:if>
						
						</tbody>
					</table>
				</div>
			</div>
			<div id="regist05">
				<div id="regForm05">
					<table>
						<caption>담당자정보</caption>
						<tbody>
							<tr>
								<th>담당자명</th>
								<td>${recruitMap.bizPerson }</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${recruitMap.bizPphone }</td>
							</tr>
							<!-- 
							<tr>
								<th>팩스</th>
								<td>${recruitMap.bizPfax }</td>
							</tr>
							 -->
							<tr>
								<th>이메일</th>
								<td>${recruitMap.bizPemail }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		<c:if test="${SE_USER_TYPE == 'person' }">
			<c:if test="${finishedStatus ne '채용마감' }">
				<ul>
					<c:if test="${scrapCnt <= 0 }">
						<li id="scrapBtn"><a href="javascript:goScrapRegist();" title="스크랩">스크랩</a></li>
					</c:if>
					<c:if test="${recruitMap.bizMethodName.contains('온라인')}">
						<li class="reg_ok"><a href="javascript:applyPopup('online');" title="입사지원">온라인입사지원</a></li>
					</c:if>
					<!-- 
					<c:if test="${recruitMap.bizMethodName.contains('이메일')}">
						<li class="reg_ok"><a href="javascript:applyPopup('email');" title="입사지원">이메일입사지원</a></li>
					</c:if>
					 -->
				</ul>
			</c:if>
		</c:if>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />

<form id="registForm" name="registForm" method="post">
	<input type="hidden" name="no" id="no" value="${map.no}" />
	<input type="hidden" name="uid" id="uid" value="${SE_LOGIN_ID }">
	<input type="hidden" name="rUid" id="rUid" value="${recruitMap.uid }">
	<input type="hidden" name="scrapCnt" id="scrapCnt" value="${scrapCnt }">
	<input type="hidden" name="concernCnt" id="concernCnt" value="${concernCnt }">
	<input type="hidden" name="resumeCnt" id="resumeCnt" value="${resumeCnt }">
	<input type="hidden" name="companyUid" id="companyUid" value="${map.companyUid }">
	<input type="hidden" name="applyType" id="applyType" value="">
</form>


<script type="text/javascript">
	
	$(document).ready(function(){
		
		$(".close_btn, .a01").on("click", function(e){
			$("#applyType").val("");
			$("#popupWrap_applyWrap").css("display", "none");
		});
		
		$(".btnArea .a02").on("click", function(e){
			registApply();
		});
	});	

	// 스크랩 등록
	function goScrapRegist(){
		
		//if($("#resumeCnt").val() <= 0){
		//	alert("이력서를 먼저 작성해 주세요");
		//	return;
			
		//}else{
			
			loadingOn();
			var callback = function(data){
				alert("스크랩 했습니다.");
				$("#scrapBtn").hide();
				loadingOff();
			};
			
			var param = {
						no : $("#no").val()
						, type : "job"
						, subType : "company"
						, uid : $("#uid").val()
						, rUid : $("#rUid").val()
					};
			ajax('post', '/registScrap.ajax', param, callback);
		//}
	}
	
	// 관심기업 등록
	function goConcernRegist(){
		//if($("#resumeCnt").val() <= 0){
		//	alert("이력서를 먼저 작성해 주세요");
		//	return;
		//}else{
			loadingOn();
			var callback = function(data){
				alert("관심기업을 등록했습니다.");
				$("#concernCnt").val(data.rstCnt);
				loadingOff();
			};
			
			var param = {
						no : $("#no").val()
						, type : "job"
						, subType : "company"
						, uid : $("#uid").val()
						, rUid : $("#rUid").val()
					};
			ajax('post', '/registNetfuConcern.ajax', param, callback);
		//}
	}
	
	// 입사지원 popup
	function applyPopup(applyType){
		
		$("#applyType").val(applyType);
		
		if(Number($("#resumeCnt").val()) <= 0){
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
						toType : applyType
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
			$("#popupWrap_applyWrap").css("display", "none");
			alert("입사지원이 완료 되었습니다.");
		};
		
		var param = {
					toType : $("#applyType").val()
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
	
	// 기업 정보 상세보기 팝업
	function detailPopup(){
		window.open("/companyDetail.do?company="+$("#companyUid").val(),"companyDetail","top=200px,left=200px,width=810px,height=700px,resizable=1,scrollbars=yes");
	}
	
</script>
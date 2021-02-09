<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<jsp:include page="/companyHeader.do" />

<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/css/company_01.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/companySubMenu.do" />
			<div id="leftPart_buttom">
				<!-- 
				<ul>
					<li class="reg_ok"><a href="#none" title="수정">수정</a></li>
				</ul>
				 -->
			</div>
		</div>
		<div id="rightPart">
			<div id="regist00">
				<div id="company_detail">
					<p class="company_name">${companyMap.bizName}</p>
				<c:if test="${companyMap.bizLogo == null || companyMap.bizLogo == '' }">
					<p class="company_logo"><img src="img/logoNo.jpg" alt="로고"/></p>
				</c:if>
				<c:if test="${companyMap.bizLogo != null && companyMap.bizLogo != '' }">
					<p class="company_logo"><img src="/allwork/peg/${companyMap.bizLogo}" alt="로고" /></p>
				</c:if>
				</div>
				<div id="detailArea">
					<p class="detail_title">기본정보</p>
					<p class="company_setting"><a href="/companyModify.do" title="기본정보수정"><i class="fas fa-cog"></i>&nbsp;기본정보수정</a></p>
					<table>
						<caption>채용공고 등록하기</caption>
						<tbody class="tabelArea">
							<tr><th class="table_title">대표자</th><td class="table_desc">${companyMap.bizRecharger}</td></tr>
							<tr><th class="table_title">기업형태</th><td class="table_desc">${companyMap.bizFormName}</td></tr>
							<tr><th class="table_title">자본금</th><td class="table_desc">${companyMap.bizCapital}</td></tr>
							<tr><th class="table_title">설립년도</th><td class="table_desc">${companyMap.bizFonundation}년</td></tr>
							<tr><th class="table_title">사원수</th><td class="table_desc">${companyMap.bizMen}명</td></tr>
							<tr><th class="table_title">상장여부</th><td class="table_desc">${companyMap.bizListName}</td></tr>
							<tr><th class="table_title">업종</th><td class="table_desc">${companyMap.bizCategoryName}</td></tr>
							<tr><th class="table_title">사업내용</th><td class="table_desc">${companyMap.bizSubject}</td></tr>
						</tbody>
					</table>
				</div>
			</div>
			<form id="registForm" name="registForm" enctype="multipart/form-data" action="/updateRecruit.do" method="post">
				<input type="hidden" name="infoType" id="infoType" value="1" />
				<input type="hidden" name="bizName" id="bizName" value="${companyMap.bizName}" />
				<input type="hidden" name="bizPost" id="bizPost" value="${companyMap.bizPost}" />
				<input type="hidden" name="bizAddress1" id="bizAddress1" value="${companyMap.bizAddress1}" />
				<input type="hidden" name="bizAddress2" id="bizAddress2" value="${companyMap.bizAddress2}" />
				<div id="regist02">
					<li id="regForm02">
						<legend>모집요강</legend>
						<div>
							<table>
							<caption>모집요강</caption>
								<tbody>
									<tr>
										<th>채용마감</th>
										<td>
											<input id="bizIngChk" type="checkbox" name="bizIngChk"/><label for="reg02_desc07">채용마감(채용마감시 체크박스를 선택해 주세요.)</label>
											<input type="hidden" id="bizIng" name="bizIng" value="${(result.bizIng == 'yes')? 'yes' : 'no'}" />
										</td>
									</tr>
									<tr>
										<th>공고제목<span class="necessary">*</span></th>
										<td>
											<input class="reg_text" id="bizTitle" type="text" name="bizTitle" placeholder="ex)웹기획 경력직 채용" value="공고제목"/>
										</td>
									</tr>
								</tbody>
							</table>

							<span class="comment">직무, 산업분야, 근무지역은 최대 3개까지 선택 가능. 추가 버튼과 삭제 버튼을 사용하세요.</span>
							<table>
								<tbody id="job">
									<tr>
										<th>직무<span class="necessary">*</span></th>
										<td>
											<select id="bizType1" name="bizType1" title="1차직무선택" onchange="javascript:getCodeJobTypeAllListAjax('job', this, '2차직무선택', 'bizType2', true, true);">
												<option value="">1차직무선택</option>
												<c:forEach var="result" items="${jobList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach>
											</select>
											<select id="bizType2" name="bizType2" title="2차직무선택" onchange="javascript:getCodeJobTypeAllListAjax('job', this, '3차직무선택', 'bizType3', true, true);">
												<option value="">2차직무선택</option>
											</select>
											<select id="bizType3" name="bizType3" title="3차직무선택">
												<option value="3차직무선택">3차직무선택</option>
											</select>
											<input type="button" name="appendItem" kind="job" value="+ 추가" />
											<input type="button" name="deleteItem" kind="job" value="- 삭제" />
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody id="area_job">
									<tr>
										<th>산업분야<span class="necessary">*</span></th>
										<td>
											<select id="bizAreaJob1" name="bizAreaJob1" title="1차산업선택" onchange="javascript:getNetfuCateListForSelect('area_job', this, '2차산업선택', 'bizAreaJob2', true, true);">
												<option value="">1차산업선택</option>
												<c:forEach var="result" items="${areaJobList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach>
											</select>
											<select id="bizAreaJob2" name="bizAreaJob2" title="2차산업선택" onchange="javascript:getNetfuCateListForSelect('area_job', this, '3차산업선택', 'bizAreaJob3', true, true);">
												<option value="">2차산업선택</option>
											</select>
											<select id="bizAreaJob3" name="bizAreaJob3" title="3차산업선택">
												<option value="3차직무선택">3차산업선택</option>
											</select>
											<input type="button" name="appendItem" kind="area_job" value="+ 추가" />
											<input type="button" name="deleteItem" kind="area_job" value="- 삭제" />
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody id="area">
									<tr>
										<th>근무지역<span class="necessary">*</span></th>
										<td>
											<select id="bizArea1" name="bizArea1" onchange="javascript:getNetfuCateListForSelect('area', this, '시구군선택', 'bizArea2', true, true);">
												<option value="">시도선택</option>
												<c:forEach var="result" items="${areaList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach>
											</select>
											<select id="bizArea2" name="bizArea2" style="width: 200px;">
												<option value="">시구군선택</option>
											</select>
											<input type="button" name="appendItem" kind="area" value="+ 추가" />
											<input type="button" name="deleteItem" kind="area" value="- 삭제" />
											<!-- span class="comment">최대 3개까지 선택 가능</span -->
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr>
										<th>담당업무<span class="necessary">*</span></th>
										<td><input id="bizBusiness" type="text" name="bizBusiness"/></td>
									</tr>
									<tr>
										<th>고용형태<span class="necessary">*</span></th>
										<td>
											<c:forEach var="result" items="${jobTypeList}" varStatus="status">
												<span><input id="bizJobfromChk" type="checkbox" name="bizJobfromChk" value="${result.code}"/><label for="reg02_desc07">${result.name}</label></span>
											</c:forEach>
											<input type="hidden" id="bizJobfrom" name="bizJobfrom" />
										</td>
									</tr>
									<tr>
										<th>모집인원<span class="necessary">*</span></th>
										<td>
											<span><input id="bizMen" type="text" name="bizMen" style="width:50px; vertical-align:middle;" numberOnly /><label for="reg02_desc08_1">&nbsp;명</label></span>
										</td>
									</tr>
									<tr>
										<th>경력사항<span class="necessary">*</span></th>
										<td>
											<span><input id="bizCareerRadio" type="radio" name="bizCareerRadio" value="102"/><label for="reg02_desc09">신입</label></span>
											<span><input id="bizCareerRadio" type="radio" name="bizCareerRadio" value=""/><label for="reg02_desc09_1">경력</label></span>
											<span>
												<select id="bizCareerYear" name="bizCareerYear" title="경력연차">
													<option value="">선택</option>
													<c:forEach var="i" begin="1" end="50">
														<option value="${i}">${i}</option>
													</c:forEach>
												</select>
											</span>
											<span><input id="bizCareerRadio" type="radio" name="bizCareerRadio" value="100"/><label for="reg02_desc09_3">경력무관</label></span>
											<input type="hidden" name="bizCareer" id="bizCareer" />
										</td>
									</tr>
									<tr>
										<th>급여조건<span class="necessary">*</span></th>
										<td>
											<select id="payType" name="payType" onchange="javascript:getNetfuCateListForSelect('inid_pay', this, '', 'bizPay', true, false);">
												<option value="">선택</option>
												<c:forEach var="result" items="${inidPayList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach>
											</select>
											<select id="bizPay" name="bizPay">
											</select>
										</td>
									</tr>
									<tr>
										<th>최종학력</th>
										<td>
											<select id="bizAbility" name="bizAbility" title="학력 선택" style="width: 300px;">
												<option value="">학력 선택</option>
												<option value="100">학력무관</option>
												<option value="1">고등학교졸업</option>
												<option value="2">대학졸업(2~3년)</option>
												<option value="3">대학교졸업(4년)</option>
												<option value="4">석사</option>
												<option value="5">박사</option>
												<%-- <c:forEach var="result" items="${jobSchoolList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach> --%>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
				</div>
				<div id="regist03">
					<li id="regForm03" name="regForm03" method="post">
						<legend>상세요강</legend>
						<div>
							<table>
								<caption>상세요강</caption>
								<tbody>
									<tr>
										<th>상세요강</th>
										<td>
											<p>
											ㆍ모집직종 및 담당업무에 관련된 상세한 정보, 모집내용에 관련된자격요건, 제출서류, 전형방법, 근무조건, 회사위치 등을 입력해 주십시오.<br/>
											ㆍ상세모집요강 작성에 많은 시간이 필요할 경우 메모장이나 워드프로그램에서 작성한 다음 붙여넣기를 하시기 바랍니다.
											</p>
											<div><textarea id="bizDetail" name="bizDetail" style="width: 100%;" >${recruitMap.bizDetail}</textarea></div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
				</div>
				<div id="regist04">
					<li id="regForm04">
						<legend>근무환경</legend>
						<div>
							<table>
								<caption>근무환경</caption>
								<tbody>
									<tr>
										<th>우대조건</th>
										<td>
											<c:forEach var="result" items="${preferentialList}" varStatus="status">
												<span><input id="bizPreferentialChk" type="checkbox" name="bizPreferentialChk" value="${result.code}"/><label for="reg02_desc07">${result.name}</label></span>
											</c:forEach>
											<input type="hidden" name="bizPreferential" id="bizPreferential" />
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
				</div>
				<div id="regist05">
					<li id="regForm05">
						<legend>채욤마감/채용방법</legend>
						<div>
							<table>
								<caption>채용마감</caption>
								<tbody>
									<tr>
									<th>채용마감<span class="necessary">*</span></th>
										<td>
											<span><input id="bizEndTypeInput" type="radio" name="bizEndTypeChk" value="input"/><label for="bizEndType">마감일</label></span>
											<span><input id="bizEndDay" type="date" name="bizEndDay"/></span>
											<span><input id="bizEndTypeGet" type="radio" name="bizEndTypeChk" value="get"/><label for="bizEndType">채용시 마감</label></span>
											<span><input id="bizEndTypeOften" type="radio" name="bizEndTypeChk" value="often"/><label for="bizEndType">상시채용</label></span>
											<input type="hidden" name="bizEndType" id="bizEndType" />
										</td>
									</tr>
									<tr>
										<th>제출서류</th>
										<td>
											<c:forEach var="result" items="${jobPaperList}" varStatus="status">
												<span><input id="bizPaperChk" type="checkbox" name="bizPaperChk" value="${result.code}"/><label for="reg02_desc07">${result.name}</label></span>
											</c:forEach>
											<input type="hidden" name="bizPaper" id="bizPaper" />
										</td>
									</tr>
									<tr>
										<th>접수방법<span class="necessary">*</span></th>
										<td>
											<c:forEach var="result" items="${jobRecipientList}" varStatus="status">
												<span><input id="bizMethodChk" type="checkbox" name="bizMethodChk" value="${result.code}"/><label for="reg02_desc07">${result.name}</label></span>
											</c:forEach>
											<input type="hidden" name="bizMethod" id="bizMethod" />
										</td>
									</tr>
									<tr>
										<th>이력서 양식</th>
										<td>
											<span><input id="bizFormChk" type="checkbox" name="bizFormChk" value="online"/><label for="bizForm">온라인 이력서</label></span>
											<span><input id="bizFormChk" type="checkbox" name="bizFormChk" value="confirm"/><label for="bizForm">자사 입사지원서 양식</label></span>
											<input type="hidden" name="bizForm" id="bizForm" />
										</td>
									</tr>
									<tr>
										<th>이력서 양식 첨부</th>
										<td>
											<input id="bizFormFile" type="file" name="bizFormFile"/>
											<input type="hidden" name="attachFlag" id="attachFlag" value="" />
											<input type="hidden" name="orgBizFormFile" id="orgBizFormFile" value="${recruitMap.bizFormFile }" />
											<c:if test="${convert:isRecruitBizFormConfirm(recruitMap.bizForm) }">
												<c:if test="${recruitMap.bizFormFile != null and recruitMap.bizFormFile.length() > 0 }">
													<br />자사 입사지원서 양식: 등록중
												</c:if>
												<c:if test="${recruitMap.bizFormFile == null or recruitMap.bizFormFile.length() < 1 }">
													<br />자사 입사지원서 양식: 미등록
												</c:if>
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
				</div>
				<div id="regist06">
					<li id="regForm06">
						<legend>담당자정보</legend>
						<div>
							<table>
								<caption>담당자정보</caption>
								<tbody>
									<tr>
										<th>담당자명<span class="necessary">*</span></th>
										<td><input id="bizPerson" type="text" name="bizPerson" title="담당자명"/></td>
									</tr>
									<tr>
										<th>전화번호<span class="necessary">*</span></th>
										<td>
											<span><input id="bizPphone1" type="text" name="bizPphone1" title="" numberOnly/></span>
											<span>-</span>
											<span><input id="bizPphone2" type="text" name="bizPphone2" title="" numberOnly/></span>
											<span>-</span>
											<span><input id="bizPphone3" type="text" name="bizPphone3" title="" numberOnly/></span>
											<input type="hidden" name="bizPphone" id="bizPphone" value="" />
										</td>
									</tr>
									<!-- 
									<tr>
										<th>팩스<span class="necessary">*</span></th>
										<td>
											<span><input id="bizPfax1" type="text" name="bizPfax1" title="" numberOnly/></span>
											<span>-</span>
											<span><input id="bizPfax2" type="text" name="bizPfax2" title="" numberOnly/></span>
											<span>-</span>
											<span><input id="bizPfax3" type="text" name="bizPfax3" title="" numberOnly/></span>
											<input type="hidden" name="bizPfax" id="bizPfax" value="" />
										</td>
									</tr>
									 -->
									<tr>
										<th>이메일<span class="necessary">*</span></th>
										<td>
											<span><input id="bizPemailId" type="text" name="bizPemailId" title=""/></span><span>@</span><span><input id="bizPemailHost" type="text" name="bizPemailHost" title=""/></span>
											<span>
												<select id="selBizPemailHost" name="selBizPemailHost" title="">
													<option value="">직접입력</option>
													<option value="gmail.com">gmail.com</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="nate.com">nate.com</option>
												</select>
											</span>
											<input type="hidden" name="bizPemail" id="bizPemail" value="" />
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
				</div>
				<input type="hidden" name="no" id="no" value="${map.no }" />
			</form>
			<ul>
			<c:if test="${convert:isRecruitBizFormConfirm(recruitMap.bizForm) and recruitMap.bizFormFile != null and recruitMap.bizFormFile.length() > 0 }">
				<li id="scrapBtn"><a href="/allwork/peg/${recruitMap.bizFormFile }" title="입사지원서 양식 다운로드">입사지원서 양식 다운로드</a></li>
			</c:if>
				<li><a href="/recruitListProgress.do" title="">취소</a></li>
				<li class="reg_ok"><a href="#" title="수정">수정</a></li>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />

<script type="text/javascript">

	var bizDetail_object = [];	

	$(document).ready(function(){
		
		nhn.husky.EZCreator.createInIFrame({
	        oAppRef: bizDetail_object,
	        elPlaceHolder: "bizDetail",
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
		
		// 추가 Button
		$("input[name=appendItem]").each(function(index){
			$(this).on("click", function(e){
				appendItem($(this).attr("kind"));
			});	
		});
		
		
		// 삭제 Button
		$("input[name=deleteItem]").each(function(index){
			$(this).on("click", function(e){
				deleteItem($(this).attr("kind"));
			});	
		});
		
		
		$("input:radio[name=bizCareerRadio]").on("click", function(e){
			if($(this).val() == "100" || $(this).val() == "102"){	// 100:경력 무관 , 102:신입
				$("#bizCareerYear").css("background-color", "#EAEAEA");
				$("#bizCareerYear").val("");
				$("#bizCareerYear option").attr("disabled", true);
			}else{
				$("#bizCareerYear").css("background-color", "#FFFFFF");
				$("#bizCareerYear option").attr("disabled", false);
			}
		});
		
		
		$("#selBizPemailHost").on("change", function(e){
			if($(this).val() == ""){
				$("#bizPemailHost").css("background-color", "#FFFFFF");
				$("#bizPemailHost").attr("readonly",false);
			}else{
				$("#bizPemailHost").css("background-color", "#EAEAEA");
				$("#bizPemailHost").attr("readonly",true);
			}
			$("#bizPemailHost").val($(this).val());
		});
		
		$(".reg_ok").on("click", function(e){
			registRecruit();
		});
		
		<c:if test="${!recruitMap.isEmpty()}">
			
			//채용마감.
			var bizIng = "${recruitMap.bizIng}";
			if (bizIng != 'yes')	$('#bizIngChk').attr("checked", true);

			// 공고 제목
			$("#bizTitle").val("${recruitMap.bizTitle}");
			
			// 모집 업종
			if(!checkNull("${recruitMap.bizType1}")){
				$("#bizType1").val("${recruitMap.bizType1}");
				getCodeJobTypeAllListAjax('job', $("#bizType1"), '2차직무선택', 'bizType2', false, true);
			}
			
			if(!checkNull("${recruitMap.bizType2}")){
				$("#bizType2").val("${recruitMap.bizType2}");
				getCodeJobTypeAllListAjax('job', $("#bizType2"), '3차직무선택', 'bizType3', false, true);
			}
			
			if(!checkNull("${recruitMap.bizType3}")){
				$("#bizType3").val("${recruitMap.bizType3}");
			}
			
			if(!checkNull("${recruitMap.bizType4}")){
				appendItem("job");
				$("#bizType4").val("${recruitMap.bizType4}");
				getCodeJobTypeAllListAjax('job', $("#bizType4"), '2차직무선택', 'bizType5', false, true);
			}
			
			if(!checkNull("${recruitMap.bizType5}")){
				$("#bizType5").val("${recruitMap.bizType5}");
				getCodeJobTypeAllListAjax('job', $("#bizType5"), '3차직무선택', 'bizType6', false, true);
			}
			
			if(!checkNull("${recruitMap.bizType6}")){
				$("#bizType6").val("${recruitMap.bizType6}");
			}
			
			if(!checkNull("${recruitMap.bizType7}")){
				appendItem("job");
				$("#bizType7").val("${recruitMap.bizType7}");
				getCodeJobTypeAllListAjax('job', $("#bizType7"), '2차직무선택', 'bizType8', false, true);
			}
			
			if(!checkNull("${recruitMap.bizType8}")){
				$("#bizType8").val("${recruitMap.bizType8}");
				getCodeJobTypeAllListAjax('job', $("#bizType8"), '3차직무선택', 'bizType9', false, true);
			}
			
			if(!checkNull("${recruitMap.bizType9}")){
				$("#bizType9").val("${recruitMap.bizType9}");
			}
			
			
			// 산업 분야
			if(!checkNull("${recruitMap.bizAreaJob1}")){
				$("#bizAreaJob1").val("${recruitMap.bizAreaJob1}");
				getNetfuCateListForSelect('area_job', $("#bizAreaJob1"), '2차직무선택', 'bizAreaJob2', false, true);
			}
			
			if(!checkNull("${recruitMap.bizAreaJob2}")){
				$("#bizAreaJob2").val("${recruitMap.bizAreaJob2}");
				getNetfuCateListForSelect('area_job', $("#bizAreaJob2"), '3차직무선택', 'bizAreaJob3', false, true);
			}
			
			if(!checkNull("${recruitMap.bizAreaJob3}")){
				$("#bizAreaJob3").val("${recruitMap.bizAreaJob3}");
			}
			
			if(!checkNull("${recruitMap.bizAreaJob4}")){
				appendItem("area_job");
				$("#bizAreaJob4").val("${recruitMap.bizAreaJob4}");
				getNetfuCateListForSelect('area_job', $("#bizAreaJob4"), '2차직무선택', 'bizAreaJob5', false, true);
			}
			
			if(!checkNull("${recruitMap.bizAreaJob5}")){
				$("#bizAreaJob5").val("${recruitMap.bizAreaJob5}");
				getNetfuCateListForSelect('area_job', $("#bizAreaJob5"), '3차직무선택', 'bizAreaJob6', false, true);
			}
			
			if(!checkNull("${recruitMap.bizAreaJob6}")){
				$("#bizAreaJob6").val("${recruitMap.bizAreaJob6}");
			}
			
			if(!checkNull("${recruitMap.bizAreaJob7}")){
				appendItem("area_job");
				$("#bizAreaJob7").val("${recruitMap.bizAreaJob7}");
				getNetfuCateListForSelect('area_job', $("#bizAreaJob7"), '2차직무선택', 'bizAreaJob8', false, true);
			}
			
			if(!checkNull("${recruitMap.bizAreaJob8}")){
				$("#bizAreaJob8").val("${recruitMap.bizAreaJob8}");
				getNetfuCateListForSelect('area_job', $("#bizAreaJob8"), '3차직무선택', 'bizAreaJob9', false, true);
			}
			
			if(!checkNull("${recruitMap.bizAreaJob9}")){
				$("#bizAreaJob9").val("${recruitMap.bizAreaJob9}");
			}
			
			// 근무 지역
			if(!checkNull("${recruitMap.bizArea1}")){
				$("#bizArea1").val("${recruitMap.bizArea1}");
				getNetfuCateListForSelect('area', $("#bizArea1"), '시구군선택', 'bizArea2', false, true);
			}
			
			if(!checkNull("${recruitMap.bizArea2}")){
				$("#bizArea2").val("${recruitMap.bizArea2}");
			}
			
			if(!checkNull("${recruitMap.bizArea3}")){
				appendItem("area");
				$("#bizArea3").val("${recruitMap.bizArea3}");
				getNetfuCateListForSelect('area', $("#bizArea3"), '시구군선택', 'bizArea4', false, true);
			}
			
			if(!checkNull("${recruitMap.bizArea4}")){
				$("#bizArea4").val("${recruitMap.bizArea4}");
			}
			
			if(!checkNull("${recruitMap.bizArea5}")){
				appendItem("area");
				$("#bizArea5").val("${recruitMap.bizArea5}");
				getNetfuCateListForSelect('area', $("#bizArea5"), '시구군선택', 'bizArea6', false, true);
			}
			
			if(!checkNull("${recruitMap.bizArea6}")){
				$("#bizArea6").val("${recruitMap.bizArea6}");
			}
			
			// 담당업무
			$("#bizBusiness").val("${recruitMap.bizBusiness}");
			
			// 고용형태
			var form = "${recruitMap.bizJobfrom}".split(",");
			for(var i = 0 ; i < form.length ; i++){
				$('input:checkbox[name="bizJobfromChk"]').each(function() {
					if(form[i] == this.value){
						$(this).attr("checked", true);
					}
				});
			}
			
			// 모집인원
			$("#bizMen").val("${recruitMap.bizMen}");
			
			// 경력 사항
			var career = "${recruitMap.bizCareer}";
			if(career == "102"){
				$(":radio[name='bizCareerRadio'][value='102']").prop("checked", true);
			}else if(career == "100"){
				$(":radio[name='bizCareerRadio'][value='100']").prop("checked", true);
			}else{
				$(":radio[name='bizCareerRadio'][value='']").prop("checked", true);
				$("#bizCareerYear").val(career);
			}
			
			// 급여 종류
			if(!checkNull("${recruitMap.payType}")){
				$("#payType").val("${recruitMap.payType}");
				getNetfuCateListForSelect('inid_pay', $("#payType"), '급여 선택', 'bizPay', false, true);
			} 
			
			if(!checkNull("${recruitMap.bizPay}")){
				$("#bizPay").val("${recruitMap.bizPay}");
			} 
			
			$("#bizAbility").val("${recruitMap.bizAbility}");
			
			// 상세요강
			//$("#bizDetail").val("${recruitMap.bizDetail}".replace(/\"/g,"\'"));		
			
			//bizDetail_object.getById["bizDetail"].exec("LOAD_CONTENTS_FIELD");
			//bizDetail_object.getById['bizDetail'].exec('FOCUS');	
			//$('iframe').contents().find('.se2_inputarea_controller husky_seditor_editingArea_verticalResizer').trigger(".drag");
			
			// 우대조건
			var preferential = "${recruitMap.bizPreferential}".split(",");
			for(var i = 0 ; i < preferential.length ; i++){
				$('input:checkbox[name="bizPreferentialChk"]').each(function() {
					if(preferential[i] == this.value){
						$(this).attr("checked", true);
					}
				});
			}
			
			// 마감일
			$("#bizEndDay").val("${recruitMap.bizEndDay}");
			var endType = "${recruitMap.bizEndType}";
			if (endType != null && endType.length > 0) {
				$('input:radio[name="bizEndTypeChk"]').each(function() {
					if(endType == this.value){
						$(this).attr("checked", true);
					}
				});
			}
			
			// 제출 서류
			var paper = "${recruitMap.bizPaper}".split(",");
			for(var i = 0 ; i < paper.length ; i++){
				$('input:checkbox[name="bizPaperChk"]').each(function() {
					if(paper[i] == this.value){
						$(this).attr("checked", true);
					}
				});
			}
			
			// 접수방법
			var method = "${recruitMap.bizMethod}".split(",");
			$('input:checkbox[name="bizMethodChk"]').each(function() {
				var checked = false;
				for(var i = 0 ; i < method.length ; i++){
					if (method[i] == this.value) {
						checked = true;
						break;
					}
				}
				$(this).attr("checked", checked);
			});
			
			// 이력서 양식
			var bizForm = "${recruitMap.bizForm}".split(",");
			$('input:checkbox[name="bizFormChk"]').each(function() {
				var checked = false;
				for(var i = 0 ; i < bizForm.length ; i++){
					if (bizForm[i] == this.value) {
						checked = true;
						break;
					}
				}
				$(this).attr("checked", checked);
			});
			
			// 이력서 양식 첨부
			$("#orgBizFormFile").val("${recruitMap.bizFormFile}");
			
			// 당방자명
			$("#bizPerson").val("${recruitMap.bizPerson}");
			
			// 담당자 전화번호
			var phone = "${recruitMap.bizPphone}".split("-");
			if(phone.length == 3){
				$("#bizPphone1").val(phone[0]);
				$("#bizPphone2").val(phone[1]);
				$("#bizPphone3").val(phone[2]);
			}else if(phone.length == 2){
				$("#bizPphone1").val(phone[0]);
				$("#bizPphone2").val(phone[1]);
			}else if(phone.length == 1){
				$("#bizPphone1").val(phone[0]);
			}else{
				
			}
			
			// 담당자 팩화번호
			var fax = "${recruitMap.bizPfax}".split("-");
			if(fax.length == 3){
				$("#bizPfax1").val(fax[0]);
				$("#bizPfax2").val(fax[1]);
				$("#bizPfax3").val(fax[2]);
			}else if(fax.length == 2){
				$("#bizPfax1").val(fax[0]);
				$("#bizPfax2").val(fax[1]);
			}else if(fax.length == 1){
				$("#bizPfax1").val(fax[0]);
			}else{
				
			}
			
			// 담당자 이메일
			var email = "${recruitMap.bizPemail}".split("@");
			if(email.length == 2){
				$("#bizPemailId").val(email[0]);
				$("#bizPemailHost").val(email[1]);
			}else if(email.length == 1){
				$("#bizPemailId").val(email[0]);
			}else{
				
			}
			
		</c:if>
		
		
	});	
	
	function appendItem(itemKind){
		
		var appendNum = $("#"+itemKind).find("tr").length;
		
		var trHtml = "";
		
		if(itemKind == "job"){
			
			if($("#job tr").length < 3){
				
				trHtml = "";
				trHtml += "<tr id='job'>";
				trHtml += "<th></th>";
				trHtml += "<td>";
				trHtml += "<select id='bizType"+((appendNum*3)+1)+"' name='bizType"+((appendNum*3)+1)+"' onchange=\"javascript:getCodeJobTypeAllListAjax('job', this, '2차직무선택', 'bizType"+((appendNum*3)+2)+"', true, true);\">";
				trHtml += "<option value=''>1차직무선택</option>\n";
				trHtml += "</select>\n";
				trHtml += "<select id='bizType"+((appendNum*3)+2)+"' name='bizType"+((appendNum*3)+2)+"' onchange=\"javascript:getCodeJobTypeAllListAjax('job', this, '3차직무선택', 'bizType"+((appendNum*3)+3)+"', true, true);\">";
				trHtml += "<option value=''>2차직무선택</option>\n";
				trHtml += "</select>\n";
				trHtml += "<select id='bizType"+((appendNum*3)+3)+"' name='bizType"+((appendNum*3)+3)+"' >";
				trHtml += "<option value=''>3차직무선택</option>\n";
				trHtml += "</select>";
				trHtml += "</td>";
				trHtml += "</tr>";
				
				$("#job").find("tr").eq(appendNum-1).after(trHtml);	
				
				getCodeJobTypeAllListAjax("job", "", "1차직무선택", "bizType"+((appendNum*3)+1), true, true);
			}
			
		}else if(itemKind == "area_job"){
			
			if($("#area_job tr").length < 3){
					
				trHtml = "";
				trHtml += "<tr id='area_job'>";
				trHtml += "<th></th>";
				trHtml += "<td>";
				trHtml += "<select id='bizAreaJob"+((appendNum*3)+1)+"' name='bizAreaJob"+((appendNum*3)+1)+"' onchange=\"javascript:getNetfuCateListForSelect('area_job', this, '2차산업선택', 'bizAreaJob"+((appendNum*3)+2)+"', true, true);\">";
				trHtml += "<option value=''>1차산업선택</option>\n";
				trHtml += "</select>\n";
				trHtml += "<select id='bizAreaJob"+((appendNum*3)+2)+"' name='bizAreaJob"+((appendNum*3)+2)+"' onchange=\"javascript:getNetfuCateListForSelect('area_job', this, '3차산업선택', 'bizAreaJob"+((appendNum*3)+3)+"', true, true);\">";
				trHtml += "<option value=''>2차산업선택</option>\n";
				trHtml += "</select>\n";
				trHtml += "<select id='bizAreaJob"+((appendNum*3)+3)+"' name='bizAreaJob"+((appendNum*3)+3)+"'>";
				trHtml += "<option value=''>3차산업선택</option>\n";
				trHtml += "</select>";
				trHtml += "</td>";
				trHtml += "</tr>";
				
				$("#area_job").find("tr").eq(appendNum-1).after(trHtml);	
				
				getNetfuCateListForSelect("area_job", "", "1차산업선택", "bizAreaJob"+((appendNum*3)+1), true, true);
			}

		}else if(itemKind == "area"){
			
			if($("#area tr").length < 3){
					
				trHtml = "";
				trHtml += "<tr>";
				trHtml += "	<th></th>";
				trHtml += "	<td>";
				trHtml += "		<select id='bizArea"+((appendNum*2)+1)+"' name='bizArea"+((appendNum*2)+1)+"' onchange=\"javascript:getNetfuCateListForSelect('area', this, '시구군선택', 'bizArea"+((appendNum*2)+2)+"', true, true);\">";
				trHtml += "			<option value=''>시구군선택</option>\n";
				trHtml += "		</select>";
				trHtml += "		<select id='bizArea"+((appendNum*2)+2)+"' name='bizArea"+((appendNum*2)+2)+"' style=\"width: 200px;\" >";
				trHtml += "			<option value=''>시도 선택</option>\n";
				trHtml += "		</select>";
				trHtml += "	</td>";
				trHtml += "</tr>";
				
				$("#area").find("tr").eq(appendNum-1).after(trHtml);	
				
				getNetfuCateListForSelect("area", "", "시도 선택", "bizArea"+((appendNum*2)+1), true, true);
			}
		}
	}
	
	function deleteItem(itemKind){
		
		var itemObj = $("#"+itemKind);
		
		if($(itemObj).find("tr").length > 1){
			$(itemObj).find("tr:last").remove();	
		}
	}
	
	
	function registRecruit(){
		
		if(checkNull($("#bizTitle").val())){ alertAndFocus("공고제목을 입력하세요.", $("#bizTitle")); return; }
		if(checkNull($("#bizType3 option:selected").val())){ alert("직무를 선택하세요."); return; }
		if(checkNull($("#bizAreaJob3 option:selected").val())){ alert("산업분야를 선택하세요."); return; }
		if(checkNull($("#bizArea2 option:selected").val())){ alert("근무지역을 선택하세요."); return; }
		if(checkNull($("#bizBusiness").val())){ alertAndFocus("담당업무를 입력하세요.", $("#bizBusiness")); return; }
		
		//채용마감.
		var bizIng ='yes';
		if ($('#bizIngChk').prop("checked")) bizIng = 'no';
		$('#bizIng').val(bizIng)

		// 고용형태 checkbox
		var bizJobfrom = "";
		$("input[name=bizJobfromChk]").each(function() {
		      if(this.checked){
		    	  bizJobfrom += this.value+",";
		      }
		});
		bizJobfrom = bizJobfrom.length > 0 ? bizJobfrom.substring(0, bizJobfrom.length-1) : "";
		if(checkNull(bizJobfrom)){ alert("고용형태를 선택하세요."); return; }
		$("#bizJobfrom").val(bizJobfrom);
		
		if(checkNull($("#bizMen").val())){ alertAndFocus("모집인원을 입력하세요.", $("#bizMen")); return; }
		
		
		// 경력사항 radio button
		var bizCareer = "";
		var bizCareerRadioVal = $("input[name=bizCareerRadio]:checked").val();
		if(bizCareerRadioVal == "100" || bizCareerRadioVal == "102"){	// 100:경력 무관 , 102:신입
			bizCareer = bizCareerRadioVal;
		}else{
			bizCareer = $("#bizCareerYear option:selected").val();
		}
		if(checkNull(bizCareer)){ alert("경력사항을 선택하세요."); return; }
		$("#bizCareer").val(bizCareer);
		
		if(checkNull($("#payType option:selected").val())){ alert("급여종류를 선택하세요."); return; }
		
		if($("#payType option:selected").val() != "payCheck01" && $("#bizPay option:selected").val() == ""){
			alert("급여액수를 선택하세요.");
			return;
		}
		
		//if(checkNull($("#bizAbility option:selected").val())){ alert("최종학력을 선택하세요."); return; }
		 
		// 우대조건 checkbox
		var bizPreferential = "";
		$("input[name=bizPreferentialChk]").each(function() {
		      if(this.checked){
		    	  bizPreferential += this.value+",";
		      }
		});
		bizPreferential = bizPreferential.length > 0 ? bizPreferential.substring(0, bizPreferential.length-1) : "";
		$("#bizPreferential").val(bizPreferential);
		
		// 채용방법 checkbox
		var bizEndType = "";
		$("input[name=bizEndTypeChk]").each(function() {
			  if(this.checked){
				  bizEndType = this.value;
			  }
		});
		if(checkNull(bizEndType)){
			alert("채용마감방법을 선태하세요.");
			return;
		}
		if(bizEndType == "input" && checkNull($("#bizEndDay").val())){
			alert("채용 마감일을 선태하세요.");
			return;
		}
		$("#bizEndType").val(bizEndType);
		
		// 제출서류 checkbox
		var bizPaper = "";
		$("input[name=bizPaperChk]").each(function() {
		      if(this.checked){
		    	  bizPaper += this.value+",";
		      }
		});
		bizPaper = bizPaper.length > 0 ? bizPaper.substring(0, bizPaper.length-1) : "";
		$("#bizPaper").val(bizPaper);
		
		// 접수방법 checkbox
		var bizMethod = "";
		$("input[name=bizMethodChk]").each(function() {
		      if(this.checked){
		    	  bizMethod += this.value+",";
		      }
		});
		bizMethod = bizMethod.length > 0 ? bizMethod.substring(0, bizMethod.length-1) : "";
		if(checkNull(bizMethod)){ alert("접수방법을 선택하세요."); return; }
		$("#bizMethod").val(bizMethod);

		// 이력서 양식 checkbox
		var bizForm = "";
		$("input[name=bizFormChk]").each(function() {
		      if(this.checked){
		    	  bizForm += this.value+",";
		      }
		});
		bizForm = bizForm.length > 0 ? bizForm.substring(0, bizForm.length-1) : "";
		$("#bizForm").val(bizForm);
		
		if(checkNull($("#bizPerson").val())){ alertAndFocus("담당자를 입력하세요.", $("#bizPerson")); return; }
		
		if(checkNull($("#bizPphone1").val()) && checkNull($("#bizPphone2").val()) && checkNull($("#bizPphone3").val())){
			alert("담당자 전화번호를 입력하세요."); 
			return; 
		}
		$("#bizPphone").val($("#bizPphone1").val()+"-"+$("#bizPphone2").val()+"-"+$("#bizPphone3").val());
		
		/*
		if(checkNull($("#bizPfax1").val()) && checkNull($("#bizPfax2").val()) && checkNull($("#bizPfax3").val())){
			alert("담당자 팩스번호를 입력하세요."); 
			return; 
		}
		$("#bizPfax").val($("#bizPfax1").val()+"-"+$("#bizPfax2").val()+"-"+$("#bizPfax3").val());
		*/
		
		if(checkNull($("#bizPemailId").val())){ alertAndFocus("담당자 이메일 ID를 입력하세요.", $("#bizPemailId")); return; }
		if(checkNull($("#bizPemailHost").val())){ alertAndFocus("담당자 이메일 종류를 입력하세요.", $("#bizPemailHost")); return; }
		
		$("#bizPemail").val($("#bizPemailId").val()+"@"+$("#bizPemailHost").val());

		bizDetail_object.getById["bizDetail"].exec("UPDATE_CONTENTS_FIELD", []);
		
		loadingOn();
		
		$("#registForm").submit();
		
	}
	
</script>


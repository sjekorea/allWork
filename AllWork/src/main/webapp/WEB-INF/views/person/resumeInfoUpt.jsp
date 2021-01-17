<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/personHeader.do" />

<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<link rel="stylesheet" type="text/css" href="/css/resume.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/personSubMenu.do" />
			<!-- 
			<div id="leftPart_buttom">
				<ul>
					<li class="res_ok"><a href="#none" title="수정">수정</a></li>
				</ul>
			</div>
			 -->
		</div>
		<div id="rightPart">
		<form id="registForm" name="registForm" enctype="multipart/form-data" action="/updateResume.do" method="post">
			<input type="hidden" name="infoType" id="infoType" value="1" />
			<input type="hidden" name="no" id="no" value="${map.no}" />
			<input type="hidden" name="uid" id="uid" value="${SE_LOGIN_ID}" />
			<input type="hidden" name="name" id="name" value="${memberMap.name}" />
			<input type="hidden" name="inidPhotoOrg" id="inidPhotoOrg" value="${memberMap.photo}" />
			<input type="hidden" name="inidPhone" id="inidPhone" value="${memberMap.phone}" />
			<input type="hidden" name="inidHphone" id="inidHphone" value="${memberMap.hphone}" />
			<input type="hidden" name="inidEmail" id="inidEmail" value="${memberMap.hphone}" />
			<input type="hidden" name="inidPost" id="inidPost" value="${memberMap.post}" />
			<input type="hidden" name="inidAddress1" id="inidAddress1" value="${memberMap.address1}" />
			<input type="hidden" name="inidAddress2" id="inidAddress2" value="${memberMap.address2}" />
			<input type="hidden" name="inidHome" id="inidHome" value="${memberMap.home}" />
			<input type="hidden" name="educationDegree" id="educationDegree" value="${memberMap.educationDegree}" />
			<input type="hidden" name="careerTotal" id="careerTotal" value="${memberMap.careerTotal}" />
				
			<div id="resume00">
				<div id="detailArea">
					<p class="detail_title">기본정보</p>
					<p class="personal_setting"><a href="/updateMyInfo.do" title="기본정보수정"><i class="fas fa-cog"></i>&nbsp;기본정보수정</a></p>
					<div id="imgPart">
						<div class="imgArea">
				<c:if test="${memberMap.photo == null || memberMap.photo == '' }">
							<p><img src="/img/userNo.png" alt="본인사진"/></p>
				</c:if>
				<c:if test="${memberMap.photo != null && memberMap.photo != '' }">
						<p><img src="/allwork/peg/${memberMap.photo}" alt="이력서 사진" /></p>
				</c:if>
						</div>
						<!-- 
						<p class="btnArea"><label for="myImg">사진선택</label><input id="inidPhoto" name="inidPhoto" type="file" onchange="javascript:viewImgName(this);"/><br/><li id="imgName"></li></p>
						 -->
						<input type="hidden" name="orgInidPhoto" id="orgInidPhoto" value="${resumeMap.inidPhoto }" />
					</div>
					<table>
						<caption>이력 등록하기</caption>
						<tbody class="tabelArea">
							<tr><th class="table_title">이름</th><td class="table_desc">${memberMap.name }</td></tr>
							<tr><th class="table_title">이메일</th><td class="table_desc">${memberMap.email }</td></tr>
							<tr><th class="table_title">휴대폰</th><td class="table_desc">${memberMap.hphone }</td></tr>
							<tr><th class="table_title">연락처</th><td class="table_desc">${memberMap.phone }</td></tr>
							<tr><th class="table_title">주소</th><td class="table_desc">[${memberMap.post }] ${memberMap.address1 } ${memberMap.address2 }</td></tr>
						</tbody>
					</table>
				</div>
			</div>
				<div id="resume01">
					<li id="resForm01">
						<fieldset>
							<legend>이력서 등록하기</legend>
							<div>
								<table>
									<caption>이력서 등록하기</caption>
									<tbody>
										<tr>
											<th>이력서 공개<span class="necessary">*</span></th>
											<td>
												<span><input id="inidSecretRadio" type="radio" name="inidSecretRadio" checked value="no"/><label for="res01_desc01">&nbsp;공개</label></span>
												<span><input id="inidSecretRadio" type="radio" name="inidSecretRadio" value="yes"/><label for="res01_desc01_1">&nbsp;비공개</label></span>
												<input type="hidden" name="inidSecret" id="inidSecret" value="" />
											</td>
										</tr>
										<!-- 
										<tr>
											<th>사진 공개<span class="necessary">*</span></th>
											<td>
												<span><input id="inidPChkRadio" type="radio" name="inidPChkRadio" checked value="yes"/><label for="res01_desc01">&nbsp;공개</label></span>
												<span><input id="inidPChkRadio" type="radio" name="inidPChkRadio" value="no"/><label for="res01_desc01_1">&nbsp;비공개</label></span>
												<input type="hidden" name="inidPChk" id="inidPChk" value="" />
											</td>
										</tr>
										 -->
												<input type="hidden" name="inidPChk" id="inidPChk" value="yes" />
									</tbody>
								</table>
							</div>
						</fieldset>
					</li>
				</div>
				<div id="resume02">
					<li id="resForm02">
						<fieldset>
							<legend>희망구직 정보</legend>
							<table>
								<caption>희망구직 정보</caption>
								<tbody>
									<tr>
										<th>이력서 제목<span class="necessary">*</span></th>
										<td>
											<span><input id="inidTitle" type="text" name="inidTitle" placeholder="(예 : ASP, SQL, MT 웹프로그래밍)"/></span>
											<span>이력서 제목은 이력서 열람여부를 결정짓는 중요한 부분이므로 희망직무 또는 구체적인 지원분야를 쓰시는 것이 좋습니다.</span>
										</td>
									</tr>
									<tr>
										<th>보유기술</th>
										<td><textarea id="inidMylskill" name="inidMylskill">${resumeMap.inidMylskill}</textarea></td>
									</tr>
									<tr>
										<th>현재상태</th>
										<td>
											<span><input id="indiConditionRadio" type="radio" name="indiConditionRadio" value="1"/><label for="res02_desc02">&nbsp;&nbsp;구직희망(미취업)</label></span>
											<span><input id="indiConditionRadio" type="radio" name="indiConditionRadio" value="2"/><label for="res02_desc02_1">&nbsp;&nbsp;이직희망(재직중)</label></span>
											<span><input id="indiConditionRadio" type="radio" name="indiConditionRadio" value="3"/><label for="res02_desc02_2">&nbsp;&nbsp;구직희망안함</label></span>
											<input type="hidden" name="indiCondition" id="indiCondition" />
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody id="area">
									<tr>
										<th>희망근무지<span class="necessary">*</span></th>
										<td>
											<select id="inidArea1" name="inidArea1" onchange="javascript:getNetfuCateListForSelect('area', this, '시구군선택', 'inidArea2', true, true);">
												<option value="">시도 선택</option>
												<c:forEach var="result" items="${areaList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach>
											</select>
											<select id="inidArea2" name="inidArea2">
												<option value="">시구군선택</option>
											</select>
											<input type="button" name="appendItem" kind="area" value="+ 추가" />
											<input type="button" name="deleteItem" kind="area" value="- 삭제" />
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody id="job">
									<tr>
										<th>직무분야<span class="necessary">*</span></th>
										<td>
											<select id="inidType1" name="inidType1" title="1차직무선택" onchange="javascript:getNetfuCateListForSelect('job', this, '2차직무선택', 'inidType2', true, true);">
												<option value="">1차직무선택</option>
												<c:forEach var="result" items="${jobList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach>
											</select>
											<select id="inidType2" name="inidType2" title="2차직무선택" onchange="javascript:getNetfuCateListForSelect('job', this, '3차직무선택', 'inidType3', true, true);">
												<option value="">2차직무선택</option>
											</select>
											<select id="inidType3" name="inidType3" title="3차직무선택">
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
											<select id="inidAreaJob1" name="inidAreaJob1" title="1차산업선택" onchange="javascript:getNetfuCateListForSelect('area_job', this, '2차산업선택', 'inidAreaJob2', true, true);">
												<option value="">1차산업선택</option>
												<c:forEach var="result" items="${areaJobList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach>
											</select>
											<select id="inidAreaJob2" name="inidAreaJob2" title="2차산업선택" onchange="javascript:getNetfuCateListForSelect('area_job', this, '3차산업선택', 'inidAreaJob3', true, true);">
												<option value="">2차산업선택</option>
											</select>
											<select id="inidAreaJob3" name="inidAreaJob3" title="3차산업선택">
												<option value="3차직무선택">3차산업선택</option>
											</select>
											<input type="button" name="appendItem" kind="area_job" value="+ 추가" />
											<input type="button" name="deleteItem" kind="area_job" value="- 삭제" />
										</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr>
										<th>희망근무형태<span class="necessary">*</span></th>
										<td>
											<c:forEach var="result" items="${jobTypeList}" varStatus="status">
												<span><input id="inidJobformChk" type="checkbox" name="inidJobformChk" value="${result.code}"/><label for="reg02_desc07">${result.name}</label></span>
											</c:forEach>
											<input type="hidden" name="inidJobform" id="inidJobform" />
										</td>
									</tr>
									<tr>
										<th>희망연봉<span class="necessary">*</span></th>
										<td>
											<select id="payType" name="payType" onchange="javascript:getNetfuCateListForSelect('inid_pay', this, '', 'inidPay', true, false);">
												<option value="">선택</option>
												<c:forEach var="result" items="${inidPayList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach>
											</select>
											<select id="inidPay" name="inidPay">
											</select>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</li>
				</div>
				<div id="resume03">
					<li id="resForm03">
						<fieldset>
							<legend>학력사항</legend>
							<table>
								<caption>학력사항</caption>
								<tbody id="education">
									<tr class="final_education">
										<th>최종학력</th>
										<td>
											<select id="final_degree" name="final_degree" title="학력 선택">
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
									<tr class="education">
										<th>학력</th>
										<td>
											<span>
												<input id="lesson_sdate_full" type="date" placeholder="yyyy-mm-dd" name="lesson_sdate_full"/>
												<select id="school2" name="school2" title="학교구분">
													<option value="">학력 선택</option>
													<option value="100">학력무관</option>
													<option value="1">고등학교졸업</option>
													<option value="2">대학졸업(2~3년)</option>
													<option value="3">대학교졸업(4년)</option>
													<option value="4">석사</option>
													<option value="5">박사</option>
												</select>
												<input id="school" type="text" name="school" placeholder="학교명"/>
											</span>
											<span>
												<input id="lesson_edate_full" type="date" placeholder="yyyy-mm-dd" name="lesson_edate_full"/>
												<select id="lesson_state" name="lesson_state" title="졸업상태">
													<c:forEach var="result" items="${jobStateList}" varStatus="status">
														<option value="${result.code}">${result.name}</option>
													</c:forEach>
												</select>
												<input id="lesson" type="text" name="lesson" placeholder="전공명"/>
												<input id="lesson2" type="text" name="lesson2" placeholder="학과명"/>
											</span>
											<span class="comment"> 다중 학력자는 [추가]를 클릭하면 현재 입력폼에서 추가 경력을 작성할 수 있습니다.</span>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</li>
					<p class="moreTab">
						<input type="button" name="appendItem" kind="education" value="+ 추가"/>
						<input type="button" name="deleteItem" kind="education" value="- 삭제"/>
					</p>
				</div>
				<div id="resume04">
					<li id="resForm04">
						<fieldset>
							<legend>경력사항</legend>
							<table>
								<caption>경력사항</caption>
								<tbody id="career">
									<tr class="total_experience">
										<th>총 경력년수</th>
										<td>
											<select id="total_year" name="total_year" title="경력연차">
												<c:forEach var="i" begin="0" end="50">
													<option value="${i}">${i}</option>
												</c:forEach>
											</select>&nbsp;년
											<select id="total_month" name="total_month" title="경력연차">
												<c:forEach var="i" begin="0" end="12">
													<option value="${i}">${i}</option>
												</c:forEach>
											</select>&nbsp;개월
											<!-- 
											<input id="careerKindChk" type="checkbox" name="careerKind" value="102"/><label for="res04_desc01_2">신입</label>
											 -->
											<input type="hidden" name="careerKind" id="careerKind" value="" />
										</td>
									</tr>
									<tr class="experience">
										<th>경력</th>
										<td>
											<span>
												<input id="hold_sdate_full" type="date" placeholder="yyyy-mm-dd" name="hold_sdate_full"/>
												<input id="company" type="text" name="company" placeholder="회사명"/>
												
											</span>
											<span>
												<input id="hold_edate_full" type="date" placeholder="yyyy-mm-dd" name="hold_edate_full"/>
												<input id="business" type="text" name="business" placeholder="담당업무"/>
											</span>
											<span class="comment"> 다중 경력자는 [추가]를 클릭하면 현재 입력폼에서 추가 경력을 작성할 수 있습니다.</span>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</li>
					<p class="moreTab">
						<input type="button" name="appendItem" kind="career" value="+ 추가"/>
						<input type="button" name="deleteItem" kind="career" value="- 삭제"/>
					</p>
				</div>
				<div id="resume06">
					<li id="resForm06" action="#none" method="post">
						<fieldset>
							<legend>자격사항</legend>
							<table>
								<caption>자격사항</caption>
								<tbody id="licence">
									<tr>
										<th>자격사항</th>
										<td>
											<p class="part01"><span>취득일자</span><br/><input id="obtain_date" type="date" placeholder="yyyy-mm-dd" name="obtain_date"/></p>
											<p class="part02"><span>자격증명</span><br/><input id="qualification" type="text" placeholder="자격증명" name="qualification"/></p>
											<p class="part03"><span>발행처</span><br/><input id="public_place" type="text" name="public_place"/></p>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</li>
					<p class="moreTab">
						<input type="button" name="appendItem" kind="licence" value="+ 추가"/>
						<input type="button" name="deleteItem" kind="licence" value="- 삭제"/>
					</p>
				</div>
				<div id="resume07">
					<li id="resForm07">
						<fieldset>
							<legend>외국어</legend>
							<table>
								<caption>외국어</caption>
								<tbody id="language">
									<tr>
										<th>외국어</th>
										<td>
											<p class="part01"><span>취득일자</span><br/><input id="ex_obtain_date" type="date" placeholder="yyyy-mm-dd"  name="ex_obtain_date"/></p>
											<p class="part02"><span>외국어명</span><br/><input id="language" type="text" name="language"/></p>
											<p class="part03">
												<span>수준</span><br/>
												<select id="level" name="level" title="선택">
													<option value="">선택</option>
													<option value="상">상</option>
													<option value="중">중</option>
													<option value="하">하</option>
												</select>
											</p>
											<p class="part04"><span>발행처</span><br/><input id="examination" type="text" name="examination"/></p>
											<p class="part05"><span>점수</span><br/><input id="point" type="text" name="point"/></p>
											<p class="part06"><span>점수/등급</span><br/>
												<select id="level2" name="level2" title="선택">
													<option value="">선택</option>
													<option value="점">점</option>
													<option value="급">급</option>
												</select>
											</p>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</li>
					<p class="moreTab">
						<input type="button" name="appendItem" kind="language" value="+ 추가"/>
						<input type="button" name="deleteItem" kind="language" value="- 삭제"/>
					</p>
				</div>
				<div id="resume08">
					<li id="resForm08">
						<fieldset>
							<legend>자기소개서<span>(경력위주로 작성해주세요)</span></legend>
							<table>
								<caption>자기소개서</caption>
								<tbody>
									<tr>
										<th>자기소개서</th>
										<td>
											<div><textarea id="inidIntroduce" name="inidIntroduce" style="width: 100%;" >${resumeMap.inidIntroduce }</textarea></div>
											<!-- 
											<div><iframe frameborder="0" scrolling="no" style="width: 100%; height: 249px;" src="/smartEditor/SmartEditor2Skin.html"></iframe></div>
											 -->
										</td>
									</tr>
								</tbody>
							</table>	
						</fieldset>
					</li>
				</div>
				<div id="resume09">
					<li id="resForm09">
						<fieldset>
							<legend>Portpolio 첨부하기</legend>
							<table>
								<caption>파일 첨부하기</caption>
								<tbody>
									<tr>
										<th>포트폴리오 파일 첨부하기 </th>
										<td>
											<input id="portfolioFile" type="file" name="portfolioFile"/>
											<input type="hidden" name="orgportfolioFile" id="orgportfolioFile" value="${resumeMap.portfolioFile }" />
											<c:if test="${resumeMap.portfolioFile != null and resumeMap.portfolioFile.length() > 0 }">
												포트폴리오 파일: 등록중
											</c:if>
											<c:if test="${resumeMap.portfolioFile == null or resumeMap.portfolioFile.length() < 1 }">
												포트폴리오 파일: 미등록
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</li>
				</div>
				<input type="hidden" name="education2" id="education2" value="" />
				<input type="hidden" name="career2" id="career2" value="" />
				<input type="hidden" name="license2" id="license2" value="" />
				<input type="hidden" name="language2" id="language2" value="" />
				<input type="hidden" name="smsSend" id="smsSend" value="NO" />
				<input type="hidden" name="aInsert" id="aInsert" value="NO" />
			</form>
			<ul>
			<c:if test="${resumeMap.portfolioFile != null and resumeMap.portfolioFile.length() > 0 }">
				<li><a href="/allwork/peg/${resumeMap.portfolioFile}" title="포트폴리오 다운로드">포트폴리오 다운로드</a></li>
			</c:if>
				<li class="res_ok"><a href="#none" title="수정">수정</a></li>
			</ul>
			</form>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />


<script type="text/javascript">

	var inidIntroduce_object = [];	

	$(document).ready(function(){
		
		nhn.husky.EZCreator.createInIFrame({
	        oAppRef: inidIntroduce_object,
	        elPlaceHolder: "inidIntroduce",
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
		
		
		$(".res_ok").on("click", function(e){
			updateResume();
		});
		
		<c:if test="${!resumeMap.isEmpty()}">
		
			// 이력서 공개/비공개
			if("${resumeMap.inidSecret}" == "yes"){
				$(":radio[name='inidSecretRadio'][value='yes']").prop("checked", true);
			}else{
				$(":radio[name='inidSecretRadio'][value='no']").prop("checked", true);
			}
			
			/*
			// 사진 공개/비공개
			if("${resumeMap.inidPChk}" == "yes"){
				$(":radio[name='inidPChkRadio'][value='yes']").prop("checked", true);
			}else{
				$(":radio[name='inidPChkRadio'][value='no']").prop("checked", true);
			}
			*/
			
			// 이력서 제목
			$("#inidTitle").val("${resumeMap.inidTitle}");
			
			// 현재 상태
			if("${resumeMap.indiCondition}" == "1"){
				$(":radio[name='indiConditionRadio'][value='1']").prop("checked", true);
			}else if("${resumeMap.indiCondition}" == "2"){
				$(":radio[name='indiConditionRadio'][value='2']").prop("checked", true);
			}else if("${resumeMap.indiCondition}" == "3"){
				$(":radio[name='indiConditionRadio'][value='3']").prop("checked", true);
			}else{
			}
			
			// 근무 지역
			if(!checkNull("${resumeMap.inidArea1}")){
				$("#inidArea1").val("${resumeMap.inidArea1}");
				getNetfuCateListForSelect('area', $("#inidArea1"), '시구군선택', 'inidArea2', false, true);
			}
			
			if(!checkNull("${resumeMap.inidArea2}")){
				$("#inidArea2").val("${resumeMap.inidArea2}");
			}
			
			if(!checkNull("${resumeMap.inidArea3}")){
				appendItem("area");
				$("#inidArea3").val("${resumeMap.inidArea3}");
				getNetfuCateListForSelect('area', $("#inidArea3"), '시구군선택', 'inidArea4', false, true);
			}
			
			if(!checkNull("${resumeMap.inidArea4}")){
				$("#inidArea4").val("${resumeMap.inidArea4}");
			}
			
			if(!checkNull("${resumeMap.inidArea5}")){
				appendItem("area");
				$("#inidArea5").val("${resumeMap.inidArea5}");
				getNetfuCateListForSelect('area', $("#inidArea5"), '시구군선택', 'inidArea6', false, true);
			}
			
			if(!checkNull("${resumeMap.inidArea6}")){
				$("#inidArea6").val("${resumeMap.inidArea6}");
			}
			
			
			// 직무 분야
			if(!checkNull("${resumeMap.inidType1}")){
				$("#inidType1").val("${resumeMap.inidType1}");
				getNetfuCateListForSelect('job', $("#inidType1"), '2차직무선택', 'inidType2', false, true);
			}
			
			if(!checkNull("${resumeMap.inidType2}")){
				$("#inidType2").val("${resumeMap.inidType2}");
				getNetfuCateListForSelect('job', $("#inidType2"), '3차직무선택', 'inidType3', false, true);
			}
			
			if(!checkNull("${resumeMap.inidType3}")){
				$("#inidType3").val("${resumeMap.inidType3}");
			}
			
			if(!checkNull("${resumeMap.inidType4}")){
				appendItem("job");
				$("#inidType4").val("${resumeMap.inidType4}");
				getNetfuCateListForSelect('job', $("#inidType4"), '2차직무선택', 'inidType5', false, true);
			}
			
			if(!checkNull("${resumeMap.inidType5}")){
				$("#inidType5").val("${resumeMap.inidType5}");
				getNetfuCateListForSelect('job', $("#inidType5"), '3차직무선택', 'inidType6', false, true);
			}
			
			if(!checkNull("${resumeMap.inidType6}")){
				$("#inidType6").val("${resumeMap.inidType6}");
			}
			
			if(!checkNull("${resumeMap.inidType7}")){
				appendItem("job");
				$("#inidType7").val("${resumeMap.inidType7}");
				getNetfuCateListForSelect('job', $("#inidType7"), '2차직무선택', 'inidType8', false, true);
			}
			
			if(!checkNull("${resumeMap.inidType8}")){
				$("#inidType8").val("${resumeMap.inidType8}");
				getNetfuCateListForSelect('job', $("#inidType8"), '3차직무선택', 'inidType9', false, true);
			}
			
			if(!checkNull("${resumeMap.inidType9}")){
				$("#inidType9").val("${resumeMap.inidType9}");
			}
			
			
			// 산업 분야
			if(!checkNull("${resumeMap.inidAreaJob1}")){
				$("#inidAreaJob1").val("${resumeMap.inidAreaJob1}");
				getNetfuCateListForSelect('area_job', $("#inidAreaJob1"), '2차직무선택', 'inidAreaJob2', false, true);
			}
			
			if(!checkNull("${resumeMap.inidAreaJob2}")){
				$("#inidAreaJob2").val("${resumeMap.inidAreaJob2}");
				getNetfuCateListForSelect('area_job', $("#inidAreaJob2"), '3차직무선택', 'inidAreaJob3', false, true);
			}
			
			if(!checkNull("${resumeMap.inidAreaJob3}")){
				$("#inidAreaJob3").val("${resumeMap.inidAreaJob3}");
			}
			
			if(!checkNull("${resumeMap.inidAreaJob4}")){
				appendItem("area_job");
				$("#inidAreaJob4").val("${resumeMap.inidAreaJob4}");
				getNetfuCateListForSelect('area_job', $("#inidAreaJob4"), '2차직무선택', 'inidAreaJob5', false, true);
			}
			
			if(!checkNull("${resumeMap.inidAreaJob5}")){
				$("#inidAreaJob5").val("${resumeMap.inidAreaJob5}");
				getNetfuCateListForSelect('area_job', $("#inidAreaJob5"), '3차직무선택', 'inidAreaJob6', false, true);
			}
			
			if(!checkNull("${resumeMap.inidAreaJob6}")){
				$("#inidAreaJob6").val("${resumeMap.inidAreaJob6}");
			}
			
			if(!checkNull("${resumeMap.inidAreaJob7}")){
				appendItem("area_job");
				$("#inidAreaJob7").val("${resumeMap.inidAreaJob7}");
				getNetfuCateListForSelect('area_job', $("#inidAreaJob7"), '2차직무선택', 'inidAreaJob8', false, true);
			}
			
			if(!checkNull("${resumeMap.inidAreaJob8}")){
				$("#inidAreaJob8").val("${resumeMap.inidAreaJob8}");
				getNetfuCateListForSelect('area_job', $("#inidAreaJob8"), '3차직무선택', 'inidAreaJob9', false, true);
			}
			
			if(!checkNull("${resumeMap.inidAreaJob9}")){
				$("#inidAreaJob9").val("${resumeMap.inidAreaJob9}");
			}
			
			
			// 희망 근무 형태
			var form = "${resumeMap.inidJobform}".split(",");
			for(var i = 0 ; i < form.length ; i++){
				$('input:checkbox[name="inidJobformChk"]').each(function() {
					if(form[i] == this.value){
						$(this).attr("checked", true);
					}
				});
			}
			
			
			// 희망 연봉
			if(!checkNull("${resumeMap.payType}")){
				$("#payType").val("${resumeMap.payType}");
				getNetfuCateListForSelect('inid_pay', $("#payType"), '급여 선택', 'inidPay', false, true);
			} 
			
			if(!checkNull("${resumeMap.inidPay}")){
				$("#inidPay").val("${resumeMap.inidPay}");
			} 
			
			
			// 학력 사항
			$("#final_degree").val("${resumeEducation.final_degree }");
			<c:forEach var="result" items="${resumeEducation.data}" varStatus="status">
				<c:if test="${status.index > 0}">
					appendItem("education");
				</c:if>		
				$("input[name='lesson_sdate_full']").eq("${status.index}").val("${result.lesson_sdate}"+"-"+"${result.lesson_sdate2}"+"-01");
				$("select[name='school2']").eq("${status.index}").val("${result.school2 }");
				$("input[name='school']").eq("${status.index}").val("${result.school }");
				$("input[name='lesson_edate_full']").eq("${status.index}").val("${result.lesson_edate}"+"-"+"${result.lesson_edate2}"+"-01");
				//$("select[name='lesson_state${status.count}']").val("${result.lesson_state }");
			<c:if test="${status.count <= 1}">
				$("select[name='lesson_state']").eq("${status.index}").val("${result.lesson_state }");
			</c:if>		
			<c:if test="${status.count > 1}">
				$("select[name='lesson_state${status.count}']").val("${result.lesson_state }");
			</c:if>		
				$("input[name='lesson']").eq("${status.index}").val("${result.lesson }");
				$("input[name='lesson2']").eq("${status.index}").val("${result.lesson2 }");
			</c:forEach>
			
			// 경력 사항
			$("#total_year").val("${resumeCareer.total_year }");
			$("#total_month").val("${resumeCareer.total_month }");
			<c:forEach var="result" items="${resumeCareer.data}" varStatus="status">
				<c:if test="${status.index > 0}">
					appendItem("career");
				</c:if>	
				$("input[name='hold_sdate_full']").eq("${status.index}").val("${result.hold_sdate}"+"-"+"${result.hold_sdate2}"+"-01");
				$("input[name='company']").eq("${status.index}").val("${result.company }");
				$("input[name='hold_edate_full']").eq("${status.index}").val("${result.hold_edate}"+"-"+"${result.hold_edate2}"+"-01");
				$("input[name='business']").eq("${status.index}").val("${result.business }");
			</c:forEach>
			
			// 자격사항
			<c:forEach var="result" items="${resumeLicense.data}" varStatus="status">
				<c:if test="${status.index > 0}">
					appendItem("licence");
				</c:if>
				$("input[name='obtain_date']").eq("${status.index}").val("${result.obtain_date }");
				$("input[name='qualification']").eq("${status.index}").val("${result.qualification }");
				$("input[name='public_place']").eq("${status.index}").val("${result.public_place }");
			</c:forEach>
			
			// 외국어
			<c:forEach var="result" items="${resumeLanguage.data}" varStatus="status">
				<c:if test="${status.index > 0}">
					appendItem("language");
				</c:if>
				$("input[name='ex_obtain_date']").eq("${status.index}").val("${result.ex_obtain_date }");
				$("input[name='language']").eq("${status.index}").val("${result.language }");
				$("select[name='level']").eq("${status.index}").val("${result.level }");
				$("input[name='examination']").eq("${status.index}").val("${result.examination }");
				$("input[name='point']").eq("${status.index}").val("${result.point }");
				$("select[name='level2']").eq("${status.index}").val("${result.level2 }");
			</c:forEach>
			
			
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
				trHtml += "<select id='inidType"+((appendNum*3)+1)+"' name='inidType"+((appendNum*3)+1)+"' onchange=\"javascript:getNetfuCateListForSelect('job', this, '2차직무선택', 'inidType"+((appendNum*3)+2)+"', true, true);\">";
				trHtml += "<option value=''>1차직무선택</option>\n";
				trHtml += "</select>\n";
				trHtml += "<select id='inidType"+((appendNum*3)+2)+"' name='inidType"+((appendNum*3)+2)+"' onchange=\"javascript:getNetfuCateListForSelect('job', this, '3차직무선택', 'inidType"+((appendNum*3)+3)+"', true, true);\">";
				trHtml += "<option value=''>2차직무선택</option>\n";
				trHtml += "</select>\n";
				trHtml += "<select id='inidType"+((appendNum*3)+3)+"' name='inidType"+((appendNum*3)+3)+"' >";
				trHtml += "<option value=''>3차직무선택</option>\n";
				trHtml += "</select>";
				trHtml += "</td>";
				trHtml += "</tr>";
				
				$("#job").find("tr").eq(appendNum-1).after(trHtml);	
				
				getNetfuCateListForSelect("job", "", "1차직무선택", "inidType"+((appendNum*3)+1), true, true);
			}
			
			
		}else if(itemKind == "area_job"){
			
			if($("#area_job tr").length < 3){
					
				trHtml = "";
				trHtml += "<tr id='area_job'>";
				trHtml += "<th></th>";
				trHtml += "<td>";
				trHtml += "<select id='inidAreaJob"+((appendNum*3)+1)+"' name='inidAreaJob"+((appendNum*3)+1)+"' onchange=\"javascript:getNetfuCateListForSelect('area_job', this, '2차산업선택', 'inidAreaJob"+((appendNum*3)+2)+"', true, true);\">";
				trHtml += "<option value=''>1차산업선택</option>\n";
				trHtml += "</select>\n";
				trHtml += "<select id='inidAreaJob"+((appendNum*3)+2)+"' name='inidAreaJob"+((appendNum*3)+2)+"' onchange=\"javascript:getNetfuCateListForSelect('area_job', this, '3차산업선택', 'inidAreaJob"+((appendNum*3)+3)+"', true, true);\">";
				trHtml += "<option value=''>2차산업선택</option>\n";
				trHtml += "</select>\n";
				trHtml += "<select id='inidAreaJob"+((appendNum*3)+3)+"' name='inidAreaJob"+((appendNum*3)+3)+"'>";
				trHtml += "<option value=''>3차산업선택</option>\n";
				trHtml += "</select>";
				trHtml += "</td>";
				trHtml += "</tr>";
				
				$("#area_job").find("tr").eq(appendNum-1).after(trHtml);	
				
				getNetfuCateListForSelect("area_job", "", "1차산업선택", "inidAreaJob"+((appendNum*3)+1), true, true);
			}

			
		}else if(itemKind == "area"){
			
			if($("#area tr").length < 3){
					
				trHtml = "";
				trHtml += "<tr>";
				trHtml += "	<th></th>";
				trHtml += "	<td>";
				trHtml += "		<select id='inidArea"+((appendNum*2)+1)+"' name='inidArea"+((appendNum*2)+1)+"' onchange=\"javascript:getNetfuCateListForSelect('area', this, '시구군선택', 'inidArea"+((appendNum*2)+2)+"', true, true);\">";
				trHtml += "			<option value=''>시도 선택</option>\n";
				trHtml += "		</select>";
				trHtml += "		<select id='inidArea"+((appendNum*2)+2)+"' name='inidArea"+((appendNum*2)+2)+"' >";
				trHtml += "			<option value=''>시구군선택</option>\n";
				trHtml += "		</select>";
				trHtml += "	</td>";
				trHtml += "</tr>";
				
				$("#area").find("tr").eq(appendNum-1).after(trHtml);	
				
				getNetfuCateListForSelect("area", "", "시도 선택", "inidArea"+((appendNum*2)+1), true, true);
			}

			
		}else if(itemKind == "education"){
			
			trHtml += "<tr class='education'>";
			trHtml += "<th>학력</th>";
			trHtml += "<td>";
			trHtml += "	<span>";
			trHtml += "		<input id='lesson_sdate_full' type='date' placeholder='yyyy-mm-dd' name='lesson_sdate_full'/>";
			trHtml += "		<select id='school2' name='school2' title='학교구분'>";
			trHtml += "			<option value=''>학력 선택</option>";
			trHtml += "			<option value='100'>학력무관</option>";
			trHtml += "			<option value='1'>고등학교졸업</option>";
			trHtml += "			<option value='2'>대학졸업(2~3년)</option>";
			trHtml += "			<option value='3'>대학교졸업(4년)</option>";
			trHtml += "			<option value='4'>석사</option>";
			trHtml += "			<option value='5'>박사</option>";
			trHtml += "		</select>";
			trHtml += "		<input id='school' type='text' name='school' placeholder='학교명'/>";
			trHtml += "	</span>";
			trHtml += "	<span>";
			trHtml += "		<input id='lesson_edate_full' type='date' placeholder='yyyy-mm-dd' name='lesson_edate_full'/>";
			trHtml += "		<select id='lesson_state"+(appendNum)+"' name='lesson_state"+(appendNum)+"' title='졸업상태'>";
			trHtml += "		</select>";
			trHtml += "		<input id='lesson' type='text' name='lesson' placeholder='전공명'/>";
			trHtml += "		<input id='lesson2' type='text' name='lesson2' placeholder='학과명'/>";
			trHtml += "	</span>";
			trHtml += "</td>";
			trHtml += "</tr>";
			
			$("#education").find("tr").eq(appendNum-1).after(trHtml);	
			
			getNetfuCateListForSelect("job_state", "", "", "lesson_state"+(appendNum), false, false);
			//getNetfuCateListForSelectUsingSelectObj("job_state", "", "", $("#lesson_state").last(), false, false);
			
		}else if(itemKind == "career"){
			
			trHtml += "<tr class='experience'>";
			trHtml += "<th>경력</th>";
			trHtml += "<td>";
			trHtml += "	<span>";
			trHtml += "		<input id='hold_sdate_full' type='date' placeholder='yyyy-mm-dd' name='hold_sdate_full'/>";
			trHtml += "		<input id='company' type='text' name='company' placeholder='회사명'/>";
			trHtml += "	</span>";
			trHtml += "	<span>";
			trHtml += "		<input id='hold_edate_full' type='date' placeholder='yyyy-mm-dd' name='hold_edate_full'/>";
			trHtml += "		<input id='business' type='text' name='business' placeholder='담당업무'/>";
			trHtml += "	</span>";
			trHtml += "</td>";
			trHtml += "</tr>";
			
			$("#career").find("tr").eq(appendNum-1).after(trHtml);	
			
			
		}else if(itemKind == "licence"){
			
			trHtml += "<tr>";
			trHtml += "	<th>자격사항</th>";
			trHtml += "	<td>";
			trHtml += "		<p class='part01'><span>취득일자</span><br/><input id='obtain_date' type='date' placeholder='yyyy-mm-dd' name='obtain_date'/></p>";
			trHtml += "		<p class='part02'><span>자격증명</span><br/><input id='qualification' type='text' placeholder='자격증명' name='qualification'/></p>";
			trHtml += "		<p class='part03'><span>발행처</span><br/><input id='public_place' type='text' name='public_place'/></p>";
			trHtml += "		<input type='hidden' name='id' id='id' value='0' />";
			trHtml += "	</td>";
			trHtml += "</tr>";
			
			$("#licence").find("tr").eq(appendNum-1).after(trHtml);	
		   
			
		}else if(itemKind == "language"){
		
			trHtml += "<tr>";
			trHtml += "	<th>외국어</th>";
			trHtml += "	<td>";
			trHtml += "		<p class='part01'><span>취득일자</span><br/><input id='ex_obtain_date' type='date' placeholder='yyyy-mm-dd'  name='ex_obtain_date'/></p>";
			trHtml += "		<p class='part02'><span>외국어명</span><br/><input id='language' type='text' name='language'/></p>";
			trHtml += "		<p class='part03'>";
			trHtml += "			<span>수준</span><br/>";
			trHtml += "			<select id='level' name='level' title='선택'>";
			trHtml += "				<option value=''>선택</option>";
			trHtml += "				<option value='상'>상</option>";
			trHtml += "				<option value='중'>중</option>";
			trHtml += "				<option value='하'>하</option>";
			trHtml += "			</select>";
			trHtml += "		</p>";
			trHtml += "		<p class='part04'><span>발행처</span><br/><input id='examination' type='text' name='examination'/></p>";
			trHtml += "		<p class='part05'><span>점수</span><br/><input id='point' type='text' name='point'/></p>";
			trHtml += "		<p class='part06'><span>점수/등급</span><br/>";
			trHtml += "			<select id='level2' name='level2' title='선택'>";
			trHtml += "				<option value=''>선택</option>";
			trHtml += "				<option value='점'>점</option>";
			trHtml += "				<option value='급'>급</option>";
			trHtml += "			</select>";
			trHtml += "		</p>";
			trHtml += "	</td>";
			trHtml += "</tr>";
			
			$("#language").find("tr").eq(appendNum-1).after(trHtml);	
			
		}
	}

	
	function deleteItem(itemKind){
		
		var itemObj = $("#"+itemKind);
		
		if(itemKind == "education" || itemKind == "career"){
			if($(itemObj).find("tr").length > 2){
				$(itemObj).find("tr:last").remove();	
			}
		}else{
			if($(itemObj).find("tr").length > 1){
				$(itemObj).find("tr:last").remove();	
			}
		}
	}
	
	
	function viewImgName(imgObj){
		var imgObjArr = $(imgObj).val().split("\\");
		if(imgObjArr.length > 0){
			$("#imgName").text(imgObjArr[imgObjArr.length-1]);	
		}
	}
	
	function updateResume(){
		
		$("#inidSecret").val($("input[name=inidSecretRadio]:checked").val());
		$("#inidPChk").val($("input[name=inidPChkRadio]:checked").val());
		
		$("#indiCondition").val($("input[name=indiConditionRadio]:checked").val());
		
		var inidJobform = "";
		$("input[name=inidJobformChk]").each(function() {
		      if(this.checked){
		    	  inidJobform += this.value+",";
		      }
		});
		inidJobform = inidJobform.length > 0 ? inidJobform.substring(0, inidJobform.length-1) : "";
		$("#inidJobform").val(inidJobform);
		
		inidIntroduce_object.getById["inidIntroduce"].exec("UPDATE_CONTENTS_FIELD", []);  

		if(checkNull($("#inidSecret").val())){ alert("이력서 공개 여부를 체크하세요."); return; }
		if(checkNull($("#inidTitle").val())){ alertAndFocus("이력서 제목을 입력하세요.", $("#inidTitle")); return; }
		if(checkNull($("#inidArea1 option:selected").val())){ alert("근무지역을 선택하세요."); return; }
		if(checkNull($("#inidType1 option:selected").val())){ alert("직무분야를 선택하세요."); return; }
		if(checkNull($("#inidAreaJob1 option:selected").val())){ alert("산업분야를 선택하세요."); return; }
		if(checkNull($("#inidJobform").val())){ alert("희망근무형태를 선택하세요."); return; }
		if(checkNull($("#payType option:selected").val())){ alert("급여 종류를 선택하세요."); return; }
		if(checkNull($("#inidPay option:selected").val())){ alert("희망급여를 선택하세요."); return; }
		
		
		/*  #######  학력 정보 JSON  */
		var educationTopInfo = new Object();
		var educationArray = new Array();
		var educationInfo;
		var lesson_sdate_full;
		var lesson_sdate;
		var lesson_sdate2;
		var lesson_edate_full;
		var lesson_edate;
		var lesson_edate2;
		var lesson_state = "";
		var strState = "";
		
		educationTopInfo.final_degree = $("#final_degree option:selected").val();
		
		var bError = false;
		$("#education .education").each(function(index, item){
			
			educationInfo = new Object();
			
			lesson_sdate_full = $(this).find("#lesson_sdate_full").val();
			if(lesson_sdate_full != "" && lesson_sdate_full.length > 7){
				lesson_sdate = lesson_sdate_full.substring(0, 4);
				lesson_sdate2 = lesson_sdate_full.substring(5, 7);
			}
		
			lesson_edate_full = $(this).find("#lesson_edate_full").val();
			if(lesson_edate_full != "" && lesson_edate_full.length > 7){
				lesson_edate = lesson_edate_full.substring(0, 4);
				lesson_edate2 = lesson_edate_full.substring(5, 7);
			}
			
			if(index <= 0){
				lesson_state = $(this).find("#lesson_state option:selected").val();
				strState = $(this).find("#lesson_state option:selected").text();	
			}else{
				lesson_state = $(this).find("#lesson_state"+(index+1)+" option:selected").val();
				strState = $(this).find("#lesson_state"+(index+1)+" option:selected").text();
			}
			
			educationInfo.school2 = $(this).find("#school2 option:selected").val();
			educationInfo.school = $(this).find("#school").val();
			educationInfo.lesson_state = lesson_state;
			educationInfo.lesson = $(this).find("#lesson").val();
			educationInfo.lesson_sdate2 = lesson_sdate2;
			educationInfo.strDegree = $(this).find("#school2 option:selected").text();
			educationInfo.lesson_edate2 = lesson_edate2;
			educationInfo.strState = strState;
			educationInfo.id = index;
			educationInfo.lesson_sdate = lesson_sdate;
			educationInfo.lesson2 = $(this).find("#lesson2").val();
			educationInfo.lesson_edate = lesson_edate;
	
			if (educationInfo.school2 || educationInfo.school || educationInfo.lesson || educationInfo.lesson2) {
				if(!lesson_sdate_full){
					bError = true;
					alert("학력사항 시작일을 선택하세요.");
					return;
				}
				if(!lesson_edate_full){
					bError = true;
					alert("학력사항 종료일을 선택하세요.");
					return;
				}				
			}

			educationArray.push(educationInfo);
		});
		if (bError) return;
		educationTopInfo.data = educationArray;
		educationTopInfo.strFinal_degree = $("#final_degree option:selected").text();
		
		$("#education2").val(JSON.stringify(educationTopInfo));
		//console.log(JSON.stringify(educationTopInfo));
		
		
		/*  #######  경력 정보 JSON  */
		var careerTopInfo = new Object();
		var careerArray = new Array();
		var careerInfo;
		var hold_sdate_full;
		var hold_sdate;
		var hold_sdate2;
		var hold_edate_full;
		var hold_edate;
		var hold_edate2;
		
		careerTopInfo.total_year = $("#total_year option:selected").val();
		careerTopInfo.total_month = $("#total_month option:selected").val();
		
		$("#career .experience").each(function(index, item){
			
			careerInfo = new Object();
			
			hold_sdate_full = $(this).find("#hold_sdate_full").val();
			if(hold_sdate_full != "" && hold_sdate_full.length > 7){
				hold_sdate = hold_sdate_full.substring(0, 4);
				hold_sdate2 = hold_sdate_full.substring(5, 7);
			}
		
			hold_edate_full = $(this).find("#hold_edate_full").val();
			if(hold_edate_full != "" && hold_edate_full.length > 7){
				hold_edate = hold_edate_full.substring(0, 4);
				hold_edate2 = hold_edate_full.substring(5, 7);
			}
			
			careerInfo.hold_sdate2 = hold_sdate2;
			careerInfo.hold_sdate = hold_sdate;
			careerInfo.hold_edate2 = hold_edate2;
			careerInfo.business = $(this).find("#business").val();
			careerInfo.hold_edate = hold_edate;
			careerInfo.company = $(this).find("#company").val();
			careerInfo.id = index;

			if (careerInfo.hold_sdate2 || careerInfo.hold_sdate
					|| careerInfo.hold_edate || careerInfo.hold_edate2
					|| careerInfo.business || careerInfo.company) {
				if(!hold_sdate_full){
					bError = true;
					alert("경력사항 시작일을 선택하세요.");
					return;
				}
				if(!hold_edate_full){
					bError = true;
					alert("경력사항 종료일을 선택하세요.");
					return;
				}
			}

			careerArray.push(careerInfo);
		});
		if (bError) return;

		careerTopInfo.data = careerArray;
		
		$("#career2").val(JSON.stringify(careerTopInfo));
		//console.log("{data:"+JSON.stringify(careerArray))+"}";
		
		
		/*  #######  자격증 정보 JSON  */
		var licenceTopInfo = new Object();
		var licenceArray = new Array();
		var licenceInfo;
		
		$("#licence tr").each(function(index, item){
			
			licenceInfo = new Object();
			licenceInfo.obtain_date = $(this).find("#obtain_date").val();;
			licenceInfo.qualification = $(this).find("#qualification").val();
			licenceInfo.public_place = $(this).find("#public_place").val();
			licenceInfo.id = index;

			if ((licenceInfo.qualification || licenceInfo.public_place) && !licenceInfo.obtain_date) {
				bError = true;
				alert("자격증 취득일을 선택하세요.");
				return;
			}

			licenceArray.push(licenceInfo);
		});
		if (bError) return;
		
		licenceTopInfo.data = licenceArray;
		
		$("#license2").val(JSON.stringify(licenceTopInfo));
		//console.log("{data:"+JSON.stringify(careerArray))+"}";

		
		
		/*  #######  외국어 정보 JSON  */
		var languageTopInfo = new Object();
		var languageItemArray = new Array();
		var languageInfo;
		
		$("#language tr").each(function(index, item){
			
			languageInfo = new Object();
			
			languageInfo.level = $(this).find("#level option:selected").val();
			languageInfo.examination = $(this).find("#examination").val();
			languageInfo.language = $(this).find("#language").val();
			languageInfo.id = index;	
			languageInfo.ex_obtain_date = $(this).find("#ex_obtain_date").val();;
			languageInfo.point = $(this).find("#point").val();
			languageInfo.level2 = $(this).find("#level2 option:selected").val();

			if ((languageInfo.level || languageInfo.examination || languageInfo.language
					|| languageInfo.point || languageInfo.level2) && !languageInfo.ex_obtain_date) {
				bError = true;
				alert("어학증명 취득일을 선택하세요.");
				return;
			}

			languageItemArray.push(languageInfo);
		});
		if (bError) return;
		languageTopInfo.data = languageItemArray;
		
		$("#language2").val(JSON.stringify(languageTopInfo));
		//console.log("{data:"+JSON.stringify(careerArray))+"}";
		
		//최종학력과 총경력년수.
		$("#educationDegree").val($("#final_degree").val());
		$("#careerTotal").val($("#total_year").val());

		
		$("#registForm").submit();
	}
	
</script>
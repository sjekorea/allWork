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
			<div id="leftPart_buttom">
				<ul>
					<li><a href="#none" title="미리보기">미리보기</a></li>
					<li><a href="#none" title="임시저장">임시저장</a></li>
					<li class="res_ok"><a href="#none" title="등록완료">등록완료</a></li>
				</ul>
			</div>
		</div>
		<div id="rightPart">
			<div id="resume00">
				<div id="detailArea">
					<p class="detail_title">기본정보</p>
					<p class="personal_setting"><a href="/updateMyInfo.do" title="기본정보수정"><i class="fas fa-cog"></i>&nbsp;기본정보수정</a></p>
					<div id="imgPart">
						<div class="imgArea">
							<p><img src="img/userNo.png" alt="본인사진"/></p>
						</div>
						<p class="btnArea"><label for="myImg">사진선택</label><input id="myImg" type="file"/></p>
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
			<form id="registForm" name="registForm" enctype="multipart/form-data" action="/registResume.do" method="post">
				<input type="hidden" name="infoType" id="infoType" value="2" />
				<input type="hidden" name="name" id="name" value="${memberMap.name}" />
				<input type="hidden" name="inidPhoto" id="inidPhoto" value="${memberMap.photo}" />
				<input type="hidden" name="inidPhone" id="inidPhone" value="${memberMap.phone}" />
				<input type="hidden" name="inidHphone" id="inidHphone" value="${memberMap.hphone}" />
				<input type="hidden" name="inidEmail" id="inidEmail" value="${memberMap.email}" />
				<input type="hidden" name="inidPost" id="inidPost" value="${memberMap.post}" />
				<input type="hidden" name="inidAddress1" id="inidAddress1" value="${memberMap.address1}" />
				<input type="hidden" name="inidAddress2" id="inidAddress2" value="${memberMap.address2}" />
				<input type="hidden" name="inidHome" id="inidHome" value="${memberMap.home}" />
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
												<span><input id="inidPChk" type="radio" name="inidPChk"/><label for="res01_desc01">&nbsp;공개</label></span>
												<span><input id="inidPChk" type="radio" name="inidPChk"/><label for="res01_desc01_1">&nbsp;비공개</label></span>
											</td>
										</tr>
										<tr>
											<th>사진 공개<span class="necessary">*</span></th>
											<td>
												<span><input id="inidTitle" type="radio" name="inidTitle"/><label for="res01_desc01">&nbsp;공개</label></span>
												<span><input id="inidTitle" type="radio" name="inidTitle"/><label for="res01_desc01_1">&nbsp;비공개</label></span>
											</td>
										</tr>
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
										<td><textarea id="inidMylskill" name="inidMylskill"></textarea></td>
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
										<th>근무지역<span class="necessary">*</span></th>
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
											<select id="inidType2" name="inidType2" title="2차직무선택" onchange="javascript:getNetfuCateListForSelect('job', this, '3차직무선택', 'bizType3', true, true);">
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
											<span><input id="inidJobformChk" type="checkbox" name="inidJobformChk"/><label for="res02_desc07">정규직</label></span>
											<span><input id="inidJobformChk" type="checkbox" name="inidJobformChk"/><label for="res02_desc07_1">계약직</label></span>
											<span><input id="inidJobformChk" type="checkbox" name="inidJobformChk"/><label for="res02_desc07_2">프리랜서</label></span>
											<span><input id="inidJobformChk" type="checkbox" name="inidJobformChk"/><label for="res02_desc07_3">아르바이트</label></span>
											<span><input id="inidJobformChk" type="checkbox" name="inidJobformChk"/><label for="res02_desc07_4">추후협의</label></span>
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
								<tbody>
									<tr class="final_education">
										<th>최종학력</th>
										<td>
											<select id="res03_desc01" name="res03_desc01" title="학력 선택">
												<option value="학력 선택">학력 선택</option>
												<c:forEach var="result" items="${jobSchoolList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr class="education">
										<th>학력</th>
										<td>
											<span>
												<input id="res03_desc02" type="date" placeholder="yyyy-mm-dd" name="res03_desc02"/>
												<select id="res03_desc02_1" name="res03_desc02_1" title="학교구분">
													<c:forEach var="result" items="${jobSchoolList}" varStatus="status">
														<option value="${result.code}">${result.name}</option>
													</c:forEach>
												</select>
												<input id="res03_desc02_2" type="text" name="res03_desc02_2" placeholder="학교명"/>
											</span>
											<span>
												<input id="res03_desc03" type="date" placeholder="yyyy-mm-dd" name="res03_desc03"/>
												<select id="res03_desc03_1" name="res03_desc03_1" title="졸업상태">
													<c:forEach var="result" items="${jobStateList}" varStatus="status">
														<option value="${result.code}">${result.name}</option>
													</c:forEach>
												</select>
												<input id="res03_desc03_2" type="text" name="res03_desc03_2" placeholder="학교명"/>
												<input id="res03_desc03_3" type="text" name="res03_desc03_3" placeholder="전공명"/>
											</span>
											<span class="comment"> 다중 경력자는 [추가]를 클릭하면 현재 입력폼에서 추가 경력을 작성할 수 있습니다.</span>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</li>
					<p class="moreTab">
						<input type="button" name="appendItem" kind="school" value="+ 추가"/>
						<input type="button" name="deleteItem" kind="school" value="- 삭제"/>
					</p>
				</div>
				<div id="resume04">
					<li id="resForm04">
						<fieldset>
							<legend>경력사항</legend>
							<table>
								<caption>경력사항</caption>
								<tbody>
									<tr class="total_experience">
										<th>총 경력년수</th>
										<td>
										<select id="res04_desc01" name="res04_desc01" title="경력연차">
											<c:forEach var="i" begin="0" end="30">
												<option value="${i}">${i}</option>
											</c:forEach>
										</select>&nbsp;년
										<select id="res04_desc01_1" name="res04_desc01_1" title="경력연차">
											<c:forEach var="i" begin="0" end="30">
												<option value="${i}">${i}</option>
											</c:forEach>
										</select>&nbsp;개월
										<input id="res04_desc01_2" type="checkbox" name="res04_desc01_2"/><label for="res04_desc01_2">신입</label>
										</td>
									</tr>
									<tr class="experience">
										<th>경력</th>
										<td>
											<span>
												<input id="res04_desc02" type="date" placeholder="yyyy-mm-dd" name="res04_desc02"/>
												<input id="res04_desc02_1" type="text" name="res04_desc02_1" placeholder="회사명"/>
											</span>
											<span>
												<input id="res04_desc03" type="date" placeholder="yyyy-mm-dd" name="res04_desc03"/>
												<input id="res04_desc03_1" type="text" name="res04_desc03_1" placeholder="담당업무"/>
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
								<tbody>
									<tr>
									<th>자격사항</th>
									<td>
										<p class="part01"><span>취득일자</span><br/><input id="res06_desc01" type="date" placeholder="yyyy-mm-dd" name="res06_desc01"/></p>
										<p class="part02"><span>자격증명</span><br/>
											<select id="inidMylskill1" name="inidMylskill1" title="1차직무선택" onchange="javascript:getNetfuCateListForSelect('inid_mylskill', this, '자격증2차선택', 'inidMylskill2', true, true);">
												<option value="">자격증1차선택</option>
												<c:forEach var="result" items="${jobList}" varStatus="status">
													<option value="${result.code}">${result.name}</option>
												</c:forEach>
											</select>
											<select id="inidMylskill2" name="inidMylskill2" title="2차직무선택" onchange="javascript:getNetfuCateListForSelect('inid_mylskill', this, '자격증3차선택', 'inidMylskill3', true, true);">
												<option value="">2차직무선택</option>
											</select>
											<select id="inidMylskill3" name="inidMylskill3" title="3차직무선택">
												<option value="3차직무선택">3차직무선택</option>
											</select>
										</p>
										<p class="part03"><span>발행처</span><br/><input id="res06_desc01_4" type="text" name="res06_desc01_4"/></p>
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
								<tbody>
									<tr>
										<th>외국어</th>
										<td>
											<p class="part01"><span>취득일자</span><br/><input id="res07_desc01" type="date" placeholder="yyyy-mm-dd"  name="res07_desc01"/></p>
											<p class="part02"><span>외국어명</span><br/><input id="res07_desc01_1" type="text" name="res07_desc01_1"/></p>
											<p class="part03">
												<span>수준</span><br/>
												<select id="res07_desc01_2" name="res07_desc01_2" title="선택">
													<option value="선택">선택</option>
													<option value="상">상</option>
													<option value="중">중</option>
													<option value="하">하</option>
												</select>
												</p>
												<p class="part04"><span>발행처</span><br/><input id="res07_desc01_3" type="text" name="res07_desc01_3"/></p>
												<p class="part05"><span>점수</span><br/><input id="res07_desc01_4" type="text" name="res07_desc01_4"/></p>
												<p class="part06">
												<span>점수/등급</span><br/>
												<select id="res07_desc01_5" name="res07_desc01_5" title="선택">
													<option value="선택">선택</option>
													<option value="상">점</option>
													<option value="중">중</option>
													<option value="하">하</option>
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
											<textarea id="inidIntroduce"></textarea>
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
										<th>파일 첨부하기</th>
										<td>
											<input id="portfolioFile" type="file" name="portfolioFile"/>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</li>
				</div>
			</form>
			<ul>
				<li><a href="#none" title="미리보기">미리보기</a></li>
				<li><a href="#none" title="임시저장">임시저장</a></li>
				<li class="res_ok"><a href="#none" title="등록완료">등록완료</a></li>
			</ul>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />


<script type="text/javascript">

	var inidMylskill_object = [];	
	var inidIntroduce_object = [];	

	$(document).ready(function(){
		
		nhn.husky.EZCreator.createInIFrame({
	        oAppRef: inidMylskill_object,
	        elPlaceHolder: "inidMylskill",
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
		
		
		$(".reg_ok").on("click", function(e){
			registResume();
		});
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
				trHtml += "<select id='bizType"+((appendNum*3)+1)+"' name='bizType"+((appendNum*3)+1)+"' onchange=\"javascript:getNetfuCateListForSelect('job', this, '2차직무선택', 'bizType"+((appendNum*3)+2)+"', true, true);\">";
				trHtml += "<option value=''>1차직무선택</option>\n";
				trHtml += "</select>\n";
				trHtml += "<select id='bizType"+((appendNum*3)+2)+"' name='bizType"+((appendNum*3)+2)+"' onchange=\"javascript:getNetfuCateListForSelect('job', this, '3차직무선택', 'bizType"+((appendNum*3)+3)+"', true, true);\">";
				trHtml += "<option value=''>2차직무선택</option>\n";
				trHtml += "</select>\n";
				trHtml += "<select id='bizType"+((appendNum*3)+3)+"' name='bizType"+((appendNum*3)+3)+"' >";
				trHtml += "<option value=''>3차직무선택</option>\n";
				trHtml += "</select>";
				trHtml += "</td>";
				trHtml += "</tr>";
				
				$("#job").find("tr").eq(appendNum-1).after(trHtml);	
				
				getNetfuCateListForSelect("job", "", "1차직무선택", "bizType"+((appendNum*3)+1), true, true);
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
				trHtml += "			<option value=''>시도 선택</option>\n";
				trHtml += "		</select>";
				trHtml += "		<select id='bizArea"+((appendNum*2)+2)+"' name='bizArea"+((appendNum*2)+2)+"' >";
				trHtml += "			<option value=''>시구군선택</option>\n";
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
	
	
	function registResume(){
		var callback = function(data){
			alert("저장 되었습니다.");
		};
		
		var param = {
					
				};
		ajax('post', '/registResume.ajax', param, callback);
	}
	
</script>
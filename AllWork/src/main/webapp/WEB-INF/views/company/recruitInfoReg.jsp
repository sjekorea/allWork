<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/companyHeader.do" />

<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/css/company_01.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/companySubMenu.do" />
			<div id="leftPart_buttom">
				<ul>
					<li class="reg_ok"><a href="#none" title="등록완료">등록완료</a></li>
				</ul>
			</div>
		</div>
		<div id="rightPart">
			<div id="regist00">
				<div id="company_detail">
					<p class="company_name">${companyMap.bizName}</p>
					<p class="company_hp"><a href="#none" title="기업홈페이지">${companyMap.bizHome}</a></p>
					<p class="company_logo"><img src="/peg/"+${companyMap.biz} alt="로고"/></p>
				</div>
				<div id="detailArea">
					<p class="detail_title">기본정보</p>
					<p class="company_setting"><a href="#none" title="기본정보수정"><i class="fas fa-cog"></i>&nbsp;기본정보수정</a></p>
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
			<div id="regist02">
				<form id="registForm" name="registForm" action="/registRecruit.do" method="post">
				<fieldset>
					<legend>모집요강</legend>
					<div>
						<table>
						<caption>모집요강</caption>
						<tbody>
							<tr>
								<th>공고제목<span class="necessary">*</span></th>
								<td>
									<span><input class="reg_text" id="bizTitle" type="text" name="bizTitle" placeholder="ex)웹기획 경력직 채용" value="공고제목"/></span>
								</td>
							</tr>
							<tr>
								<th>모집업종<span class="necessary">*</span></th>
								<td>
									<select id="job11" name="job11" title="1차직무선택" onchange="javascript:getNetfuCateListForSelect('job', this, '2차직무선택', 'job12', true, true);">
										<option value="">1차직무선택</option>
										<c:forEach var="result" items="${jobList}" varStatus="status">
											<option value="${result.code}">${result.name}</option>
										</c:forEach>
									</select>
									<select id="job12" name="job12" title="2차직무선택" onchange="javascript:getNetfuCateListForSelect('job', this, '3차직무선택', 'job13', true, true);">
											<option value="">2차직무선택</option>
										</select>
									<select id="job13" name="job13" title="3차직무선택">
										<option value="3차직무선택">3차직무선택</option>
									</select>
									<input id="reg02_desc02_3" type="button" name="reg02_desc02_3" value="+ 추가"/>
									<input id="reg02_desc02_3" type="button" name="reg02_desc02_3" value="- 삭제"/>
								</td>
							</tr>
							<tr>
								<th>산업분야<span class="necessary">*</span></th>
								<td>
									<select id="areaJob11" name="areaJob11" title="1차산업선택" onchange="javascript:getNetfuCateListForSelect('area_job', this, '2차산업선택', 'areaJob12', true, true);">
										<option value="">1차산업선택</option>
										<c:forEach var="result" items="${jobList}" varStatus="status">
											<option value="${result.code}">${result.name}</option>
										</c:forEach>
									</select>
									<select id="areaJob12" name="areaJob12" title="2차산업선택" onchange="javascript:getNetfuCateListForSelect('area_job', this, '3차산업선택', 'areaJob13', true, true);">
											<option value="">2차산업선택</option>
										</select>
									<select id="areaJob13" name="areaJob13" title="3차산업선택">
										<option value="3차직무선택">3차산업선택</option>
									</select>
									<input id="res02_desc03_3" type="button" name="res02_desc03_3" value="+ 추가"/>
									<input id="reg02_desc02_3" type="button" name="reg02_desc02_3" value="- 삭제"/>
								</td>
							</tr>
							<tr>
								<th>근무지역<span class="necessary">*</span></th>
								<td>
									<select id="area11" name="area1" onchange="javascript:getNetfuCateListForSelect('area', this, '시구군선택', 'area12', true, true);">
										<c:forEach var="result" items="${areaList}" varStatus="status">
											<option value="${result.code}">${result.name}</option>
										</c:forEach>
									</select>
									<select id="area12" name="area2">
										<option value="">시구군선택</option>
									</select>
									<input id="reg02_desc05_3" type="button" name="reg02_desc05_3" value="+ 추가"/>
									<input id="reg02_desc02_3" type="button" name="reg02_desc02_3" value="- 삭제"/>
									<span class="comment">최대 3개까지 선택 가능</span>
								</td>
							</tr>
							<tr>
								<th>담당업무<span class="necessary">*</span></th>
								<td><input id=bizBusiness type="text" name="bizBusiness"/></td>
							</tr>
							<tr>
								<th>고용형태<span class="necessary">*</span></th>
								<td>
									<c:forEach var="result" items="${jobTypeList}" varStatus="status">
										<span><input id="bizJobfromChk" type="checkbox" name="bizJobfromChk" value="${result.code}"/><label for="reg02_desc07">${result.name}</label></span>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<th>모집인원<span class="necessary">*</span></th>
								<td>
									<span><input id="bizMen" type="text" name="bizMen"/><label for="reg02_desc08_1">&nbsp;명</label></span>
								</td>
							</tr>
							<tr>
								<th>경력사항<span class="necessary">*</span></th>
								<td>
									<span><input id="reg02_desc09" type="checkbox" name="reg02_desc09"/><label for="reg02_desc09">신입</label></span>
									<span><input id="reg02_desc09_1" type="checkbox" name="reg02_desc09_1"/><label for="reg02_desc09_1">경력</label></span>
									<span>
										<select id="reg02_desc09_2" name="reg02_desc09_2" title="경력연차">
											<option value="선택">선택</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
											<option value="13">13</option>
											<option value="14">14</option>
											<option value="15">15</option>
											<option value="16">16</option>
											<option value="17">17</option>
											<option value="18">18</option>
											<option value="19">19</option>
											<option value="20">20</option>
										</select>
									</span>
									<span><input id="reg02_desc09_3" type="checkbox" name="reg02_desc09_3"/><label for="reg02_desc09_3">경력무관</label></span>
								</td>
							</tr>
							<tr>
								<th>급여조건<span class="necessary">*</span></th>
								<td>
									<select id="inidPay1" name="inidPay1" onchange="javascript:getNetfuCateListForSelect('inid_pay', this, '', 'inidPay2', true, false);">
										<c:forEach var="result" items="${inidPayList}" varStatus="status">
											<option value="${result.code}">${result.name}</option>
										</c:forEach>
									</select>
									<select id="inidPay2" name="inidPay2">
									</select>
								</td>
							</tr>
							<tr>
								<th>최종학력<span class="necessary">*</span></th>
								<td>
									<select id="reg02_desc11" name="reg02_desc11" title="학력 선택">
										<option value="학력 선택">학력 선택</option>
										<c:forEach var="result" items="${jobSchoolList}" varStatus="status">
											<option value="${result.code}">${result.name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							</tbody>
						</table>
					</div>
				</fieldset>
				</form>
			</div>
			<div id="regist03">
				<form id="regForm03" action="#none" method="post">
				<fieldset>
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
										<textarea id="bizDetail" name="bizDetail"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset>
				</form>
			</div>
			<div id="regist04">
				<form id="regForm04" action="#none" method="post">
				<fieldset>
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
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset>
				</form>
			</div>
			<div id="regist05">
				<form id="regForm05" action="#none" method="post">
				<fieldset>
					<legend>접수기간/방법</legend>
					<div>
						<table>
							<caption>접수기간/방법</caption>
							<tbody>
								<tr>
								<th>접수기간<span class="necessary">*</span></th>
									<td>
										<span><input id="reg05_desc01" type="date" name="reg05_desc01"/></span><span>~</span><span><input id="reg05_desc01_1" type="date" name="reg05_desc01_1"/></span>
										<span><input id="reg05_desc01_2" type="checkbox" name="reg05_desc01_2"/><label for="reg05_desc01_2">상시채용</label></span>
										<span><input id="reg05_desc01_3" type="checkbox" name="reg05_desc01_3"/><label for="reg05_desc01_3">채용시 마감</label></span>
									</td>
								</tr>
								<tr>
									<th>제출서류</th>
									<td>
										<c:forEach var="result" items="${jobPaperList}" varStatus="status">
											<span><input id="bizPaperChk" type="checkbox" name="bizPaperChk" value="${result.code}"/><label for="reg02_desc07">${result.name}</label></span>
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th>접수방법<span class="necessary">*</span></th>
									<td>
										<c:forEach var="result" items="${jobRecipientList}" varStatus="status">
											<span><input id="bizFormChk" type="checkbox" name="bizFormChk" value="${result.code}"/><label for="reg02_desc07">${result.name}</label></span>
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th>이력서 양식</th>
									<td>
										<span><input id="reg05_desc04" type="checkbox" name="reg05_desc04"/><label for="reg05_desc04">온라인 이력서</label></span>
										<span><input id="reg05_desc04_1" type="checkbox" name="reg05_desc04_1"/><label for="reg05_desc04_1">자사 입사지원서 양식</label></span>
									</td>
								</tr>
								<tr>
									<th>이력서 양식 첨부</th>
									<td>
										<span class="file_btn"><input class="upload-name" id="reg05_desc05"/><label class="fileUp" for="reg05_desc05_1">파일첨부</label><input id="reg05_desc05_1" type="file" name="reg05_desc05_1"/></span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</fieldset>
				</form>
			</div>
			<div id="regist06">
				<form id="regForm06" action="#none" method="post">
				<fieldset>
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
										<span><input id="bizPphone1" type="text" name="bizPphone1" title=""/></span>
										<span>-</span>
										<span><input id="bizPphone2" type="text" name="bizPphone2" title=""/></span>
										<span>-</span>
										<span><input id="bizPphone3" type="text" name="bizPphone3" title=""/></span>
										<input type="hidden" name="bizPphone" id="bizPphone" value="" />
									</td>
								</tr>
								<tr>
									<th>팩스<span class="necessary">*</span></th>
									<td>
										<span><input id="bizPfax1" type="text" name="bizPfax1" title=""/></span>
										<span>-</span>
										<span><input id="bizPfax2" type="text" name="bizPfax2" title=""/></span>
										<span>-</span>
										<span><input id="bizPfax3" type="text" name="bizPfax3" title=""/></span>
										<input type="hidden" name="bizPfax" id="bizPfax" value="" />
									</td>
								</tr>
								<tr>
									<th>이메일<span class="necessary">*</span></th>
									<td>
										<span><input id="bizPemailId" type="text" name="bizPemailId" title=""/></span><span>@</span><span><input id="reg06_desc04_1" type="text" name="reg06_desc04_1" title="이메일 주소 선택"/></span>
										<span>
											<select id="selBizPemailHost" name="selBizPemailHost" title="">
												<option value="direct">직접입력</option>
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
				</fieldset>
				</form>
			</div>
			<ul>
				<li><a href="" title="">취소</a></li>
				<li class="reg_ok"><a href="#none" title="등록완료">등록완료</a></li>
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
		
		$(".reg_ok").on("click", function(e){
			registRecruit();
		});
	});	
	
	
	function registRecruit(){
		var callback = function(data){
			alert("저장 되었습니다.");
		};
		
		var param = {
					
				};
		ajax('post', '/registRecruit.ajax', param, callback);
	}
	
</script>


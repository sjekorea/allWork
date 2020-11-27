<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_connectSetting.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/personSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="resume02">
				<form id="resForm02" action="#none" method="post">
					<fieldset>
						<legend>맞춤서비스설정</legend>
						<table>
							<caption>맞춤서비스설정</caption>
							<tbody id="job">
								<tr>
									<th>모집업종</th>
									<td>
										<select id="job11" name="job1" title="1차직무선택" onchange="javascript:getNetfuCateListForSelect('job', this, '2차직무선택', 'job12', true, true);">
											<option value="">1차직무선택</option>
										</select>
										<select id="job12" name="job2" title="2차직무선택" onchange="javascript:getNetfuCateListForSelect('job', this, '3차직무선택', 'job13', true, true);">
											<option value="">2차직무선택</option>
										</select>
										<select id="job13" name="job3" title="3차직무선택">
											<option value="">3차직무선택</option>
										</select>
										<input id="appendJob" type="button" name="appendJob" value="+ 추가" />
										<input id="deleteJob" type="button" name="deleteJob" value="- 삭제" />
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody id="area">
								<tr>
									<th>근무지역</th>
									<td>
										<select id="area11" name="area1" onchange="javascript:getNetfuCateListForSelect('area', this, '시구군선택', 'area12', true, true);">
											<option value="">시도선택</option>
										</select>
										<select id="area12" name="area2">
											<option value="">시구군선택</option>
										</select>
										<input id="appendArea" type="button" name="appendArea" value="+ 추가" />
										<input id="deleteArea" type="button" name="deleteArea" value="- 삭제" />
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<th>성별</th>
									<td>
										<span><input id="sex" type="radio" name="sex" value="none" />성별무관</span>
										<span><input id="sex" type="radio" name="sex" value="man" />남자</span>
										<span><input id="sex" type="radio" name="sex" value="woman" />여자</span>
									</td>
								</tr>
								<tr>
									<th>고용형태</th>
									<td id="jobFormTr"></td>
								</tr>
								<tr class="final_education">
									<th>최종학력</th>
									<td>
										<select id="jobSchool" name="jobSchool" title="학력 선택">
											<option value = "">학력선택</option>
											<option value = "100">학력무관</option>
											<option value = "1">고등학교졸업</option>
											<option value = "2">대학졸업(2~3년)</option>
											<option value = "3">대학교졸업(4년)</option>
											<option value = "4">석사</option>
											<option value = "5">석사</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>경력사항</th>
									<td>
										<span><input id="bizCareerChkRadio" type="radio" name="bizCareerChkRadio" value="102"/>신입</span> 
										<span><input id="bizCareerChkRadio" type="radio" name="bizCareerChkRadio" value="101"/>경력</span>
										<span>
											<select id="bizCareerSel1" name="bizCareerSel1" title="경력연차">
												<option value="">선택</option>
												<c:forEach var="result" items="${careerRange}" varStatus="status">
													<option value="${result}">${result}</option>
												</c:forEach>
											</select>
											~
											<select id="bizCareerSel2" name="bizCareerSel2" title="경력연차">
												<option value="">선택</option>
												<c:forEach var="result" items="${careerRange}" varStatus="status">
													<option value="${result}">${result}</option>
												</c:forEach>
											</select>
										</span>
										<span><input id="bizCareerChk" type="checkbox" name="bizCareerChk" value="100" />경력무관</span>
									</td>
								</tr>
								<tr>
									<th>급여정도</th>
									<td>
										<select id="jobPay1" name="jobPay1" title="연봉/시급선택" onchange="javascript:getNetfuCateListForSelect('job_pay', this, '', 'jobPay2', true, false);">
										</select>
										<select id="jobPay2" name="jobPay2" title="연봉선택">
											<option value="">선택</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</form>
			</div>
			<ul>
				<li><a href="javascript:goList();" title="보러가기">보러가기</a></li>
				<li class="reg_ok"><a href="javascript:registServiceSetting();" title="설정하기">설정하기</a></li>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />

<script type="text/javascript">
	
	$(document).ready(function(){
		
		// 산업 정보 select
		getNetfuCateListForSelect("job", "", "1차직무선택", "job11", true, true);
		
		// 지역 정보 select
		getNetfuCateListForSelect("area", "", "시도 선택", "area11", true, true);
		
		// 고용형태 select
		getNetfuCateListForCheckbox("job_type", "jobFormTr", "jobForm", true);
		
		// 학력 정보 select
		//getNetfuCateListForSelect("job_school", "", "학력 선택", "jobSchool", true, true);
		
		// 급여 종류 정보 select
		getNetfuCateListForSelect("job_pay", "", "급여 종류 선택", "jobPay1", true, true);
		
		// 산업 정보 추가 Button
		$("#appendJob").on("click", function(e){
			appendItem("job");
		});
		
		// 산업 정보 추가 Button
		$("#deleteJob").on("click", function(e){
			deleteItem("job");
		});
		
		// 지역 정보 추가 Button
		$("#appendArea").on("click", function(e){
			appendItem("area");
		});
		
		// 지역 정보 추가 Button
		$("#deleteArea").on("click", function(e){
			deleteItem("area");
		});
		
		// 지역 정보 select
		$("#job1").on("change", function(e){
			getNetfuCateList("job", $("#job1 option:selected").val(), "2차직무선택", "job2", true);
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
				trHtml += "<select id='job"+(appendNum+1)+"1' name='job"+(appendNum+1)+"1' title='1차직무선택' onchange=\"javascript:getNetfuCateListForSelect('job', this, '2차직무선택', 'job"+(appendNum+1)+"2', true, true);\">";
				trHtml += "		<option value=''>1차직무선택</option>";
				trHtml += "</select>\n";
				trHtml += "<select id='job"+(appendNum+1)+"2' name='job"+(appendNum+1)+"2' title='2차직무선택' onchange=\"javascript:getNetfuCateListForSelect('job', this, '3차직무선택', 'job"+(appendNum+1)+"3', true, true);\">";
				trHtml += "		<option value=''>2차직무선택</option>";
				trHtml += "</select>\n";
				trHtml += "<select id='job"+(appendNum+1)+"3' name='job"+(appendNum+1)+"3' title='3차직무선택'>";
				trHtml += "		<option value=''>3차직무선택</option>";
				trHtml += "</select>";
				trHtml += "</td>";
				trHtml += "</tr>";
				
				$("#job").find("tr").eq(appendNum-1).after(trHtml);	
				
				getNetfuCateListForSelect("job", "", "1차직무선택", "job"+(appendNum+1)+"1", true, true);
			}
			
		}else if(itemKind == "area"){
			
			if($("#area tr").length < 3){
					
				trHtml = "";
				trHtml += "<tr>";
				trHtml += "	<th></th>";
				trHtml += "	<td>";
				trHtml += "		<select id='area"+(appendNum+1)+"1' name='area"+(appendNum+1)+"1' title='시도선택' onchange=\"javascript:getNetfuCateListForSelect('area', this, '시구군선택', 'area"+(appendNum+1)+"2', true, true);\">";
				trHtml += "			<option value=''>시도선택</option>";
				trHtml += "		</select>";
				trHtml += "		<select id='area"+(appendNum+1)+"2' name='area"+(appendNum+1)+"2' title='시구군선택'>";
				trHtml += "			<option value=''>시구군선택</option>";
				trHtml += "		</select>";
				trHtml += "	</td>";
				trHtml += "</tr>";
				
				$("#area").find("tr").eq(appendNum-1).after(trHtml);	
				
				getNetfuCateListForSelect("area", "", "시도 선택", "area"+(appendNum+1)+"1", true, true);
			}
			
		}
	}
	
	function deleteItem(itemKind){
		
		var itemObj = $("#"+itemKind);
		
		if($(itemObj).find("tr").length > 1){
			$(itemObj).find("tr:last").remove();	
		}
	}
	
	// 보러가기
	function goList(){
		location.href = "/fitRecruitList.do";
	}
	
	// 설정하기
	function registServiceSetting(){
		
		loadingOn();
		
		// 성별 Radio
		var sex = $("input[name=sex]:checked").val();
		sex = (isEmpty(sex) ? "" : sex);
		
		// 고용형태 Checkbox
		var form = "";
		$("input[name=jobForm]").each(function() {
		      if(this.checked){
		    	  form += this.value+",";
		      }
		});
		form = form.length > 0 ? form.substring(0, form.length-1) : "";

		// 최종학력
		var school = $("#jobSchool option:selected").val();
		
		// 신입/경력 Radio
		var bizCareerRadio = $("input[name=bizCareerRadio]:checked").val();
		bizCareerRadio = isEmpty(bizCareerRadio) ? "" : bizCareerRadio;
		
		// 경력 년수
		var bizCareerSel1 = $("#bizCareerSel1 option:selected").val();
		var bizCareerSel2 = $("#bizCareerSel2 option:selected").val();
		
		// 무관 checkbox
		var bizCareerChk = "";
		$("input[name=bizCareerChk]").each(function() {
		      if(this.checked){
		    	  bizCareerChk += this.value+",";
		      }
		});
		bizCareerChk = bizCareerChk.length > 0 ? bizCareerChk.substring(0, bizCareerChk.length-1) : "";
		
		// 경력사항 value
		var career = bizCareerRadio+","+bizCareerSel1+","+bizCareerSel2+","+bizCareerChk;
		
		// 급여 종류 / 급여
		var payType = $("#jobPay1 option:selected").val();
		var pay = $("#jobPay2 option:selected").val();
		
		var callback = function(data){
			alert("저장 되었습니다.");
			loadingOff();
		};
		
		var param = {
					uid : "${SE_LOGIN_ID}"
					, job1 : (isEmpty($("#job11 option:selected").val()) ? "" : $("#job11 option:selected").val())
					, job2 : (isEmpty($("#job12 option:selected").val()) ? "" : $("#job12 option:selected").val())
					, job3 : (isEmpty($("#job13 option:selected").val()) ? "" : $("#job13 option:selected").val())
					, job4 : (isEmpty($("#job21 option:selected").val()) ? "" : $("#job21 option:selected").val())
					, job5 : (isEmpty($("#job22 option:selected").val()) ? "" : $("#job22 option:selected").val())
					, job6 : (isEmpty($("#job23 option:selected").val()) ? "" : $("#job23 option:selected").val())
					, job7 : (isEmpty($("#job31 option:selected").val()) ? "" : $("#job31 option:selected").val())
					, job8 : (isEmpty($("#job32 option:selected").val()) ? "" : $("#job32 option:selected").val())
					, job9 : (isEmpty($("#job33 option:selected").val()) ? "" : $("#job33 option:selected").val())
					, area : (isEmpty($("#area11 option:selected").val()) ? "" : $("#area11 option:selected").val())
					, area2 : (isEmpty($("#area12 option:selected").val()) ? "" : $("#area12 option:selected").val())
					, area3 : (isEmpty($("#area21 option:selected").val()) ? "" : $("#area21 option:selected").val())
					, area4 : (isEmpty($("#area22 option:selected").val()) ? "" : $("#area22 option:selected").val())
					, area5 : (isEmpty($("#area31 option:selected").val()) ? "" : $("#area31 option:selected").val())
					, area6 : (isEmpty($("#area32 option:selected").val()) ? "" : $("#area32 option:selected").val())
					, sex : sex
					, age : ""
					, form : form
					, school : $("#jobSchool option:selected").val()
					, career : career
					, payType : $("#jobPay1 option:selected").val()
					, pay : $("#jobPay2 option:selected").val()
				};
		ajax('post', '/registMyService.ajax', param, callback);
	}
	
	
		
</script>


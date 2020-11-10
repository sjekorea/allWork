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
										<span><input id="sex" type="radio" name="sex1" /><label for="sex1">성별무관</label></span>
										<span><input id="sex" type="radio" name="sex2" /><label for="sex2">남자</label></span>
										<span><input id="sex" type="radio" name="sex3" /><label for="sex3">여자</label></span>
									</td>
								</tr>
								<tr>
									<th>고용형태</th>
									<td id="jobType"></td>
								</tr>
								<tr class="final_education">
									<th>최종학력</th>
									<td>
										<select id="jobSchool" name="jobSchool" title="학력 선택"></select>
									</td>
								</tr>
								<tr>
									<th>경력사항</th>
									<td>
										<span><input id="bizCareerChk" type="checkbox" name="bizCareer" value="102"/><label for="bizCareer">신입</label></span> 
										<span><input id="bizCareerChk" type="checkbox" name="bizCareer" value="101"/><label for="bizCareer">경력</label></span>
										<span>
											<select id="bizCareerSel" name="bizCareerSel" title="경력연차">
												<option value="">선택</option>
												<c:forEach var="result" items="${careerRange}" varStatus="status">
													<option value="${result}">${result}</option>
												</c:forEach>
											</select>
										</span>
										<span><input id="reg02_desc09_3" type="checkbox" name="reg02_desc09_3" /><label for="reg02_desc09_3">경력무관</label></span>
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
				<li><a href="#none" title="보러가기">보러가기</a></li>
				<li class="reg_ok"><a href="#none" title="설정하기">설정하기</a></li>
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
		getNetfuCateListForCheckbox("job_type", "jobType", true);
		
		// 학력 정보 select
		getNetfuCateListForSelect("job_school", "", "", "jobSchool", true, false);
		
		// 급여 종류 정보 select
		getNetfuCateListForSelect("job_pay", "", "", "jobPay1", true, false);
		
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
		
		
		$("#rightPart ul li a").on("click", function(e){
			location.href = "/fitRecruitList.do";
		});
		
	});	
	
	
	function appendItem(itemKind){
		
		var appendNum = $("#"+itemKind).find("tr").length;
		var trHtml = "";
		
		if(itemKind == "job"){
			
			if($("#job tr").length < 3){
				
				trHtml = "";
				trHtml += "<tr id='job'>";
				trHtml += "<th>모집업종</th>";
				trHtml += "<td>";
				trHtml += "<select id='job"+(appendNum+1)+"1' name='job"+(appendNum+1)+"1' title='1차직무선택' onchange=\"javascript:getNetfuCateList('job', this, '2차직무선택', 'job"+(appendNum+1)+"2', true);\">";
				trHtml += "		<option value=''>1차직무선택</option>";
				trHtml += "</select>\n";
				trHtml += "<select id='job"+(appendNum+1)+"2' name='job"+(appendNum+1)+"2' title='2차직무선택' onchange=\"javascript:getNetfuCateList('job', this, '3차직무선택', 'job"+(appendNum+1)+"3', true);\">";
				trHtml += "		<option value=''>2차직무선택</option>";
				trHtml += "</select>\n";
				trHtml += "<select id='job"+(appendNum+1)+"3' name='job"+(appendNum+1)+"3' title='3차직무선택'>";
				trHtml += "		<option value=''>3차직무선택</option>";
				trHtml += "</select>";
				trHtml += "</td>";
				trHtml += "</tr>";
				
				$("#job").find("tr").eq(appendNum-1).after(trHtml);	
				
				getNetfuCateList("job", "", "1차직무선택", "job"+(appendNum+1)+"1", true);
			}
			
		}else if(itemKind == "area"){
			
			if($("#area tr").length < 2){
					
				trHtml = "";
				trHtml += "<tr>";
				trHtml += "	<th>근무지역</th>";
				trHtml += "	<td>";
				trHtml += "		<select id='area"+(appendNum+1)+"1' name='area"+(appendNum+1)+"1' title='시도선택' onchange=\"javascript:getNetfuCateList('area', this, '시구군선택', 'area"+(appendNum+1)+"2', true);\">";
				trHtml += "			<option value=''>시도선택</option>";
				trHtml += "		</select>";
				trHtml += "		<select id='area"+(appendNum+1)+"2' name='area"+(appendNum+1)+"2' title='시구군선택'>";
				trHtml += "			<option value=''>시구군선택</option>";
				trHtml += "		</select>";
				trHtml += "	</td>";
				trHtml += "</tr>";
				
				$("#area").find("tr").eq(appendNum-1).after(trHtml);	
				
				getNetfuCateList("area", "", "시도 선택", "area"+(appendNum+1)+"1", true);
			}
			
		}
	}
	
	function deleteItem(itemKind){
		
		var itemObj = $("#"+itemKind);
		
		if($(itemObj).find("tr").length > 1){
			$(itemObj).find("tr:last").remove();	
		}
	}
	
	
	
		
</script>


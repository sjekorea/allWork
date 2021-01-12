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
										<select id="job1" name="job1" title="1차직무선택" onchange="javascript:getNetfuCateListForSelect('job', this, '2차직무선택', 'job2', true, true);">
											<option value="">1차직무선택</option>
											<c:forEach var="result" items="${jobList}" varStatus="status">
												<option value="${result.code}">${result.name}</option>
											</c:forEach>
										</select>
										<select id="job2" name="job2" title="2차직무선택" onchange="javascript:getNetfuCateListForSelect('job', this, '3차직무선택', 'job3', true, true);">
											<option value="">2차직무선택</option>
										</select>
										<select id="job3" name="job3" title="3차직무선택">
											<option value="">3차직무선택</option>
										</select>
										<input type="button" name="appendItem" kind="job" value="+ 추가" />
										<input type="button" name="deleteItem" kind="job" value="- 삭제" />
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody id="area">
								<tr>
									<th>근무지역</th>
									<td>
										<select id="area1" name="area1" onchange="javascript:getNetfuCateListForSelect('area', this, '시구군선택', 'area2', true, true);">
											<option value="">시도선택</option>
											<c:forEach var="result" items="${areaList}" varStatus="status">
												<option value="${result.code}">${result.name}</option>
											</c:forEach>
										</select>
										<select id="area2" name="area2">
											<option value="">시구군선택</option>
										</select>
										<input type="button" name="appendItem" kind="area" value="+ 추가" />
										<input type="button" name="deleteItem" kind="area" value="- 삭제" />
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<!-- <tr>
									<th>성별</th>
									<td>
										<span><input id="sex" type="radio" name="sex" value="none" />성별무관</span>
										<span><input id="sex" type="radio" name="sex" value="man" />남자</span>
										<span><input id="sex" type="radio" name="sex" value="woman" />여자</span>
									</td>
								</tr> -->
								<tr>
									<th>고용형태</th>
									<td id="jobFormTr">
										<c:forEach var="result" items="${jobTypeList}" varStatus="status">
											<span><input id="jobForm" type="checkbox" name="jobForm" value="${result.code}"/><label for="reg02_desc07">${result.name}</label></span>
										</c:forEach>
									</td>
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
										<span><input id="bizCareerRadio" type="radio" name="bizCareerRadio" value="102"/>신입</span> 
										<span><input id="bizCareerRadio" type="radio" name="bizCareerRadio" value="101"/>경력</span>
										<span>
											<select id="bizCareerSel1" name="bizCareerSel1" title="경력연차">
												<option value="">선택</option>
												<c:forEach var="i" begin="1" end="30">
													<option value="${i}">${i}</option>
												</c:forEach>
											</select>
											~
											<select id="bizCareerSel2" name="bizCareerSel2" title="경력연차">
												<option value="">선택</option>
												<c:forEach var="i" begin="1" end="30">
													<option value="${i}">${i}</option>
												</c:forEach>
											</select>
										</span>
										<span><input id="bizCareerChk" type="checkbox" name="bizCareerChk" value="100" />경력무관</span>
									</td>
								</tr>
								<tr>
									<th>급여정도</th>
									<td>
										<select id="payType" name="payType" title="연봉/시급선택" onchange="javascript:getNetfuCateListForSelect('inid_pay', this, '급여 선택', 'jobPay', true, true);">
											<option value="">급여 종류</option>
											<c:forEach var="result" items="${inidPayList}" varStatus="status">
												<option value="${result.code}">${result.name}</option>
											</c:forEach>
										</select>
										<select id="jobPay" name="jobPay" title="연봉선택">
											<option value="">선택</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
					<input type="hidden" name="processFlag" id="processFlag" value="insert" />
					<input type="hidden" name="no" id="no" value="${msMap.no }" />
				</form>
			</div>
			<ul>
				<li><a href="javascript:goList();" title="맞춤채용정보 보기">맞춤채용정보 보기</a></li>
				<li class="reg_ok"><a href="javascript:registServiceSetting();" title="설정하기">설정하기</a></li>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />

<script type="text/javascript">
	
	$(document).ready(function(){
		
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
		
		// -- 맞춤 서비스 정보가 있는 경우 component value setting
		<c:if test="${!msMap.isEmpty()}">
		
			$("#processFlag").val("update");
			
			if(!checkNull("${msMap.job1}")){
				$("#job1").val("${msMap.job1}");
				getNetfuCateListForSelect('job', $("#job1"), '2차직무선택', 'job2', false, true);
			}
			
			if(!checkNull("${msMap.job2}")){
				$("#job2").val("${msMap.job2}");
				getNetfuCateListForSelect('job', $("#job2"), '3차직무선택', 'job3', false, true);
			}
			
			if(!checkNull("${msMap.job3}")){
				$("#job3").val("${msMap.job3}");
			}
			
			if(!checkNull("${msMap.job4}")){
				appendItem("job");
				$("#job4").val("${msMap.job4}");
				getNetfuCateListForSelect('job', $("#job4"), '2차직무선택', 'job5', false, true);
			}
			
			if(!checkNull("${msMap.job5}")){
				$("#job5").val("${msMap.job5}");
				getNetfuCateListForSelect('job', $("#job5"), '3차직무선택', 'job6', false, true);
			}
			
			if(!checkNull("${msMap.job6}")){
				$("#job6").val("${msMap.job6}");
			}
			
			if(!checkNull("${msMap.job7}")){
				appendItem("job");
				$("#job7").val("${msMap.job7}");
				getNetfuCateListForSelect('job', $("#job7"), '2차직무선택', 'job8', false, true);
			}
			
			if(!checkNull("${msMap.job8}")){
				$("#job8").val("${msMap.job8}");
				getNetfuCateListForSelect('job', $("#job8"), '3차직무선택', 'job9', false, true);
			}
			
			if(!checkNull("${msMap.job9}")){
				$("#job9").val("${msMap.job9}");
			}
			
			
			
			
			if(!checkNull("${msMap.area}")){
				$("#area1").val("${msMap.area}");
				getNetfuCateListForSelect('area', $("#area1"), '시구군선택', 'area2', false, true);
			}
			
			if(!checkNull("${msMap.area2}")){
				$("#area2").val("${msMap.area2}");
			}
			
			if(!checkNull("${msMap.area3}")){
				appendItem("area");
				$("#area3").val("${msMap.area3}");
				getNetfuCateListForSelect('area', $("#area3"), '시구군선택', 'area4', false, true);
			}
			
			if(!checkNull("${msMap.area4}")){
				$("#area4").val("${msMap.area4}");
			}
			
			if(!checkNull("${msMap.area5}")){
				appendItem("area");
				$("#area5").val("${msMap.area5}");
				getNetfuCateListForSelect('area', $("#area5"), '시구군선택', 'area6', false, true);
			}
			
			if(!checkNull("${msMap.area6}")){
				$("#area6").val("${msMap.area6}");
			}
			
			var form = "${msMap.form}".split(",");
			for(var i = 0 ; i < form.length ; i++){
				$('input:checkbox[name="jobForm"]').each(function() {
					if(form[i] == this.value){
						$(this).attr("checked", true);
					}
				});
			}
			
			if(!checkNull("${msMap.school}")){
				$("#jobSchool").val("${msMap.school}");
			}
			
			var career = "${msMap.career}".split(",");
			if(career.length == 4){
				if(career[0] == "101"){
					$(":radio[name='bizCareerRadio'][value='101']").prop("checked", true);
				}else if(career[0] == "102"){
					$(":radio[name='bizCareerRadio'][value='102']").prop("checked", true);
				}else{
					
				}
				
				$("#bizCareerSel1").val(career[1]);
				$("#bizCareerSel2").val(career[2]);
				
				if(career[3] != null && career[3] != "" && career[3] == "100"){
					$("#bizCareerChk").prop("checked", true);
				}
			}
			
			
			
			
			
			if(!checkNull("${msMap.payType}")){
				$("#payType").val("${msMap.payType}");
				getNetfuCateListForSelect('inid_pay', $("#payType"), '급여 선택', 'jobPay', false, true);
			} 
			
			if(!checkNull("${msMap.pay}")){
				$("#jobPay").val("${msMap.pay}");
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
				trHtml += "<select id='job"+((appendNum*3)+1)+"' name='job"+((appendNum*3)+1)+"' title='1차직무선택' onchange=\"javascript:getNetfuCateListForSelect('job', this, '2차직무선택', 'job"+((appendNum*3)+2)+"', true, true);\">";
				trHtml += "		<option value=''>1차직무선택</option>";
				trHtml += "</select>\n";
				trHtml += "<select id='job"+((appendNum*3)+2)+"' name='job"+((appendNum*3)+2)+"' title='2차직무선택' onchange=\"javascript:getNetfuCateListForSelect('job', this, '3차직무선택', 'job"+((appendNum*3)+3)+"', true, true);\">";
				trHtml += "		<option value=''>2차직무선택</option>";
				trHtml += "</select>\n";
				trHtml += "<select id='job"+((appendNum*3)+3)+"' name='job"+((appendNum*3)+3)+"' title='3차직무선택'>";
				trHtml += "		<option value=''>3차직무선택</option>";
				trHtml += "</select>";
				trHtml += "</td>";
				trHtml += "</tr>";
				
				$("#job").find("tr").eq(appendNum-1).after(trHtml);	
				
				getNetfuCateListForSelect("job", "", "1차직무선택", "job"+((appendNum*3)+1), true, true);
			}
			
		}else if(itemKind == "area"){
			
			if($("#area tr").length < 3){
					
				trHtml = "";
				trHtml += "<tr>";
				trHtml += "	<th></th>";
				trHtml += "	<td>";
				trHtml += "		<select id='area"+((appendNum*2)+1)+"' name='area"+((appendNum*2)+1)+"' title='시도선택' onchange=\"javascript:getNetfuCateListForSelect('area', this, '시구군선택', 'area"+((appendNum*2)+2)+"', true, true);\">";
				trHtml += "			<option value=''>시도선택</option>";
				trHtml += "		</select>";
				trHtml += "		<select id='area"+((appendNum*2)+2)+"' name='area"+((appendNum*2)+2)+"' title='시구군선택'>";
				trHtml += "			<option value=''>시구군선택</option>";
				trHtml += "		</select>";
				trHtml += "	</td>";
				trHtml += "</tr>";
				
				$("#area").find("tr").eq(appendNum-1).after(trHtml);	
				
				getNetfuCateListForSelect("area", "", "시도 선택", "area"+((appendNum*2)+1), true, true);
			}
			
		}
	}
	
	function deleteItem(itemKind){
		
		var itemObj = $("#"+itemKind);
		
		if($(itemObj).find("tr").length > 1){
			$(itemObj).find("tr:last").remove();	
		}
	}
	
	// 맞춤채용정보 보기
	function goList(){
		loadingOn();
		location.href = "/fitRecruitList.do";
	}
	
	// 설정하기
	function registServiceSetting(){
		
		loadingOn();
		
		/* // 성별 Radio
		var sex = $("input[name=sex]:checked").val();
		sex = (isEmpty(sex) ? "" : sex); */
		
		// 고용형태 Checkbox
		var form = "";
		$('input:checkbox[name="jobForm"]').each(function() {
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
		
		var processUrl = "/registMyService.ajax";
		if("update" == $("#processFlag").val()){
			processUrl = "/updateMyService.ajax";
		}
		
		var callback = function(data){
			alert("맞춤서비스를 설정했습니다.");
			loadingOff();
		};
		
		var param = {
					uid : "${SE_LOGIN_ID}"
					, job1 : (isEmpty($("#job1 option:selected").val()) ? "" : $("#job1 option:selected").val())
					, job2 : (isEmpty($("#job2 option:selected").val()) ? "" : $("#job2 option:selected").val())
					, job3 : (isEmpty($("#job3 option:selected").val()) ? "" : $("#job3 option:selected").val())
					, job4 : (isEmpty($("#job4 option:selected").val()) ? "" : $("#job4 option:selected").val())
					, job5 : (isEmpty($("#job5 option:selected").val()) ? "" : $("#job5 option:selected").val())
					, job6 : (isEmpty($("#job6 option:selected").val()) ? "" : $("#job6 option:selected").val())
					, job7 : (isEmpty($("#job7 option:selected").val()) ? "" : $("#job7 option:selected").val())
					, job8 : (isEmpty($("#job8 option:selected").val()) ? "" : $("#job8 option:selected").val())
					, job9 : (isEmpty($("#job9 option:selected").val()) ? "" : $("#job9 option:selected").val())
					, area : (isEmpty($("#area1 option:selected").val()) ? "" : $("#area1 option:selected").val())
					, area2 : (isEmpty($("#area2 option:selected").val()) ? "" : $("#area2 option:selected").val())
					, area3 : (isEmpty($("#area3 option:selected").val()) ? "" : $("#area3 option:selected").val())
					, area4 : (isEmpty($("#area4 option:selected").val()) ? "" : $("#area4 option:selected").val())
					, area5 : (isEmpty($("#area5 option:selected").val()) ? "" : $("#area5 option:selected").val())
					, area6 : (isEmpty($("#area6 option:selected").val()) ? "" : $("#area6 option:selected").val())
					, sex : ""
					, age : ""
					, form : form
					, school : $("#jobSchool option:selected").val()
					, career : career
					, payType : $("#payType option:selected").val()
					, pay : $("#jobPay option:selected").val()
					, no : $("#no").val()
				};
		ajax('post', processUrl, param, callback);
	}
	
</script>


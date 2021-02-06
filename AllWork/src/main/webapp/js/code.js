
function getNetfuCateListForSelect(type, pObj, allTitle, selectObjId, loadingFlag, allFlag){
	
	if(loadingFlag) loadingOn();
	
	var pCode = (pObj != null && pObj != "") ? $(pObj).val() : "";
			
	var callback = function(data){
		
		var selectObj = $("#"+selectObjId);
		
		$(selectObj).empty();
		
		if(allFlag) $(selectObj).append("<option value=''>"+allTitle+"</option>");
		
		for(var count = 0 ; count < data.list.length ; count++){
			var option = $("<option value="+data.list[count].code+">"+data.list[count].name+"</option>");
			$(selectObj).append(option);
		}
		
		if(loadingFlag) loadingOff();
		
	};
	var param = {
				type : type
				, pCode : pCode
			};
	ajaxNonAsync('post', '/getCodeListAjax.ajax', param, callback);
	
}


function getCodeJobTypeAllListAjax(type, pObj, allTitle, selectObjId, loadingFlag, allFlag){
	
	if(loadingFlag) loadingOn();
	
	var pCode = (pObj != null && pObj != "") ? $(pObj).val() : "";
			
	var callback = function(data){
		
		var selectObj = $("#"+selectObjId);
		
		$(selectObj).empty();
		
		if(allFlag) $(selectObj).append("<option value=''>"+allTitle+"</option>");
		
		if (data == null || data.list == null || data.list.length < 1) {
			var option = $("<option value=all>전체</option>");
			$(selectObj).append(option);			
		} else {
			for(var count = 0 ; count < data.list.length ; count++){
				var option = $("<option value="+data.list[count].code+">"+data.list[count].name+"</option>");
				$(selectObj).append(option);
			}			
		}
		
		if(loadingFlag) loadingOff();
		
	};
	var param = {
				type : type
				, pCode : pCode
			};
	ajaxNonAsync('post', '/getCodeJobTypeAllListAjax.ajax', param, callback);
	
}

function getNetfuCateListForSelectUsingSelectObj(type, pObj, allTitle, selectObj, loadingFlag, allFlag){

	if(loadingFlag) loadingOn();
	
	var pCode = (pObj != null && pObj != "") ? $(pObj).val() : "";
			
	var callback = function(data){
		
		var selectObj = $(selectObj);
		
		$(selectObj).empty();
		
		if(allFlag) $(selectObj).append("<option value=''>"+allTitle+"</option>");
		
		for(var count = 0 ; count < data.list.length ; count++){
			var option = $("<option value="+data.list[count].code+">"+data.list[count].name+"</option>");
			$(selectObj).append(option);
		}
		
		if(loadingFlag) loadingOff();
		
	};
	var param = {
				type : type
				, pCode : pCode
			};
	ajax('post', '/getCodeListAjax.ajax', param, callback);
	
}



function getNetfuCateListForCheckbox(type, appendObjId, objId, loadingFlag){
	
	if(loadingFlag) loadingOn();
	
	var itemHtml = "";
	var callback = function(data){
		
		var cbObj = $("#"+appendObjId);
		
		$(cbObj).empty();
		for(var count = 0 ; count < data.list.length ; count++){
			itemHtml = "<span><input id='"+objId+"' type='checkbox' name='"+objId+"' value='"+data.list[count].code+"' />"+data.list[count].name+"</span>";
			$(cbObj).append(itemHtml);
		}
		
		if(loadingFlag) loadingOff();
		
	};
	var param = {
				type : type
				, pCode : ""
			};
	ajax('post', '/getCodeListAjax.ajax', param, callback);
	
}


function getNetfuCateListForUl(type, pCode, appendObjId, selfId, loadingFlag){
	
	if(loadingFlag) loadingOn();

	var callback = function(data){
		
		var appendObj = $("#"+appendObjId);
		
		$(appendObj).empty();
		
		//(begin)++2021.01.13 by s.yoo.
		if (selfId == "area_job2" || selfId == "area_job3" || selfId == "job2" || selfId == "job3") {
			tempLi = "<li><input id='"+selfId+"' class='on' type='button' name='all' value='전체'/></li>"; 
			$(appendObj).append(tempLi);
		}
		//(end)++2021.01.13 by s.yoo.
		
		var tempLi = "";
		for(var count = 0 ; count < data.list.length ; count++){
			tempLi = "<li><input id='"+selfId+"' class='on' type='button' name='"+data.list[count].code+"' value='"+data.list[count].name+"'/></li>"; 
			$(appendObj).append(tempLi);
		}
		
		if(loadingFlag) loadingOff();
		
	};
	var param = {
				type : type
				, pCode : pCode
				, incOldCode: 1
			};
	if (selfId == "job2" || selfId == "job3") {
		//직무코드 처리.
		ajax('post', '/getCodeJobTypeAllListAjax.ajax', param, callback);
		return;
	}
	ajax('post', '/getCodeListAjax.ajax', param, callback);
	
}

function getNetfuCateListForSelect(type, pObj, empayTitle, selectObjId, loadingFlag, allFlag){
	
	if(loadingFlag) loadingOn();
	
	var pCode = (pObj != null && pObj != "") ? $(pObj).val() : "";
			
	var callback = function(data){
		
		var selectObj = $("#"+selectObjId);
		
		$(selectObj).empty();
		
		if(allFlag) $(selectObj).append("<option value=''>"+empayTitle+"</option>");
		
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


function getNetfuCateListForCheckbox(type, cbObjId, loadingFlag){
	
	if(loadingFlag) loadingOn();
	
	var itemHtml = "";
	var callback = function(data){
		
		var cbObj = $("#"+cbObjId);
		
		$(cbObj).empty();
		for(var count = 0 ; count < data.list.length ; count++){
			itemHtml = "<span><input id='"+cbObjId+(count+1)+"' type='checkbox' name='"+cbObjId+(count+1)+"' /><label for='"+cbObjId+(count+1)+"'>"+data.list[count].name+"</label></span>";
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
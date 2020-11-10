function ajax(c_method, c_url, c_data, c_callback){
	$.ajax({
    	type: c_method,
    	dataType: "json",
    	data: c_data,
        url: c_url,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
        success: function(response, status, req) { 
        	c_callback(response);
        },error:function(request,status,error){
        	//alert('에러가 발생했습니다./n통신 상태를 확인후 잠시 후 다시 시도해 주세요.');
        	console.log(error);
        },beforeSend:function(e){ 
        },complete:function(){
        }
	});
}


function ajaxNonAsync(c_method, c_url, c_data, c_callback){
	$.ajax({
    	type: c_method,
    	dataType: "json",
    	data: c_data,
        url: c_url,
        async : false ,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
        success: function(response, status, req) { 
        	c_callback(response);
        },error:function(request,status,error){
        	//alert('에러가 발생했습니다./n통신 상태를 확인후 잠시 후 다시 시도해 주세요.');
        	console.log(error);
        },beforeSend:function(e){ 
        },complete:function(){
        }
	});
}

function ajaxWithFormName(formName, c_method, c_url, c_data, c_callback){
	$.ajax({
		name: formName,	
    	type: c_method,
    	dataType: "json",
    	data: c_data,
        url: c_url,
        success: function(response, status, req) { 
        	c_callback(response);
        },error:function(request,status,error){
        	//alert('에러가 발생했습니다.<br/>통신 상태를 확인후 잠시 후 다시 시도해 주세요.');
        	console.log(error);
        },beforeSend:function(e){ 
        },complete:function(){
        }
	});
}


function ajaxCheckBeforeSending(formName, c_method, c_url, c_data, c_callback, c_beforeSending){
	$.ajax({
		name: formName,
    	type: c_method,
    	dataType: "json",
    	data: c_data,
        url: c_url,
        success: function(response, status, req) { 
        	c_callback(response);
        },error:function(request,status,error){
        	//alert('에러가 발생했습니다.<br/>통신 상태를 확인후 잠시 후 다시 시도해 주세요.');
        	console.log(error);
        },beforeSend:function(xhr, opts){ 
        	c_beforeSending(xhr, opts);
        },complete:function(){
        }
	});
}


function ajaxFileUpload(c_method, c_url, c_data, c_callback){
	$.ajax({
    	type: c_method,
    	enctype: 'multipart/form-data',
    	data: c_data,
        url: c_url,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
        processData : false,
        contentType : false,
        success: function(response, status, req) { 
        	c_callback(response);
        },error:function(request,status,error){
        	//alert('에러가 발생했습니다.<br/>통신 상태를 확인후 잠시 후 다시 시도해 주세요.');
        	console.log(error);
        },beforeSend:function(e){ 
        },complete:function(){
        }
	});
}


function checkNull(targetVal){
	if(targetVal.replace(/\s/g,'') == "null" || targetVal.replace(/\s/g,'') == "" || targetVal.replace(/\s/g,'') == null || targetVal.replace(/\s/g,'') == "undefined" || targetVal.replace(/\s/g,'') == undefined){
		return true;
	}else{
		return false;
	}
}

function convertNull(targetVal){
	if(targetVal != "null" && targetVal != "" && targetVal != null && targetVal != "undefined" && targetVal != undefined){
		return targetVal;
	}else{
		return "";
	}
}

function alertAndFocus(message, obj){
	alert(message);
	obj.focus();
}


function checkLength(targetVal, len){
	if(targetVal.length == len){
		return true;
	}else{
		return false;
	}
}

/**
 * 바이트수 반환  
 * 
 * @param el : tag jquery object
 * @returns {Number}
 */
function byteCheck(el){
    var codeByte = 0;
    for (var idx = 0; idx < el.val().length; idx++) {
        var oneChar = escape(el.val().charAt(idx));
        if ( oneChar.length == 1 ) {
            codeByte ++;
        } else if (oneChar.indexOf("%u") != -1) {
            codeByte += 2;
        } else if (oneChar.indexOf("%") != -1) {
            codeByte ++;
        }
    }
    return codeByte;
}



function chkPwd(str){
	 var pw = str;
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[~!@.#$%\^*_+=]/gi);
	 var resultBoo = true;
	 
	 if(pw.length < 8){
		 resultBoo = false;
	 }else if(num < 0 || eng < 0 || spe < 0 ){
		 resultBoo = false;
	 }else if(str != str.replace(/\s/g,"")){
		 resultBoo = false;
	 }else{
		 resultBoo = true;
	 }
	 return resultBoo;
}


function validateEmail(email) {
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return re.test(email);
}

function validateMobileNo(mobileNo) {
	var re =  /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	
	return re.test(mobileNo);
}

function getToday(){
	var now = new Date();
	var today = now.getFullYear();
	today += '-' + (now.getMonth() + 1) ;
	today += '-' + now.getDate();
	
	return today;
}

function getNowMonthDate(){
	var now = new Date();
	var today = fillZero((now.getMonth()+1), 2) + fillZero(now.getDate(), 2);
	
	return today;
}


function getNowTime(){
	var now = new Date();
	var nowTime = now.getFullYear();
	nowTime += '-' + (now.getMonth() + 1) ;
	nowTime += '-' + now.getDate();
	nowTime += ' ' + now.getHours();
	nowTime += ':' + now.getMinutes();
	nowTime += ':' + now.getSeconds();
	return nowTime;
}

function getNowYear(){
	var now = new Date();
	var nowYear = now.getFullYear();
	
	return nowYear;
}

function getNowMonth(){
	var now = new Date();
	var nowMonth = now.getMonth() + 1;
	
	return nowMonth;
}

function getNowDate(){
	var now = new Date();
	var nowDate = now.getDate();
	
	return nowDate;
}

function getNowHour(){
	var now = new Date();
	var nowHour = now.getHours();
	
	return nowHour;
}


function convertBr(arg){
	return arg.replace(/(\n|\r\n)/g, '<br>');
}


function convertToHtml(str){
	str = str.replace(/</g, "&lt;");
	str = str.replace(/>/g, "&gt;");
	str = str.replace(/\"/g, "&quot;");
	str = str.replace(/\'/g, "&#39;");
	return str;
}


function fillZero(arg, len){
	var tmpStr = "";
	var tmpArg = String(arg);
	if(tmpArg.length < len){
		for(var i = 0 ; i < (len - tmpArg.length) ; i++){
			tmpStr += "0";
		}
	}
	return tmpStr+arg;
}


function addMonth(date, month){

    var temp = new Date(date.getFullYear(), date.getMonth()+month, date.getDate()-1);
    return temp; 
}


function addDay(date, day){

    var temp = new Date(date.getFullYear(), date.getMonth(), date.getDate()-day);
    return temp; 
}

function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function removeCommas(x) {
    if(!x || x.length == 0) return "";
    else return x.split(",").join("");
}

function getUUID() { // UUID v4 generator in JavaScript (RFC4122 compliant)
	return 'xxxxxxxxxxxx4xxxyxxxxxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
		var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 3 | 8);
	    return v.toString(16);
	});
}


function convertQuot(str){
	alert("aaa");
	str = str.replace(/\"/g, "A");
	str = str.replace(/\'/g, "BB");
	return str;
}


function convertEnter(str){
	str = str.replace(/\n\r/g, " ");
	return str;
}

function loadingOn(){
	$("#progress_barWrap").css("display", "block");
}

function loadingOff(){
	$("#progress_barWrap").css("display", "none");
}
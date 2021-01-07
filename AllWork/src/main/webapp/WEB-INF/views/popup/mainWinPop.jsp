<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8"/>
<title>  </title>
<link rel="stylesheet" type="text/css" href="/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/css/font.css"/>
<link rel="stylesheet" type="text/css" href="/css/reset.css"/>
<link  rel="stylesheet" type="text/css" href="/css/all.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/js/jquery-1.12.4.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/common.js"></script>
<script>

	var nWidth = parseInt("${popupMap.width}") + 45;
	var nHeight = parseInt("${popupMap.height}") + 140;
	window.top.resizeTo(nWidth, nHeight);
	window.top.moveTo("${popupMap.left}", "${popupMap.top}");

	document.title = "${popupMap.subject}";

	var set_cookie = function(code){
		alert(code);
		setCookie("netfu_popup_"+code, code, 1);
	}
</script> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
<style></style>
</head>
<body>
	<div id="popupWrap">
		<div class="imgArea" style="resize: both; overflow: auto;">
			<img src="img/main/popup.jpg" alt="이미지00"/>
		</div>
		<div class="buttonArea">
			<div class="col-1">
				<a href="javascript:self.close();"><b class="fon11 wht">닫기</b></a>
			</div>
			<div class="col-2">
				<a href="javascript:self.close();" onClick="set_cookie('${popupMap.code}');"><b class="fon11 wht">오늘 하루동안 안보기</b></a>
			</div>
		</div>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- (begin) 2020.12.30 by s.yoo	-->
<!-- 
<jsp:include page="/indexHeader.do" />
 -->
<c:choose>
	<c:when test="${SE_LOGIN_STATUS}">
		<c:if test="${SE_USER_TYPE == 'company' }">
			<jsp:include page="/companyHeader.do"/>
		</c:if>

		<c:if test="${SE_USER_TYPE == 'person' }">
			<jsp:include page="/personHeader.do" />
		</c:if>
	</c:when>
	<c:otherwise>
			<jsp:include page="/indexHeader.do" />
	</c:otherwise>
</c:choose>
<!-- (end) 2020.12.30 by s.yoo	-->
<!-- (begin) 2020.12.30 by s.yoo	-->
<link rel="stylesheet" type="text/css" href="/css/community.css"/>
<style type="text/css">
	/*현재메뉴 언더라인*/
	#menuTree ul .menu08{text-decoration: underline;}
</style>

<div id="containerWrap">
		  <div id="container">
			<div id="leftPart">
			  <jsp:include page="/communitySubMenu.do" />
			</div>
			<div id="rightPart">
			  <h4>모바일 서비스 안내</h4>
			  <ul class="provision personalProvision">
			  	<div>
			  		${item.mobileService}
			  	</div>
			  </ul>
			</div>
		  </div>
		</div>
</div>
	
<jsp:include page="/footer.do" />

<script type="text/javascript">
	$(document).ready(function(){
		$(".tab li:eq(0)").find("a").on("click", function(e){
			$(".tab li:eq(0)").css("background-color", "#4F60E3");
			$(".tab li:eq(0)").find("a").css("color", "#FFFFFF");
			$(".tab li:eq(1)").css("background-color", "#FFFFFF");
			$(".tab li:eq(1)").find("a").css("color", "#000000");
			$(".personalProvision").css("display", "block");
			$(".companyProvision").css("display", "none");
		});
		$(".tab li:eq(1)").find("a").on("click", function(e){
			$(".tab li:eq(0)").css("background-color", "#FFFFFF");
			$(".tab li:eq(0)").find("a").css("color", "#000000");
			$(".tab li:eq(1)").css("background-color", "#4F60E3");
			$(".tab li:eq(1)").find("a").css("color", "#FFFFFF");
			$(".personalProvision").css("display", "none");
			$(".companyProvision").css("display", "block");
		});
	});
</script>
<!-- (end) 2020.12.30 by s.yoo	-->

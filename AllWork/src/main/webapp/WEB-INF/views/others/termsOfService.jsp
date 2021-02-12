<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- (begin) 2020.12.30 by s.yoo	-->
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
<link rel="stylesheet" type="text/css" href="/css/customerCenter_provision.css"/>

<div id="containerWrap">
          <div id="container">
            <div id="leftPart">
              <jsp:include page="/communitySubMenu.do" />
            </div>
            <div id="rightPart">
              <h4>이용약관</h4>
              <ul class="tab">
                <li><a href="#" title="개인회원 이용약관">개인회원 이용약관</a></li>
                <li><a href="#" title="기업회원 이용약관">기업회원 이용약관</a></li>
              </ul>
              <ul class="provision personalProvision">
			  	<div>
			  		${item.agreement}
			  	</div>
              </ul>
              <ul class="provision companyProvision" style="display:none;">
			  	<div>
			  		${item.agreement3}
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

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
<link rel="stylesheet" type="text/css" href="/css/customerCenter_privacy.css"/>


<div id="containerWrap">
          <div id="container">
            <div id="leftPart">
              <jsp:include page="/communitySubMenu.do" />
            </div>
            <div id="rightPart">
              <h4>개인정보 취급방침</h4>
              <ul class="tab">
                <li><a href="#" title="개인회원 취급방침">개인회원 취급방침</a></li>
                <li><a href="#" title="기업회원 취급방침">기업회원 취급방침</a></li>
              </ul>
              <ul class="privacy personalPrivacy">
			  	<div>
			  		${item.privacy}
			  	</div>
              </ul>
              <ul class="privacy companyPrivacy" style="display:none">
			  	<div>
			  		${item.privacy3}
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
			$(".personalPrivacy").css("display", "block");
			$(".companyPrivacy").css("display", "none");
		});
		$(".tab li:eq(1)").find("a").on("click", function(e){
			$(".tab li:eq(0)").css("background-color", "#FFFFFF");
			$(".tab li:eq(0)").find("a").css("color", "#000000");
			$(".tab li:eq(1)").css("background-color", "#4F60E3");
			$(".tab li:eq(1)").find("a").css("color", "#FFFFFF");
			$(".personalPrivacy").css("display", "none");
			$(".companyPrivacy").css("display", "block");
		});
	});
</script>
<!-- (end) 2020.12.30 by s.yoo	-->

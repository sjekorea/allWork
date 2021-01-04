<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- (begin) 2020.12.30 by s.yoo	-->
<!-- 
<jsp:include page="/introHeader.do" />
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

<link rel="stylesheet" type="text/css" href="/css/introduction_partnership05.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/introSubMenu.do" />
		</div>
		<div id="rightPart">
			<p class="icon">
				<i class="fas fa-exclamation-triangle"></i>
			</p>
			<p class="title">페이지 준비중입니다.</p>
			<p class="desc">
				보다 나은 서비스 제공을 위하여 페이지 준비중에 있습니다.<br /> 빠른시일내에 준비하여 찾아뵙겠습니다.
			</p>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />
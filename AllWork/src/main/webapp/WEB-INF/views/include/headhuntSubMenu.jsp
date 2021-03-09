<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" type="text/css" href="/css/common.css"/>

<!-- (begin) 2020.12.30 by s.yoo -->
<div id="menuTree">
	<p class="settingBtn"><a href="/headhuntList.do" title="헤드헌팅">헤드헌팅</a></p>
	<ul>
		<li class="menu menu01">
			<a href="/headhuntList.do">
				채용정보
			</a>
		</li>
		<li class="menu menu02">
<c:choose>
	<c:when test="${SE_LOGIN_STATUS}">
		<c:if test="${SE_USER_TYPE == 'person' }">
			<a href="https://allwork.officecall.cloud/" target="_blank" title="화상면접">화상면접</a>
		</c:if>
				
		<c:if test="${SE_USER_TYPE == 'company' }">
			<a href="https://allwork.officecall.cloud/?user_check=admin" target="_blank" title="화상면접">화상면접</a>
		</c:if>
	</c:when>
	<c:otherwise>
			<a href="javascript:alert('로그인 이후에 사용할 수 있습니다.');" title="화상면접">화상면접</a>
	</c:otherwise>
</c:choose>
		</li>
	</ul>
</div>

<!-- (end) 2020.12.30 by s.yoo -->

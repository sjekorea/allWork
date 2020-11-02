<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div id="menuTree">
	<p class="settingBtn">
		<c:choose>
			<c:when test="${SE_USER_TYPE eq 'person'}">
				<a href="/personHome.do" title="기업회원 홈">개인회원 홈</a>
			</c:when>
			<c:otherwise>
				<a href="/personHome.do" title="기업회원 홈">개인회원 홈</a>
			</c:otherwise>
		</c:choose>
	</p>
	<ul>
		<li class="gnb gnb01"><a href="#" title="채용정보">채용정보</a>
			<h3>채용정보</h3>
		</li>
	</ul>
</div>
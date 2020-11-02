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
		<li class="gnb gnb02"><a href="#" title="면접진행">면접진행</a>
			<h3>면접진행</h3>
		</li>
		<li class="gnb gnb03"><a href="#" title="기업방문">기업방문</a>
			<h3>기업방문</h3>
		</li>
		<li class="gnb gnb04"><a href="#" title="이력서제공">이력서제공</a>
			<h3>이력서제공</h3>
		</li>
		<li class="gnb gnb05"><a href="#" title="재취업성공">재취업성공</a>
			<h3>재취업성공</h3>
		</li>
		<li class="gnb gnb05"><a href="#" title="사전면접">사전면접</a>
			<h3>사전면접</h3>
		</li>
	</ul>
</div>
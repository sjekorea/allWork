<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" type="text/css" href="/css/common.css"/>

<div id="menuTree">
	<p class="settingBtn"><a href="/recruitSearch.do" title="채용정보">채용정보</a></p>
	<ul>
		<li class="gnb gnb01"><a href="/recruitSearch.do" title="채용검색">채용검색</a>
			<ol class="subMenu">
				<li class="subMenu01"><a href="/recruitSearch.do" title="상세검색">상세검색</a></li>
				<li class="subMenu02"><a href="/recruitSearchByDuty.do" title="직무별">직무별</a></li>
				<li class="subMenu03"><a href="/recruitSearchByIndustry.do" title="산업별">산업별</a></li>
				<li class="subMenu04"><a href="/recruitSearchByArea.do" title="지역별">지역별</a></li>
			</ol>
		</li>
		<li class="gnb gnb02"><a href="/recruitSearchForFree.do" title="프리랜서">프리랜서</a></li>
		<li class="gnb gnb03"><a href="/recruitSearchForAlba.do" title="알바채용">알바채용</a></li>
		<li class="gnb gnb04"><a href="/recruitOther.do" title="기타채용정보">기타채용정보</a></li>
	</ul>
</div>

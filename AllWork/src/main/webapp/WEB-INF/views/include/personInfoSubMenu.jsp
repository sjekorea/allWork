<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" type="text/css" href="/css/common.css"/>

<div id="menuTree">
	<p class="settingBtn"><a href="/personSearch.do" title="인재정보">인재정보</a></p>
	<ul>
		<li class="gnb"><a href="/personSearch.do" title="인재검색">인재검색</a>
			<ol class="subMenu">
				<li class="subMenu01"><a href="/personSearch.do" title="상세검색">상세검색</a></li>
				<li class="subMenu02"><a href="#" title="직무별">직무별</a></li>
				<li class="subMenu03"><a href="#" title="산업별">산업별</a></li>
				<li class="subMenu04"><a href="#" title="지역별">지역별</a></li>
				<li class="subMenu05"><a href="#" title="기업별">기업별</a></li>
				<li class="subMenu06"><a href="#" title="지역별">프리랜서</a></li>
				<li class="subMenu07"><a href="#" title="기업별">알바</a></li>
			</ol>
		</li>
	</ul>
</div>

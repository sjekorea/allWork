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
			<a href="#">
				화상면접
			</a>
		</li>
	</ul>
</div>


<form id="searchForm" name="searchForm" method="post" action="/headhuntList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
</form>
<!-- (end) 2020.12.30 by s.yoo -->

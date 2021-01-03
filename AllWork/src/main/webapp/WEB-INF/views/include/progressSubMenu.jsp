<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" type="text/css" href="/css/common.css"/>

<!-- (begin) 2020.12.30 by s.yoo -->
<div id="menuTree">
	<p class="settingBtn"><a href="javascript:goProgressList('netfu_52508_48920', 1);" title="고객센터">채용진행현황</a></p>
	<ul>
		<li class="menu menu01">
			<a href="javascript:goProgressList('netfu_52508_48920', 1);">
				면접진행
			</a>
		</li>
		<li class="menu menu02">
			<a href="javascript:goProgressList('netfu_52508_50000', 1);">
				기업방문
			</a>
		</li>
		<li class="menu menu03">
			<a href="javascript:goProgressList('netfu_52508_60000', 1);">
				이력서제공
			</a>
		</li>
		<li class="menu menu04">
			<a href="javascript:goProgressList('netfu_52508_70000', 1);">
				재취업성공
			</a>
		</li>
		<li class="menu menu05">
			<a href="javascript:goProgressList('netfu_52508_80000', 1);">
				사전면접
			</a>
		</li>
		<li class="menu menu06">
			<a href="javascript:goProgressList('netfu_52508_90000', 1);">
				적응컨설팅
			</a>
		</li>
	</ul>
</div>


<form id="searchForm" name="searchForm" method="post" action="/progressList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="boardCode" id="boardCode" value="${boardCode}" />
	<input type="hidden" name="no" id="no" value="" />
</form>

<script type="text/javascript">

	function goProgressList(boardCode, pageNo){
		$("#pageNo").val(pageNo);
		$("#boardCode").val(boardCode);
		$("#searchForm").attr("action", "/progressList.do");
		$("#searchForm").submit();
	}

	function goProgressView(boardCode, id, pageNo){
		$("#pageNo").val(pageNo);
		$("#boardCode").val(boardCode);
		$("#no").val(id);
		$("#searchForm").attr("action", "/progressView.do");
		$("#searchForm").submit();
	}
	
</script>
<!-- (end) 2020.12.30 by s.yoo -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" type="text/css" href="/css/common.css"/>

<!-- (begin) 2020.12.30 by s.yoo -->
<div id="menuTree">
	<p class="settingBtn"><a href="/noticeList.do" title="고객센터">고객센터</a></p>
	<ul>
		<li class="menu menu01">
			<a href="/noticeList.do">
				공지사항
			</a>
		</li>
	<c:if test="${SE_LOGIN_STATUS}">
		<li class="menu menu02">
			<a href="javascript:goBoardList('netfu_41549_84812', 1);">
				게시판
			</a>
		</li>
	</c:if>
		<li class="menu menu03">
			<a href="/faqList.do">
				FAQ
			</a>
		</li>
		<li class="menu menu04">
			<a href="/paymentGuide.do" title="이용안내">이용안내</a>
			<ol class="subMenu subMenu04">
				<li>
					<a href="/paymentGuide.do">
						유료채용광고 문의
					</a>
				</li>
			</ol>
		</li>
		<li class="menu menu05">
			<a href="/termsOfService.do">
				이용약관
			</a>
		</li>
		<li class="menu menu06">
			<a href="/privacyPolicy.do">
				개인정보취급방침
			</a>
		</li>
	<c:if test="${SE_LOGIN_STATUS}">
		<li class="menu menu07">
			<a href="javascript:goBoardEdit('netfu_44304_38055', 0, 1);">
				불편 및 신고상황 접수
			</a>
		</li>
	</c:if>
		<li class="menu menu08">
			<a href="/mobileGuide.do">
				모바일 서비스
			</a>
		</li>
		<li class="menu menu09">
			<a href="/libraryList.do">
				자료실
			</a>
		</li>
	</ul>
</div>


<form id="searchForm" name="searchForm" method="post" action="/boardList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="boardCode" id="boardCode" value="${boardCode}" />
	<input type="hidden" name="no" id="no" value="" />
</form>

<script type="text/javascript">

	function goBoardList(boardCode, pageNo){
		$("#pageNo").val(pageNo);
		//$("#boardType").val(boardType);
		$("#boardCode").val(boardCode);
		$("#searchForm").attr("action", "/boardList.do");
		$("#searchForm").submit();
	}

	function goBoardEdit(boardCode, id, pageNo){
		$("#pageNo").val(pageNo);
		//$("#boardType").val(boardType);
		$("#boardCode").val(boardCode);
		$("#no").val(id);
		$("#searchForm").attr("action", "/boardEdit.do");
		$("#searchForm").submit();
	}

	function goBoardView(boardCode, id, pageNo){
		$("#pageNo").val(pageNo);
		//$("#boardType").val(boardType);
		$("#boardCode").val(boardCode);
		$("#no").val(id);
		$("#searchForm").attr("action", "/boardView.do");
		$("#searchForm").submit();
	}
	
</script>
<!-- (end) 2020.12.30 by s.yoo -->

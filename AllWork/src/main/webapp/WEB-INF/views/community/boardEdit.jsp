<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- (begin) 2020.12.30 by s.yoo	-->
<!-- 
<jsp:include page="/communityHeader.do" />
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

<link rel="stylesheet" type="text/css" href="/css/customerCenter_board_upload.css"/>

<style type="text/css">
	/*현재메뉴 언더라인*/
	<c:if test="${boardCode == 'netfu_57809_60663' }">
		#menuTree ul .menu01{text-decoration: underline;}
	</c:if>
	<c:if test="${boardCode == 'netfu_41549_84812' }">
		#menuTree ul .menu02{text-decoration: underline;}
	</c:if>
	<c:if test="${boardCode == 'netfu_92829_39479' }">
		#menuTree ul .menu03{text-decoration: underline;}
	</c:if>
	<c:if test="${boardCode == 'netfu_44304_38055' }">
		#menuTree ul .menu07{text-decoration: underline;}
	</c:if>
	<c:if test="${boardCode == 'netfu_94498_34711' }">
		#menuTree ul .menu09{text-decoration: underline;}
	</c:if>
</style>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/communitySubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="boardPart">
				<h4>${boardName }</h4>
				<form id="regForm02" action="#none" method="post">
					<fieldset>
					<legend>${boardName } 글쓰기</legend>
					<div>
						<p>
							<span class="write_title">작성자</span>
							<span class="write_desc">${item.uid}</span>
						</p>
						<!-- 
						<p>
							<span class="write_title">파일첨부</span>
							<span class="write_desc">
							<input id="writeDesc"/><label for="writeDesc_1">파일첨부</label><input id="writeDesc_1" type="file" name="writeDesc_1"/>
							</span>
						</p>
						 -->
						<p>
							<span class="write_title">제목</span>
							<span class="write_desc"><input value="${item.subject}" /></span>
						</p>
						<p class="writePart">
							<textarea>${item.content}</textarea>
						</p>
					</div>
					</fieldset>
				</form>
				<ul class="buttonPart">
					<a href="#" title="등록"><li>등록</li></a>
					<a href="javascript:goBack();" title="취소"><li>취소</li></a>
				</ul>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />

<script type="text/javascript">
	
	$(document).ready(function(){
	});
	
	function goBack() {
		//불편사항 신고 및 접수
		<c:if test="${boardCode == 'netfu_44304_38055' }">
			location.href = "/noticeList.do";
		</c:if>
		
		//게시판
		<c:if test="${boardCode == 'netfu_41549_84812' }">
			if (${item.id} > 0) {
				goBoardView('${boardCode}', ${item.id}, ${map.get("pageNo")});
			} else {
				goBoardList('${boardCode}', 0, ${map.get("pageNo")});
			}
		</c:if>
	}

</script>

<!-- (end) 2020.12.30 by s.yoo	-->

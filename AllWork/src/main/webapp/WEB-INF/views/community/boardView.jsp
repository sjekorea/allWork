<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- (begin) 2020.12.30 by s.yoo	-->
<jsp:include page="/communityHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/customerCenter_board_post.css"/>

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
				<div class="titlePart">
					<h4>${boardName }</h4>
					<p class="title">${item.subject}</p>
					<div class="detailArea">
						<p class="writer">작성자&nbsp;<span>${item.uid}</span></p>
						<p class="detail"><span>${item.strWdate}</span><span>&nbsp;</span>조회수<span><fmt:formatNumber value="${item.hit}" pattern="#,###"/></span></p>
						<!-- 
						<p class="attachment"><span class="attachment_title">첨부파일</span><span>없음</span></p>
						 -->
					</div>
				</div>
				<div class="descPart">
					<p>${item.content}</p>
				</div>

				<!-- 게시판에 대해서만 내가 쓴 글에 대해 수정/삭제 기능 지원 -->
				<p class="golist"><a href="javascript:goBoardList('${boardCode}', ${map.get("pageNo")});" title="목록">목록보기</a></p>
			<c:if test="${boardCode == 'netfu_41549_84812' && item.uid == SE_LOGIN_ID}">
				<ul class="buttonPart">
					<li><a href="javascript:goBoardEdit('${boardCode}', ${item.id}, ${map.get("pageNo")});" title="수정">수정</a></li>
					<li><a href="javascript:confirmDelete(${item.id})" title="삭제">삭제</a></li>
				</ul>
			</c:if>
			
				<!-- 
				<ul class="buttonPart">
					<li><a href="#" title="등록">등록</a></li>
					<li><a href="#" title="답글">답글</a></li>
				</ul>
				<div class="replyPart">
					<h4>댓글</h4>
					<div class="reply_text">
						<form>
						<fieldset>
							<legend>댓글입력</legend>
							<textarea></textarea>
							<p class="reply_btn"><a href="#" title="댓글입력">댓글<br/>입력</a></p>
						</fieldset>
						</form>
					</div>
					<p class="ok_btn"><a href="/boardEdit.do" title="등록">등록</a></p>
				</div>
				 -->
			</div>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />

<script type="text/javascript">
	
	$(document).ready(function(){
	});
	
	function confirmDelete(id) {
		var result = confirm("글을 삭제할까요?");
		if(result) {
			procDelete(id);
		}	
	}
	
	function procDelete(id){
	
		var callback = function(data){
			if(data.rstCnt > 0){
				alert("고객님의 글을 삭제했습니다.");
				goBoardList('${boardCode}', ${map.get("pageNo")});
			}else{
				alert("오류가 발생해서 글을 삭제하지 못했습니다.\n잠시후에 다시 이용해 주십시오.");
				loadingOff();
			}
		};
		var param = {
				  boardCode : '${boardCode}'
				, no: id
			};
		ajax('post', '/boardDeleteProcess.ajax', param, callback);
	}

</script>

<!-- (end) 2020.12.30 by s.yoo	-->

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

<!-- Smart Editor 2 사용. -->
<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/communitySubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="boardPart">
				<h4>${boardName }</h4>
				<div class="titlePart">
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
				<ul class="buttonPart">
				<c:if test="${boardCode == 'netfu_41549_84812' && item.uid == SE_LOGIN_ID}">
					<li><a href="javascript:goBoardEdit('${boardCode}', ${item.id}, ${map.get("pageNo")});" title="수정">수정</a></li>
					<li><a href="javascript:confirmDelete(${item.id})" title="삭제">삭제</a></li>
				</c:if>
				<c:if test="${boardCode == 'netfu_41549_84812'}">
					<li id="btn_reply"><a href="javascript:goBoardReply();" title="답변달기">답변달기</a></li>
				</c:if>
				</ul>
			
				<!-- 
				<ul class="buttonPart">
					<li><a href="#" title="등록">등록</a></li>
					<li><a href="#" title="답글">답글</a></li>
				</ul>
				 -->
				<div class="replyPart" id="reply_area" style="display:none;" >
					<form id="formMain" action="#none" method="post">
						<p>
							<span class="write_title">제목</span>
							<span class="write_desc"><input id="subject" name="subject" maxlength=100 value="[RE] ${item.subject}" /></span>
						</p>
						<div class="reply_text">
							<fieldset>
							<legend>댓글입력</legend>
							<textarea class="textArea" id="content" name="content"></textarea>
							<p class="reply_btn"><a href="javascript:goSubmitForm();" title="댓글입력">댓글<br/>입력</a></p>
							
							<input type="hidden" id="type" name="type" value="${item.type}" />
							<input type="hidden" id="subType" name="subType" value="${item.subType}" />
							<input type="hidden" id="boardCode" name="boardCode" value="${item.boardCode}" />
							<input type="hidden" id="uid" name="uid" value="${SE_LOGIN_ID }" />
							<input type="hidden" id="nickName" name="nickName" value="${SE_USER_NM}" />
							<input type="hidden" id="thumbnail" name="thumbnail" value="" />
		
							<input type="hidden" id="id" name="id" value="${item.id}" />
							<input type="hidden" id="ref" name="ref" value="${item.ref}" />
							<input type="hidden" id="replyReq" name="replyReq" value="${item.replyReq + 1}" />
							<input type="hidden" id="replyLevel" name="replyLevel" value="${item.replyLevel + 1}" />
							</fieldset>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />

<script type="text/javascript">

	/*
	var content_object = [];
	
	$(document).ready(function(){
		//Smart Editor
		nhn.husky.EZCreator.createInIFrame({
	        oAppRef: content_object,
	        elPlaceHolder: "content",
	        sSkinURI: "/smartEditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	        }, 
	        fOnAppLoad : function(){
	            //textarea 내용을 에디터상에 바로 뿌려주고자 할때 사용
	            //content_object.getById["content"].exec("PASTE_HTML", [ "{item.content}" ]);
	        }
	    });
	});
	*/
	
	
	/*
	 * 댓글 입력.
	 */
	function goBoardReply() {
		$("#reply_area").css("display", "block");	
		$("#btn_reply").css("display", "none");
		$("#content").focus();
	}
	function goSubmitForm(){
		
		//content_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

		if(checkNull($("#subject").val())){
			alertAndFocus("제목을 입력하세요.", $("#subject"));
			return;
		}
		
		if(checkNull($("#content").val())){
			alertAndFocus("내용을 입력하세요.", $("#content"));
			return;
		}
		
		//content의 \n을 <br />로 교체.
		var strContent = $("#content").val();
		strContent = strContent.replace(/\n/gi, "<br />");
		$("#content").val(strContent);

		var callback = function(data){
			if(data.rstCnt > 0){
				alert("고객님의 글을 등록했습니다.");
				return goBoardList('${boardCode}', ${map.get("pageNo")});
			}else{
				alert("오류가 발생해서 글을 등록하지 못했습니다.\n잠시후에 다시 이용해 주십시오.");
				loadingOff();
			}
		};
		var param = {
				  boardCode : '${boardCode}'
				, uid: '${SE_LOGIN_ID}'
				, nickName: '${SE_USER_NM}'
				, subject : $("#subject").val()
				, content : $("#content").val()
				, no: $("#id").val()
				, ref : $("#ref").val()
				, replyReq : $("#replyReq").val()
				, replyLevel : $("#replyLevel").val()
			};
		ajax('post', '/boardWriteProcess.ajax', param, callback);
	}
	
	
	
	/*
	 * 글 삭제.
	 */
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
				return goBoardList('${boardCode}', ${map.get("pageNo")});
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

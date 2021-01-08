<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- (begin) 2020.12.30 by s.yoo	-->
<jsp:include page="/communityHeader.do" />

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
				<form id="formMain" action="#none" method="post">
					<fieldset>
					<legend>${boardName } 글쓰기</legend>
					<div>
					<c:if test="${rstCnt < 1 }">
						<p>
							<span class="necessary">오류가 발생해서 글을 등록하지 못했습니다.</span>
						</p>
					</c:if>
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
							<span class="write_desc"><input id="subject" name="subject" maxlength=100 value="${item.subject}" /></span>
						</p>
						<p class="writePart">
							<textarea id="content" name="content">${item.content}</textarea>
						</p>
					</div>
					</fieldset>
					<input type="hidden" name="id" id="id" value="${item.id}" />
				</form>
				<ul class="buttonPart">
					<li><a href="javascript:goSubmitForm();" title="등록">등록</a></li>
					<li><a href="javascript:goBack();" title="취소">취소</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />

<script type="text/javascript">

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
            	//var data = '${map.content}'.replace(/\"/gi, "");
	            //content_object.getById["content"].exec("PASTE_HTML", [ "${item.content}" ]);
	        }
	    });
	});
	
	function goBack() {
		//불편사항 신고 및 접수
		<c:if test="${boardCode == 'netfu_44304_38055' }">
			location.href = "/noticeList.do";
		</c:if>
		
		//게시판
		<c:if test="${boardCode == 'netfu_41549_84812' }">
			if ($("#id").val() > 0) {
				goBoardView('${boardCode}', $("#id").val(), ${map.get("pageNo")});
			} else {
				goBoardList('${boardCode}', 0, ${map.get("pageNo")});
			}
		</c:if>
	}

	
	function goSubmitForm(){
		
		content_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

		if(checkNull($("#subject").val())){
			alertAndFocus("제목을 입력하세요.", $("#subject"));
			return;
		}
		
		if(checkNull($("#content").val())){
			alertAndFocus("내용을 입력하세요.", $("#content"));
			return;
		}

		var id = $("#id").val();
		
		var callback = function(data){
			if(data.rstCnt > 0){
				alert("고객님의 글을 등록했습니다.");
				return goBack();
			}else{
				alert("오류가 발생해서 글을 등록하지 못했습니다.\n잠시후에 다시 이용해 주십시오.");
				loadingOff();
			}
		};
		var param = {
				  boardCode : '${boardCode}'
				, uid: '${item.uid}'
				, nickName: '${SE_USER_NM}'
				, subject : $("#subject").val()
				, content : $("#content").val()
				, no: id
			};
		if (id > 0) {
			ajax('post', '/boardUpdateProcess.ajax', param, callback);
		} else {
			ajax('post', '/boardWriteProcess.ajax', param, callback);
		}
	}

</script>

<!-- (end) 2020.12.30 by s.yoo	-->

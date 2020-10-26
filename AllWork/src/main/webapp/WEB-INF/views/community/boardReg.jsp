<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/customerCenter_board_upload.css"/>

<div id="containerWrap">
<div id="container">
<div id="leftPart">
<jsp:include page="/communitySubMenu.do" />
</div>
<div id="rightPart">
<div id="boardPart">
<h4>게시판</h4>
<form id="regForm02" action="#none" method="post">
<fieldset>
<legend>게시판 글쓰기</legend>
<div>
<p>
<span class="write_title">작성자</span>
<span class="write_desc">asdf</span>
</p>
<p>
<span class="write_title">파일첨부</span>
<span class="write_desc">
<input id="writeDesc"/><label for="writeDesc_1">파일첨부</label><input id="writeDesc_1" type="file" name="writeDesc_1"/>
</span>
</p>
<p>
<span class="write_title">제목</span>
<span class="write_desc"><input/></span>
</p>
<p class="writePart">
<textarea></textarea>
</p>
</div>
</fieldset>
</form>
<ul class="buttonPart">
<li><a href="#" title="등록">등록</a></li>
<li><a href="#" title="답글">취소</a></li>
</ul>
</div>
</div>
</div>
</div>
</div>


<jsp:include page="/footer.do" />
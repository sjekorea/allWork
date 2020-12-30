<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/communityHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/customerCenter_board_post.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/communitySubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="boardPart">
				<div class="titlePart">
					<h4>게시판</h4>
					<p class="title">재취업 성공후 적응 컨설팅</p>
					<div class="detailArea">
						<p class="writer">작성자&nbsp;<span>sungstar711</span></p>
						<p class="detail"><span>2020.10.17</span><span>16:31</span>조회수<span>3</span></p>
						<p class="attachment"><span class="attachment_title">첨부파일</span><span>없음</span></p>
					</div>
				</div>
				<div class="descPart">
					<p>내용보기</p>
				</div>
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
					<p class="ok_btn"><a href="/boardReg.do" title="등록">등록</a></p>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />

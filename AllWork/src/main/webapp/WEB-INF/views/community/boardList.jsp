<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/communityHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/customerCenter_board_square.css"/>

<div id="containerWrap">
<div id="container">
<div id="leftPart">
<jsp:include page="/communitySubMenu.do" />
</div>
<div id="rightPart">
<div id="boardPart">
<h4>게시판</h4>
<div class="boardBoxWrap">
<ul class="boardBox">
<li>
<a href="#" title="게시판이미지01">
<img src="img/personal_board_square/img01.jpg" alt="게시판이미지01"/>
</a>
</li>
<li>
<a href="#" title="게시판이미지02">
<img src="img/personal_board_square/img00.jpg" alt="게시판이미지02"/>
</a>
</li>
<li>
<a href="#" title="게시판이미지02">
<img src="img/personal_board_square/img00.jpg" alt="게시판이미지02"/>
</a>
</li>
<li>
<a href="#" title="게시판이미지02">
<img src="img/personal_board_square/img00.jpg" alt="게시판이미지02"/>
</a>
</li>
<li>
<a href="#" title="게시판이미지02">
<img src="img/personal_board_square/img00.jpg" alt="게시판이미지02"/>
</a>
</li>
<li>
<a href="#" title="게시판이미지02">
<img src="img/personal_board_square/img00.jpg" alt="게시판이미지02"/>
</a>
</li>
<li>
<a href="#" title="게시판이미지02">
<img src="img/personal_board_square/img00.jpg" alt="게시판이미지02"/>
</a>
</li>
<li>
<a href="#" title="게시판이미지02">
<img src="img/personal_board_square/img00.jpg" alt="게시판이미지02"/>
</a>
</li>
<li>
<a href="#" title="게시판이미지02">
<img src="img/personal_board_square/img00.jpg" alt="게시판이미지02"/>
</a>
</li>
</ul>
</div>
<p class="delete"><a href="#none" title="등록">등록</a></p>
<div class="numareaWrap">
<ul class="numArea">
<li><a href="#" title="prev"><i class="fas fa-chevron-left"></i></a></li>
<li class="p01"><a href="#" title="page1">1</a></li>
<li><a href="#" title="page2">2</a></li>
<li><a href="#" title="page3">3</a></li>
<li><a href="#" title="page4">4</a></li>
<li><a href="#" title="page5">5</a></li>
<li><a href="#" title="page6">6</a></li>
<li><a href="#" title="page7">7</a></li>
<li><a href="#" title="page8">8</a></li>
<li><a href="#" title="page9">9</a></li>
<li><a href="#" title="page10">10</a></li>
<li><a href="#" title="next"><i class="fas fa-chevron-right"></i></a></li>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>

<jsp:include page="/footer.do" />

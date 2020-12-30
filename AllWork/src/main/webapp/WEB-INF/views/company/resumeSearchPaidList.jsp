<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_payDetails.css"/>

<div id="containerWrap">
<div id="container">
<div id="leftPart">
<jsp:include page="/companySubMenu.do" />
</div>
<div id="rightPart">
<h4>결제내역 조회</h4>
<div id="listPart">
<div class="part01">
<div class="date">
<form>
<fieldset>
<legend>기간별 조회</legend>
<p>
<span>기간별 조회</span>
<span><input type="date" placeholder="yyyy-mm-dd"/></span>~
<span><input type="date" placeholder="yyyy-mm-dd"/></span>
<span><input type="submit" value="조회하기"/></span>
</p>
</fieldset>
</form>
</div>
<ul class="list">
<li class="list_title">
<div class="desc01">신청일</div>
<div class="desc02">신청상품</div>
<div class="desc03">결제금액</div>
<div class="desc04">결제상태</div>
</li>
<li>
<div class="desc">
<p class="desc01">2020.11.01</p>
<p class="desc02">이력서 강조상품</p>
<p class="desc03">10,000원</p>
<p class="desc04">완료</p>
</div>
</li>
<li>
<div class="desc">
<p class="desc01">2020.11.01</p>
<p class="desc02">이력서 강조상품</p>
<p class="desc03">10,000원</p>
<p class="desc04">미결제</p>
</div>
</li>
</ul>
</div>
<div class="part02">
<ul class="list">
<li class="list_title">
<div class="desc01">신청일</div>
<div class="desc02">신청상품</div>
<div class="desc03">결제금액</div>
<div class="desc04">결제상태</div>
</li>
<li>
<div class="desc">
<p class="desc01">2020.11.01</p>
<p class="desc02">이력서 강조상품</p>
<p class="desc03">10,000원</p>
<p class="desc04">완료</p>
</div>
</li>
</ul>
</div>
<div class="part03">
<ul class="list">
<li class="list_title">
<div class="desc01">신청일</div>
<div class="desc02">신청상품</div>
<div class="desc03">결제금액</div>
<div class="desc04">결제상태</div>
</li>
<li>
<div class="desc">
<p class="desc01">2020.11.01</p>
<p class="desc02">이력서 강조상품</p>
<p class="desc03">10,000원</p>
<p class="desc04">완료</p>
</div>
</li>
</ul>
</div>
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
<jsp:include page="/footer.do" />

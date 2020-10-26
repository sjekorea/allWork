<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/companyHeader.do"/>

<link rel="stylesheet" type="text/css" href="/css/company_side.css"/>
<link rel="stylesheet" type="text/css" href="/css/company_support.css"/>

<div id="containerWrap">
<div id="container">
<div id="leftPart">
<jsp:include page="/companySubMenu.do" />
</div>
<div id="rightPart">
<div id="listPart">
<h4>입사지원자 관리</h4>
<p class="listTotal">입사지원자관리 총<span>0</span>명</p>
<select id="align">
<option value="시도선택">진행중인 채용공고</option>
</select>
<p class="delete"><a href="#none" title="선택삭제">선택삭제</a></p>
<ul class="list">
<li class="list_title">
<div class="desc00"><input type="checkbox"/></div>
<div class="desc01"></div>
<div class="desc02">이름</div>
<div class="desc03">이력서</div>
<div class="desc04">스크랩일</div>
</li>
<li>
<div class="desc00"><input type="checkbox"/></div>
<div class="desc01"><img src="/img/company_home/img00.jpeg" alt="인재사진"/></div>
<div class="desc02">홍길동</div>
<div class="desc03">
<a href="#none" title="채용공고">
<p class="t_desc01">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
</a>
</div>
<div class="desc04">
<p class="scrap_day">20-10-22</p>
</div>
</li>
<li>
<div class="desc00"><input type="checkbox"/></div>
<div class="desc01"><img src="/img/company_home/img00.jpeg" alt="인재사진"/></div>
<div class="desc02">홍길동</div>
<div class="desc03">
<a href="#none" title="채용공고">
<p class="t_desc01">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
</a>
</div>
<div class="desc04">
<p class="scrap_day">20-10-22</p>
</div>
</li>
<li>
<div class="desc00"><input type="checkbox"/></div>
<div class="desc01"><img src="/img/company_home/img00.jpeg" alt="인재사진"/></div>
<div class="desc02">홍길동</div>
<div class="desc03">
<a href="#none" title="채용공고">
<p class="t_desc01">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
</a>
</div>
<div class="desc04">
<p class="scrap_day">20-10-22</p>
</div>
</li>
<li>
<div class="desc00"><input type="checkbox"/></div>
<div class="desc01"><img src="/img/company_home/img00.jpeg" alt="인재사진"/></div>
<div class="desc02">홍길동</div>
<div class="desc03">
<a href="#none" title="채용공고">
<p class="t_desc01">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
</a>
</div>
<div class="desc04">
<p class="scrap_day">20-10-22</p>
</div>
</li>
</ul>
<ul class="numArea">
<!--<li><a href="#" title="prev"><i class="fas fa-chevron-left"></i></a></li>-->
<li class="p01"><a href="#" title="page1">1</a></li>
<!--<li><a href="#" title="page2">2</a></li>
<li><a href="#" title="page3">3</a></li>
<li><a href="#" title="page4">4</a></li>
<li><a href="#" title="page5">5</a></li>
<li><a href="#" title="page6">6</a></li>
<li><a href="#" title="page7">7</a></li>
<li><a href="#" title="page8">8</a></li>
<li><a href="#" title="page9">9</a></li>
<li><a href="#" title="page10">10</a></li>
<li><a href="#" title="next"><i class="fas fa-chevron-right"></i></a></li>-->
</ul>
</div>
</div>
</div>
</div>


<jsp:include page="/footer.do" />


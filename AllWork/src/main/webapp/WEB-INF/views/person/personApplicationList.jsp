<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_apply.css"/>

<div id="containerWrap">
<div id="container">
<div id="leftPart">
<jsp:include page="/personSubMenu.do" />
</div>
<div id="rightPart">
<div id="listPart">
<h4>입사지원 현황</h4>
<ul class="tab">
<li><a class="selected" href="#none" title="온라인 입사지원">온라인 입사지원</a></li>
<li><a href="#none" title="이메일 입사지원">이메일 입사지원</a></li>
<li><a href="#none" title="모바일 입사지원">모바일 입사지원</a></li>
<li><a href="#none" title="선택삭제">선택삭제</a></li>
</ul>
<p class="apply_total">온라인 입사지원 총 <span>0</span>건</p>
<ul class="list">
<li class="list_title">
<div class="desc00"><input type="checkbox"/></div>
<div class="desc01">지원내역</div>
<div class="desc02">이력서</div>
<div class="desc03">마감일</div>
<div class="desc04">지원일</div>
</li>
<li>
<div class="desc00"><input type="checkbox"/></div>
<div class="desc01">
<p class="title"><a href="#none" title="회사명">(주)파인스태프</a></p>
<p class="t_desc"><a href="#none" title="공고내용">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</a></p>
</div>
<div class="desc02">
<p class="my_resume"><a href="#none" title="이력서">이력서</a></p>
</div>
<div class="desc03">
<p class="d_day">20-10-22</p>
</div>
<div class="desc04">
<p class="apply_date">20-10-22</p>
</div>
</li>
<li>
<div class="desc00"><input type="checkbox"/></div>
<div class="desc01">
<p class="title"><a href="#none" title="회사명">(주)파인스태프</a></p>
<p class="t_desc"><a href="#none" title="공고내용">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</a></p>
</div>
<div class="desc02">
<p class="my_resume"><a href="#none" title="이력서">이력서</a></p>
</div>
<div class="desc03">
<p class="d_day">20-10-22</p>
</div>
<div class="desc04">
<p class="apply_date">20-10-22</p>
</div>
</li>
<li>
<div class="desc00"><input type="checkbox"/></div>
<div class="desc01">
<p class="title"><a href="#none" title="회사명">(주)파인스태프</a></p>
<p class="t_desc"><a href="#none" title="공고내용">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</a></p>
</div>
<div class="desc02">
<p class="my_resume"><a href="#none" title="이력서">이력서</a></p>
</div>
<div class="desc03">
<p class="d_day">20-10-22</p>
</div>
<div class="desc04">
<p class="apply_date">20-10-22</p>
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


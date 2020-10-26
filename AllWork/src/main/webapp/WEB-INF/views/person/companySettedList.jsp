<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_connect.css"/>

<div id="containerWrap">
<div id="container">
<div id="leftPart">
<jsp:include page="/personSubMenu.do" />
</div>
<div id="rightPart">
<div id="detailArea">
<h4>맞춤채용정보</h4>
<p class="delete"><a href="#none" title="맞춤설정">맞춤설정</a></p>
<div class="tableArea">
<p class="table_title">직종</p><p class="table_desc table_desc01"></p>
<p class="table_title">근무지역</p><p class="table_desc"></p>
<p class="table_title">성별</p><p class="table_desc"></p>
<p class="table_title">학력</p><p class="table_desc"></p>
<p class="table_title">고용형태</p><p class="table_desc"></p>
<p class="table_title">급여정도</p><p class="table_desc"></p>
<p class="table_title">경력</p><p class="table_desc"></p>
</div>
</div>
<div id="listPart">
<p class="listTitle">검색된 맞춤채용정보</p>
<select id="align">
<option value="시도선택">정렬방식선택</option>
<option value="전체">등록일순</option>
<option value="서울">수정일순</option>
<option value="인천">마감일순</option>
<option value="경기">경력높은순</option>
<option value="광주">경력낮은순</option>
<option value="대전">학력높은순</option>
<option value="대구">학력낮은순</option>
</select>
<ul class="list">
<li class="list_title">
<div class="desc01">회사명</div>
<div class="desc02">채용정보</div>
<div class="desc03">마감일</div>
</li>
<li>
<a href="#none" title="맞춤채용공고">
<p class="title">(주)파인스태프</p>
<div class="desc">
<p class="desc0">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
<p class="desc1"><strong>급여 </strong>3000-3500만원</p>
<p class="desc2"><strong>경력 </strong>무관</p>
<p class="desc3"><strong>나이 </strong>무관</p>
<p class="desc1"><strong>지역 </strong>경기 광주시</p>
<p class="desc2"><strong>학력 </strong>무관</p>
<p class="desc3"><strong>성별 </strong>무관</p>
</div>
<p class="deadline deadline00">상시채용</p>
</a>
</li>
<li>
<a href="#none" title="맞춤채용공고">
<p class="title">(주)파인스태프</p>
<div class="desc">
<p class="desc0">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
<p class="desc1"><strong>급여 </strong>3000-3500만원</p>
<p class="desc2"><strong>경력 </strong>무관</p>
<p class="desc3"><strong>나이 </strong>무관</p>
<p class="desc1"><strong>지역 </strong>경기 광주시</p>
<p class="desc2"><strong>학력 </strong>무관</p>
<p class="desc3"><strong>성별 </strong>무관</p>
</div>
<p class="deadline deadline00">상시채용</p>
</a>
</li>
<li>
<a href="#none" title="맞춤채용공고">
<p class="title">(주)파인스태프</p>
<div class="desc">
<p class="desc0">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
<p class="desc1"><strong>급여 </strong>3000-3500만원</p>
<p class="desc2"><strong>경력 </strong>무관</p>
<p class="desc3"><strong>나이 </strong>무관</p>
<p class="desc1"><strong>지역 </strong>경기 광주시</p>
<p class="desc2"><strong>학력 </strong>무관</p>
<p class="desc3"><strong>성별 </strong>무관</p>
</div>
<p class="deadline deadline01">채용시마감</p>
</a>
</li>
<li>
<a href="#none" title="맞춤채용공고">
<p class="title">(주)파인스태프</p>
<div class="desc">
<p class="desc0">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
<p class="desc1"><strong>급여 </strong>3000-3500만원</p>
<p class="desc2"><strong>경력 </strong>무관</p>
<p class="desc3"><strong>나이 </strong>무관</p>
<p class="desc1"><strong>지역 </strong>경기 광주시</p>
<p class="desc2"><strong>학력 </strong>무관</p>
<p class="desc3"><strong>성별 </strong>무관</p>
</div>
<p class="deadline deadline02">~2/14(목)</p>
</a>
</li>
<li>
<a href="#none" title="맞춤채용공고">
<p class="title">(주)파인스태프</p>
<div class="desc">
<p class="desc0">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
<p class="desc1"><strong>급여 </strong>3000-3500만원</p>
<p class="desc2"><strong>경력 </strong>무관</p>
<p class="desc3"><strong>나이 </strong>무관</p>
<p class="desc1"><strong>지역 </strong>경기 광주시</p>
<p class="desc2"><strong>학력 </strong>무관</p>
<p class="desc3"><strong>성별 </strong>무관</p>
</div>
<p class="deadline deadline00">상시채용</p>
</a>
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


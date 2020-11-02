<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/company_connect.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/companySubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="detailArea">
				<h4>맞춤 인재정보</h4>
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
				<p class="listTitle">검색된 맞춤인재정보</p>
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
						<div class="desc01">이름</div>
						<div class="desc02">이력서</div>
						<div class="desc03">경력</div>
						<div class="desc04">희망급여</div>
					</li>
					<li>
						<div class="desc">
							<p class="desc01">홍길동</p>
							<p class="desc02">
							<a href="#none" title="맞춤채용공고">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</a>
							</p>
							<p class="desc03">10년 2개월</p>
							<p class="desc04">3000-3500만원</p>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_scrap.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/personSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="listPart">
				<h4>스크랩한 기업</h4>
				<p class="delete">
					<a href="#none" title="선택삭제">선택삭제</a>
				</p>
				<ul class="list">
					<li class="list_title">
						<div class="desc00">
							<input type="checkbox" />
						</div>
						<div class="desc01">채용공고</div>
						<div class="desc02">마감일</div>
						<div class="desc03">스크랩일</div>
					</li>
					<li>
						<div class="desc00">
							<input type="checkbox" />
						</div>
						<div class="desc01">
							<p class="title">
								(주)파인스태프&nbsp;<a href="#none" title="관심기업체크"><i
									class="far fa-heart"></i></a>
							</p>
							<a href="#none" title="채용공고">
								<p class="t_desc01">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							</a>
							<p class="t_desc02">경력무관 | 학력무관 | 서울>서초구 | 정규직</p>
						</div>
						<div class="desc02">
							<p class="d_day">20-10-22</p>
						</div>
						<div class="desc03">
							<p class="scrap_day">20-10-22</p>
						</div>
					</li>
					<li>
						<div class="desc00">
							<input type="checkbox" />
						</div>
						<div class="desc01">
							<p class="title">
								(주)파인스태프&nbsp;<a href="#none" title="관심기업체크"><i
									class="far fa-heart"></i></a>
							</p>
							<a href="#none" title="채용공고">
								<p class="t_desc01">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							</a>
							<p class="t_desc02">경력무관 | 학력무관 | 서울>서초구 | 정규직</p>
						</div>
						<div class="desc02">
							<p class="d_day">20-10-22</p>
						</div>
						<div class="desc03">
							<p class="scrap_day">20-10-22</p>
						</div>
					</li>
					<li>
						<div class="desc00">
							<input type="checkbox" />
						</div>
						<div class="desc01">
							<p class="title">
								(주)파인스태프&nbsp;<a href="#none" title="관심기업체크"><i
									class="far fa-heart"></i></a>
							</p>
							<a href="#none" title="채용공고">
								<p class="t_desc01">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							</a>
							<p class="t_desc02">경력무관 | 학력무관 | 서울>서초구 | 정규직</p>
						</div>
						<div class="desc02">
							<p class="d_day">20-10-22</p>
						</div>
						<div class="desc03">
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
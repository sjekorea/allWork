<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_interview.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/personSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="listPart">
				<h4>면접요청기업</h4>
				<p class="comment">* 회사명을 클릭하면 회사정보와 함께 현재 진행중이거나 마감된 모든 채용공고를 보실 수 있습니다.</p>
				<ul class="list">
					<li class="list_title">
						<div class="desc01">회사명</div>
						<div class="desc02">사업내용</div>
						<div class="desc03">열람일</div>
					</li>
					<li>
						<div class="desc01">
							<a href="#none" title="회사명"><p>(주)파인스태프</p></a>
						</div>
						<div class="desc02">
							<a href="#none" title="사업내용"><p>[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p></a>
						</div>
						<div class="desc03">
							<p>20-10-22</p>
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
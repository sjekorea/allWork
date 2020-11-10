<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/introHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/introduction_location.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/introSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="map">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12663.612089588483!2d127.0156792!3d37.4866148!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa1b74f4c4f18b8bd!2zKOyjvCnsmKzsm4ztgaw!5e0!3m2!1sko!2skr!4v1605014812648!5m2!1sko!2skr"
					width="1080" height="480" frameborder="0" style="border: 0;"
					allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
			</div>
			<div id="map_detail">
				<h4>올워크</h4>
				<ul>
					<li>
						<p class="title">주소</p>
						<p class="desc">서울특별시 서초구 서초중앙로 52(서초동, 영진빌딩) 3층</p>
					</li>
					<li>
						<p class="title">대표전화</p>
						<p class="desc">02) 585-0108</p>
					</li>
					<li>
						<p class="title">운영시간</p>
						<p class="desc">
							평일 09:00 ~ 19:00<br /> 토요일, 일요일, 공휴일 휴무
						</p>
					</li>
					<li>
						<p class="title">이메일</p>
						<p class="desc">mail@allwork.co.kr</p>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />
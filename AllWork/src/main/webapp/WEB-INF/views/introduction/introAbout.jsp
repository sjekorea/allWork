<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/introHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/introduction_about.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/introSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="part01">
				<p class="logo">Allwork</p>
				<p class="desc">
					Allwork란 평생 일한다는 개념이 아닙니다.<br /> 건강이 유지되는 한 창조적이며 경제적인 활동을 하자는
					의미입니다.<br /> 그래서 Allwork는 오랜 기간 우수한 기술과 경력을 쌓아온 퇴직자들이 우량 중소/중견기업에
					재취업 할 수 있도록<br /> 도와드리는 것을 목표로 합니다.
				</p>
				<p class="line"></p>
			</div>
			<div id="part02">
				<p class="title">
					40세 이상 경력자의재취업을 위한<br /> 국내 유일의 전문 구인구직 취업 사이트 입니다.
				</p>
				<ul>
					<li><span><i class="far fa-check-circle"></i></span>개인회원은 40세
						이상 경력자만 가입 하실 수 있습니다.</li>
					<li><span><i class="far fa-check-circle"></i></span>이용자의 특성을
						고려하여 화면 구성을 최대한 단순하고 보기에 편하게 하였습니다.</li>
				</ul>
				<p class="title">
					우량 중소/중견기업 재취업을 통해<br /> 새로운 사회활동 기회를 잡으실 수 있도록 도와드립니다.
				</p>
				<ul>
					<li><span><i class="far fa-check-circle"></i></span>실제적인 구인구직
						관련 정보만을 제공합니다.</li>
					<li><span><i class="far fa-check-circle"></i></span>자체적인 구인정보
						필터링 시스템 운영을 통해 보험영업, 단순 서비스 업무, 일용직 등등에 대한 제안을 사전 차단함으로써<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;실질적이고
						안정적인 구직활동이 될 수 있도록 도와드립니다.</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- (begin) 2020.12.30 by s.yoo	-->
<!-- 
<jsp:include page="/introHeader.do" />
 -->
<c:choose>
	<c:when test="${SE_LOGIN_STATUS}">
		<c:if test="${SE_USER_TYPE == 'company' }">
			<jsp:include page="/companyHeader.do"/>
		</c:if>

		<c:if test="${SE_USER_TYPE == 'person' }">
			<jsp:include page="/personHeader.do" />
		</c:if>
	</c:when>
	<c:otherwise>
			<jsp:include page="/indexHeader.do" />
	</c:otherwise>
</c:choose>
<!-- (end) 2020.12.30 by s.yoo	-->

<link rel="stylesheet" type="text/css" href="/css/introduction_partnership01.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/introSubMenu.do" />
		</div>
		<div id="rightPart">
			<ul>
				<li>
					<p class="partner">
						성균관대학교<br /> 공과대학 총동문회
					</p>
					<p class="desc">성균관대학교 공과대학 총동문회(회장 심왕섭)와 Allwork 가 함께 동문들의
						재취업을 서로 돕기로 업무 협정을 체결했습니다.</p>
					<p class="date">2013년 8월 13일</p>
				</li>
				<li>
					<p class="partner">
						홍익사대부고<br /> 총동문회
					</p>
					<p class="desc">홍익사대부고 총동문회 사무실에서 (주)라온과기술의 김봉갑 대표와, 홍익사대부고
						총동문회장 김수배 회장님하고 홍익사대부고 동문들의 재취업 Allwork에서 서로 돕기로 업무 협정을 체결했습니다.</p>
					<p class="date">2013년 8월 29일</p>
				</li>
				<li>
					<p class="partner">
						청주고 재경 49회<br /> 동창회
					</p>
					<p class="desc">청주고 제 49회(76년 졸업) 재경 동창회 최현동 회장과 (주)라온과기술의 김봉갑
						대표가 청주고 제 49회 동문들의 재취업을 Allwork에서 서로 돕기로 업무 협정을 체결했습니다</p>
					<p class="date">2013년 10월 18일</p>
				</li>
				<li>
					<p class="partner">
						동명대학교<br /> 산학협력단
					</p>
					<p class="desc">부산의 동명대학교 산학협력단에서 산학협력단장인 노태정 교수와 (주)라온과기술의
						김봉갑대표와 사이에 우수 퇴직 경력자들에 대한 구직정보를 동명대학교 산학협력단과 관계된 중소기업에 제공하는 업무협정을
						체결하였습니다.</p>
					<p class="date">2014년 4월 30일</p>
				</li>
				<li>
					<p class="partner">
						김천고 재경 송설<br /> 동창회
					</p>
					<p class="desc">김천고 재경 송설 동창회 이정화(전 삼성 SDI 부사장)회장과, (주)라온과기술의
						김봉갑 대표와, 김천고 동문들의 재취업을 Allwork에서 서로 돕기로 업무 협정을 체결하였습니다.</p>
					<p class="date">2015년 1월 28일</p>
				</li>
				<li>
					<p class="partner partner01">구미전자정보기술원</p>
					<p class="desc">구미전자정보기술원 차종범 원장과, (주)라온과기술의 김봉갑 대표가 구미지역 중소기업의
						인력난 해소를 위해 올워크allwork가 인련정보를 제공하기로 업무 협약을 체결하였습니다.</p>
					<p class="date">2015년 9월 8일</p>
				</li>
				<li>
					<p class="partner partner01">법무법인 인본</p>
					<p class="desc">법무법인 “인본”의 공동대표인 김종규변호사와 정한철변호사께서 올워크의 김봉갑 대표와
						상호 긴밀한 업무협력관계를 맺었습니다.</p>
					<p class="date">2015년 11월 23일</p>
				</li>
				<li>
					<p class="partner partner01">(사)벤처기업협회</p>
					<p class="desc">사단법인 벤처기업협회 손광희 상근부회장과 올워크 김봉갑대표께서 협약을 체결하여,
						벤처기업들에게 인력정보를 제공하는 HR서비스 지원사업을 추진하여 인력난 해소에 도움이 될 것입니다.</p>
					<p class="date">2015년 11월 9일</p>
				</li>
				<li>
					<p class="partner partner01">(사)한국소공인진흥협회</p>
					<p class="desc">사단법인 한국소공인진흥협회 곽의택회장과 올워크 김봉갑대표께서 업무협약을 체결하여,
						30만 소공인들에게 산업현장의 우수한 이공계 경력자들의 인력정보를 제공하기로 하였습니다.</p>
					<p class="date">2016년 1월 19일</p>
				</li>
				<li>
					<p class="partner partner01">(사)한국전자기술협회</p>
					<p class="desc">사단법인 한국전자기술협회 이감열회장과 김봉갑대표가 업무협약을 체결하여 PCB산업분야에
						우수 전문인력을 소개하기로 하였습니다.</p>
					<p class="date">2016년 1월 21일</p>
				</li>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />

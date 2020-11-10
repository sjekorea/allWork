<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/personHeader.do" />


<link rel="stylesheet" type="text/css" href="/css/company_01_view.css"/>


<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/recruitInfoSubMenu.do" />
		</div>
		<div id="rightPart">
			<div id="regist00">
				<div id="company_detail">
					<p class="company_name">${SE_USER_NM }</p>
					<p class="company_hp"><a href="#none" title="기업홈페이지">www.ilmagna.com</a></p>
					<p class="company_logo"><img src="#" alt="로고" /></p>
				</div>
				<div id="detailArea">
					<p class="detail_title">기본정보</p>
					<p class="company_setting">
						<a href="#none" title="관심기업등록"><i class="far fa-heart"></i></a>&nbsp;관심기업등록
						<span><a href="#none" title="기업정보 상세보기"><i class="fas fa-cog"></i>&nbsp;기업정보 상세보기</a></span>
					</p>
					<div class="tabelArea">
						<p class="table_title">대표자</p>
						<p class="table_desc">홍길동</p>
						<p class="table_title">기업형태</p>
						<p class="table_desc">벤처기업</p>
						<p class="table_title">자본금</p>
						<p class="table_desc">4천만원</p>
						<p class="table_title">설립년도</p>
						<p class="table_desc">2019년</p>
						<p class="table_title">사원수</p>
						<p class="table_desc">6명</p>
						<p class="table_title">상장여부</p>
						<p class="table_desc">비상장</p>
						<p class="table_title">업종</p>
						<p class="table_desc01">IT.웹.통신</p>
						<p class="table_title">사업내용</p>
						<p class="table_desc01">AI S/W 개발</p>
					</div>
				</div>
			</div>
			<div id="regist02">
				<div id="regForm02">
					<table>
						<caption>모집요강</caption>
						<tbody>
							<tr>
								<th>공고제목</th>
								<td>[현장파견]정규직 채용(전기공사. 통신공사)</td>
							</tr>
							<tr>
								<th>산업분야</th>
								<td>생산.제조.기계.산업 > 전기.전자.제어 > 전기공사</td>
							</tr>
							<tr>
								<th>직분야</th>
								<td>경기 > 의정부시</td>
							</tr>
							<tr>
								<th>빠른선택</th>
								<td>운전전문직군</td>
							</tr>
							<tr>
								<th>근무지역</th>
								<td>경기 > 의정부시</td>
							</tr>
							<tr>
								<th>담당업무</th>
								<td>[현장파견]정규직 채용(전기공사. 통신공사)</td>
							</tr>
							<tr>
								<th>고용형태</th>
								<td>정규직</td>
							</tr>
							<tr>
								<th>모집인원</th>
								<td>1명</td>
							</tr>
							<tr>
								<th>경력사항</th>
								<td>신입</td>
							</tr>
							<tr>
								<th>급여조건</th>
								<td>2,600만원 이하</td>
							</tr>
							<tr>
								<th>우대조건</th>
								<td>등록된 우대조건 없음</td>
							</tr>
							<tr>
								<th>최종학력</th>
								<td>무관</td>
							</tr>
							<tr>
								<th>나이제한</th>
								<td>무관</td>
							</tr>
							<tr>
								<th>성별</th>
								<td>남자</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="regist03">
				<div id="regForm03">
					<h4>상세요강</h4>
					<p>
						1. 모집내용 : 감시시스템 위탁업무(현장파견 근무 가능자)<br /> 2. 제출서류 : 이력서 , 자기소개서, 자격증
						사본 등<br /> 3. 근무조건 : 주 5일 (1일8시간)<br /> 4. 본사 : 경기도 안양시 동안구 (평촌역
						도보 7분)<br />
					</p>
				</div>
			</div>
			<div id="regist04">
				<div id="regForm04">
					<table>
						<caption>접수기간/방법</caption>
						<tbody>
							<tr>
								<th>접수기간</th>
								<td>~2020 11월 04일(일요일) 마감일 23일전</td>
							</tr>
							<tr>
								<th>제출서류</th>
								<td>
									<span>이력서</span>&nbsp;| <span>자기소개서</span>&nbsp;| <span>졸업증명서</span>&nbsp;|
									<span>주민등록등본</span>&nbsp;| <span>성적증명서</span>
								</td>
							</tr>
							<tr>
								<th>접수방법</th>
								<td>온라인 입사지원</td>
							</tr>
							<tr>
								<th>이력서 양식</th>
								<td>온라인 이력서</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="regist05">
				<div id="regForm05">
					<table>
						<caption>담당자정보</caption>
						<tbody>
							<tr>
								<th>담당자명</th>
								<td>홍길동</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>031-347-6111</td>
							</tr>
							<tr>
								<th>팩스</th>
								<td>031-347-6111</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>iiroom@iiroom.kr</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<ul>
				<li><a href="#none" title="스크랩">스크랩</a></li>
				<li class="reg_ok"><a href="#none" title="입사지원">입사지원</a></li>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />

<form id="searchForm" name="searchForm" method="post" action="/recruitScrapList.do">
	<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo}" />
	<input type="hidden" name="no" id="no" value="${map.no}" />
</form>

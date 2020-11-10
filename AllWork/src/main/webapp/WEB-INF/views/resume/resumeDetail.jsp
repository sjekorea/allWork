<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/resume_view.css"/>

<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<div id="menuTree">
				<jsp:include page="/personInfoSubMenu.do" />
			</div>
		</div>
		<div id="rightPart">
			<div id="resume00">
				<div id="imgArea">
					<p><img src="/img/company_home/img00.jpeg" alt="본인사진" /></p>
				</div>
				<div id="detailArea">
					<p class="detail_title">기본정보</p>
					<div class="tabelArea">
						<p class="table_title">이름</p>
						<p class="table_desc">홍길동</p>
						<p class="table_title">이메일</p>
						<p class="table_desc">asdf@naver.com</p>
						<p class="table_title">휴대폰</p>
						<p class="table_desc">010-000-0000</p>
						<p class="table_title">연락처</p>
						<p class="table_desc">-</p>
						<p class="table_title">주소</p>
						<p class="table_desc01">[463-869] 경기 성남시 분당구 정자일로 156</p>
					</div>
				</div>
			</div>
			<div id="resume02">
				<div id="resForm02">
					<table>
						<caption>희망구직 정보</caption>
						<tbody>
							<tr>
								<th>이력서 제목</th>
								<td>소방안전원, 계측제어정비, 설계</td>
							</tr>
							<tr>
								<th>현재상태</th>
								<td>구직희망(미취업)</td>
							</tr>
							<tr>
								<th>근무지역</th>
								<td class="workPlace">
									<p>경기도&nbsp;>&nbsp;안양시</p>
									<p>경기도&nbsp;>&nbsp;의왕시</p>
									<p>경기도&nbsp;>&nbsp;군포시</p>
								</td>
							</tr>
							<tr>
								<th>직무분야</th>
								<td>경영.기획.사무 > 총무.법무.사무 > 일반관리직</td>
							</tr>
							<tr>
								<th>산업분야</th>
								<td>제조·생산·화학업>전기·전자·제어>전자</td>
							</tr>
							<tr>
								<th>선택적 직무</th>
								<td>운전전문직군</td>
							</tr>
							<tr>
								<th>희망근무형태</th>
								<td>정규직</td>
							</tr>
							<tr>
								<th>희망연봉</th>
								<td>2,600만원 이하</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="resume03">
				<div id="resForm03">
					<h4>학력사항</h4>
					<p class="final_education">
						<span>최종학력</span><span class="edu_result">대학원 석사졸업</span>
					</p>
					<ul>
						<li class="edu_title">
							<p class="edu_desc01">재학기간</p>
							<p class="edu_desc02">학교명</p>
							<p class="edu_desc03">전공</p>
							<p class="edu_desc04">졸업상태</p>
						</li>
						<li class="edu_desc">
							<p class="edu_desc01">2004.3.1 ~ 2008.2.20</p>
							<p class="edu_desc02">oo대학교</p>
							<p class="edu_desc03">oo과</p>
							<p class="edu_desc04">졸업</p>
						</li>
					</ul>
				</div>
			</div>
			<div id="resume04">
				<div id="resForm04">
					<h4>학력사항</h4>
					<p class="final_education">
						<span>총 경력년수</span><span class="edu_result">20년 0개월</span>
					</p>
					<ul>
						<li class="edu_title">
							<p class="edu_desc01">재직기간</p>
							<p class="edu_desc02">회사명</p>
							<p class="edu_desc03">담당업무</p>
						</li>
						<li class="edu_desc">
							<p class="edu_desc01">2004.3.1 ~ 2008.2.20</p>
							<p class="edu_desc02">(주)00</p>
							<p class="edu_desc03">[현장파견]정규직 채용(전기공사. 통신공사)</p>
						</li>
					</ul>
				</div>
			</div>
			<div id="resume05">
				<div id="resForm05">
					<h4>보유기술</h4>
					<p>소방안전관리 및 계측제어설비정비,설계.</p>
				</div>
			</div>
			<div id="resume06">
				<div id="resForm06">
					<h4>자격사항</h4>
					<ul>
						<li class="edu_title">
							<p class="edu_desc01">취득일자</p>
							<p class="edu_desc02">자격증명</p>
							<p class="edu_desc03">발행처</p>
						</li>
						<li class="edu_desc">
							<p class="edu_desc01">2004.3.1</p>
							<p class="edu_desc02">중급전기공사</p>
							<p class="edu_desc03">한국전기공사협회</p>
						</li>
						<li class="edu_desc">
							<p class="edu_desc01">2008.3.1</p>
							<p class="edu_desc02">2급소방안전관리자</p>
							<p class="edu_desc03">한국소방안전원</p>
						</li>
					</ul>
				</div>
			</div>
			<div id="resume07">
				<div id="resForm07">
					<h4>외국어</h4>
					<ul>
						<li class="edu_title">
							<p class="edu_desc01">취득일자</p>
							<p class="edu_desc02">외국어명</p>
							<p class="edu_desc03">수준</p>
							<p class="edu_desc04">점수</p>
							<p class="edu_desc05">발행처</p>
						</li>
						<li class="edu_desc">
							<p class="edu_desc01">2004.3.1</p>
							<p class="edu_desc02">TOEIC</p>
							<p class="edu_desc03">-</p>
							<p class="edu_desc04">600</p>
							<p class="edu_desc05">ETC</p>
						</li>
					</ul>
				</div>
			</div>
			<div id="resume08">
				<div id="resForm08">
					<h4>자기소개서</h4>
					<p>
						포항소재 포스코 및 포스코ICT(자회사)에서 20년 근무경력있슴니다.<br /> 담당업무:계측설비정비 및 설계,시운전.<br />
						퇴사후 포항소재 (주)보광테크 에서 12년근무했슴니다.<br /> 담당업무:전기,계측자재납품 및 설치,시운전<br />
					</p>
				</div>
			</div>
			<ul class="buttons">
				<li><a href="#none" title="포트폴리오 다운로드">포트폴리오 다운로드</a></li>
				<li class="res_ok"><a href="#none" title="면접제의">면접제의</a></li>
				<li><a href="#none" title="스크랩">스크랩</a></li>
				<li><a href="#none" title="인쇄">인쇄</a></li>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />


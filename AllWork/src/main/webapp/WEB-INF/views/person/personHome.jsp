<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/header_personal_home.css"/>
<link rel="stylesheet" type="text/css" href="/css/personal_home.css"/>

<div id="containerWrap">
	<div id="leftPart">
		<div id="myBox">
			<div class="imgArea">
				<p class="cameraBtn"><a href="#" title="사진등록버튼"><i class="fas fa-camera-retro"></i></a></p>
				<p class="myImg"><img src="/img/company_home/img00.jpeg" alt="본인사진"/></p>
			</div>
			<p class="myName"><strong>${SE_USER_NM }</strong>님</p>
			<p class="myDetail"><a href="#" title="이력서보기버튼">이력서보기</a></p>
		</div>
		<div id="menuTree">
			<ul>
				<li class="gnb"><a href="#" title="이력서관리">이력서관리</a>
					<h3>이력서관리</h3>
					<ol>
						<li><a href="/resumeInfoReg.do" title="이력서등록">이력서등록</a></li>
						<li><a href="#" title="이력서수정">이력서수정</a></li>
						<li><a href="#" title="첨부파일관리">첨부파일관리</a></li>
					</ol>
				</li>
				<li class="gnb"><a href="#" title="입사지원관리">입사지원관리</a>
					<h3>입사지원관리</h3>
					<ol>
						<li><a href="#" title="입사지원현황">입사지원현황</a></li>
					</ol>
				</li>
				<li class="gnb"><a href="#" title="스크랩/관심기업">스크랩/관심기업</a>
					<h3>스크랩/관심기업</h3>
					<ol>
						<li><a href="#" title="스크랩">스크랩</a></li>
						<li><a href="#" title="관심기업">관심기업</a></li>
						<li><a href="#" title="면접요청기업">면접요청기업</a></li>
					</ol>
				</li>
				<li class="gnb"><a href="#" title="맞춤서비스 관리">맞춤서비스 관리</a>
					<h3>맞춤서비스 관리</h3>
					<ol>
						<li><a href="#" title="맞춤채용정보">맞춤채용정보</a></li>
						<li><a href="#" title="맞춤서비스설정">맞춤서비스설정</a></li>
					</ol>
				</li>
				<li class="gnb payService"><a href="#" title="유료서비스">유료서비스</a>
					<h3>유료서비스</h3>
					<ol>
						<li><a href="#" title="결재내역 조회">결재내역 조회</a></li>
						<li><a href="#" title="유료옵션서비스 신청">유료옵션서비스 신청</a></li>
					</ol>
				</li>
				<li class="gnb"><a href="#" title="회원정보관리">회원정보관리</a></li>
			</ul>
		</div>
	</div>
	<div id="rightPart">
		<div id="reviewPart">
			<ul>
				<li class="review00"><a href="#" title="지원완료"><strong>${netfuItemCompanyCnt }</strong><span>지원완료</span></a></li>
				<li class="review01"><a href="#" title="이력서열람"><strong>3</strong><span>이력서열람</span></a></li>
				<li class="review02"><a href="#" title="스크랩공고"><strong>${netfuScrapCnt }</strong><span>스크랩공고</span></a></li>
				<li class="review03"><a href="#" title="관심기업공고"><strong>0</strong><span>관심기업공고</span></a></li>
			</ul>
		</div>
		<div id="recommendPart">
			<h4>추천채용정보</h4>
			<ul>
				<li>
					<a href="#" title="기업회원등록공고">
						<div class="descBox">
							<p class="desc01">(주)다우리종합건설</p>
							<p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
							<span class="desc03">1명</span>
						</div>
						</a>
				</li>
				<li>
					<a href="#" title="기업회원등록공고">
						<div class="descBox">
							<p class="desc01">(주)다우리종합건설</p>
							<p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
							<span class="desc03">1명</span>
						</div>
					</a>
				</li>
				<li>
					<a href="#" title="기업회원등록공고">
						<div class="descBox">
							<p class="desc01">(주)다우리종합건설</p>
							<p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
							<span class="desc03">1명</span>
						</div>
					</a>
				</li>
				<li>
					<a href="#" title="기업회원등록공고">
						<div class="descBox">
							<p class="desc01">(주)다우리종합건설</p>
							<p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
							<span class="desc03">1명</span>
						</div>
					</a>
				</li>
				<li>
					<a href="#" title="기업회원등록공고">
						<div class="descBox">
							<p class="desc01">(주)다우리종합건설</p>
							<p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
							<span class="desc03">1명</span>
						</div>
					</a>
				</li>
			</ul>
		</div>
		<div id="listPart">
			<ul class="tab">
				<li><a class="selected" href="#none" title="맞춤채용공고">맞춤채용공고</a></li>
				<li><a href="#none" title="스크랩공고">스크랩공고</a></li>
				<li><a href="#none" title="최근 본 공고">최근 본 공고</a></li>
			</ul>
			<ul class="list">
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
						<p class="deadline deadline00">상시채용</p>
					</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />

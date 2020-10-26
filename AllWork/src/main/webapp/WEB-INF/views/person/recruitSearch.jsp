<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/header_personal.css"/>
<link rel="stylesheet" type="text/css" href="/css/personal_01.css"/>

<div id="containerWrap">
	<div id="rec_left">
		<jsp:include page="/personSubMenu.do" />
	</div>
	<div id="rec_right">
		<div id="recruitment">
			<h4>채용정보 상세검색</h4>
			<div id="rec_row01">
				<dl class="cate_location">
					<dt>
						<a href="#" title="지역별">지역별</a>
					</dt>
					<dd>
						<div>
							<ul>
								<li><input id="column01_btn01" type="button"
									name="column01_btn01" value="서울특별시" /></li>
								<li><input id="column01_btn02" type="button"
									name="column01_btn02" value="경기도" /></li>
								<li><input id="column01_btn03" type="button"
									name="column01_btn03" value="인천광역시" /></li>
								<li><input id="column01_btn04" type="button"
									name="column01_btn04" value="대전광역시" /></li>
								<li><input id="column01_btn05" type="button"
									name="column01_btn05" value="세종특별자치시" /></li>
								<li><input id="column01_btn06" type="button"
									name="column01_btn06" value="충청남도" /></li>
								<li><input id="column01_btn07" type="button"
									name="column01_btn07" value="충청북도" /></li>
								<li><input id="column01_btn08" type="button"
									name="column01_btn08" value="광주광역시" /></li>
								<li><input id="column01_btn09" type="button"
									name="column01_btn09" value="전라남도" /></li>
								<li><input id="column01_btn10" type="button"
									name="column01_btn10" value="전라북도" /></li>
								<li><input id="column01_btn11" type="button"
									name="column01_btn11" value="대구광역시" /></li>
								<li><input id="column01_btn12" type="button"
									name="column01_btn12" value="경상북도" /></li>
								<li><input id="column01_btn13" type="button"
									name="column01_btn13" value="부산광역시" /></li>
								<li><input id="column01_btn14" type="button"
									name="column01_btn14" value="울산광역시" /></li>
								<li><input id="column01_btn15" type="button"
									name="column01_btn15" value="경상남도" /></li>
								<li><input id="column01_btn16" type="button"
									name="column01_btn16" value="강원도" /></li>
								<li><input id="column01_btn17" type="button"
									name="column01_btn17" value="제주특별자치도" /></li>
								<li><input id="column01_btn18" type="button"
									name="column01_btn18" value="전국" /></li>
								<li><input id="column01_btn19" type="button"
									name="column01_btn19" value="해외" /></li>
							</ul>
						</div>
					</dd>
				</dl>
				<dl class="cate_job">
					<dt>
						<a href="#" title="직무별">직무별</a>
					</dt>
					<dd>
						<div>
							<ul>
								<li><input id="column02_btn01" type="button"
									name="column02_btn01" value="경영·사무" /></li>
								<li><input id="column02_btn02" type="button"
									name="column02_btn02" value="마케팅·광고·홍보" /></li>
								<li><input id="column02_btn03" type="button"
									name="column02_btn03" value="IT·인터넷" /></li>
								<li><input id="column02_btn04" type="button"
									name="column02_btn04" value="디자인" /></li>
								<li><input id="column02_btn05" type="button"
									name="column02_btn05" value="무역·유통" /></li>
								<li><input id="column02_btn06" type="button"
									name="column02_btn06" value="영업·고객상담" /></li>
								<li><input id="column02_btn07" type="button"
									name="column02_btn07" value="서비스" /></li>
								<li><input id="column02_btn08" type="button"
									name="column02_btn08" value="연구개발·설계" /></li>
								<li><input id="column02_btn09" type="button"
									name="column02_btn09" value="생산·제조" /></li>
								<li><input id="column02_btn10" type="button"
									name="column02_btn10" value="교육" /></li>
								<li><input id="column02_btn11" type="button"
									name="column02_btn11" value="건설" /></li>
								<li><input id="column02_btn12" type="button"
									name="column02_btn12" value="의료" /></li>
								<li><input id="column02_btn13" type="button"
									name="column02_btn13" value="미디어" /></li>
								<li><input id="column02_btn14" type="button"
									name="column02_btn14" value="전문·특수직" /></li>
							</ul>
						</div>
					</dd>
				</dl>
				<dl class="cate_industry">
					<dt>
						<a href="#" title="산업별">산업별</a>
					</dt>
					<dd>
						<div>
							<ul>
								<li><input id="column03_btn01" type="button"
									name="column03_btn01" value="서비스업" /></li>
								<li><input id="column03_btn02" type="button"
									name="column03_btn02" value="금융·은행업" /></li>
								<li><input id="column03_btn03" type="button"
									name="column03_btn03" value="IT·정보통신업" /></li>
								<li><input id="column03_btn04" type="button"
									name="column03_btn04" value="판매·유통업" /></li>
								<li><input id="column03_btn05" type="button"
									name="column03_btn05" value="교육업" /></li>
								<li><input id="column03_btn06" type="button"
									name="column03_btn06" value="건설업" /></li>
								<li><input id="column03_btn07" type="button"
									name="column03_btn07" value="의료·제약업" /></li>
								<li><input id="column03_btn08" type="button"
									name="column03_btn08" value="미디어·광고업" /></li>
								<li><input id="column03_btn09" type="button"
									name="column03_btn09" value="문화·예술·디자인업" /></li>
								<li><input id="column03_btn10" type="button"
									name="column03_btn10" value="기관·협회" /></li>
							</ul>
						</div>
					</dd>
				</dl>
				<dl class="cate_education">
					<dt>
						<a href="#" title="학력">학력</a>
					</dt>
					<dd>
						<div>
							<ul>
								<li><input id="column05_btn01" type="button"
									name="column05_btn01" value="학력무관" /></li>
								<li><input id="column05_btn02" type="button"
									name="column05_btn02" value="고졸채용" /></li>
								<li><input id="column05_btn03" type="button"
									name="column05_btn03" value="대학(2,3년제) 채용" /></li>
								<li><input id="column05_btn04" type="button"
									name="column05_btn04" value="대학(4년제) 채용" /></li>
								<li><input id="column05_btn05" type="button"
									name="column05_btn05" value="고등학교졸업" /></li>
								<li><input id="column05_btn06" type="button"
									name="column05_btn06" value="석박사 우대" /></li>
							</ul>
						</div>
					</dd>
				</dl>
				<dl class="cate_ect">
					<dt>
						<a href="#" title="상세조건별">상세조건별</a>
					</dt>
					<dd>
						<div>
							<ul>
								<li><input id="column06_btn01" type="button"
									name="column06_btn01" value="해외지역" /></li>
								<li><input id="column06_btn02" type="button"
									name="column06_btn02" value="직급/직책별" /></li>
								<li><input id="column06_btn03" type="button"
									name="column06_btn03" value="전공계열별" /></li>
								<li><input id="column06_btn04" type="button"
									name="column06_btn04" value="우대조건별" /></li>
								<li><input id="column06_btn05" type="button"
									name="column06_btn05" value="자격증별" /></li>
								<li><input id="column06_btn06" type="button"
									name="column06_btn06" value="복리후생별" /></li>
							</ul>
						</div>
					</dd>
				</dl>
				<dl class="cate_freelancer">
					<dt>
						<a href="#" title="프리랜서마켓">프리랜서마켓</a>
					</dt>
					<dd>
						<div>
							<ul>
								<li><input id="column07_btn01" type="button"
									name="column07_btn01" value="기계, 전자, 전기" /></li>
								<li><input id="column07_btn02" type="button"
									name="column07_btn02" value="엔지니어" /></li>
								<li><input id="column07_btn03" type="button"
									name="column07_btn03" value="연구개발, 국책과제" /></li>
								<li><input id="column07_btn04" type="button"
									name="column07_btn04" value="It,프로그래밍" /></li>
								<li><input id="column07_btn05" type="button"
									name="column07_btn05" value="비지니스컨설팅" /></li>
								<li><input id="column07_btn06" type="button"
									name="column07_btn06" value="영업,마케팅" /></li>
								<li><input id="column07_btn07" type="button"
									name="rcolumn07_btn07" value="기타" /></li>
							</ul>
						</div>
					</dd>
				</dl>
			</div>
		</div>
		<div id="rec_listPart01">
			<div id="rec_titleArea01">
				<h4>채용정보</h4>
				<ul class="rec_align">
					<li><a href="#none" title="등록일순">등록일순&nbsp;&nbsp;|&nbsp;</a></li>
					<li><a href="#none" title="등록일순">수정일순&nbsp;&nbsp;|&nbsp;</a></li>
					<li><a href="#none" title="등록일순">마감일순</a></li>
				</ul>
			</div>
			<ul class="rec_title">
				<li class="desc01">업체명</li>
				<li class="desc02">채용정보</li>
				<li class="desc03">경력</li>
				<li class="desc04">학력</li>
				<li class="desc05">등록/수정</li>
				<li class="desc06">마감</li>
			</ul>
			<ul class="rec_list">
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline01">채용시 마감</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline02">~10/15</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
			</ul>
			<div class="numareaWrap">
				<ul class="numArea">
					<li><a href="#" title="prev"><i
							class="fas fa-chevron-left"></i></a></li>
					<li class="p01"><a href="#" title="page1">1</a></li>
					<li><a href="#" title="page2">2</a></li>
					<li><a href="#" title="page3">3</a></li>
					<li><a href="#" title="page4">4</a></li>
					<li><a href="#" title="page5">5</a></li>
					<li><a href="#" title="page6">6</a></li>
					<li><a href="#" title="page7">7</a></li>
					<li><a href="#" title="page8">8</a></li>
					<li><a href="#" title="page9">9</a></li>
					<li><a href="#" title="page10">10</a></li>
					<li><a href="#" title="next"><i
							class="fas fa-chevron-right"></i></a></li>
				</ul>
			</div>
		</div>
		<div id="rec_listPart02">
			<div id="rec_titleArea02">
				<h4>프리랜서 채용정보</h4>
				<ul class="rec_align">
					<li><a href="#none" title="등록일순">등록일순&nbsp;&nbsp;|&nbsp;</a></li>
					<li><a href="#none" title="등록일순">수정일순&nbsp;&nbsp;|&nbsp;</a></li>
					<li><a href="#none" title="등록일순">마감일순</a></li>
				</ul>
			</div>
			<ul class="rec_title">
				<li class="desc01">업체명</li>
				<li class="desc02">채용정보</li>
				<li class="desc03">경력</li>
				<li class="desc04">학력</li>
				<li class="desc05">등록/수정</li>
				<li class="desc06">마감</li>
			</ul>
			<ul class="rec_list">
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
			</ul>
			<div class="numareaWrap">
				<ul class="numArea">
					<li><a href="#" title="prev"><i
							class="fas fa-chevron-left"></i></a></li>
					<li class="p01"><a href="#" title="page1">1</a></li>
					<li><a href="#" title="page2">2</a></li>
					<li><a href="#" title="page3">3</a></li>
					<li><a href="#" title="page4">4</a></li>
					<li><a href="#" title="page5">5</a></li>
					<li><a href="#" title="page6">6</a></li>
					<li><a href="#" title="page7">7</a></li>
					<li><a href="#" title="page8">8</a></li>
					<li><a href="#" title="page9">9</a></li>
					<li><a href="#" title="page10">10</a></li>
					<li><a href="#" title="next"><i
							class="fas fa-chevron-right"></i></a></li>
				</ul>
			</div>
		</div>
		<div id="rec_listPart03">
			<div id="rec_titleArea03">
				<h4>알바 채용정보</h4>
				<ul class="rec_align">
					<li><a href="#none" title="등록일순">등록일순&nbsp;&nbsp;|&nbsp;</a></li>
					<li><a href="#none" title="등록일순">수정일순&nbsp;&nbsp;|&nbsp;</a></li>
					<li><a href="#none" title="등록일순">마감일순</a></li>
				</ul>
			</div>
			<ul class="rec_title">
				<li class="desc01">업체명</li>
				<li class="desc02">채용정보</li>
				<li class="desc03">경력</li>
				<li class="desc04">학력</li>
				<li class="desc05">등록/수정</li>
				<li class="desc06">마감</li>
			</ul>
			<ul class="rec_list">
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
			</ul>
			<div class="numareaWrap">
				<ul class="numArea">
					<li><a href="#" title="prev"><i
							class="fas fa-chevron-left"></i></a></li>
					<li class="p01"><a href="#" title="page1">1</a></li>
					<li><a href="#" title="page2">2</a></li>
					<li><a href="#" title="page3">3</a></li>
					<li><a href="#" title="page4">4</a></li>
					<li><a href="#" title="page5">5</a></li>
					<li><a href="#" title="page6">6</a></li>
					<li><a href="#" title="page7">7</a></li>
					<li><a href="#" title="page8">8</a></li>
					<li><a href="#" title="page9">9</a></li>
					<li><a href="#" title="page10">10</a></li>
					<li><a href="#" title="next"><i
							class="fas fa-chevron-right"></i></a></li>
				</ul>
			</div>
		</div>
		<div id="rec_listPart04">
			<div id="rec_titleArea04">
				<h4>기타 채용정보</h4>
				<ul class="rec_align">
					<li><a href="#none" title="등록일순">등록일순&nbsp;&nbsp;|&nbsp;</a></li>
					<li><a href="#none" title="등록일순">수정일순&nbsp;&nbsp;|&nbsp;</a></li>
					<li><a href="#none" title="등록일순">마감일순</a></li>
				</ul>
			</div>
			<ul class="rec_title">
				<li class="desc01">업체명</li>
				<li class="desc02">채용정보</li>
				<li class="desc03">경력</li>
				<li class="desc04">학력</li>
				<li class="desc05">등록/수정</li>
				<li class="desc06">마감</li>
			</ul>
			<ul class="rec_list">
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline01">채용시 마감</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline02">~09/12</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
				<li><a href="#none" title="맞춤채용공고">
						<p class="list_title">(주)파인스태프</p>
						<div class="desc1">
							<p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
							<p class="desc12">
								<strong>급여 </strong>3000-3500만원
							</p>
							<p class="desc12">
								<strong>지역 </strong>경기 광주시
							</p>
						</div>
						<div class="desc2">
							<p class="desc21">무관</p>
							<p class="desc22">무관</p>
						</div>
						<div class="desc3">
							<p class="desc31">
								<strong>등록 </strong>09/12
							</p>
							<p class="desc32">
								<strong>수정 </strong>09/12
							</p>
						</div>
						<p class="deadline deadline00">상시채용</p>
				</a></li>
			</ul>
			<div class="numareaWrap">
				<ul class="numArea">
					<li><a href="#" title="prev"><i
							class="fas fa-chevron-left"></i></a></li>
					<li class="p01"><a href="#" title="page1">1</a></li>
					<li><a href="#" title="page2">2</a></li>
					<li><a href="#" title="page3">3</a></li>
					<li><a href="#" title="page4">4</a></li>
					<li><a href="#" title="page5">5</a></li>
					<li><a href="#" title="page6">6</a></li>
					<li><a href="#" title="page7">7</a></li>
					<li><a href="#" title="page8">8</a></li>
					<li><a href="#" title="page9">9</a></li>
					<li><a href="#" title="page10">10</a></li>
					<li><a href="#" title="next"><i
							class="fas fa-chevron-right"></i></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/company_03_1.css" />

<div id="containerWrap">
	<div id="leftPart">
		<jsp:include page="/personInfoSubMenu.do" />
	</div>
	<div id="rightPart">
		<div id="part01">
			<ul class="adPart">
				<li>
					<a href="#none" title="유료인재광고01">
						<div>
							<p class="star"><i class="fas fa-star"></i></p>
							<p class="desc01">함**(남/1962년생)</p>
							<p class="desc02">34년 4개월</p>
							<p class="desc03">회계법인 14년 근무 경험(회계/세무/공무)</p>
							<p class="desc04">국제기구, 사단법인, NGO, 재단법인, 시민단체</p>
						</div>
					</a>
				</li>
				<li>
					<a href="#none" title="유료인재광고02">
						<div>
							<p class="star"><i class="fas fa-star"></i></p>
							<p class="desc01">함**(남/1962년생)</p>
							<p class="desc02">34년 4개월</p>
							<p class="desc03">회계법인 14년 근무 경험(회계/세무/공무)</p>
							<p class="desc04">국제기구, 사단법인, NGO, 재단법인, 시민단체</p>
						</div>
					</a>
				</li>
				<li>
					<a href="#none" title="유료인재광고03">
						<div>
							<p class="star"><i class="fas fa-star"></i></p>
							<p class="desc01">함**(남/1962년생)</p>
							<p class="desc02">34년 4개월</p>
							<p class="desc03">회계법인 14년 근무 경험(회계/세무/공무)</p>
							<p class="desc04">국제기구, 사단법인, NGO, 재단법인, 시민단체</p>
						</div>
					</a>
				</li>
				<li>
					<a href="#none" title="유료인재광고04">
						<div>
							<p class="star"><i class="fas fa-star"></i></p>
							<p class="desc01">함**(남/1962년생)</p>
							<p class="desc02">34년 4개월</p>
							<p class="desc03">회계법인 14년 근무 경험(회계/세무/공무)</p>
							<p class="desc04">국제기구, 사단법인, NGO, 재단법인, 시민단체</p>
						</div>
					</a>
				</li>
			</ul>
		</div>
		<div id="part02">
			<form action="#none" method="get" name="searchForm">
				<fieldset>
					<legend>검색</legend>
					<div>
						<span><input id="checkBox_01" type="checkbox" name="q" title="체크박스01" /></span><label for="checkBox_01">‘그리고’(and) 검색</label>
						<span><input id="checkBox_02" type="checkbox" name="q" title="체크박스02" /></span><label for="checkBox_02">‘또는’(or) 검색</label> 
						<span><input id="checkBox_03" type="checkbox" name="q" title="체크박스03" /></span><label for="checkBox_03">‘제외’ 검색</label>
					</div>
					<p><input id="searchText01" type="text" name="q" title="allwork 검색" placeholder="전체(직무, 산업, 이력서내용, 이력서 번호 등)" /></p>
					<p><input id="searchText02" type="text" name="q" title="allwork 검색" placeholder="회사명" /></p>
					<p><input id="searchText03" type="text" name="q" title="allwork 검색" placeholder="학교명, 전공명" /></p>
					<p class="btnBox"><input id="search_btn" type="button" name="searchBtn" value="검색" /></p>
				</fieldset>
			</form>
		</div>
		
		
<div id="part03">
<div id="row01">
<ul class="tab">
<li><a href="#" title="직무">직무</a></li>
<li><a href="#" title="근무지역">근무지역</a></li>
<li><a href="#" title="경력">경력</a></li>
<li><a href="#" title="학력">학력</a></li>
<li><a href="#" title="고용형태">고용형태</a></li>
</ul>
<div class="descArea">
<ul>
<li><input id="col01_btn01" class="on" type="button" name="col01_btn01" value="경영·사무"/></li>
<li><input id="col01_btn02" class="on" type="button" name="col01_btn02" value="마케팅·광고·홍보"/></li>
<li><input id="col01_btn03" class="on" type="button" name="col01_btn03" value="IT·인터넷"/></li>
<li><input id="col01_btn04" class="on" type="button" name="col01_btn04" value="디자인"/></li>
<li><input id="col01_btn05" class="on" type="button" name="col01_btn05" value="무역·유통"/></li>
<li><input id="col01_btn06" class="on" type="button" name="col01_btn06" value="영업·고객상담"/></li>
<li><input id="col01_btn07" class="on" type="button" name="col01_btn07" value="서비스"/></li>
<li><input id="col01_btn08" class="on" type="button" name="col01_btn08" value="연구개발·설계"/></li>
<li><input id="col01_btn09" class="on" type="button" name="col01_btn09" value="생산·제조"/></li>
<li><input id="col011_btn10" class="on" type="button" name="col01_btn10" value="교육"/></li>
<li><input id="col01_btn11" class="on" type="button" name="col01_btn11" value="건설"/></li>
<li><input id="col01_btn12" class="on" type="button" name="col01_btn12" value="의료"/></li>
<li><input id="col01_btn13" class="on" type="button" name="col01_btn13" value="미디어"/></li>
<li><input id="col01_btn14" class="on" type="button" name="col01_btn14" value="전문·특수직"/></li>
</ul>
<ul>
<li><input id="col02_btn01" class="on" type="button" name="col02_btn01" value="서울특별시"/></li>
<li><input id="col02_btn02" class="on" type="button" name="col02_btn02" value="경기도"/></li>
<li><input id="col02_btn03" class="on" type="button" name="col02_btn03" value="인천광역시"/></li>
<li><input id="col02_btn04" class="on" type="button" name="col02_btn04" value="대전광역시"/></li>
<li><input id="col02_btn05" class="on" type="button" name="col02_btn05" value="세종특별자치시"/></li>
<li><input id="col02_btn06" class="on" type="button" name="col02_btn06" value="충청남도"/></li>
<li><input id="col02_btn07" class="on" type="button" name="col02_btn07" value="충청북도"/></li>
<li><input id="col02_btn08" class="on" type="button" name="col02_btn08" value="광주광역시"/></li>
<li><input id="col02_btn09" class="on" type="button" name="col02_btn09" value="전라남도"/></li>
<li><input id="col02_btn10" class="on" type="button" name="col02_btn10" value="전라북도"/></li>
<li><input id="col02_btn11" class="on" type="button" name="col02_btn11" value="대구광역시"/></li>
<li><input id="col02_btn12" class="on" type="button" name="col02_btn12" value="경상북도"/></li>
<li><input id="col02_btn13" class="on" type="button" name="col02_btn13" value="부산광역시"/></li>
<li><input id="col02_btn14" class="on" type="button" name="col02_btn14" value="울산광역시"/></li>
<li><input id="col02_btn15" class="on" type="button" name="col02_btn15" value="경상남도"/></li>
<li><input id="col02_btn16" class="on" type="button" name="col02_btn16" value="강원도"/></li>
<li><input id="col02_btn17" class="on" type="button" name="col02_btn17" value="제주특별자치도"/></li>
<li><input id="col02_btn18" class="on" type="button" name="col02_btn18" value="전국"/></li>
<li><input id="col02_btn19" class="on" type="button" name="col02_btn19" value="해외"/></li>
</ul>
<ul>
<li><input id="col03_btn01" class="on" type="button" name="col03_btn01" value="신입"/></li>
<li><input id="col03_btn02" class="on" type="button" name="col03_btn02" value="경력무관"/></li>
<li><input id="col03_btn03" class="on" type="button" name="col03_btn03" value="1~3년"/></li>
<li><input id="col03_btn04" class="on" type="button" name="col03_btn04" value="3~5년"/></li>
<li><input id="col03_btn05" class="on" type="button" name="col03_btn05" value="5~10년"/></li>
<li><input id="col03_btn06" class="on" type="button" name="col03_btn06" value="10~15년"/></li>
<li><input id="col03_btn07" class="on" type="button" name="col03_btn07" value="15년~"/></li>
</ul>
<ul>
<li><input id="col04_btn01" class="on" type="button" name="col04_btn01" value="대학교졸업(4년)"/></li>
<li><input id="col04_btn02" class="on" type="button" name="col04_btn02" value="대학졸업(2,3년)"/></li>
<li><input id="col04_btn03" class="on" type="button" name="col04_btn03" value="대학원 석사졸업"/></li>
<li><input id="col04_btn04" class="on" type="button" name="col04_btn04" value="대학원 박사졸업"/></li>
<li><input id="col04_btn05" class="on" type="button" name="col04_btn05" value="고등학교졸업"/></li>
<li><input id="col04_btn06" class="on" type="button" name="col04_btn06" value="학력무관"/></li>
</ul>
<ul>
<li><input id="col05_btn01" class="on" type="button" name="col05_btn01" value="정규직"/></li>
<li><input id="col05_btn02" class="on" type="button" name="col05_btn02" value="계약직"/></li>
<li><input id="col05_btn03" class="on" type="button" name="col05_btn03" value="프리랜서"/></li>
<li><input id="col05_btn04" class="on" type="button" name="col05_btn04" value="아르바이트"/></li>
<li><input id="col05_btn05" class="on" type="button" name="col05_btn05" value="기타"/></li>
</ul>
</div>
</div>
<div id="row02">
<ul class="tab">
<li><a href="#" title="산업">산업</a></li>
<li><a href="#" title="직급/직책/급여">직급/직책/급여</a></li>
<li><a href="#" title="자격증">자격증</a></li>
<li><a href="#" title="성별">성별</a></li>
<li></li>
</ul>
<div class="descArea">
<ul>
<li><input id="column01_btn01" class="on" type="button" name="column01_btn01" value="서비스업"/></li>
<li><input id="column01_btn02" class="on" type="button" name="column01_btn02" value="금융·은행업"/></li>
<li><input id="column01_btn03" class="on" type="button" name="column01_btn03" value="IT·정보통신업"/></li>
<li><input id="column01_btn04" class="on" type="button" name="column01_btn04" value="판매·유통업"/></li>
<li><input id="column01_btn05" class="on" type="button" name="column01_btn05" value="제조·생산·화학업"/></li>
<li><input id="column01_btn06" class="on" type="button" name="column01_btn06" value="교육업"/></li>
<li><input id="column01_btn07" class="on" type="button" name="column01_btn07" value="건설업"/></li>
<li><input id="column01_btn08" class="on" type="button" name="column01_btn08" value="의료·제약업"/></li>
<li><input id="column01_btn09" class="on" type="button" name="column01_btn09" value="미디어·광고업"/></li>
<li><input id="column01_btn10" class="on" type="button" name="column01_btn10" value="문화·예술·디자인업"/></li>
<li><input id="column01_btn11" class="on" type="button" name="column01_btn11" value="기관·협회"/></li>
</ul>
<ul>
<li>직급</li>
<li><input id="column02_btn01" class="on" type="button" name="column02_btn01" value="사원~대리급"/></li>
<li><input id="column02_btn02" class="on" type="button" name="column02_btn02" value="과장~차장급"/></li>
<li><input id="column02_btn03" class="on" type="button" name="column02_btn03" value="부장급"/></li>
<li><input id="column02_btn04" class="on" type="button" name="column02_btn04" value="임원~CEO"/></li>
<li>급여</li>
<li><input id="column02_btn05" class="on" type="button" name="column02_btn05" value="~ 3000만원"/></li>
<li><input id="column02_btn06" class="on" type="button" name="column02_btn06" value="3000 ~ 4000만원"/></li>
<li><input id="column02_btn07" class="on" type="button" name="column02_btn07" value="4000 ~ 5000만원"/></li>
<li><input id="column02_btn08" class="on" type="button" name="column02_btn08" value="5000 ~ 6000만원"/></li>
<li><input id="column02_btn09" class="on" type="button" name="column02_btn09" value="6000만원 이상"/></li>
</ul>
<ul>
<li><input id="column03_btn01" class="on" type="button" name="column03_btn01" value="기계, 전자"/></li>
<li><input id="column03_btn02" class="on" type="button" name="column03_btn02" value="생산,품질"/></li>
<li><input id="column03_btn03" class="on" type="button" name="column03_btn03" value="건설·건축·화학"/></li>
<li><input id="column03_btn04" class="on" type="button" name="column03_btn04" value="경제·경영·금융·무역"/></li>
<li><input id="column03_btn05" class="on" type="button" name="column03_btn05" value="산업·안전·환경"/></li>
<li><input id="column03_btn06" class="on" type="button" name="column03_btn06" value="IT·정보통신"/></li>
<li><input id="column03_btn07" class="on" type="button" name="column03_btn07" value="보건·복지·위생"/></li>
</ul>
<ul>
<li><input id="column04_btn01" class="on" type="button" name="column04_btn01" value="남자"/></li>
<li><input id="column04_btn02" class="on" type="button" name="column04_btn02" value="여자"/></li>
</ul>
<ul></ul>
</div>
</div>
<div id="searchBox">
<p class="keywords">
<span><input type="button" value="서울특별시"/><i class="fas fa-times"></i></span>
<span><input type="button" value="서울특별시"/><i class="fas fa-times"></i></span>
<span><input type="button" value="서울특별시"/><i class="fas fa-times"></i></span>
<span><input type="button" value="서울특별시"/><i class="fas fa-times"></i></span>
<span><input type="button" value="서울특별시"/><i class="fas fa-times"></i></span>
</p>
<p class="reset"><a href="#none" title="초기화">초기화</a></p>
<p class="goBtn"><input id="search_btn" type="button" value="선택된 조건 검색하기"/></p>
</div>
</div>
		
		
		
		
		<div id="listPart">
			<h4>인재정보</h4>
			<ul class="title">
				<li class="desc01">이름</li>
				<li class="desc02">이력서 정보</li>
				<li class="desc03">희망지역</li>
				<li class="desc04">경력·희망연봉</li>
				<li class="desc05">수정일</li>
			</ul>
			<ul class="list">
				<li><a href="#" title="맞춤채용인재정보">
						<p class="desc00">
							<span class="desc00_00">주oo</span><br /> <span class="desc00_01">남/64년생</span>
						</p>
						<p class="desc01">
							<span class="desc00_02">영업관리</span><br /> <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
						</p>
						<p class="desc02">
							<span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br /> <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
						</p>
						<p class="desc03">
							<span class="desc00_06">신입</span><br /> <span class="desc00_07">회사내규에따름</span>
						</p>
						<p class="date">2020.08.27</p>
				</a></li>
				<li><a href="#" title="맞춤채용인재정보">
						<p class="desc00">
							<span class="desc00_00">주oo</span><br /> <span class="desc00_01">남/64년생</span>
						</p>
						<p class="desc01">
							<span class="desc00_02">영업관리</span><br /> <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
						</p>
						<p class="desc02">
							<span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br /> <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
						</p>
						<p class="desc03">
							<span class="desc00_06">신입</span><br /> <span class="desc00_07">회사내규에따름</span>
						</p>
						<p class="date">2020.08.27</p>
				</a></li>
				<li><a href="#" title="맞춤채용인재정보">
						<p class="desc00">
							<span class="desc00_00">주oo</span><br /> <span class="desc00_01">남/64년생</span>
						</p>
						<p class="desc01">
							<span class="desc00_02">영업관리</span><br /> <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
						</p>
						<p class="desc02">
							<span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br /> <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
						</p>
						<p class="desc03">
							<span class="desc00_06">신입</span><br /> <span class="desc00_07">회사내규에따름</span>
						</p>
						<p class="date">2020.08.27</p>
				</a></li>
				<li><a href="#" title="맞춤채용인재정보">
						<p class="desc00">
							<span class="desc00_00">주oo</span><br /> <span class="desc00_01">남/64년생</span>
						</p>
						<p class="desc01">
							<span class="desc00_02">영업관리</span><br /> <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
						</p>
						<p class="desc02">
							<span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br /> <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
						</p>
						<p class="desc03">
							<span class="desc00_06">신입</span><br /> <span class="desc00_07">회사내규에따름</span>
						</p>
						<p class="date">2020.08.27</p>
				</a></li>
				<li><a href="#" title="맞춤채용인재정보">
						<p class="desc00">
							<span class="desc00_00">주oo</span><br /> <span class="desc00_01">남/64년생</span>
						</p>
						<p class="desc01">
							<span class="desc00_02">영업관리</span><br /> <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
						</p>
						<p class="desc02">
							<span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br /> <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
						</p>
						<p class="desc03">
							<span class="desc00_06">신입</span><br /> <span class="desc00_07">회사내규에따름</span>
						</p>
						<p class="date">2020.08.27</p>
				</a></li>
				<li><a href="#" title="맞춤채용인재정보">
						<p class="desc00">
							<span class="desc00_00">주oo</span><br /> <span class="desc00_01">남/64년생</span>
						</p>
						<p class="desc01">
							<span class="desc00_02">영업관리</span><br /> <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
						</p>
						<p class="desc02">
							<span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br /> <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
						</p>
						<p class="desc03">
							<span class="desc00_06">신입</span><br /> <span class="desc00_07">회사내규에따름</span>
						</p>
						<p class="date">2020.08.27</p>
				</a></li>
				<li><a href="#" title="맞춤채용인재정보">
						<p class="desc00">
							<span class="desc00_00">주oo</span><br /> <span class="desc00_01">남/64년생</span>
						</p>
						<p class="desc01">
							<span class="desc00_02">영업관리</span><br /> <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
						</p>
						<p class="desc02">
							<span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br /> <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
						</p>
						<p class="desc03">
							<span class="desc00_06">신입</span><br /> <span class="desc00_07">회사내규에따름</span>
						</p>
						<p class="date">2020.08.27</p>
				</a></li>
				<li><a href="#" title="맞춤채용인재정보">
						<p class="desc00">
							<span class="desc00_00">주oo</span><br /> <span class="desc00_01">남/64년생</span>
						</p>
						<p class="desc01">
							<span class="desc00_02">영업관리</span><br /> <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
						</p>
						<p class="desc02">
							<span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br /> <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
						</p>
						<p class="desc03">
							<span class="desc00_06">신입</span><br /> <span class="desc00_07">회사내규에따름</span>
						</p>
						<p class="date">2020.08.27</p>
				</a></li>
				<li><a href="#" title="맞춤채용인재정보">
						<p class="desc00">
							<span class="desc00_00">주oo</span><br /> <span class="desc00_01">남/64년생</span>
						</p>
						<p class="desc01">
							<span class="desc00_02">영업관리</span><br /> <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
						</p>
						<p class="desc02">
							<span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br /> <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
						</p>
						<p class="desc03">
							<span class="desc00_06">신입</span><br /> <span class="desc00_07">회사내규에따름</span>
						</p>
						<p class="date">2020.08.27</p>
				</a></li>
				<li><a href="#" title="맞춤채용인재정보">
						<p class="desc00">
							<span class="desc00_00">주oo</span><br /> <span class="desc00_01">남/64년생</span>
						</p>
						<p class="desc01">
							<span class="desc00_02">영업관리</span><br /> <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
						</p>
						<p class="desc02">
							<span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br /> <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
						</p>
						<p class="desc03">
							<span class="desc00_06">신입</span><br /> <span class="desc00_07">회사내규에따름</span>
						</p>
						<p class="date">2020.08.27</p>
				</a></li>
			</ul>
			<div class="numareaWrap">
				<ul class="numArea">
					<li><a href="#" title="prev"><i class="fas fa-chevron-left"></i></a></li>
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
					<li><a href="#" title="next"><i class="fas fa-chevron-right"></i></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />
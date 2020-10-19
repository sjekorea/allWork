<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8"/>
  <title> 채용정보 </title>
  <link rel="stylesheet" type="text/css" href="/css/header_personal.css"/>
  <link rel="stylesheet" type="text/css" href="/css/personal_01_01.css"/>
	<link rel="stylesheet" type="text/css" href="/css/footer.css"/>
	<link rel="stylesheet" type="text/css" href="/css/font.css"/>
  <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
  <link  rel="stylesheet" type="text/css" href="/css/all.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
  <style></style>
  </head>
  <body>
      <div id="allworkWrap">
        <div id="headerWrap">
          <div id="header">
            <div id="logoArea">
              <h1><a href="/index.do" title="allwork사이트">Allwork</a></h1>
              <p>시니어를&nbsp;위한&nbsp;재취업&nbsp;포털</p>
            </div>
          </div>
          <div id="headWrap">
            <div id="head">
            <ul class="nav">
              <li class="nav01"><a href="/recruitSearch.do" title="채용정보">채용정보</a></li>
              <li class="nav02"><a href="#none" title="헤드헌팅">헤드헌팅</a></li>
              <li class="nav03"><a href="#none" title="채용진행현황">채용진행현황</a></li>
              <li class="nav04"><a href="#none" title="커뮤니티">커뮤니티</a></li>
            </ul>
            <div class="linkArea">
              <a href="#" title="마이페이지"><span class ="fas fa-user-check"></span></a>
              <a href="#none" title="메뉴전체보기"><span class="fas fa-bars"></span></a>
            </div>
          </div>
          </div>
        </div>
        <div id="containerWrap">
          <div id="rec_left">
            <div id="menuTree">
              <p class="settingBtn"><a href="/personalHome.do" title="개인회원 홈">개인회원 홈</a></p>
              <ul>
                <li class="menu menu01"><a href="/recruitSearch.do" title="채용정보">채용정보</a>
                  <h3>채용정보</h3>
                    <ol class="subMenu">
                      <li><a href="/recruitSearch.do" title="상세검색">상세검색</a></li>
                      <li><a href="#" title="직무별">직무별</a></li>
                      <li><a href="#" title="산업별">산업별</a></li>
                      <li><a href="#" title="지역별">지역별</a></li>
                    </ol>
                </li>
                <li class="menu menu02"><a href="#" title="프리랜서">프리랜서</a></li>
                <li class="menu menu03"><a href="#" title="프리랜서">알바채용</a></li>
                <li class="menu menu04"><a href="#" title="프리랜서">기타채용정보</a></li>
              </ul>
            </div>
          </div>
          <div id="rec_right">
            <div id="recruitment">
              <h4>직무별</h4>
              <div id="rec_row01">
                <dl class="cate_job">
                  <dt><a href="#" title="직무별">직무별</a></dt>
                  <dd>
                    <div>
                      <ul>
                        <li><input id="column02_btn01" type="button" name="column02_btn01" value="경영·사무"/></li>
                        <li><input id="column02_btn02" type="button" name="column02_btn02" value="마케팅·광고·홍보"/></li>
                        <li><input id="column02_btn03" type="button" name="column02_btn03" value="IT·인터넷"/></li>
                        <li><input id="column02_btn04" type="button" name="column02_btn04" value="디자인"/></li>
                        <li><input id="column02_btn05" type="button" name="column02_btn05" value="무역·유통"/></li>
                        <li><input id="column02_btn06" type="button" name="column02_btn06" value="영업·고객상담"/></li>
                        <li><input id="column02_btn07" type="button" name="column02_btn07" value="서비스"/></li>
                        <li><input id="column02_btn08" type="button" name="column02_btn08" value="연구개발·설계"/></li>
                        <li><input id="column02_btn09" type="button" name="column02_btn09" value="생산·제조"/></li>
                        <li><input id="column02_btn10" type="button" name="column02_btn10" value="교육"/></li>
                        <li><input id="column02_btn11" type="button" name="column02_btn11" value="건설"/></li>
                        <li><input id="column02_btn12" type="button" name="column02_btn12" value="의료"/></li>
                        <li><input id="column02_btn13" type="button" name="column02_btn13" value="미디어"/></li>
                        <li><input id="column02_btn14" type="button" name="column02_btn14" value="전문·특수직"/></li>
                      </ul>
                    </div>
                  </dd>
                </dl>
                <dl class="cate_industry">
                  <dt><a href="#" title="산업별">산업별</a></dt>
                  <dd>
                    <div>
                      <ul>
                        <li><input id="column03_btn01" type="button" name="column03_btn01" value="서비스업"/></li>
                        <li><input id="column03_btn02" type="button" name="column03_btn02" value="금융·은행업"/></li>
                        <li><input id="column03_btn03" type="button" name="column03_btn03" value="IT·정보통신업"/></li>
                        <li><input id="column03_btn04" type="button" name="column03_btn04" value="판매·유통업"/></li>
                        <li><input id="column03_btn05" type="button" name="column03_btn05" value="교육업"/></li>
                        <li><input id="column03_btn06" type="button" name="column03_btn06" value="건설업"/></li>
                        <li><input id="column03_btn07" type="button" name="column03_btn07" value="의료·제약업"/></li>
                        <li><input id="column03_btn08" type="button" name="column03_btn08" value="미디어·광고업"/></li>
                        <li><input id="column03_btn09" type="button" name="column03_btn09" value="문화·예술·디자인업"/></li>
                        <li><input id="column03_btn10" type="button" name="column03_btn10" value="기관·협회"/></li>
                      </ul>
                    </div>
                  </dd>
                </dl>
                <dl class="cate_location">
                  <dt><a href="#" title="지역별">지역별</a></dt>
                  <dd>
                    <div>
                      <ul>
                        <li><input id="column01_btn01" type="button" name="column01_btn01" value="서울특별시"/></li>
                        <li><input id="column01_btn02" type="button" name="column01_btn02" value="경기도"/></li>
                        <li><input id="column01_btn03" type="button" name="column01_btn03" value="인천광역시"/></li>
                        <li><input id="column01_btn04" type="button" name="column01_btn04" value="대전광역시"/></li>
                        <li><input id="column01_btn05" type="button" name="column01_btn05" value="세종특별자치시"/></li>
                        <li><input id="column01_btn06" type="button" name="column01_btn06" value="충청남도"/></li>
                        <li><input id="column01_btn07" type="button" name="column01_btn07" value="충청북도"/></li>
                        <li><input id="column01_btn08" type="button" name="column01_btn08" value="광주광역시"/></li>
                        <li><input id="column01_btn09" type="button" name="column01_btn09" value="전라남도"/></li>
                        <li><input id="column01_btn10" type="button" name="column01_btn10" value="전라북도"/></li>
                        <li><input id="column01_btn11" type="button" name="column01_btn11" value="대구광역시"/></li>
                        <li><input id="column01_btn12" type="button" name="column01_btn12" value="경상북도"/></li>
                        <li><input id="column01_btn13" type="button" name="column01_btn13" value="부산광역시"/></li>
                        <li><input id="column01_btn14" type="button" name="column01_btn14" value="울산광역시"/></li>
                        <li><input id="column01_btn15" type="button" name="column01_btn15" value="경상남도"/></li>
                        <li><input id="column01_btn16" type="button" name="column01_btn16" value="강원도"/></li>
                        <li><input id="column01_btn17" type="button" name="column01_btn17" value="제주특별자치도"/></li>
                        <li><input id="column01_btn18" type="button" name="column01_btn18" value="전국"/></li>
                        <li><input id="column01_btn19" type="button" name="column01_btn19" value="해외"/></li>
                      </ul>
                    </div>
                  </dd>
                </dl>
                <dl class="cate_education">
                  <dt><a href="#" title="학력">학력</a></dt>
                  <dd>
                    <div>
                      <ul>
                        <li><input id="column05_btn01" type="button" name="column05_btn01" value="학력무관"/></li>
                        <li><input id="column05_btn02" type="button" name="column05_btn02" value="고졸채용"/></li>
                        <li><input id="column05_btn03" type="button" name="column05_btn03" value="대학(2,3년제) 채용"/></li>
                        <li><input id="column05_btn04" type="button" name="column05_btn04" value="대학(4년제) 채용"/></li>
                        <li><input id="column05_btn05" type="button" name="column05_btn05" value="고등학교졸업"/></li>
                        <li><input id="column05_btn06" type="button" name="column05_btn06" value="석박사 우대"/></li>
                      </ul>
                    </div>
                  </dd>
                </dl>
                <dl class="cate_ect">
                  <dt><a href="#" title="상세조건별">상세조건별</a></dt>
                  <dd>
                    <div>
                      <ul>
                        <li><input id="column06_btn01" type="button" name="column06_btn01" value="해외지역"/></li>
                        <li><input id="column06_btn02" type="button" name="column06_btn02" value="직급/직책별"/></li>
                        <li><input id="column06_btn03" type="button" name="column06_btn03" value="전공계열별"/></li>
                        <li><input id="column06_btn04" type="button" name="column06_btn04" value="우대조건별"/></li>
                        <li><input id="column06_btn05" type="button" name="column06_btn05" value="자격증별"/></li>
                        <li><input id="column06_btn06" type="button" name="column06_btn06" value="복리후생별"/></li>
                      </ul>
                    </div>
                  </dd>
                </dl>
                <dl class="cate_freelancer">
                  <dt><a href="#" title="프리랜서마켓">프리랜서마켓</a></dt>
                  <dd>
                    <div>
                      <ul>
                        <li><input id="column07_btn01" type="button" name="column07_btn01" value="기계, 전자, 전기"/></li>
                        <li><input id="column07_btn02" type="button" name="column07_btn02" value="엔지니어"/></li>
                        <li><input id="column07_btn03" type="button" name="column07_btn03" value="연구개발, 국책과제"/></li>
                        <li><input id="column07_btn04" type="button" name="column07_btn04" value="It,프로그래밍"/></li>
                        <li><input id="column07_btn05" type="button" name="column07_btn05" value="비지니스컨설팅"/></li>
                        <li><input id="column07_btn06" type="button" name="column07_btn06" value="영업,마케팅"/></li>
                        <li><input id="column07_btn07" type="button" name="rcolumn07_btn07" value="기타"/></li>
                      </ul>
                    </div>
                  </dd>
                </dl>
              </div>
              <div id="cateOn">
                <ul class="select01">
                  <li><input id="column02_btn01" type="button" name="column02_btn01" value="경영·사무"/></li>
                  <li><input id="column02_btn02" type="button" name="column02_btn02" value="마케팅·광고·홍보"/></li>
                  <li><input id="column02_btn03" type="button" name="column02_btn03" value="IT·인터넷"/></li>
                  <li><input id="column02_btn04" type="button" name="column02_btn04" value="디자인"/></li>
                  <li><input id="column02_btn05" type="button" name="column02_btn05" value="무역·유통"/></li>
                  <li><input id="column02_btn06" type="button" name="column02_btn06" value="영업·고객상담"/></li>
                  <li><input id="column02_btn07" type="button" name="column02_btn07" value="서비스"/></li>
                  <li><input id="column02_btn08" type="button" name="column02_btn08" value="연구개발·설계"/></li>
                  <li><input id="column02_btn09" type="button" name="column02_btn09" value="생산·제조"/></li>
                  <li><input id="column02_btn10" type="button" name="column02_btn10" value="교육"/></li>
                  <li><input id="column02_btn11" type="button" name="column02_btn11" value="건설"/></li>
                  <li><input id="column02_btn12" type="button" name="column02_btn12" value="의료"/></li>
                  <li><input id="column02_btn13" type="button" name="column02_btn13" value="미디어"/></li>
                  <li><input id="column02_btn14" type="button" name="column02_btn14" value="전문·특수직"/></li>
                </ul>
                <ul class="select02">
                  <li><input id="column02_btn011" type="button" name="column02_btn011" value="자동차·조선·기계"/></li>
                  <li><input id="column02_btn021" type="button" name="column02_btn021" value="반도체·디스플레이"/></li>
                  <li><input id="column02_btn031" type="button" name="column02_btn031" value="화학·에너지·환경"/></li>
                  <li><input id="column02_btn041" type="button" name="column02_btn041" value="전기·전자·제어"/></li>
                  <li><input id="column02_btn051" type="button" name="column02_btn051" value="기계설계·CAD·CAM"/></li>
                  <li><input id="column02_btn061" type="button" name="column02_btn061" value="통신기술·네트워크구축"/></li>
                  <li><input id="column02_btn071" type="button" name="column02_btn071" value="바이오·제약·식품"/></li>
                </ul>
                <ul class="select03">
                  <li><input id="column02_btn012" type="button" name="column02_btn012" value="기계"/></li>
                  <li><input id="column02_btn022" type="button" name="column02_btn022" value="기구설계"/></li>
                  <li><input id="column02_btn032" type="button" name="column02_btn032" value="생산기술"/></li>
                  <li><input id="column02_btn042" type="button" name="column02_btn042" value="제품개발"/></li>
                  <li><input id="column02_btn052" type="button" name="column02_btn052" value="금형설계"/></li>
                  <li><input id="column02_btn062" type="button" name="column02_btn062" value="R&D"/></li>
                  <li><input id="column02_btn072" type="button" name="column02_btn072" value="메카트로닉스"/></li>
                  <li><input id="column02_btn042" type="button" name="column02_btn042" value="금속"/></li>
                  <li><input id="column02_btn052" type="button" name="column02_btn052" value="조선/플랜트"/></li>
                  <li><input id="column02_btn062" type="button" name="column02_btn062" value="건설/건축"/></li>
                  <li><input id="column02_btn072" type="button" name="column02_btn072" value="철강"/></li>
                </ul>
              </div>
            </div>
            <div id="rec_listPart01">
              <div id="rec_titleArea01">
                <h4>추천채용정보</h4>
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
                <li>
                  <a href="#none" title="맞춤채용공고">
                    <p class="list_title">(주)파인스태프</p>
                    <div class="desc1">
                      <p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
                      <p class="desc12"><strong>급여 </strong>3000-3500만원</p>
                      <p class="desc12"><strong>지역 </strong>경기 광주시</p>
                    </div>
                    <div class="desc2">
                      <p class="desc21">무관</p>
                      <p class="desc22">무관</p>
                    </div>
                    <div class="desc3">
                      <p class="desc31"><strong>등록 </strong>09/12</p>
                      <p class="desc32"><strong>수정 </strong>09/12</p>
                    </div>
                    <p class="deadline deadline00">상시채용</p>
                  </a>
                </li>
                <li>
                  <a href="#none" title="맞춤채용공고">
                    <p class="list_title">(주)파인스태프</p>
                    <div class="desc1">
                      <p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
                      <p class="desc12"><strong>급여 </strong>3000-3500만원</p>
                      <p class="desc12"><strong>지역 </strong>경기 광주시</p>
                    </div>
                    <div class="desc2">
                      <p class="desc21">무관</p>
                      <p class="desc22">무관</p>
                    </div>
                    <div class="desc3">
                      <p class="desc31"><strong>등록 </strong>09/12</p>
                      <p class="desc32"><strong>수정 </strong>09/12</p>
                    </div>
                    <p class="deadline deadline01">채용시 마감</p>
                  </a>
                </li>
                <li>
                  <a href="#none" title="맞춤채용공고">
                    <p class="list_title">(주)파인스태프</p>
                    <div class="desc1">
                      <p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
                      <p class="desc12"><strong>급여 </strong>3000-3500만원</p>
                      <p class="desc12"><strong>지역 </strong>경기 광주시</p>
                    </div>
                    <div class="desc2">
                      <p class="desc21">무관</p>
                      <p class="desc22">무관</p>
                    </div>
                    <div class="desc3">
                      <p class="desc31"><strong>등록 </strong>09/12</p>
                      <p class="desc32"><strong>수정 </strong>09/12</p>
                    </div>
                    <p class="deadline deadline02">~10/15</p>
                  </a>
                </li>
                <li>
                  <a href="#none" title="맞춤채용공고">
                    <p class="list_title">(주)파인스태프</p>
                    <div class="desc1">
                      <p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
                      <p class="desc12"><strong>급여 </strong>3000-3500만원</p>
                      <p class="desc12"><strong>지역 </strong>경기 광주시</p>
                    </div>
                    <div class="desc2">
                      <p class="desc21">무관</p>
                      <p class="desc22">무관</p>
                    </div>
                    <div class="desc3">
                      <p class="desc31"><strong>등록 </strong>09/12</p>
                      <p class="desc32"><strong>수정 </strong>09/12</p>
                    </div>
                    <p class="deadline deadline00">상시채용</p>
                  </a>
                </li>
                <li>
                  <a href="#none" title="맞춤채용공고">
                    <p class="list_title">(주)파인스태프</p>
                    <div class="desc1">
                      <p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
                      <p class="desc12"><strong>급여 </strong>3000-3500만원</p>
                      <p class="desc12"><strong>지역 </strong>경기 광주시</p>
                    </div>
                    <div class="desc2">
                      <p class="desc21">무관</p>
                      <p class="desc22">무관</p>
                    </div>
                    <div class="desc3">
                      <p class="desc31"><strong>등록 </strong>09/12</p>
                      <p class="desc32"><strong>수정 </strong>09/12</p>
                    </div>
                    <p class="deadline deadline00">상시채용</p>
                  </a>
                </li>
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
            <div id="rec_listPart02">
              <div id="rec_titleArea02">
                <h4>채용정보 I<span>올워크에서 등록한 채용정보</span></h4>
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
                <li>
                  <a href="#none" title="맞춤채용공고">
                    <p class="list_title">(주)파인스태프</p>
                    <div class="desc1">
                      <p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
                      <p class="desc12"><strong>급여 </strong>3000-3500만원</p>
                      <p class="desc12"><strong>지역 </strong>경기 광주시</p>
                    </div>
                    <div class="desc2">
                      <p class="desc21">무관</p>
                      <p class="desc22">무관</p>
                    </div>
                    <div class="desc3">
                      <p class="desc31"><strong>등록 </strong>09/12</p>
                      <p class="desc32"><strong>수정 </strong>09/12</p>
                    </div>
                    <p class="deadline deadline00">상시채용</p>
                  </a>
                </li>
                <li>
                  <a href="#none" title="맞춤채용공고">
                    <p class="list_title">(주)파인스태프</p>
                    <div class="desc1">
                      <p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
                      <p class="desc12"><strong>급여 </strong>3000-3500만원</p>
                      <p class="desc12"><strong>지역 </strong>경기 광주시</p>
                    </div>
                    <div class="desc2">
                      <p class="desc21">무관</p>
                      <p class="desc22">무관</p>
                    </div>
                    <div class="desc3">
                      <p class="desc31"><strong>등록 </strong>09/12</p>
                      <p class="desc32"><strong>수정 </strong>09/12</p>
                    </div>
                    <p class="deadline deadline00">상시채용</p>
                  </a>
                </li>
                <li>
                  <a href="#none" title="맞춤채용공고">
                    <p class="list_title">(주)파인스태프</p>
                    <div class="desc1">
                      <p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
                      <p class="desc12"><strong>급여 </strong>3000-3500만원</p>
                      <p class="desc12"><strong>지역 </strong>경기 광주시</p>
                    </div>
                    <div class="desc2">
                      <p class="desc21">무관</p>
                      <p class="desc22">무관</p>
                    </div>
                    <div class="desc3">
                      <p class="desc31"><strong>등록 </strong>09/12</p>
                      <p class="desc32"><strong>수정 </strong>09/12</p>
                    </div>
                    <p class="deadline deadline00">상시채용</p>
                  </a>
                </li>
                <li>
                  <a href="#none" title="맞춤채용공고">
                    <p class="list_title">(주)파인스태프</p>
                    <div class="desc1">
                      <p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
                      <p class="desc12"><strong>급여 </strong>3000-3500만원</p>
                      <p class="desc12"><strong>지역 </strong>경기 광주시</p>
                    </div>
                    <div class="desc2">
                      <p class="desc21">무관</p>
                      <p class="desc22">무관</p>
                    </div>
                    <div class="desc3">
                      <p class="desc31"><strong>등록 </strong>09/12</p>
                      <p class="desc32"><strong>수정 </strong>09/12</p>
                    </div>
                    <p class="deadline deadline00">상시채용</p>
                  </a>
                </li>
                <li>
                  <a href="#none" title="맞춤채용공고">
                    <p class="list_title">(주)파인스태프</p>
                    <div class="desc1">
                      <p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
                      <p class="desc12"><strong>급여 </strong>3000-3500만원</p>
                      <p class="desc12"><strong>지역 </strong>경기 광주시</p>
                    </div>
                    <div class="desc2">
                      <p class="desc21">무관</p>
                      <p class="desc22">무관</p>
                    </div>
                    <div class="desc3">
                      <p class="desc31"><strong>등록 </strong>09/12</p>
                      <p class="desc32"><strong>수정 </strong>09/12</p>
                    </div>
                    <p class="deadline deadline00">상시채용</p>
                  </a>
                </li>
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
            <div id="rec_listPart03">
              <div id="rec_titleArea03">
                <h4>채용정보 II<span>기업이 등록한 채용정보</span></h4>
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
                <li>
                  <a href="#none" title="맞춤채용공고">
                    <p class="list_title">(주)파인스태프</p>
                    <div class="desc1">
                      <p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
                      <p class="desc12"><strong>급여 </strong>3000-3500만원</p>
                      <p class="desc12"><strong>지역 </strong>경기 광주시</p>
                    </div>
                    <div class="desc2">
                      <p class="desc21">무관</p>
                      <p class="desc22">무관</p>
                    </div>
                    <div class="desc3">
                      <p class="desc31"><strong>등록 </strong>09/12</p>
                      <p class="desc32"><strong>수정 </strong>09/12</p>
                    </div>
                    <p class="deadline deadline00">상시채용</p>
                  </a>
                </li>
                <li>
                  <a href="#none" title="맞춤채용공고">
                    <p class="list_title">(주)파인스태프</p>
                    <div class="desc1">
                      <p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
                      <p class="desc12"><strong>급여 </strong>3000-3500만원</p>
                      <p class="desc12"><strong>지역 </strong>경기 광주시</p>
                    </div>
                    <div class="desc2">
                      <p class="desc21">무관</p>
                      <p class="desc22">무관</p>
                    </div>
                    <div class="desc3">
                      <p class="desc31"><strong>등록 </strong>09/12</p>
                      <p class="desc32"><strong>수정 </strong>09/12</p>
                    </div>
                    <p class="deadline deadline00">상시채용</p>
                  </a>
                </li>
                <li>
                  <a href="#none" title="맞춤채용공고">
                    <p class="list_title">(주)파인스태프</p>
                    <div class="desc1">
                      <p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
                      <p class="desc12"><strong>급여 </strong>3000-3500만원</p>
                      <p class="desc12"><strong>지역 </strong>경기 광주시</p>
                    </div>
                    <div class="desc2">
                      <p class="desc21">무관</p>
                      <p class="desc22">무관</p>
                    </div>
                    <div class="desc3">
                      <p class="desc31"><strong>등록 </strong>09/12</p>
                      <p class="desc32"><strong>수정 </strong>09/12</p>
                    </div>
                    <p class="deadline deadline00">상시채용</p>
                  </a>
                </li>
                <li>
                  <a href="#none" title="맞춤채용공고">
                    <p class="list_title">(주)파인스태프</p>
                    <div class="desc1">
                      <p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
                      <p class="desc12"><strong>급여 </strong>3000-3500만원</p>
                      <p class="desc12"><strong>지역 </strong>경기 광주시</p>
                    </div>
                    <div class="desc2">
                      <p class="desc21">무관</p>
                      <p class="desc22">무관</p>
                    </div>
                    <div class="desc3">
                      <p class="desc31"><strong>등록 </strong>09/12</p>
                      <p class="desc32"><strong>수정 </strong>09/12</p>
                    </div>
                    <p class="deadline deadline00">상시채용</p>
                  </a>
                </li>
                <li>
                  <a href="#none" title="맞춤채용공고">
                    <p class="list_title">(주)파인스태프</p>
                    <div class="desc1">
                      <p class="desc11">[월평균275만/믹서트럭]레미콘 직영기사 구인 광주/김포/당진</p>
                      <p class="desc12"><strong>급여 </strong>3000-3500만원</p>
                      <p class="desc12"><strong>지역 </strong>경기 광주시</p>
                    </div>
                    <div class="desc2">
                      <p class="desc21">무관</p>
                      <p class="desc22">무관</p>
                    </div>
                    <div class="desc3">
                      <p class="desc31"><strong>등록 </strong>09/12</p>
                      <p class="desc32"><strong>수정 </strong>09/12</p>
                    </div>
                    <p class="deadline deadline00">상시채용</p>
                  </a>
                </li>
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
        <div id="footerWrap">
    			<div id="footer">
    				<h2>Allwork정보 및 이용약관</h2>
            <p class="footLogo">Allwork</p>
            <div id="copyArea">
      				<ul class="menuArea">
      					<li><a href="#" title="회사소개">회사소개</a></li>
      					<li><a href="#" title="고객센터">고객센터</a></li>
      					<li><a href="#" title="개인정보처리방침">개인정보처리방침</a></li>
      					<li><a href="#" title="사이트맵">사이트맵</a></li>
      				</ul>
              <ul class="linkArea">
                <li><a href="#" title="인스타페이지"><i class="fab fa-instagram"></i></a></li>
                <li><a href="#" title="유투브페이지"><i class="fab fa-youtube"></i></a></li>
                <li><a href="#" title="페이스북페이지"><i class="fab fa-facebook"></i></a></li>
              </ul>
  						<div class="address">
  							<span>상호 : (주)올워크 | 직업정보제공사업등록번호 : 서울청 제2019-2호 | 대표이사 : 김봉갑 | 평일 : am 09:00 ~ pm 06:00 | 토요일, 일요일, 공휴일 휴무</span><br/>
  							<span>E-mail : mail@allwork.co.kr Tel. 02-585-0108 | 주소 : 06640 서울특별시 서초구 서초중앙로 52 (서초동, 영진빌딩) 3층</span><br/>
  							<span>Copyright ⓒ allwork.co.kr all rights reserved.</span>
  						</div>
            </div>
    			</div>
    		</div>
      </div>
  </body>
</html>


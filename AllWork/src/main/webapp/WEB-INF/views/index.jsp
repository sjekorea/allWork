<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8"/>
  <title> allwork </title>
  <link rel="stylesheet" type="text/css" href="/css/header_main.css"/>
  <link rel="stylesheet" type="text/css" href="/css/index.css"/>
	<link rel="stylesheet" type="text/css" href="/css/footer.css"/>
	<link rel="stylesheet" type="text/css" href="/css/font.css"/>
  <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
  <link  rel="stylesheet" type="text/css" href="/css/all.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="/js/jquery-1.12.4.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
  <script src="/js/index00.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
  <style>
  </style>
  </head>
  <body>
    <div id="allworkWrap">
      <div id="progress_bar" style="display:none;">
        <p class="load">loading...</p>
        <p class="bar"></p>
      </div>
      <div id="headerWrap">
        <div id="topWrap">
          <ul class="topMenu">	
            <c:choose>
				<c:when test="${SE_LOGIN_STATUS}">
					<li><a href="/logout.do" title="로그아웃">로그아웃&nbsp;|&nbsp;</a></li>
           		    <li><a href="#" title="mypage">mypage</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/login.do" title="로그인">로그인&nbsp;|&nbsp;</a></li>
           		    <li><a href="/personalJoin.do" title="회원가입">회원가입</a></li>
				</c:otherwise>
			</c:choose>
          </ul>
        </div>
        <div id="head">
          <div id="header">
            <h1><a href="/index.do" title="allwork사이트">Allwork</a></h1>
            <ul class="nav">
              <li><a href="#none" title="전체메뉴보기"><i class="fas fa-bars"></i></a></li>
              <li><a href="/recruitSearch.do" title="채용정보">채용정보</a></li>
              <li><a href="/personSearch.do" title="인재검색">인재검색</a></li>
              <li><a href="#none" title="헤드헌팅">헤드헌팅</a></li>
              <li><a href="#none" title="채용진행현황">채용진행현황</a></li>
              <li><a href="#none" title="커뮤니티">커뮤니티</a></li>
            </ul>
            <ul class="linkArea">
              <c:choose>
				<c:when test="${SE_LOGIN_STATUS}">
					<li class="a01"><a href="/logout.do" title="개인회원 로그인">로그아웃</a></li>
                	<li class="a02"><a href="#" title="mypage">mypage</a></li>
				</c:when>
				<c:otherwise>
					<li class="a01"><a href="/login.do?type=person" title="개인회원 로그인">개인회원 로그인</a></li>
                	<li class="a02"><a href="/login.do?type=company" title="기업회원 로그인">기업회원 로그인</a></li>
				</c:otherwise>
			</c:choose>
            </ul>
          </div>
        </div>
      </div>
      <div id="allMenuWrap">
        <div id="allMenu">
          <p><a href="#" title="채용정보"><i class="far fa-times-circle"></i></a></p>
          <div class="sitemapArea">
            <div class="sitemap">
              <h4>채용정보</h4>
              <ul>
                <li class="sitemap_depth01"><a href="/recruitSearch.do" title="채용정보">채용정보</a>
                  <li class="sitemap_depth02"><a href="#" title="상세검색">상세검색</a></li>
                  <li class="sitemap_depth02"><a href="/recruitSearchByDuty.do" title="직무별">직무별</a></li>
                  <li class="sitemap_depth02"><a href="#" title="산업별">산업별</a></li>
                  <li class="sitemap_depth02"><a href="#" title="지역별">지역별</a></li>
                  <li class="sitemap_depth02"><a href="#" title="기업별">기업별</a></li>
                <li class="sitemap_depth01"><a href="#" title="프리랜서">프리랜서</a></li>
                <li class="sitemap_depth01"><a href="#" title="알바채용">알바채용</a></li>
                <li class="sitemap_depth01"><a href="#" title="기타채용정보">기타채용정보</a></li>
                <li class="sitemap_depth01"><a href="#" title="모바일채용정보">모바일채용정보</a></li>
              </ul>
            </div>
            <div class="sitemap">
              <h4>인재검색</h4>
              <ul>
                <li class="sitemap_depth01"><a href="/personSearch.do" title="인재검색">인재검색</a>
                  <li class="sitemap_depth02"><a href="#" title="상세검색">상세검색</a></li>
                  <li class="sitemap_depth02"><a href="#" title="직무별">직무별</a></li>
                  <li class="sitemap_depth02"><a href="#" title="산업별">산업별</a></li>
                  <li class="sitemap_depth02"><a href="#" title="지역별">지역별</a></li>
                  <li class="sitemap_depth02"><a href="#" title="기업별">기업별</a></li>
                  <li class="sitemap_depth02"><a href="#" title="프리랜서">프리랜서</a></li>
                  <li class="sitemap_depth02"><a href="#" title="알바">알바</a></li>
                <li class="sitemap_depth01"><a href="#" title="스크랩인재">스크랩인재</a></li>
                <li class="sitemap_depth01"><a href="#" title="우수추천인재">우수추천인재</a></li>
              </ul>
            </div>
            <div class="sitemap">
              <h4>헤드헌팅</h4>
              <ul>
                <li class="sitemap_depth01"><a href="#" title="채용정보">채용정보</a>
              </ul>
            </div>
            <div class="sitemap">
              <h4>채용진행현황</h4>
              <ul>
                <li class="sitemap_depth01"><a href="#" title="면접진행">면접진행</a>
                <li class="sitemap_depth01"><a href="#" title="기업방문">기업방문</a></li>
                <li class="sitemap_depth01"><a href="#" title="이력서제공">이력서제공</a></li>
                <li class="sitemap_depth01"><a href="#" title="재취업성공">재취업성공</a></li>
                <li class="sitemap_depth01"><a href="#" title="사전면접">사전면접</a></li>
              </ul>
            </div>
          </div>
          <div id="allMenu_ect">
            <span><a href="#" title="고객센터">고객센터</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</span>
            <span><a href="#" title="회사소개">회사소개</a></span>
          </div>
        </div>
      </div>
      <div id="containerWrap">
        <div id="visualWrap">
          <div id="visual">
            <h2>비쥬얼영역</h2>
            <div class="descBox">
              <p class="desc1"><span>40세&nbsp;이상&nbsp;구인구직은</span><br/><span class="bold">올워크</span></p>
              <div id="searchArea">
                <form action="https://www.mmca.co.kr/search" method="get" name="searchForm">
                  <fieldset>
                  <legend>검색</legend>
                  <p class="textBox"><input id="searchText" type="text" name="q"  title="allwork 검색" maxlength="100" placeholder="검색어를 입력해주세요"/></p>
                  <p class="btnBox00"><input id="search_btn00" type="button" name="searchBtn00" value="검색"/></p>
                  </fieldset>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div id="screen">
          <ul id="film">
            <li class="scene scene0">
              <img src="/img/main/main00.jpg" alt="이미지00"/>
            </li>
            <li class="scene scene1">
              <img src="/img/main/main01.jpg" alt="이미지01"/>
            </li>
          </ul>
        </div>
        <div id="content01Wrap">
          <div id="content01">
            <ul>
              <li class="headhunting">
                <a href="01_aboutMMCA.html" title="유료공고00">
                  <span class="desc00">헤드헌팅</span><span class="desc01">1명</span>
                  <p class="desc02">(주)다우리종합건설</p>
                  <p class="desc03">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                  <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                </a>
              </li>
              <li class="headhunting">
                <a href="01_aboutMMCA.html" title="유료공고00">
                    <span class="desc00">헤드헌팅</span><span class="desc01">1명</span>
                    <p class="desc02">(주)다우리종합건설</p>
                    <p class="desc03">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                    <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                </a>
              </li>
              <li class="headhunting">
                <a href="01_aboutMMCA.html" title="유료공고00">
                    <span class="desc00">헤드헌팅</span><span class="desc01">1명</span>
                    <p class="desc02">(주)다우리종합건설</p>
                    <p class="desc03">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                    <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                </a>
              </li>
              <li class="regular">
                <a href="01_aboutMMCA.html" title="유료공고00">
                    <span class="desc00">정규직</span><span class="desc01">1명</span>
                    <p class="desc02">(주)다우리종합건설</p>
                    <p class="desc03">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                    <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                </a>
              </li>
              <li class="regular">
                <a href="01_aboutMMCA.html" title="유료공고00">
                    <span class="desc00">정규직</span><span class="desc01">1명</span>
                    <p class="desc02">(주)다우리종합건설</p>
                    <p class="desc03">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                    <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                </a>
              </li>
              <li class="regular">
                <a href="01_aboutMMCA.html" title="유료공고00">
                    <span class="desc00">정규직</span><span class="desc01">1명</span>
                    <p class="desc02">(주)다우리종합건설</p>
                    <p class="desc03">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                    <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                </a>
              </li>
              <li class="freelance">
                <a href="01_aboutMMCA.html" title="유료공고00">
                    <span class="desc00">프리랜서</span><span class="desc01">1명</span>
                    <p class="desc02">(주)다우리종합건설</p>
                    <p class="desc03">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                    <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                </a>
              </li>
              <li class="partT">
                <a href="01_aboutMMCA.html" title="유료공고00">
                    <span class="desc00">알바</span><span class="desc01">1명</span>
                    <p class="desc02">(주)다우리종합건설</p>
                    <p class="desc03">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                    <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div id="content02Wrap">
            <div id="content02">
              <div id="adArea">
                <p class="btn btn_prev"><a href="01_aboutMMCA.html" title="이전보기"><img src="/img/main/btn_prev.jpg" alt="이전버튼"/></a></p>
                <ul id="adList">
                  <li>
                    <a href="01_aboutMMCA.html" title="기업홈">
                      <p class="adImg">
                        <img src="/img/main/ad00.jpg" alt="기업광고00"/>
                      </p>
                      <p class="adText">
      									<span class="w_subtitle">삼성전자</span><br/>
      									<span class="w_title">경력직 채용</span>
      								</p>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업홈">
                      <p class="adImg">
                        <img src="/img/main/ad01.jpg" alt="기업광고01"/>
                      </p>
                      <p class="adText">
      									<span class="w_subtitle">LG전자</span><br/>
      									<span class="w_title">경력직 채용</span>
      								</p>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업홈">
                      <p class="adImg">
                        <img src="/img/main/ad02.jpg" alt="기업광고02"/>
                      </p>
                      <p class="adText">
      									<span class="w_subtitle">HANSAE패션</span><br/>
      									<span class="w_title">경력직 채용</span>
      								</p>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업홈">
                      <p class="adImg">
                        <img src="/img/main/ad03.jpg" alt="기업광고03"/>
                      </p>
                      <p class="adText">
      									<span class="w_subtitle">현대백화점</span><br/>
      									<span class="w_title">경력직 채용</span>
      								</p>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업홈">
                      <p class="adImg">
                        <img src="/img/main/ad04.jpg" alt="기업광고04"/>
                      </p>
                      <p class="adText">
      									<span class="w_subtitle">오리온</span><br/>
      									<span class="w_title">경력직 채용</span>
      								</p>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업홈">
                      <p class="adImg">
                        <img src="/img/main/ad05.jpg" alt="기업광고05"/>
                      </p>
                      <p class="adText">
      									<span class="w_subtitle">KB</span><br/>
      									<span class="w_title">경력직 채용</span>
      								</p>
                    </a>
                  </li>
                </ul>
                <p class="btn btn_prev"><a href="01_aboutMMCA.html" title="다음보기"><img src="/img/main/btn_next.jpg" alt="다음버튼"/></a></p>
              </div>
            </div>
            <div id="content03Wrap">
              <div id="content03">
                <h4>기업회원 등록 채용공고</h4>
                <p class="more"><a href="#none" title="더보기">more+</a></p>
                <ul>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
            <div id="content04Wrap">
              <div id="content04">
                <h4>프리랜서 채용공고</h4>
                <p><a href="01_aboutMMCA.html" title="더보기">more+</a></p>
                <ul>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
            <div id="content05Wrap">
              <div id="content05">
                <h4>알바 채용공고</h4>
                <p><a href="01_aboutMMCA.html" title="더보기">more+</a></p>
                <ul>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="01_aboutMMCA.html" title="기업회원등록공고">
                      <div class="descBox">
                        <p class="desc01">(주)다우리종합건설</p>
                        <p class="desc02">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
                        <span class="desc03">1명</span>
                        <span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
            <div id="content06Wrap">
              <div id="content06">
                <h4>기타 채용정보</h4>
                <p><a href="01_aboutMMCA.html" title="더보기">more+</a></p>
                <table title="이름, 아이디, 비밀번호, 이메일 등의 정보입력">
        					<caption>기타 채용정보</caption>
                  <thead id="boardTitle">
                    <tr>
        							<th>회사명</th>
        							<td class="jPart">채용분야</td>
                      <td class="jPerson">채용인원</td>
                      <td class="jadd">근무처</td>
                      <td class="jcontact">연락처</td>
                      <td class="jDate">등록일</td>
        						</tr>
                  </thead>
                  <tbody>
                    <tr onclick="location.href='https://www.daum.net/'" style="cursor:pointer">
        							<th>주)킨스파트너스</th>
        							<td class="jPart">[한국원자력안전기술원 자회사 킨스파트너스] 업무지원팀 채용 공고</td>
                      <td class="jPerson">1명</td>
                      <td class="jadd">충북 충주시</td>
                      <td class="jcontact">043-843-9912</td>
                      <td class="jDate">20-09-24</td>
        						</tr>
                    <tr onclick="location.href='https://www.daum.net/'" style="cursor:pointer">
        							<th>주)킨스파트너스</th>
        							<td class="jPart">[한국원자력안전기술원 자회사 킨스파트너스] 업무지원팀 채용 공고</td>
                      <td class="jPerson">1명</td>
                      <td class="jadd">충북 충주시</td>
                      <td class="jcontact">043-843-9912</td>
                      <td class="jDate">20-09-24</td>
        						</tr>
                    <tr onclick="location.href='https://www.daum.net/'" style="cursor:pointer">
        							<th>주)킨스파트너스</th>
        							<td class="jPart">[한국원자력안전기술원 자회사 킨스파트너스] 업무지원팀 채용 공고</td>
                      <td class="jPerson">1명</td>
                      <td class="jadd">충북 충주시</td>
                      <td class="jcontact">043-843-9912</td>
                      <td class="jDate">20-09-24</td>
        						</tr>
                    <tr onclick="location.href='https://www.daum.net/'" style="cursor:pointer">
        							<th>주)킨스파트너스</th>
        							<td class="jPart">[한국원자력안전기술원 자회사 킨스파트너스] 업무지원팀 채용 공고</td>
                      <td class="jPerson">1명</td>
                      <td class="jadd">충북 충주시</td>
                      <td class="jcontact">043-843-9912</td>
                      <td class="jDate">20-09-24</td>
        						</tr>
                    <tr onclick="location.href='https://www.daum.net/'" style="cursor:pointer">
        							<th>주)킨스파트너스</th>
        							<td class="jPart">[한국원자력안전기술원 자회사 킨스파트너스] 업무지원팀 채용 공고</td>
                      <td class="jPerson">1명</td>
                      <td class="jadd">충북 충주시</td>
                      <td class="jcontact">043-843-9912</td>
                      <td class="jDate">20-09-24</td>
        						</tr>
                    <tr onclick="location.href='https://www.daum.net/'" style="cursor:pointer">
        							<th>주)킨스파트너스</th>
        							<td class="jPart">[한국원자력안전기술원 자회사 킨스파트너스] 업무지원팀 채용 공고</td>
                      <td class="jPerson">1명</td>
                      <td class="jadd">충북 충주시</td>
                      <td class="jcontact">043-843-9912</td>
                      <td class="jDate">20-09-24</td>
        						</tr>
                    <tr onclick="location.href='https://www.daum.net/'" style="cursor:pointer">
        							<th>주)킨스파트너스</th>
        							<td class="jPart">[한국원자력안전기술원 자회사 킨스파트너스] 업무지원팀 채용 공고</td>
                      <td class="jPerson">1명</td>
                      <td class="jadd">충북 충주시</td>
                      <td class="jcontact">043-843-9912</td>
                      <td class="jDate">20-09-24</td>
        						</tr>
                    <tr onclick="location.href='https://www.daum.net/'" style="cursor:pointer">
        							<th>주)킨스파트너스</th>
        							<td class="jPart">[한국원자력안전기술원 자회사 킨스파트너스] 업무지원팀 채용 공고</td>
                      <td class="jPerson">1명</td>
                      <td class="jadd">충북 충주시</td>
                      <td class="jcontact">043-843-9912</td>
                      <td class="jDate">20-09-24</td>
        						</tr>
                    <tr onclick="location.href='https://www.daum.net/'" style="cursor:pointer">
        							<th>주)킨스파트너스</th>
        							<td class="jPart">[한국원자력안전기술원 자회사 킨스파트너스] 업무지원팀 채용 공고</td>
                      <td class="jPerson">1명</td>
                      <td class="jadd">충북 충주시</td>
                      <td class="jcontact">043-843-9912</td>
                      <td class="jDate">20-09-24</td>
        						</tr>
                    <tr onclick="location.href='https://www.daum.net/'" style="cursor:pointer">
        							<th>주)킨스파트너스</th>
        							<td class="jPart">[한국원자력안전기술원 자회사 킨스파트너스] 업무지원팀 채용 공고</td>
                      <td class="jPerson">1명</td>
                      <td class="jadd">충북 충주시</td>
                      <td class="jcontact">043-843-9912</td>
                      <td class="jDate">20-09-24</td>
        						</tr>
        					</tbody>
        				</table>
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

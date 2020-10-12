<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"/>

<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/moment.min.js"></script>
<script type="text/javascript" src="/js/common.js"></script>

<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8"/>
  <title> 개인회원 홈 </title>
  <link rel="stylesheet" type="text/css" href="/css/header_personal.css"/>
	<link rel="stylesheet" type="text/css" href="/css/footer.css"/>
	<link rel="stylesheet" type="text/css" href="/css/font.css"/>
  <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
  <link  rel="stylesheet" type="text/css" href="/css/all.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
  <style>


  body{background: #EDF0F5;font-family:"NotoSansKR-Regular";}
  /*###################################   containerWrap  ###################################*/
      #containerWrap{width:1280px;margin: 0 auto;overflow: hidden;}
  /*###################################   leftpart   ###################################*/
        #leftPart{width:220px;height:100%;float: left;}
        #myBox{width:100%;height:300px;background-color:#F4F8FC;overflow: hidden;}
        #myBox .imgArea{width:124px;height:124px;position: relative;margin: 50px auto 0;}
        #myBox .imgArea .myImg{width:100%;height:100%;border-radius:50%;margin: 0 auto;background-color: #fff;}
        #myBox .imgArea .cameraBtn{width:34px; height:34px;border-radius:17px;line-height: 34px;background-color:#4F60E3;text-align: center;position: absolute;bottom: 0;right: 0;}
        #myBox .imgArea .fas{color: #fff;}

        #myBox p{width: 100%;text-align: center;}
        #myBox .myName{padding-top: 12px;padding-bottom:10px;font-size:16px;}
        #myBox .myDetail{width:100px;height: 30px;line-height: 29px;margin: 0 auto;border: 1px solid #4F60E3;font-size:14px;}
        #myBox .myDetail a{color:#4F60E3;}

          #myBox .myDetail:hover a{color:#000;}
          #myBox .myDetail:hover{border: 1px solid #000;}

        #menuTree{width:100%;height:100%;margin-top:20px;font-size:16px;}
        #menuTree ul{width:100%;font-size: 16px;text-indent:20px;}
        #menuTree ul .gnb{padding-top:10px;padding-bottom: 20px;}
        #menuTree ul .payService{height:64px;background-color: #FFCE00;}
        #menuTree ul .payService li a{color:#666;}
        #menuTree ol{width:100%;font-size: 14px;text-indent:40px;}
        #menuTree ol a{color:#999;}

  /*###################################   rightpart   ###################################*/
  #rightPart{width:1000px;height:100%;margin-left:60px;float: left;}

  /*###################################   reviewpart   ###################################*/
  #reviewPart{width:100%;height:300px;overflow: hidden;}
  #reviewPart ul{width:740px;height:154px;margin: 98px auto 0;}
  #reviewPart ul li{width:110px;height:100%;text-align: center;float:left;margin-right:100px;}
          #reviewPart ul li:last-child{margin-right:0px;}

  #reviewPart ul li a{display: block;width: 100%;height: 100%;}
  #reviewPart ul li a strong{display: block;width: 106px;height: 106px;line-height: 106px;margin-bottom: 40px;border-radius:53px;font-size:30px;color:#999;background-color:#F4F8FC;}
  #reviewPart ul li a span{font-size: 16px;color:#999;}

  #reviewPart ul .review01 a strong{color:#4F60E3;}
  #reviewPart ul .review01 a span{color:#4F60E3;}
  #reviewPart ul .review01 a strong:hover{color:#000;}
  #reviewPart ul .review01 a span:hover{color:#000;}

  /*###################################   recommendpart   ###################################*/
  #recommendPart{width:100%;margin-top: 30px;overflow: hidden;}
  #recommendPart h4{width:100%;padding-bottom:10px;}
  #recommendPart ul{width:100%;height:140px;}
  #recommendPart li{width:198px;height:138px;border: 1px solid #ccc;float:left;}

        #recommendPart li:hover{border: 1px solid #666;}

  #recommendPart li a{display: block;width:100%;height: 100%;}
  #recommendPart ul li a .descBox{width:80%;height:80%;padding: 10%;}
  #recommendPart ul li a span{font-size:12px;}

  #recommendPart ul li a .desc01{width:100%;font-size: 14px;line-height:24px;padding-bottom: 18px;float:left;}
  #recommendPart ul li a .desc02{width:100%;font-size: 14px;font-family:"NotoSansKR-Bold";float:left;}
  #recommendPart ul li a .desc03{width:100%;font-size: 12px;line-height:36px;font-family:"NotoSansKR-Light";float:left;}
  #recommendPart ul li a .desc04{width:50%;text-align:left;float:left;padding-top:10px;}
  #recommendPart ul li a .desc05{width:50%;text-align: right;float:right;padding-top:10px;}

  /*###################################   listpart   ###################################*/
  #listPart{width:100%;margin-top: 30px;margin-bottom: 100px;overflow: hidden;font-size: 14px;}
  #listPart .tab{width:540px;height:40px;}
  #listPart .tab li{width:178px;height:38px;line-height:38px;text-align:center; background-color: #eee;border:1px solid #ccc;float:left;}
  #listPart .tab li a{display: block;width: 100%;height: 100%;color:#ccc;}

          #listPart .tab li:hover{border: 1px solid #999;}
          #listPart .tab li:hover a{color: #999;}

  #listPart .tab li a.selected{background-color: #fff;color:#000;}

  #listPart .list{width:100%;border-top:1px solid #999;overflow: hidden;}
  #listPart .list li{width:100%;height:150px;border-bottom:1px solid #ccc;}
  #listPart .list li a{display: block;width: 100%;height: 100%;overflow: hidden;}

          #listPart .list li a:hover{background-color: #F4F8FC;}

  #listPart .list li a .title{width:226px;height: 100%;line-height:150px;text-align:center;font-size: 16px;float:left;}
  #listPart .list li a .desc{width:550px;height:100%;float:left;padding-top:35px;}
    #listPart .list li a .desc .desc0{width:100%;font-size: 16px;padding-bottom: 15px;float:left;}
    #listPart .list li a .desc .desc1{width:220px;float:left;color:#666;}
    #listPart .list li a .desc .desc2{width:80px;float:left;color:#666;}
    #listPart .list li a .desc .desc3{width:250px;float:left;color:#666;}

  #listPart .list li a .deadline{width:124px;height:40px;margin: 55px 50px;line-height:40px;text-align:center;float:left;font-size:14px;}
    #listPart .list li a .deadline00{background-color: #4F60E3;color:#fff;}
    #listPart .list li a .deadline01{background-color: #000;color:#fff;}
    #listPart .list li a .deadline02{background-color: #E0F1FF;color:#333;}

	 </style>
  </head>
  <body>
      <div id="allworkWrap">
        <div id="headerWrap">
          <div id="header">
            <div id="logoArea">
              <h1><a href="/index.do" title="allwork사이트">Allwork</a></h1>
              <p>시니어를&nbsp;위한&nbsp;재취업&nbsp;포털</p>
            </div>
            <!--<div id="searchArea">
              <form action="https://www.mmca.co.kr/search" method="get" name="searchForm">
      					<fieldset>
      					<legend>검색</legend>
                <p class="textBox"><input id="searchText" type="text" name="q"  title="allwork 검색" maxlength="100"/></p>
                <p class="btnBox00"><input id="search_btn00" type="image" src="img/personal00/searchBtn.png" name="searchBtn00" alt="검색버튼" title="돋보기 이미지"/></p>
                <p class="btnBox01"><input id="search_btn01" type="button" name="searchBtn01" value="직무&middot;지역찾기"/></p>
                <p class="btnBox02"><input id="search_btn02" type="button" name="searchBtn02" value="상세검색"/></p>
                </fieldset>
      				</form>
            </div>-->
          </div>
          <div id="headWrap">
            <div id="head">
            <ul class="nav">
              <li><a href="/recruitSearch.do" title="채용정보">채용정보</a></li>
              <li><a href="#none" title="헤드헌팅">헤드헌팅</a></li>
              <li><a href="#none" title="채용진행현황">채용진행현황</a></li>
              <li><a href="#none" title="커뮤니티">커뮤니티</a></li>
            </ul>
            <div class="linkArea">
              <a href="/personalHome.do" title="마이페이지"><span class ="fas fa-user-check"></span></a>
              <!--<a href="#none" title="기업회원 홈"><span class="a00">기업회원 홈</span></a>-->
              <a href="#none" title="메뉴전체보기"><span class="fas fa-bars"></span></a>
            </div>
          </div>
          </div>
        </div>
        <div id="containerWrap">
          <div id="leftPart">
            <div id="myBox">
              <div class="imgArea">
                <p class="myImg"><img src="/peg/${memberMap.photo }"/>
                </p>
                <p class="cameraBtn"><a href="#" title="사진등록버튼"><i class="fas fa-camera-retro"></i></a></p>
              </div>
              <p class="myName"><strong>홍길동</strong>님</p>
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
                <li class="review00">
                  <a href="#" title="지원완료">
                    <strong>${netfuItemCompanyCnt }</strong>
                    <span>지원완료</span>
                  </a>
                </li>
                <li class="review01">
                  <a href="#" title="이력서열람">
                    <strong>${netfuItemResumeCnt }</strong>
                    <span>이력서열람</span>
                  </a>
                </li>
                <li class="review02">
                  <a href="#" title="스크랩공고">
                    <strong>${netfuScrapCnt }</strong>
                    <span>스크랩공고</span>
                  </a>
                </li>
                <li class="review03">
                  <a href="#" title="관심기업공고">
                    <strong>0</strong>
                    <span>관심기업공고</span>
                  </a>
                </li>
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




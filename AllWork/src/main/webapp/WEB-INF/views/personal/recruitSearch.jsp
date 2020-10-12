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
	<link rel="stylesheet" type="text/css" href="/css/footer.css"/>
	<link rel="stylesheet" type="text/css" href="/css/font.css"/>
  <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
  <link  rel="stylesheet" type="text/css" href="/css/all.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
  <style>


      body{background-color:#EDF0F5;font-family:"NotoSansKR-Regular";}


      /*#####  현재페이지 메뉴  ###################################*/
      #head .nav .nav01{background-color:#4F60E3;}
      #head .nav .nav01 a{color:#fff;}
      /*###################################   containerWrap  ###################################*/
        #containerWrap{width:1280px;margin:0 auto;overflow: hidden;}

        /*###################################   leftpart   ###################################*/
        #rec_left{width:200px;height:100%;float: left;margin-top:20px;}
        #menuTree{width:198px;height:387px;background-color: #fff;border: 1px solid #ccc;}
        #menuTree p{width: 198px;height:78px;line-height: 78px;text-align: center;border-bottom: 1px solid #ccc;}
        #menuTree p a{display: block;width: 100%;height:100%;color:#4F60E3;}

            #menuTree p:hover{background-color: #F7FAFF;}

        #menuTree ul{width:100%;height:380px;padding-top:20px;}
        #menuTree ul .menu{width:100%;line-height: 22px;text-indent:30px;padding-top:10px;padding-bottom: 10px;}
        #menuTree ul .menu a{font-size: 16px;font-family:"NotoSansKR-Medium";}
        #menuTree ul .subMenu{width:100%;text-indent:50px;padding-top:5px;}
        #menuTree ul .subMenu li{width:100%;}
        #menuTree ul .subMenu li a{color:#888;font-size:14px;font-family:"NotoSansKR-Regular";}




      /*###################################   part03/상세검색  ###################################*/
      #rec_right{width:1060px;overflow: hidden;margin-top:20px;margin-left:20px;float:left;}

        #recruitment{width:100%;overflow: hidden;}
        #recruitment h4{width:100%;font-size:18px;padding:20px 0 10px;}
        #recruitment #rec_row01{width:1058px;text-indent:20px;line-height:50px;background-color:#fff;border:1px solid #ccc;margin-bottom:20px;float:left;}
        #recruitment #rec_row01 dl{width:175px;border-right:1px solid #ccc;float:left;}
        #recruitment #rec_row01 dl dt{width:100%;height: 49px;background-color:#eee;border-bottom:1px solid #ccc;}
        #recruitment #rec_row01 dl dt a{display:block;width:100%;height:100%;color:#333;}
        #recruitment #rec_row01 dl dd{width:100%;height: 280px;overflow: scroll;}
        #recruitment #rec_row01 dl dd div{width:100%;height: 100%;}
        #recruitment #rec_row01 dl dd div ul{width:100%;height: 100%;}
        #recruitment #rec_row01 dl dd div ul li{width:100%;height:30px;}
        #recruitment #rec_row01 dl dd div ul li input{display: block;width: 100%;height:30px;line-height: 30px;border:none;background-color:#fff;
                                     text-align:left;text-indent:20px;font-size:14px;}

                                    #recruitment #rec_row01 dl:last-child{width:178px;border:none;}

        /*###################################   rec_listpart   ###################################*/
        #rec_listPart01, #rec_listPart02, #rec_listPart03, #rec_listPart04{width:1060px;margin-top:40px;padding-bottom:30px;overflow: hidden;font-size: 14px;}
        #rec_titleArea01, #rec_titleArea02, #rec_titleArea03, #rec_titleArea04{width:100%;height:40px;}
        #rec_titleArea01 h4, #rec_titleArea02 h4, #rec_titleArea03 h4, #rec_titleArea04 h4{width:50%;font-size:18px;float: left;}
        #rec_titleArea01 .rec_align, #rec_titleArea02 .rec_align, #rec_titleArea03 .rec_align, #rec_titleArea04 .rec_align{width:50%;text-align: right;float: left;padding-top:10px;}
        #rec_titleArea01 .rec_align li, #rec_titleArea02 .rec_align li, #rec_titleArea03 .rec_align li, #rec_titleArea04 .rec_align li{display:inline-block;margin-bottom:10px;}
        #rec_titleArea01 .rec_align li a, #rec_titleArea02 .rec_align li a, #rec_titleArea03 .rec_align li a, #rec_titleArea04 .rec_align li a{font-size:11px;}

        .rec_title{width:1060px;height:40px;line-height: 40px;color:#333;text-align:center;background-color:#fff;border-bottom:2px solid #666;}
        .rec_title li{float:left;font-family:"NotoSansKR-Bold";}
        .rec_title li.desc01{width:200px;}
        .rec_title li.desc02{width:460px;}
        .rec_title li.desc03{width:60px;}
        .rec_title li.desc04{width:60px;}
        .rec_title li.desc05{width:80px;}
        .rec_title li.desc06{width:160px;}

        .rec_list{width:1060px;overflow: hidden;background-color:#fff;}
        .rec_list li{width:1058px;height:148px;border:1px solid #fff;border-bottom:1px solid #ccc;}
        .rec_list li a{display: block;width: 100%;height: 100%;overflow: hidden;}

                .rec_list li:hover{border:1px solid #4F60E3;}

        .rec_list li a .list_title{width:200px;height: 100%;line-height:150px;text-align:center;font-size: 16px;float:left;}
        .rec_list li a .desc1{width:458px;height:100%;float:left;padding-top:35px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;}
        .rec_list li a .desc1 .desc11{width:100%;font-size: 16px;padding-bottom: 15px;float:left;}
        .rec_list li a .desc1 .desc12{width:100%;float:left;color:#666;}

        .rec_list li a .desc2{width:120px;height:100%;line-height:150px;float:left;text-align: center;}
        .rec_list li a .desc2 .desc21{width:60px;height:100%;float:left;color:#666;}
        .rec_list li a .desc2 .desc22{width:60px;height:100%;float:left;color:#666;}

        .rec_list li a .desc3{width:80px;height:100%;float:left;padding-top:55px;text-align: center;}

        .rec_list li a .deadline{width:120px;height:40px;margin:55px 20px;line-height:40px;text-align:center;float:left;font-size:14px;}
        .rec_list li a .deadline00{background-color: #4F60E3;color:#fff;}
        .rec_list li a .deadline01{background-color: #000;color:#fff;}
        .rec_list li a .deadline02{background-color: #E0F1FF;color:#333;}

        .numareaWrap{width:100%;overflow: hidden;background-color:#fff;}
        .numArea{width:360px;height:30px;line-height:28px;padding-top:30px;padding-bottom:30px;text-align: center;margin:0 auto;}
        .numArea li{width:28px;height:28px;border:1px solid #ccc;float:left;}
        .numArea li a{color:#ccc;}

                      .numArea li:hover{border: 1px solid #666;}
                      .numArea li:hover a{color:#666;}

        .numArea .p01{border: 1px solid #666;}
        .numArea .p01 a{color:#666;}

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
              <li class="nav01"><a href="/recruitSearch.do" title="채용정보">채용정보</a></li>
              <li class="nav02"><a href="#none" title="헤드헌팅">헤드헌팅</a></li>
              <li class="nav03"><a href="#none" title="채용진행현황">채용진행현황</a></li>
              <li class="nav04"><a href="#none" title="커뮤니티">커뮤니티</a></li>
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
              <h4>채용정보 상세검색</h4>
              <div id="rec_row01">
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
                    <p class="deadline deadline02">~09/12</p>
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

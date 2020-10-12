<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8"/>
  <title> 인재검색 </title>
  <link rel="stylesheet" type="text/css" href="/css/header_company.css"/>
	<link rel="stylesheet" type="text/css" href="/css/footer.css"/>
	<link rel="stylesheet" type="text/css" href="/css/font.css"/>
  <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
  <link  rel="stylesheet" type="text/css" href="/css/all.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
  <style>


  body{background: #EDF0F5;font-family:"NotoSansKR-Regular";}


  /*###################################   containerWrap  ###################################*/
      #containerWrap{width:1280px;margin: 20px auto 100px;overflow: hidden;}
  /*###################################   leftpart   ###################################*/
      #leftPart{width:200px;height:100%;float: left;}
      #menuTree{width:198px;height:408px;background-color: #fff;border: 1px solid #ccc;}
      #menuTree p{width: 198px;height:78px;line-height: 78px;text-align: center;border-bottom: 1px solid #ccc;}
      #menuTree p a{display: block;width: 100%;height:100%;color:#4F60E3;}

          #menuTree p:hover{background-color: #F7FAFF;}

      #menuTree ul{width:100%;height:380px;padding-top:20px;}
      #menuTree ul .gnb{width:100%;line-height: 22px;text-indent:30px;padding-top:10px;padding-bottom: 10px;}
      #menuTree ul .gnb a{font-size: 16px;}
      #menuTree ul .subMenu{width:100%;text-indent:50px;padding-top:5px;}
      #menuTree ul .subMenu li{width:100%;}
      #menuTree ul .subMenu li a{color:#666;font-size:14px;}

/*###################################   applyBox   ###################################*/
      #applyBox{width:138px;height:138px;background-color: #fff;border: 1px solid #ccc;margin-top:10px;padding: 30px;}
      #applyBox p{width: 100%;}
      #applyBox .apply_btn01{margin-bottom:15px;}
      #applyBox p label{font-size:14px;line-height:30px;}
      #applyBox p input{width:138px;height: 30px;border: 1px solid #aaa;background-color: #fff;}

              #applyBox p input:hover{background-color:#4F60E3;color:#fff;}

  /*###################################   rightpart   ###################################*/
  #rightPart{width:1060px;margin-left:20px;float: left;}

  /*###################################   part01/추천인재  ###################################*/
  #part01{width:100%;overflow: hidden;}
  #part01 ul{width:1060px;height:250px;margin-bottom:20px;}
  #part01 ul li{width:248px;height:248px;background-color: #fff;border: 1px solid #fff;margin-right:20px;float: left;}
  #part01 ul li:last-child{margin-right:0;}
  #part01 ul li a{display: block;width:100%;height:100%;}
  #part01 ul li a div{width:208px;height:208px;padding:20px;}
  #part01 ul li a div p{font-size:20px;padding-bottom:20px;}
  #part01 ul li a div .star{width:100%;text-align: right;color:#eee;}
  #part01 ul li a div .desc01{width:100%;font-size:14px;padding-bottom:10px;}
  #part01 ul li a div .desc02{width:100%;font-size:10px;color:#4F60E3;}
  #part01 ul li a div .desc03{width:100%;font-size:16px;font-family:"NotoSansKR-Bold"; }
  #part01 ul li a div .desc04{width:100%;font-size:10px;color:#999;}

                #part01 ul li:hover{border: 1px solid #4F60E3;}

  /*###################################   part02/검색  ###################################*/
  #part02{width:100%;margin-top:10px;overflow: hidden;}
  #part02 form{width:1060px;height:70px;}
  #part02 form fieldset{border:none;}
  #part02 form fieldset legend{display: none;}
  #part02 form fieldset div{width:100%;height:20px;margin-bottom:10px;}
  #part02 form fieldset div input{width:20px;height:20px;}
  #part02 form fieldset div label{font-size:14px;padding-left:10px;padding-right:30px;vertical-align:top;}
  #part02 form fieldset p{float: left;width:308px;height:38px;background-color: #fff;border:1px solid #999;}
  #part02 form fieldset p input{border:none;width:308px;height:38px;text-indent: 10px;}
  #part02 form fieldset p.btnBox{width: 130px;height:40px;border:none;}
  #part02 form fieldset p.btnBox input{width: 130px;height:40px;background-color:#4F60E3;color:#fff;font-size:16px;}

/*###################################   part03/상세검색  ###################################*/
  #part03{width:100%;margin-top:10px;overflow: hidden;}
  #row01{width:1058px;text-indent:20px;line-height:50px;background-color:#fff;border:1px solid #ccc;float:left;}
  #row01 dl{width:210px;border-right:1px solid #ccc;float:left;}
  #row01 dl dt{width:100%;height: 49px;background-color:#eee;border-bottom:1px solid #ccc; }
  #row01 dl dd{width:100%;height: 280px;overflow:auto;}
  #row01 dl dd div{width:100%;height: 100%;}
  #row01 dl dd div ul{width:100%;height: 100%;}
  #row01 dl dd div ul li{width:100%;height:30px;}
  #row01 dl dd div ul li input{display: block;width: 100%;height:30px;line-height: 30px;border:none;background-color:#fff;
                               text-align:left;text-indent:20px;font-size:14px;}

                               #row01 dl:last-child{width:214px;border:none;}

#row02{width:1058px;text-indent:20px;line-height:50px;background-color:#fff;border:1px solid #ccc;float:left;}
#row02 dl{width:210px;border-right:1px solid #ccc;float:left;}
#row02 dl dt{width:100%;height: 49px;background-color:#eee;border-bottom:1px solid #ccc; }
#row02 dl dd{width:100%;height: 280px;overflow:auto;}
#row02 dl dd div{width:100%;height: 100%;}
#row02 dl dd div ul{width:100%;height: 100%;}
#row02 dl dd div ul li{width:100%;height:30px;line-height: 30px;font-size:14px;background-color:#EDF0F5;}
#row02 dl dd div ul li input{display: block;width: 100%;height:30px;line-height: 30px;border:none;background-color:#fff;
                             text-align:left;text-indent:20px;font-size:14px;color:#000;}


                              #row02 dl:last-child{width:214px;border:none;}
                              #row02 dd{display: none;}


  /*###################################   listpart   ###################################*/
  #listPart{width:100%;margin-top: 40px;overflow: hidden;font-size: 14px;}
  #listPart h4{width:100%;font-size:18px;text-indent:40px;margin-bottom: 10px;}
  #listPart .title{width:1060px;height:40px;line-height: 40px;background-color:#fff;color:#333;text-align: center;border-bottom:1px solid #000;}
  #listPart .title li{float:left;}
  #listPart .title li.desc01{width:180px;}
  #listPart .title li.desc02{width:420px;}
  #listPart .title li.desc03{width:160px;text-align: left;}
  #listPart .title li.desc04{width:160px;text-align: left;}
  #listPart .title li.desc05{width:100px;}




  #listPart .list{width:100%;overflow: hidden;background-color:#fff;}
  #listPart .list li{width:1058px;height:148px;border:1px solid #fff;border-bottom:1px solid #ccc;}
  #listPart .list li a{display: block;width: 100%;height: 100%;overflow: hidden;}

          #listPart .list li:hover{border:1px solid #4F60E3;}

  #listPart .list li a p{height:100px;float:left;font-size: 16px;padding-top:50px;line-height: 24px;}
  #listPart .list li a .desc00{width:180px;text-align: center;}
  #listPart .list li a .desc01{width:420px;}
  #listPart .list li a .desc02{width:160px;}
  #listPart .list li a .desc03{width:160px;}
  #listPart .list li a .date{width:100px;line-height:58px;text-align: center;}

  #listPart .numareaWrap{width:100%;overflow: hidden;background-color:#fff;}
  #listPart .numArea{width:360px;height:30px;line-height:28px;padding-top:30px;padding-bottom:30px;text-align: center;margin:0 auto;}
  #listPart .numArea li{width:28px;height:28px;border:1px solid #ccc;float:left;}
  #listPart .numArea li a{color:#ccc;}

                  #listPart .numArea li:hover{border: 1px solid #666;}
                  #listPart .numArea li:hover a{color:#666;}

  #listPart .numArea .p01{border: 1px solid #666;}
  #listPart .numArea .p01 a{color:#666;}


	 </style>
  </head>
  <body>
      <div id="allworkWrap">
        <div id="headerWrap">
          <div id="topWrap">
            <h1><a href="/index.do" title="올워크홈">Allwork</a></h1>
            <ul class="topMenu">
              <li><a href="#none" title="기업정보/관리">올워크&nbsp;&nbsp;<i class="fas fa-chevron-down"></i>&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
              <li><a href="#none" title="고객센터">고객센터&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
              <li><a href="/companyHome.do" title="기업회원 홈">기업회원 홈</a></li>
            </ul>
          </div>
          <div id="headWrap">
            <div id="head">
              <p><a href="/companyHome.do" title="기업홈">올워크</a></p>
              <ul class="nav">
                <li><a href="/recruitInfoReg.do" title="공고등록">공고등록</a></li>
                <li><a href="#none" title="공고ㆍ지원자관리">공고ㆍ지원자관리</a></li>
                <li><a href="/personSearch.do" title="인재검색">인재검색</a></li>
                <li><a href="#none" title="헤드헌팅 의뢰">헤드헌팅 의뢰</a></li>
                <li><a href="#none" title="기업정보">기업정보</a></li>
              </ul>
              <ul class="linkArea">
                <li><a href="#none" title="유료이용내역">유료이용내역</a></li>
                <li><a href="#none" title="서비스안내">서비스안내</a></li>
                <li><a href="#none" title="전체메뉴보기"><i class="fas fa-bars"></i></a></li>
              </ul>
            </div>
          </div>
        </div>
        <div id="containerWrap">
          <div id="leftPart">
            <div id="menuTree">
              <p class="settingBtn"><a href="/companyHome.do" title="기업회원 홈">기업회원 홈</a></p>
              <ul>
                <li class="gnb"><a href="/personSearch.do" title="인재검색">인재검색</a>
                  <h3>인재검색</h3>
                    <ol class="subMenu">
                      <li><a href="#" title="상세검색">상세검색</a></li>
                      <li><a href="#" title="직무별">직무별</a></li>
                      <li><a href="#" title="산업별">산업별</a></li>
                      <li><a href="#" title="지역별">지역별</a></li>
                      <li><a href="#" title="기업별">기업별</a></li>
                    </ol>
                </li>
                <li class="gnb"><a href="#" title="프리랜서">프리랜서</a></li>
                <li class="gnb"><a href="#" title="알바채용">알바채용</a></li>
                <li class="gnb"><a href="#" title="기타채용정보">기타채용정보</a></li>
              </ul>
            </div>
          </div>
          <div id="rightPart">
            <div id="part01">
              <ul>
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
                    <span><input id="checkBox_01" type="checkbox" name="q"  title="체크박스01"/></span><label for="checkBox_01">‘그리고’(and) 검색</label>
                    <span><input id="checkBox_02" type="checkbox" name="q"  title="체크박스02"/></span><label for="checkBox_02">‘또는’(or) 검색</label>
                    <span><input id="checkBox_03" type="checkbox" name="q"  title="체크박스03"/></span><label for="checkBox_03">‘제외’ 검색</label>
                  </div>
                  <p><input id="searchText01" type="text" name="q"  title="allwork 검색" placeholder="전체(직무, 산업, 이력서내용, 이력서 번호 등)"/></p>
                  <p><input id="searchText02" type="text" name="q"  title="allwork 검색" placeholder="회사명"/></p>
                  <p><input id="searchText03" type="text" name="q"  title="allwork 검색" placeholder="학교명, 전공명"/></p>
                  <p class="btnBox"><input id="search_btn" type="button" name="searchBtn" value="검색"/></p>
                </fieldset>
      				</form>
            </div>
            <div id="part03">
              <div id="row01">
                <dl>
                  <dt><a href="#" title="직무">직무</a></dt>
                  <dd>
                    <div>
                      <ul>
                        <li><input id="col01_btn01" type="button" name="col01_btn01" value="경영·사무"/></li>
                        <li><input id="col01_btn02" type="button" name="col01_btn02" value="마케팅·광고·홍보"/></li>
                        <li><input id="col01_btn03" type="button" name="col01_btn03" value="IT·인터넷"/></li>
                        <li><input id="col01_btn04" type="button" name="col01_btn04" value="디자인"/></li>
                        <li><input id="col01_btn05" type="button" name="col01_btn05" value="무역·유통"/></li>
                        <li><input id="col01_btn06" type="button" name="col01_btn06" value="영업·고객상담"/></li>
                        <li><input id="col01_btn07" type="button" name="col01_btn07" value="서비스"/></li>
                        <li><input id="col01_btn08" type="button" name="col01_btn08" value="연구개발·설계"/></li>
                        <li><input id="col01_btn09" type="button" name="col01_btn09" value="생산·제조"/></li>
                        <li><input id="col011_btn10" type="button" name="col01_btn10" value="교육"/></li>
                        <li><input id="col01_btn11" type="button" name="col01_btn11" value="건설"/></li>
                        <li><input id="col01_btn12" type="button" name="col01_btn12" value="의료"/></li>
                        <li><input id="col01_btn13" type="button" name="col01_btn13" value="미디어"/></li>
                        <li><input id="col01_btn14" type="button" name="col01_btn14" value="전문·특수직"/></li>
                      </ul>
                    </div>
                  </dd>
                </dl>
                <dl>
                  <dt><a href="#" title="근무지역">근무지역</a></dt>
                  <dd>
                    <div>
                      <ul>
                        <li><input id="col02_btn01" type="button" name="col02_btn01" value="서울특별시"/></li>
                        <li><input id="col02_btn02" type="button" name="col02_btn02" value="경기도"/></li>
                        <li><input id="col02_btn03" type="button" name="col02_btn03" value="인천광역시"/></li>
                        <li><input id="col02_btn04" type="button" name="col02_btn04" value="대전광역시"/></li>
                        <li><input id="col02_btn05" type="button" name="col02_btn05" value="세종특별자치시"/></li>
                        <li><input id="col02_btn06" type="button" name="col02_btn06" value="충청남도"/></li>
                        <li><input id="col02_btn07" type="button" name="col02_btn07" value="충청북도"/></li>
                        <li><input id="col02_btn08" type="button" name="col02_btn08" value="광주광역시"/></li>
                        <li><input id="col02_btn09" type="button" name="col02_btn09" value="전라남도"/></li>
                        <li><input id="col02_btn10" type="button" name="col02_btn10" value="전라북도"/></li>
                        <li><input id="col02_btn11" type="button" name="col02_btn11" value="대구광역시"/></li>
                        <li><input id="col02_btn12" type="button" name="col02_btn12" value="경상북도"/></li>
                        <li><input id="col02_btn13" type="button" name="col02_btn13" value="부산광역시"/></li>
                        <li><input id="col02_btn14" type="button" name="col02_btn14" value="울산광역시"/></li>
                        <li><input id="col02_btn15" type="button" name="col02_btn15" value="경상남도"/></li>
                        <li><input id="col02_btn16" type="button" name="col02_btn16" value="강원도"/></li>
                        <li><input id="col02_btn17" type="button" name="col02_btn17" value="제주특별자치도"/></li>
                        <li><input id="col02_btn18" type="button" name="col02_btn18" value="전국"/></li>
                        <li><input id="col02_btn19" type="button" name="col02_btn19" value="해외"/></li>
                      </ul>
                    </div>
                  </dd>
                </dl>
                <dl>
                  <dt><a href="#" title="경력">경력</a></dt>
                  <dd>
                    <div>
                      <ul>
                        <li><input id="col03_btn01" type="button" name="col03_btn01" value="신입"/></li>
                        <li><input id="col03_btn02" type="button" name="col03_btn02" value="경력무관"/></li>
                        <li><input id="col03_btn03" type="button" name="col03_btn03" value="1~3년"/></li>
                        <li><input id="col03_btn04" type="button" name="col03_btn04" value="3~5년"/></li>
                        <li><input id="col03_btn05" type="button" name="col03_btn05" value="5~10년"/></li>
                        <li><input id="col03_btn06" type="button" name="col03_btn06" value="10~15년"/></li>
                        <li><input id="col03_btn07" type="button" name="col03_btn07" value="15년~"/></li>
                      </ul>
                    </div>
                  </dd>
                </dl>
                <dl>
                  <dt><a href="#" title="학력">학력</a></dt>
                  <dd>
                    <div>
                      <ul>
                        <li><input id="col04_btn01" type="button" name="col04_btn01" value="대학교졸업(4년)"/></li>
                        <li><input id="col04_btn02" type="button" name="col04_btn02" value="대학졸업(2,3년)"/></li>
                        <li><input id="col04_btn03" type="button" name="col04_btn03" value="대학원 석사졸업"/></li>
                        <li><input id="col04_btn04" type="button" name="col04_btn04" value="대학원 박사졸업"/></li>
                        <li><input id="col04_btn05" type="button" name="col04_btn05" value="고등학교졸업"/></li>
                        <li><input id="col04_btn06" type="button" name="col04_btn06" value="학력무관"/></li>
                      </ul>
                    </div>
                  </dd>
                </dl>
                <dl>
                  <dt><a href="#" title="고용형태">고용형태</a></dt>
                  <dd>
                    <div>
                      <ul>
                        <li><input id="col05_btn01" type="button" name="col05_btn01" value="정규직"/></li>
                        <li><input id="col05_btn02" type="button" name="col05_btn02" value="계약직"/></li>
                        <li><input id="col05_btn03" type="button" name="col05_btn03" value="프리랜서"/></li>
                        <li><input id="col05_btn04" type="button" name="col05_btn04" value="아르바이트"/></li>
                        <li><input id="col05_btn05" type="button" name="col05_btn05" value="기타"/></li>
                      </ul>
                    </div>
                  </dd>
                </dl>
              </div>
              <div id="row02">
                <dl>
                  <dt><a href="#" title="산업">산업</a></dt>
                  <dd>
                    <div>
                      <ul>
                        <li><input id="column01_btn01" type="button" name="column01_btn01" value="서비스업"/></li>
                        <li><input id="column01_btn02" type="button" name="column01_btn02" value="금융·은행업"/></li>
                        <li><input id="column01_btn03" type="button" name="column01_btn03" value="IT·정보통신업"/></li>
                        <li><input id="column01_btn04" type="button" name="column01_btn04" value="판매·유통업"/></li>
                        <li><input id="column01_btn05" type="button" name="column01_btn05" value="제조·생산·화학업"/></li>
                        <li><input id="column01_btn06" type="button" name="column01_btn06" value="교육업"/></li>
                        <li><input id="column01_btn07" type="button" name="column01_btn07" value="건설업"/></li>
                        <li><input id="column01_btn08" type="button" name="column01_btn08" value="의료·제약업"/></li>
                        <li><input id="column01_btn09" type="button" name="column01_btn09" value="미디어·광고업"/></li>
                        <li><input id="column01_btn10" type="button" name="column01_btn10" value="문화·예술·디자인업"/></li>
                        <li><input id="column01_btn11" type="button" name="column01_btn11" value="기관·협회"/></li>
                      </ul>
                    </div>
                  </dd>
                </dl>
                <dl>
                  <dt><a href="#" title="직급/직책/급여">직급/직책/급여</a></dt>
                  <dd>
                    <div>
                      <ul>
                        <li>직급</li>
                        <li><input id="column02_btn01" type="button" name="column02_btn01" value="사원~대리급"/></li>
                        <li><input id="column02_btn02" type="button" name="column02_btn02" value="과장~차장급"/></li>
                        <li><input id="column02_btn03" type="button" name="column02_btn03" value="부장급"/></li>
                        <li><input id="column02_btn04" type="button" name="column02_btn04" value="임원~CEO"/></li>
                        <li>급여</li>
                        <li><input id="column02_btn05" type="button" name="column02_btn05" value="~ 3000만원"/></li>
                        <li><input id="column02_btn06" type="button" name="column02_btn06" value="3000 ~ 4000만원"/></li>
                        <li><input id="column02_btn07" type="button" name="column02_btn07" value="4000 ~ 5000만원"/></li>
                        <li><input id="column02_btn08" type="button" name="column02_btn08" value="5000 ~ 6000만원"/></li>
                        <li><input id="column02_btn09" type="button" name="column02_btn09" value="6000만원 이상"/></li>
                      </ul>
                    </div>
                  </dd>
                </dl>
                <dl>
                  <dt><a href="#" title="자격증">자격증</a></dt>
                  <dd>
                    <div>
                      <ul>
                        <li><input id="column03_btn01" type="button" name="column03_btn01" value="기계, 전자"/></li>
                        <li><input id="column03_btn02" type="button" name="column03_btn02" value="생산,품질"/></li>
                        <li><input id="column03_btn03" type="button" name="column03_btn03" value="건설·건축·화학"/></li>
                        <li><input id="column03_btn04" type="button" name="column03_btn04" value="경제·경영·금융·무역"/></li>
                        <li><input id="column03_btn05" type="button" name="column03_btn05" value="산업·안전·환경"/></li>
                        <li><input id="column03_btn06" type="button" name="column03_btn06" value="IT·정보통신"/></li>
                        <li><input id="column03_btn07" type="button" name="column03_btn07" value="보건·복지·위생"/></li>
                      </ul>
                    </div>
                  </dd>
                </dl>
                <dl>
                  <dt><a href="#" title="성별">성별</a></dt>
                  <dd>
                    <div>
                      <ul>
                        <li><input id="column04_btn01" type="button" name="column04_btn01" value="남자"/></li>
                        <li><input id="column04_btn02" type="button" name="column04_btn02" value="여자"/></li>
                      </ul>
                    </div>
                  </dd>
                </dl>
                <dl>
                  <dt><a href="#" title="blank"></a></dt>
                  <dd>
                    <div></div>
                  </dd>
                </dl>
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
                <li>
                  <a href="#" title="맞춤채용인재정보">
                    <p class="desc00">
                      <span class="desc00_00">주oo</span><br/>
                      <span class="desc00_01">남/64년생</span>
                    </p>
                    <p class="desc01">
                      <span class="desc00_02">영업관리</span><br/>
                      <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
                    </p>
                    <p class="desc02">
                      <span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br/>
                      <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
                    </p>
                    <p class="desc03">
                      <span class="desc00_06">신입</span><br/>
                      <span class="desc00_07">회사내규에따름</span>
                    </p>
                    <p class="date">2020.08.27</p>
                  </a>
                </li>
                <li>
                  <a href="#" title="맞춤채용인재정보">
                    <p class="desc00">
                      <span class="desc00_00">주oo</span><br/>
                      <span class="desc00_01">남/64년생</span>
                    </p>
                    <p class="desc01">
                      <span class="desc00_02">영업관리</span><br/>
                      <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
                    </p>
                    <p class="desc02">
                      <span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br/>
                      <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
                    </p>
                    <p class="desc03">
                      <span class="desc00_06">신입</span><br/>
                      <span class="desc00_07">회사내규에따름</span>
                    </p>
                    <p class="date">2020.08.27</p>
                  </a>
                </li>
                <li>
                  <a href="#" title="맞춤채용인재정보">
                    <p class="desc00">
                      <span class="desc00_00">주oo</span><br/>
                      <span class="desc00_01">남/64년생</span>
                    </p>
                    <p class="desc01">
                      <span class="desc00_02">영업관리</span><br/>
                      <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
                    </p>
                    <p class="desc02">
                      <span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br/>
                      <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
                    </p>
                    <p class="desc03">
                      <span class="desc00_06">신입</span><br/>
                      <span class="desc00_07">회사내규에따름</span>
                    </p>
                    <p class="date">2020.08.27</p>
                  </a>
                </li>
                <li>
                  <a href="#" title="맞춤채용인재정보">
                    <p class="desc00">
                      <span class="desc00_00">주oo</span><br/>
                      <span class="desc00_01">남/64년생</span>
                    </p>
                    <p class="desc01">
                      <span class="desc00_02">영업관리</span><br/>
                      <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
                    </p>
                    <p class="desc02">
                      <span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br/>
                      <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
                    </p>
                    <p class="desc03">
                      <span class="desc00_06">신입</span><br/>
                      <span class="desc00_07">회사내규에따름</span>
                    </p>
                    <p class="date">2020.08.27</p>
                  </a>
                </li>
                <li>
                  <a href="#" title="맞춤채용인재정보">
                    <p class="desc00">
                      <span class="desc00_00">주oo</span><br/>
                      <span class="desc00_01">남/64년생</span>
                    </p>
                    <p class="desc01">
                      <span class="desc00_02">영업관리</span><br/>
                      <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
                    </p>
                    <p class="desc02">
                      <span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br/>
                      <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
                    </p>
                    <p class="desc03">
                      <span class="desc00_06">신입</span><br/>
                      <span class="desc00_07">회사내규에따름</span>
                    </p>
                    <p class="date">2020.08.27</p>
                  </a>
                </li>
                <li>
                  <a href="#" title="맞춤채용인재정보">
                    <p class="desc00">
                      <span class="desc00_00">주oo</span><br/>
                      <span class="desc00_01">남/64년생</span>
                    </p>
                    <p class="desc01">
                      <span class="desc00_02">영업관리</span><br/>
                      <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
                    </p>
                    <p class="desc02">
                      <span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br/>
                      <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
                    </p>
                    <p class="desc03">
                      <span class="desc00_06">신입</span><br/>
                      <span class="desc00_07">회사내규에따름</span>
                    </p>
                    <p class="date">2020.08.27</p>
                  </a>
                </li>
                <li>
                  <a href="#" title="맞춤채용인재정보">
                    <p class="desc00">
                      <span class="desc00_00">주oo</span><br/>
                      <span class="desc00_01">남/64년생</span>
                    </p>
                    <p class="desc01">
                      <span class="desc00_02">영업관리</span><br/>
                      <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
                    </p>
                    <p class="desc02">
                      <span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br/>
                      <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
                    </p>
                    <p class="desc03">
                      <span class="desc00_06">신입</span><br/>
                      <span class="desc00_07">회사내규에따름</span>
                    </p>
                    <p class="date">2020.08.27</p>
                  </a>
                </li>
                <li>
                  <a href="#" title="맞춤채용인재정보">
                    <p class="desc00">
                      <span class="desc00_00">주oo</span><br/>
                      <span class="desc00_01">남/64년생</span>
                    </p>
                    <p class="desc01">
                      <span class="desc00_02">영업관리</span><br/>
                      <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
                    </p>
                    <p class="desc02">
                      <span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br/>
                      <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
                    </p>
                    <p class="desc03">
                      <span class="desc00_06">신입</span><br/>
                      <span class="desc00_07">회사내규에따름</span>
                    </p>
                    <p class="date">2020.08.27</p>
                  </a>
                </li>
                <li>
                  <a href="#" title="맞춤채용인재정보">
                    <p class="desc00">
                      <span class="desc00_00">주oo</span><br/>
                      <span class="desc00_01">남/64년생</span>
                    </p>
                    <p class="desc01">
                      <span class="desc00_02">영업관리</span><br/>
                      <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
                    </p>
                    <p class="desc02">
                      <span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br/>
                      <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
                    </p>
                    <p class="desc03">
                      <span class="desc00_06">신입</span><br/>
                      <span class="desc00_07">회사내규에따름</span>
                    </p>
                    <p class="date">2020.08.27</p>
                  </a>
                </li>
                <li>
                  <a href="#" title="맞춤채용인재정보">
                    <p class="desc00">
                      <span class="desc00_00">주oo</span><br/>
                      <span class="desc00_01">남/64년생</span>
                    </p>
                    <p class="desc01">
                      <span class="desc00_02">영업관리</span><br/>
                      <span class="desc00_03">영업.판매&nbsp;>&nbsp;영업기획.관리&nbsp;|&nbsp;대학교졸업(4년)</span>
                    </p>
                    <p class="desc02">
                      <span class="desc00_04">경기&nbsp;>&nbsp;수원시</span><br/>
                      <span class="desc00_05">서울&nbsp;>&nbsp;구로구</span>
                    </p>
                    <p class="desc03">
                      <span class="desc00_06">신입</span><br/>
                      <span class="desc00_07">회사내규에따름</span>
                    </p>
                    <p class="date">2020.08.27</p>
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

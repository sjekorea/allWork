<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="ko">
 <head>
  <meta charset="utf-8"/>
  <title> allwork </title>
  <link rel="stylesheet" type="text/css" href="/css/header.css"/>
	<link rel="stylesheet" type="text/css" href="/css/footer.css"/>
	<link rel="stylesheet" type="text/css" href="/css/font.css"/>
  <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
  <link  rel="stylesheet" type="text/css" href="/css/all.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
  <style>

  body{background-color:#EDF0F5;}

  /*###################################   Header    ###################################*/d

  #allworkWrap{width:100%;font-family:"NanumBarunGothicRegular";}
    #headerWrap{width:100%;height:130px;}

      #topWrap{width:100%;height:40px;background-color:#eee;}
        #topWrap .topMenu{width:1280px;height:40px;line-height: 40px;text-align: right;margin:0 auto;}
        #topWrap .topMenu li{display:inline-block;font-size: 12px;}

      #head{width:100%;height:90px;background-color: #fff;}
      #header{width:1280px;height:100%;margin:0 auto;background-color: #fff;}
        #header h1{width:150px;height:90px;line-height: 90px;font-size:32px;font-family:"NotoSansKR-Bold";float:left;}
        #header h1 a{color:#4F60E3;}
        #header .nav{width:770px;height:90px;float:left;}
        #header .nav li{font-size: 20px;display: inline-block;line-height: 100px;padding:0 20px;}
        #header .nav .dropMenuWrap{display: none;}

        #header .nav li:hover{background-color:#4F60E3;}
        #header .nav li:hover a{color:#fff;}

        #header .linkArea{width:360px;height:90px;float:left;}
        #header .linkArea li{font-size:18px;width:180px;height:90px;float:left;text-align: center;line-height: 100px;background-color: aqua;}
          #header .linkArea .a01{background-color:#273245;}
          #header .linkArea .a02{background-color:#4F60E3;}
          #header .linkArea li a{color:#fff;}

          #header .linkArea .a01:hover{background-color:#000;}
          #header .linkArea .a02:hover{background-color:#3E4EC3;}



  /*###################################   containerWrap ###################################*/
  /*###################################   visual ###################################*/

  #containerWrap{width:100%;background-color:#fff;position:relative;}
  #visualWrap{width:100%;height:400px;overflow:hidden;margin:0 auto;position:absolute;top:0;left:0;}
  #visual{width:1280px;height:400px;margin:0 auto;}

  #visual .descBox{width:500px;height:100%;/*background-color:rgba(0,0,0,1);*/}
  #visual .descBox p{width:100%;font-size:28px;font-family:"NanumBarunGothicUltralight";color:#fff;}
  #visual .descBox .desc0{height:120px;line-height:180px;font-size:20px;font-family:"NotoSansKR-Bold";}
  #visual .descBox .desc1{height:120px;font-size:46px;}

  #visual .descBox #searchArea{width:500px;height:90px;background-color:rgba(255,255,255,0.6);}
  #visual .descBox #searchArea form{width:460px;height:46px;margin:0px auto;}
  #visual .descBox #searchArea fieldset{border:none;}
  #visual .descBox #searchArea legend{display:none;}
  #visual .descBox #searchArea .textBox{width:370px;height:44px;border:1px solid #43425D;margin-top:22px;float:left;}
  #visual .descBox #searchArea .textBox input{width:100%;height:100%;border:none;font-size:16px;text-indent:10px;}
  #visual .descBox #searchArea .btnBox00{width:80px;height:46px;text-align: center;margin-top:22px;float:left;}
  #visual .descBox #searchArea .btnBox00 input{width:100%;height:100%;border:none;background-color:#43425D;color:#fff;font-size:18px; }

  #visual .descBox #searchArea:hover .textBox{border:1px solid #ccc;}

  #imageWrap{width:1920px;height: 400px;margin: 0 auto;}
  #film{width:100%;}
  #film li{width:100%;float:left;}
  #film li img{width:100%;}


  #contentWrap{width:100%;}
  /*###################################   content01 유료공고 모음 ###################################*/

  #content01{width:1280px;height:750px;margin:100px auto 0;}
  #content01 ul{width:1300px;height: 634px;overflow: hidden;}
  #content01 ul li{width:303px;height:297px;border:1px solid #ccc;box-shadow:8px 8px 1px rgba(220,220,220,1);margin-right:15px;margin-bottom: 15px;float:left;}
  #content01 ul li a{display: block;width:80%;height:80%;padding: 10%;text-align: center;position: relative;}
  #content01 ul li a span{font-size:14px;}

  #content01 ul li a .desc00{width:100px;height:40px;line-height: 40px;color:#fff; position: absolute;top: 0;left:0;}
  #content01 ul li a .desc01{width:100%;padding-bottom:40px;text-align: right;float:left;}
  #content01 ul li a .desc02{width:100%;font-size: 20px;padding-bottom:20px;float:left;}
  #content01 ul li a .desc03{width:100%;font-size: 18px;font-family:"NotoSansKR-Bold";float:left;padding-bottom:35px;border-bottom: 1px solid #000;}
  #content01 ul li a .desc04{width:50%;text-align:left;float:left;padding-top:25px;}
  #content01 ul li a .desc05{width:50%;text-align: right;float:right;padding-top:25px;}

      #content01 ul .headhunting a .desc00{background-color:#BE22C4;}
      #content01 ul .regular a .desc00{background-color:#4F60E3;}
      #content01 ul .freelance a .desc00{background-color:#33B9B4;}
      #content01 ul .partT a .desc00{background-color:#E2A603;}

  #content01 ul li a:hover{border:1px solid #43425D;}


/*###################################   content02 기업광고 모음 ###################################*/

    #content02Wrap{width:100%;border-top: 1px solid #ccc;}
    #content02{width:1280px;height:70px;margin:0 auto;}
    #adArea{width:100%;height:100%;}
    #adArea p{width:40px;height:40px;margin-top: 15px;float:left;}
    #adArea p a{display: block;width:100%;height:100%;}
    #adArea p a img{width:100%;}

    #adArea #adList{width:1200px;height:100%;float:left;}
    #adArea #adList li{width:200px;height:100%;float:left;}
    #adArea #adList li a{display: block;width:100%;height:100%;position: relative;}
    #adArea #adList li a p{width:100%;height:100%;position: absolute;top:0;left:0;margin-top:0;}
    #adArea #adList li a .adImg{width:100%;height:100%;}
    #adArea #adList li a .adImg img{width:100%;height:100%;}

    #adArea #adList li a .adText{width:100%;height:50px;text-align: center;font-size:14px;color:#fff;background-color:#43425D;padding-top:20px;opacity:0;}

    #adArea #adList li:hover a .adText{opacity:1;}
    #adArea .btn:hover{filter: contrast(80%);}

/*###################################   content03 기업회원등록 공고 ###################################*/
    #content03Wrap{width:100%;border-top: 1px solid #ccc;}
    #content03{width:1280px;margin:100px auto 0;}
    #content03 h4{width:100%;line-height: 120px;font-size:28px;font-family:"NanumBarunGothicUltralight";text-align: center;}
    #content03 p{width:100%;padding-bottom: 10px;}
    #content03 ul{width:1300px;overflow: hidden;}
    #content03 ul li{width:303px;height:197px;border:1px solid #ccc;margin-right:20px;margin-bottom: 20px;float:left;}
    #content03 ul li a{display: block;width:100%;height:100%;position: relative;}
    #content03 ul li a .descBox{width:80%;height:80%;padding: 10%;}
    #content03 ul li a span{font-size:12px;}

    #content03 ul li a .desc01{width:100%;font-size: 14px;line-height:24px;font-family:"NanumBarunGothicRegula";float:left;}
    #content03 ul li a .desc02{width:100%;font-size: 18px;line-height:24px;font-family:"NanumBarunGothicBold";float:left;}
    #content03 ul li a .desc03{width:100%;font-size: 12px;line-height:36px;font-family:"NotoSansKR-Bold";float:left;}
    #content03 ul li a .desc04{width:50%;text-align:left;float:left;padding-top:10px;}
    #content03 ul li a .desc05{width:50%;text-align: right;float:right;padding-top:10px;}

        #content03 ul .headhunting a .desc00{background-color:#BE22C4;}
        #content03 ul .regular a .desc00{background-color:#4F60E3;}
        #content03 ul .freelance a .desc00{background-color:#33B9B4;}
        #content03 ul .partT a .desc00{background-color:#E2A603;}

    #content03 ul li a:hover{border:1px solid #43425D;}


    /*###################################   content04 프리랜서 공고 ###################################*/
        #content04Wrap{width:100%;background-color:#EDF0F5;}
        #content04{width:1280px;height:700px;margin:100px auto 0;padding-top: 90px;}
        #content04 h4{width:100%;line-height: 120px;font-size:28px;font-family:"NanumBarunGothicUltralight";text-align: center;}
        #content04 p{width:100%;padding-bottom: 10px;}
        #content04 ul{width:1300px;overflow: hidden;}
        #content04 ul li{width:303px;height:197px;border:1px solid #ccc;margin-right:20px;margin-bottom: 20px;background-color: #fff;float:left;}
        #content04 ul li a{display: block;width:100%;height:100%;position: relative;}
        #content04 ul li a .descBox{width:80%;height:80%;padding: 10%;}
        #content04 ul li a span{font-size:12px;}

        #content04 ul li a .desc01{width:100%;font-size: 14px;line-height:24px;font-family:"NanumBarunGothicRegula";float:left;}
        #content04 ul li a .desc02{width:100%;font-size: 18px;line-height:24px;font-family:"NanumBarunGothicBold";float:left;}
        #content04 ul li a .desc03{width:100%;font-size: 12px;line-height:36px;font-family:"NotoSansKR-Bold";float:left;}
        #content04 ul li a .desc04{width:50%;text-align:left;float:left;padding-top:10px;}
        #content04 ul li a .desc05{width:50%;text-align: right;float:right;padding-top:10px;}

            #content04 ul .headhunting a .desc00{background-color:#BE22C4;}
            #content04 ul .regular a .desc00{background-color:#4F60E3;}
            #content04 ul .freelance a .desc00{background-color:#33B9B4;}
            #content04 ul .partT a .desc00{background-color:#E2A603;}

        #content04 ul li a:hover{border:1px solid #43425D;}



        /*###################################   content05 알바 공고 ###################################*/
            #content05Wrap{width:100%;}
            #content05{width:1280px;height:700px;margin:100px auto 0;}
            #content05 h4{width:100%;line-height: 120px;font-size:28px;font-family:"NanumBarunGothicUltralight";text-align: center;}
            #content05 p{width:100%;padding-bottom: 10px;}
            #content05 ul{width:1300px;overflow: hidden;}
            #content05 ul li{width:303px;height:197px;border:1px solid #ccc;margin-right:20px;margin-bottom: 20px;background-color: #fff;float:left;}
            #content05 ul li a{display: block;width:100%;height:100%;position: relative;}
            #content05 ul li a .descBox{width:80%;height:80%;padding: 10%;}
            #content05 ul li a span{font-size:12px;}

            #content05 ul li a .desc01{width:100%;font-size: 14px;line-height:24px;font-family:"NanumBarunGothicRegula";float:left;}
            #content05 ul li a .desc02{width:100%;font-size: 18px;line-height:24px;font-family:"NanumBarunGothicBold";float:left;}
            #content05 ul li a .desc03{width:100%;font-size: 12px;line-height:36px;font-family:"NotoSansKR-Bold";float:left;}
            #content05 ul li a .desc04{width:50%;text-align:left;float:left;padding-top:10px;}
            #content05 ul li a .desc05{width:50%;text-align: right;float:right;padding-top:10px;}

                #content05 ul .headhunting a .desc00{background-color:#BE22C4;}
                #content05 ul .regular a .desc00{background-color:#4F60E3;}
                #content05 ul .freelance a .desc00{background-color:#33B9B4;}
                #content05 ul .partT a .desc00{background-color:#E2A603;}

            #content05 ul li a:hover{border:1px solid #43425D;}


  /*###################################   content06 기타채용공고 ###################################*/
  #content06Wrap{width:100%;background-color:#EDF0F5;}
  #content06{width:1280px;height:1000px;margin:100px auto 0;padding-top:100px;}
  #content06 h4{width:100%;line-height: 120px;font-size:28px;font-family:"NanumBarunGothicUltralight";text-align: center;}
  #content06 p{width:100%;padding-bottom: 10px;}
  #content06 table{width:100%;}
  #content06 table caption{display: none;}
  #content06 table thead{width:100%;line-height: 60px;font-size:16px;text-align: center;}
  #content06 table thead tr{width:1280px;border-top:2px solid #000;border-bottom:2px solid #aaa;display: table;font-size:18px;font-family:"NanumBarunGothicBold";}

  #content06 table tbody{width:100%;font-size:16px;text-align: center;}
  #content06 table tbody tr{width:1280px;line-height: 60px;border-bottom:1px solid #ccc;display: table;font-size:16px;font-family:"NanumBarunGothicLight";}

      #content06 table tr th{width:200px;}
      #content06 table tr .jPart{width:600px;}
      #content06 table tr .jPerson{width:100px;}
      #content06 table tr .jadd{width:130px;}
      #content06 table tr .jcontact{width:130px;}
      #content06 table tr .jDate{width:100px;}

      #content06 table tbody tr .jPart{text-align: left;}

      #content06 table tbody tr:hover{background-color:#fff;}






	</style>
  </head>
  <body>
      <div id="allworkWrap">
        <div id="headerWrap">
          <div id="topWrap">
            <ul class="topMenu">
              <li><a href="index.html" title="로그인">로그인&nbsp;|&nbsp;</a></li>
              <li><a href="index.html" title="회원가입">회원가입</a></li>
            </ul>
          </div>
          <div id="head">
            <div id="header">
              <h1><a href="index.html" title="allwork사이트">Allwork</a></h1>
              <ul class="nav">
                      <li><a href="01_aboutMMCA.html" title="채용정보">채용정보</a>
                        <h3>채용정보</h3>
                        <div class="dropMenuWrap">
                          <div class="dropMenu">
                            <div id="drop0">
                              <ol>
                                <li>인사말</li>
                                <li>연혁</li>
                                <li>조직도</li>
                                <li>후원사</li>
                              </ol>
                              <ol>
                                <li>서울관</li>
                                <li>과천관</li>
                                <li>덕수궁관</li>
                                <li>단체관람</li>
                                <li>전시해설</li>
                              </ol>
                              <ol>
                                <li>현재전시</li>
                                <li>예정된전시</li>
                                <li>과거전시</li>
                              </ol>
                              <ol>
                                <li>필름앤비디오</li>
                                <li>다원예술</li>
                              </ol>
                              <ol>
                                <li>교육안내</li>
                                <li>교육신청</li>
                                <li>어린이미술관</li>
                              </ol>
                            </div>
                            <div class="miniAd">
                              <p class="aimg">
                                <img src="img/img_submenu.jpg" alt="광고이미지"/>
                              </p>
                              <p class="atext">
                                예술과 기술의 실험(E.A.T.)<br/>
                                2018.05.26 ~ 2018.09.16
                              </p>
                              <p class="alink">바로가기 <span>▷</span></p>
                            </div>
                          </div>
                        </div>
                      </li>
                      <li><a href="02_information.html" title="인재검색">인재검색</a>
                        <h3>인재검색</h3>
                        <div class="dropMenuWrap">
                          <div class="dropMenu">
                            <div id="drop1">
                              <ol>
                                <li>인사말</li>
                                <li>연혁</li>
                                <li>조직도</li>
                                <li>후원사</li>
                              </ol>
                              <ol>
                                <li>서울관</li>
                                <li>과천관</li>
                                <li>덕수궁관</li>
                                <li>단체관람</li>
                                <li>전시해설</li>
                              </ol>
                              <ol>
                                <li>현재전시</li>
                                <li>예정된전시</li>
                                <li>과거전시</li>
                              </ol>
                              <ol>
                                <li>필름앤비디오</li>
                                <li>다원예술</li>
                              </ol>
                              <ol>
                                <li>교육안내</li>
                                <li>교육신청</li>
                                <li>어린이미술관</li>
                              </ol>
                            </div>
                            <div class="miniAd">
                              <p class="aimg">
                                <img src="img/img_submenu.jpg" alt="광고이미지"/>
                              </p>
                              <p class="atext">
                                예술과 기술의 실험(E.A.T.)<br/>
                                2018.05.26 ~ 2018.09.16
                              </p>
                              <p class="alink">바로가기 <span>▷</span></p>
                            </div>
                          </div>
                        </div>
                      </li>
                      <li><a href="03_exhibition.html" title="헤드헌팅">헤드헌팅</a>
                        <h3>헤드헌팅</h3>
                        <div class="dropMenuWrap">
                          <div class="dropMenu">
                            <div id="drop2">
                              <ol>
                                <li>인사말</li>
                                <li>연혁</li>
                                <li>조직도</li>
                                <li>후원사</li>
                              </ol>
                              <ol>
                                <li>서울관</li>
                                <li>과천관</li>
                                <li>덕수궁관</li>
                                <li>단체관람</li>
                                <li>전시해설</li>
                              </ol>
                              <ol>
                                <li>현재전시</li>
                                <li>예정된전시</li>
                                <li>과거전시</li>
                              </ol>
                              <ol>
                                <li>필름앤비디오</li>
                                <li>다원예술</li>
                              </ol>
                              <ol>
                                <li>교육안내</li>
                                <li>교육신청</li>
                                <li>어린이미술관</li>
                              </ol>
                            </div>
                            <div class="miniAd">
                              <p class="aimg">
                                <img src="img/img_submenu.jpg" alt="광고이미지"/>
                              </p>
                              <p class="atext">
                                예술과 기술의 실험(E.A.T.)<br/>
                                2018.05.26 ~ 2018.09.16
                              </p>
                              <p class="alink">바로가기 <span>▷</span></p>
                            </div>
                          </div>
                        </div>
                      </li>
                      <li><a href="04_program.html" title="채용진행현황">채용진행현황</a>
                        <h3>채용진행현황</h3>
                        <div class="dropMenuWrap">
                          <div class="dropMenu">
                            <div id="drop3">
                              <ol>
                                <li>인사말</li>
                                <li>연혁</li>
                                <li>조직도</li>
                                <li>후원사</li>
                              </ol>
                              <ol>
                                <li>서울관</li>
                                <li>과천관</li>
                                <li>덕수궁관</li>
                                <li>단체관람</li>
                                <li>전시해설</li>
                              </ol>
                              <ol>
                                <li>현재전시</li>
                                <li>예정된전시</li>
                                <li>과거전시</li>
                              </ol>
                              <ol>
                                <li>필름앤비디오</li>
                                <li>다원예술</li>
                              </ol>
                              <ol>
                                <li>교육안내</li>
                                <li>교육신청</li>
                                <li>어린이미술관</li>
                              </ol>
                            </div>
                            <div class="miniAd">
                              <p class="aimg">
                                <img src="img/img_submenu.jpg" alt="광고이미지"/>
                              </p>
                              <p class="atext">
                                예술과 기술의 실험(E.A.T.)<br/>
                                2018.05.26 ~ 2018.09.16
                              </p>
                              <p class="alink">바로가기 <span>▷</span></p>
                            </div>
                          </div>
                        </div>
                      </li>
                      <li><a href="06_edu.html" title="커뮤니티">커뮤니티</a>
                        <h3>커뮤니티</h3>
                        <div class="dropMenuWrap">
                          <div class="dropMenu">
                            <div id="drop4">
                              <ol>
                                <li>인사말</li>
                                <li>연혁</li>
                                <li>조직도</li>
                                <li>후원사</li>
                              </ol>
                              <ol>
                                <li>서울관</li>
                                <li>과천관</li>
                                <li>덕수궁관</li>
                                <li>단체관람</li>
                                <li>전시해설</li>
                              </ol>
                              <ol>
                                <li>현재전시</li>
                                <li>예정된전시</li>
                                <li>과거전시</li>
                              </ol>
                              <ol>
                                <li>필름앤비디오</li>
                                <li>다원예술</li>
                              </ol>
                              <ol>
                                <li>교육안내</li>
                                <li>교육신청</li>
                                <li>어린이미술관</li>
                              </ol>
                            </div>
                            <div class="miniAd">
                              <p class="aimg">
                                <img src="img/img_submenu.jpg" alt="광고이미지"/>
                              </p>
                              <p class="atext">
                                예술과 기술의 실험(E.A.T.)<br/>
                                2018.05.26 ~ 2018.09.16
                              </p>
                              <p class="alink">바로가기 <span>▷</span></p>
                            </div>
                          </div>
                        </div>
                      </li>
                    </ul>
              <ul class="linkArea">
                <li class="a01"><a href="01_aboutMMCA.html" title="개인회원 로그인">개인회원 로그인</a></li>
                <li class="a02"><a href="01_aboutMMCA.html" title="기업회원 로그인">기업회원 로그인</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div id="containerWrap">
          <div id="visualWrap">
            <div id="visual">
              <h2>비쥬얼영역</h2>
              <div class="descBox">
                <p class="desc0">Allwork</p>
                <p class="desc1"><span>시니어를&nbsp;위한&nbsp;</span><br/><span class="bold">재취업&nbsp;&nbsp;포털</span></p>
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
          <div id="imageWrap">
            <ul id="film">
              <li class="scene scene0">
                <img src="/img/main/main00.jpg" alt="이미지00"/>
              </li>
            </ul>
          </div>
          <div id="contentWrap">
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
                <li><a href="#" title="인스타페이지"><img src="/img/main/icon_insta.png" alt="인스타아이콘"/></a></li>
                <li><a href="#" title="유투브페이지"><img src="/img/main/icon_you.png" alt="유투브아이콘"/></a></li>
                <li><a href="#" title="페이스북페이지"><img src="/img/main/icon_face.png" alt="페이스북아이콘"/></a></li>
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
    </div>
    </div>
  </body>
</html>
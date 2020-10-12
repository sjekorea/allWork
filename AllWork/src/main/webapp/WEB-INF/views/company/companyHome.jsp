<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8"/>
  <title> 기업회원 홈 </title>
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
        #leftPart{width:300px;height:100%;float: left;}
        #mycompanyBox{width:260px;height:160px;background-color:#fff;padding:20px;}

        #mycompanyBox p{text-align: center;}
        #mycompanyBox .settingBtn{width:100%;text-align: right;font-size: 12px;}
        #mycompanyBox .companyName{width: 100%;font-size:32px;padding-top:30px;}
        #mycompanyBox .uploadApplication{width:120px;height:30px;line-height: 30px;margin: 0 auto;font-size:14px;margin-top:10px;border: 1px solid #4F60E3;}
        #mycompanyBox .uploadApplication a{width: 100%;height:100%;color:#4F60E3;}

              #mycompanyBox .uploadApplication:hover{border:1px solid #333;}
              #mycompanyBox .uploadApplication:hover a{color:#333;}

        #paymentBox{width:220px;height:50px;padding:40px; background-color: #FFCE00;font-size: 14px;line-height: 28px;color:#333;}
            #paymentBox .payBtn{text-decoration: underline;}

        #menuTree{width:300px;height:100%;line-height:22px;font-size:16px;}
        #menuTree ul{width:260px;font-size: 16px;text-indent:20px;background-color: #fff;padding:20px;}
        #menuTree ul .gnb{padding-top:10px;padding-bottom: 20px;}
        /*#menuTree ul .payService{height:64px;background-color: #FFCE00;}*/
        #menuTree ul .payService li a{color:#666;}
        #menuTree ol{width:100%;font-size: 14px;text-indent:40px;}
        #menuTree ol a{color:#999;}

  /*###################################   rightpart   ###################################*/
  #rightPart{width:942px;margin-left:38px;float: left;}

  /*###################################   part00/지원자관리  ###################################*/
  #part00{width:100%;overflow: hidden;margin-bottom: 20px;}
  #part00 h4{width:100%; height:40px;line-height: 50px;font-size: 12px;}
  #part00 h4 a{color:#999;}
  #part00 ul{width:940px;}
  #part00 .list00 li{width:940px;height:100px;background-color: #fff;border: 1px solid #fff;border-bottom: 1px solid #ccc;}

        #part00 .list00 li:hover{border: 1px solid #4F60E3;}

  #part00 .list00 li p{width: 100px;height:100%;line-height: 100px;text-align: center;float: left;}
  #part00 .list00 li div{width: 840px;height:100%;float: left;}
  #part00 .list00 .desc .desc0{width:100%;height:60px;text-align: left;line-height: 85px;float: left;}

          #part00 .list00 .desc .desc0 a:hover{text-decoration: underline;}

  #part00 .list00 .desc .desc1{width:50%;height:40px;line-height: 20px;font-size: 12px;float: left;}

        #part00 .list00 .desc .desc1 a:hover{text-decoration: underline;}

  #part00 .list00 .desc .desc2{width:50%;height:40px;line-height: 20px;font-size: 12px;float: left;}
  #part00 .list00 .desc .desc2 .total{color:#4F60E3;font-weight:700;}

        #part00 .list00 .desc .desc2 a:hover{text-decoration: underline;}



/*###################################   part01/맞춤인재 관리    ###################################*/
#part01{width:100%;overflow: hidden;}
#part01 h4{width:100%; height:40px;line-height: 50px;font-size: 12px;}
#part01 h4 a{color:#999;}
#part01 ul{width:100%;}
#part01 ul li{width:940px;height:100px;background-color: #fff;border: 1px solid #fff;border-bottom: 1px solid #ccc;}
#part01 ul li p{float:left;}
#part01 ul li .img00{width:80px;height: 80px;margin:10px 10px;overflow: hidden;}
#part01 ul li .img00 img{width:100%;}
#part01 ul li .desc00{width:270px;height:70px;padding-top:30px;text-align: center;}
#part01 ul li .desc00 .name{font-size:18px;}
#part01 ul li .desc00 .age{font-size:14px;}
#part01 ul li .desc01{width:420px;height:70px;padding-top:30px;line-height:24px;}
#part01 ul li .desc01 .detail{font-size:18px;}
#part01 ul li .desc01 .title01{font-size:14px;}
#part01 ul li .date{width:150px;line-height:100px;font-size:14px;}

#part01 ul li:hover{border: 1px solid #4F60E3;}

  /*###################################   listpart   ###################################*/
  #listPart{width:100%;margin-top: 30px;margin-bottom: 10px;overflow: hidden;font-size: 14px;}
  #listPart .tab{width:540px;height:40px;}
  #listPart .tab li{width:178px;height:38px;line-height:38px;text-align:center; background-color: #eee;border:1px solid #ccc;float:left;}
  #listPart .tab li a{display: block;width: 100%;height: 100%;color:#ccc;}

          #listPart .tab li:hover{border: 1px solid #999;}
          #listPart .tab li:hover a{color: #999;}

  #listPart .tab li a.selected{background-color: #fff;color:#000;}

  #listPart .list{width:100%;border-top:1px solid #999;overflow: hidden;background-color: #fff;}
  #listPart .list li{width:100%;height:149px;border-bottom:1px solid #ccc;}
  #listPart .list li a{display: block;width: 100%;height: 100%;overflow: hidden;}

          #listPart .list li a:hover{background-color: #F7FAFF;}

  #listPart .list li a p{height:100px;float:left;font-size: 16px;padding-top:50px;line-height: 24px;}
  #listPart .list li a .desc00{width:150px;text-align: center;}
  #listPart .list li a .desc01{width:450px;}
  #listPart .list li a .desc02{width:120px;}
  #listPart .list li a .desc03{width:120px;}
  #listPart .list li a .date{width:100px;line-height:58px;}


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
            <div id="mycompanyBox">
              <p class="settingBtn"><a href="#" title="기업정보관리">기업정보관리  <i class="fas fa-cog"></i></a></p>
              <p class="companyName">${SE_USER_NM }</p>
              <p class="uploadApplication"><a href="/recruitInfoReg.do" title="채용공고 등록">채용공고 등록</a></p>
            </div>
            <div id="paymentBox">
              <p>결제하실 금액 <strong>0</strong>원 <span class="payBtn"><a href="#" title="내역보기">내역보기</a></span></p>
              <p>충전금 <strong>0</strong>원</p>
            </div>
            <div id="menuTree">
              <ul>
                <li class="gnb"><a href="#" title="채용관리">채용관리</a>
                  <h3>채용관리</h3>
                    <ol>
                      <li><a href="/recruitInfoReg.do" title="채용공고 등록">채용공고 등록</a></li>
                      <li><a href="#" title="진행중인 채용정보">진행중인 채용정보</a></li>
                      <li><a href="#" title="마감된 채용정보">마감된 채용정보</a></li>
                    </ol>
                </li>
                <li class="gnb"><a href="#" title="인재관리">인재관리</a>
                  <h3>인재관리</h3>
                    <ol>
                      <li><a href="#" title="스크랩인재">스크랩인재</a></li>
                      <li><a href="#" title="유료서비스 신청">유료서비스 신청</a></li>
                      <li><a href="#" title="맞춤서비스 설정">맞춤서비스 설정</a></li>
                      <li><a href="#" title="맞춤 인재정보">맞춤 인재정보</a></li>
                    </ol>
                </li>
                <li class="gnb"><a href="#" title="입사지원 관리">입사지원 관리</a>
                  <h3>입사지원 관리</h3>
                    <ol>
                      <li><a href="#" title="입사지원 관리">입사지원 관리</a></li>
                      <li><a href="#" title="입사지원/면접제의 요청관리">입사지원/면접제의 요청관리</a></li>
                    </ol>
                </li>
                <li class="gnb payService"><a href="#" title="유료서비스">유료서비스</a>
                  <h3>유료서비스</h3>
                    <ol>
                      <li><a href="#" title="유료채용광고 서비스">유료채용광고 서비스</a></li>
                      <li><a href="#" title="인재검색서칭 서비스">인재검색서칭 서비스</a></li>
                    </ol>
                </li>
                <li class="gnb"><a href="#" title="채용문자">채용문자</a></li>
                <li class="gnb"><a href="#" title="FAQ">FAQ</a></li>
              </ul>
            </div>
          </div>
          <div id="rightPart">
            <div id="part00">
              <h4><a href="#" title="지원자 관리">지원자 관리<span><i class="fas fa-chevron-right"></i></span></a></h4>
              <ul class="list00">
                <li>
                  <p class="state">진행중</p>
                  <div class="desc">
                    <p class="desc0"><a href="#" title="모집공고타이틀">[재택]웹디자인, 모바일 디자이너 모집</a></p>
                    <div class="desc1">
                      <span>2020.08.27 ~ 2020.09.26</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="공고보기"><span>공고보기</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="복사"><span>복사</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="삭제"><span>삭제</span></a>
                    </div>
                    <div class="desc2">
                      <a href="#" title="전체 지원자" class="total">전체 지원자<span>11</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="미열람">미열람<span>11</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="열람">열람<span>0</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="서류합격">서류합격<span>0</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="불합격">불합격<span>0</span></a>
                    </div>
                  </div>
                </li>
                <li>
                  <p class="state">진행중</p>
                  <div class="desc">
                    <p class="desc0"><a href="#" title="모집공고타이틀">[재택]웹디자인, 모바일 디자이너 모집</a></p>
                    <div class="desc1">
                      <span>2020.08.27 ~ 2020.09.26</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="공고보기"><span>공고보기</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="복사"><span>복사</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="삭제"><span>삭제</span></a>
                    </div>
                    <div class="desc2">
                      <a href="#" title="전체 지원자" class="total">전체 지원자<span>11</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="미열람">미열람<span>11</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="열람">열람<span>0</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="서류합격">서류합격<span>0</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="불합격">불합격<span>0</span></a>
                    </div>
                  </div>
                </li>
                <li>
                  <p class="state">진행중</p>
                  <div class="desc">
                    <p class="desc0"><a href="#" title="모집공고타이틀">[재택]웹디자인, 모바일 디자이너 모집</a></p>
                    <div class="desc1">
                      <span>2020.08.27 ~ 2020.09.26</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="공고보기"><span>공고보기</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="복사"><span>복사</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="삭제"><span>삭제</span></a>
                    </div>
                    <div class="desc2">
                      <a href="#" title="전체 지원자" class="total">전체 지원자<span>11</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="미열람">미열람<span>11</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="열람">열람<span>0</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="서류합격">서류합격<span>0</span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                      <a href="#" title="불합격">불합격<span>0</span></a>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
            <div id="part01">
              <h4><a href="#" title="맞춤인재 관리">맞춤인재 관리<span><i class="fas fa-chevron-right"></i></span></a></h4>
              <ul class="list00">
                <li>
                  <a href="#" title="기업회원등록공고">
                    <p class="img00"><img src="/img/company_home/img00.jpeg" alt="인재사진"/></p>
                    <p class="desc00">
                      <span class="name">주oo</span><br/>
                      <span class="age">남 37세</span>
                    </p>
                    <p class="desc01">
                      <span class="detail">명지전문대학 컴퓨터정보(2,3년) 졸업</span><br/>
                      <span class="title01">000개발팀 과장</span>
                    </p>
                    <p class="date">2020.08.27</p>
                  </a>
                </li>
                <li>
                  <a href="#" title="기업회원등록공고">
                    <p class="img00"><img src="/img/company_home/img01.jpeg" alt="인재사진"/></p>
                    <p class="desc00">
                      <span class="name">주oo</span><br/>
                      <span class="age">남 37세</span>
                    </p>
                    <p class="desc01">
                      <span class="detail">명지전문대학 컴퓨터정보(2,3년) 졸업</span><br/>
                      <span class="title01">000개발팀 과장</span>
                    </p>
                    <p class="date">2020.08.27</p>
                  </a>
                </li>
                <li>
                  <a href="#" title="기업회원등록공고">
                    <p class="img00"><img src="/img/company_home/img02.jpg" alt="인재사진"/></p>
                    <p class="desc00">
                      <span class="name">주oo</span><br/>
                      <span class="age">남 37세</span>
                    </p>
                    <p class="desc01">
                      <span class="detail">명지전문대학 컴퓨터정보(2,3년) 졸업</span><br/>
                      <span class="title01">000개발팀 과장</span>
                    </p>
                    <p class="date">2020.08.27</p>
                  </a>
                </li>
              </ul>
            </div>
            <div id="listPart">
              <ul class="tab">
            		<li><a class="selected" href="#none" title="맞춤채용인재">맞춤채용인재</a></li>
            		<li><a href="#none" title="스크랩인재">스크랩인재</a></li>
            		<li><a href="#none" title="최근 본 인재">최근 본 인재</a></li>
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
                      <span class="desc00_07">회사내규에따</span>
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
                      <span class="desc00_07">회사내규에따</span>
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
                      <span class="desc00_07">회사내규에따</span>
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
                      <span class="desc00_07">회사내규에따</span>
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
                      <span class="desc00_07">회사내규에따</span>
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
                      <span class="desc00_07">회사내규에따</span>
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
                      <span class="desc00_07">회사내규에따</span>
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
                      <span class="desc00_07">회사내규에따</span>
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
                      <span class="desc00_07">회사내규에따</span>
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
                      <span class="desc00_07">회사내규에따</span>
                    </p>
                    <p class="date">2020.08.27</p>
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

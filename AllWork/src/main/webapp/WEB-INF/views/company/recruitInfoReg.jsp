<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8"/>
  <title> 채용공고 등록 </title>
  <link rel="stylesheet" type="text/css" href="/css/header_company.css"/>
	<link rel="stylesheet" type="text/css" href="/css/footer.css"/>
	<link rel="stylesheet" type="text/css" href="/css/font.css"/>
  <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
  <link  rel="stylesheet" type="text/css" href="/css/all.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
  <style>


  body{background: #EDF0F5;font-family:"NotoSansKR-Regular";}

  /*###################################   containerWrap  ###################################*/
      #containerWrap{width:100%;margin: 10px auto 80px;overflow: hidden;}
      #container{width:1280px;margin:0 auto;}

  /*###################################   reg_leftPart   ###################################*/
      #reg_leftPart{width:1060px;float:left;margin-right:10px;}

      #reg_leftPart ul{width:405px;margin:0 auto;}
      #reg_leftPart ul li{width:198px;height:48px;margin-bottom:5px;margin-right:5px;text-align:center;line-height:50px;background-color:#fff;border:1px solid #ccc;float:left;}
      #reg_leftPart ul li:last-child{margin-right:0px;}
      #reg_leftPart ul li a{display:block;width:100%;height:100%;color:#666;}
      #reg_leftPart ul li.reg_ok{background-color:#4F60E3;border:1px solid #4F60E3;}
      #reg_leftPart ul li.reg_ok a{color:#fff;}

      /*###############################   regist00   ###############################*/
      #regist00{width:1060px;margin-bottom:10px;}
      #company_detail{width:1060px;overflow:hidden;background-color:#fff;margin-bottom:10px;}
      #company_detail p{float:left;height: 126px;line-height:126px;}
      #company_detail .company_name{width:220px;padding-left:40px;font-size:32px;}
      #company_detail .company_hp{width:560px;}
      #company_detail .company_logo{width:238px;height:124px;line-height:124px;text-align: center;border:1px solid #ccc;}

      #detailArea{width:981px;padding:40px 39px 40px;background-color:#fff;}
      #detailArea .detail_title{width:100%;height:30px;font-size:24px;font-family:"NotoSansKR-Thin";}
      #detailArea .company_setting{width:110px;height:28px;line-height:28px;font-size:14px;margin-bottom:10px;margin-left:871px;text-align:center;border:1px solid #808495;}
      #detailArea .tabelArea{width:100%;text-indent:10px;overflow: hidden;border-top:1px solid #808495;}
      #detailArea .tabelArea p{float: left;}
      #detailArea .tabelArea .table_title{width:120px;height:39px;line-height:40px;border-bottom:1px solid #ccc;background-color:#808495;color:#fff;}
      #detailArea .tabelArea .table_desc{width:207px;height:39px;line-height:40px;border-bottom:1px solid #808495;}
      #detailArea .tabelArea .table_desc01{width:860px;height:39px;line-height:40px;border-bottom:1px solid #808495;}

                    #detailArea .company_setting:hover{background-color:#eee;}


        fieldset{border:none;}
        legend{font-size:24px;padding-bottom:20px;font-family:"NotoSansKR-Thin";}
        #regForm01 div{width:100%;}
        caption{display:none;}
        tbody{width:100%;text-align:left;}
        tr{width:100%;height:60px;font-size:16px;height:100px;}
        th{width:180px;font-family:"NotoSansKR-Medium";}
        td{width:800px;font-size:14px;}
        td label{font-family:"NotoSansKR-Regular";}
        td input[type="button"]{width:120px;height:40px;padding:0 10px;text-align:center;font-size:16px;
                                background-color:#fff;
                                border:1px solid #999;vertical-align:top;margin-right:20px;}
        td input[type="text"]{width:800px;height:40px;background-color:#fff;border:1px solid #999;text-indent:10px;}
        td input::placeholder{color:#ccc;font-size:16px;}
        td input[type="checkbox"]{width:20px;height:20px;vertical-align:bottom;margin-right:5px;border:1px solid #999;}
        td input[type="radio"]{width:20px;height:20px;vertical-align:bottom;margin-right:5px;border:1px solid #999;}

        td span{display:inline-block;padding-right:20px;}
        td select{width:200px;height:40px;border:1px solid #999;font-size:16px;text-indent:10px;color:#666;}
        td textarea{width:100%;height:200px;}
        td input[type="date"]{width:160px;height:40px;border:1px solid #999;font-size:14px;padding:0 10px;color:#666;}
        .comment{color:red;font-size:12px;padding-top:5px;}
        .necessary{padding-right:0;}

        /*###############################   regist01   ###############################*/
        #regist01{width:100%;overflow:hidden;margin-bottom:10px;}
        #regForm01{width:980px;background-color:#fff;padding:40px;}


        /*###############################   regist02   ###############################*/
        #regist02{width:100%;overflow:hidden;margin-bottom:10px;}
        #regForm02{width:980px;background-color:#fff;padding:40px;}
        #regForm02 input[type="checkbox"]{margin-top:3px;}
        #reg02_desc08_1{width:50px; height:20px;vertical-align:top;}
        #reg02_desc12_2, #reg02_desc12_3{width:50px; height:20px;vertical-align:top;}

        /*###############################   regist03   ###############################*/
        #regist03{width:100%;overflow:hidden;margin-bottom:10px;}
        #regForm03{width:980px;background-color:#fff;padding:40px;}
        #regForm03 th{display:none;}
        #regForm03 td{width:980px;}
        #regForm03 p{width:100%;padding-bottom:20px;}

        /*###############################   regist04   ###############################*/
        #regist04{width:100%;overflow:hidden;margin-bottom:10px;}
        #regForm04{width:980px;background-color:#fff;padding:40px;}
        #regForm04 span{width:176px;margin-bottom:10px;padding-top:8px;}

        /*###############################   regist05   ###############################*/
        #regist05{width:100%;overflow:hidden;margin-bottom:10px;}
        #regForm05{width:980px;background-color:#fff;padding:40px;}
        #regForm05 tr{height:60px;}

        #regForm05 .file_btn{border:none;}
        #regForm05 input[type="file"]{position: absolute;
                                      width: 0;
                                      height: 0;
                                      padding: 0;
                                      overflow: hidden;
                                      border: 0;
                                  }
        #regForm05 label.fileUp {font-family:"NotoSansKR-Medium";
                          display: inline-block;
                          height: 40px;
                          line-height:40px;
                          width:100px;
                          text-align: center;
                          color: #fff;
                          vertical-align: middle;
                          background-color: #4F60E3;
                          cursor: pointer;
                          border: 1px solid #ebebeb;

                      }
        #regForm05 #reg05_desc05{

                          display: inline-block;
                          width:240px;
                          height: 40px;
                          font-size:16px;
                          color:#ccc;
                          padding: 0 10px;
                            vertical-align: middle;
                            background-color: #f5f5f5;
                          border: 1px solid #ebebeb;


                        }

        /*###############################   regist06   ###############################*/
        #regist06{width:100%;overflow:hidden;margin-bottom:10px;}
        #regForm06{width:980px;background-color:#fff;padding:40px;}
        #regForm06 input[type="text"]{width:200px;}
        #regForm06 tr{height:60px;}

        #contact{width:100%;}
        #contact tr{margin:10px 0;}
        #contact span{padding:0 5px;}
        #contact label{display: inline-block;width:160px;}
        #contact input[type="text"]{width:160px;height:40px;margin:5px 0;}
        #contact select{width:160px;}

  /*###################################   reg_rightPart   ###################################*/
      #reg_rightPart{width:210px;float:left;}
      #reg_rightPart ul{width:100%;}
      #reg_rightPart ul li{width:198px;height:78px;margin-bottom:5px;text-align:center;line-height:80px;background-color:#fff;border:1px solid #ccc;}
      #reg_rightPart ul li a{display:block;width:100%;height:100%;color:#666;}
      #reg_rightPart ul li.reg_ok{background-color:#4F60E3;border:1px solid #4F60E3;}
      #reg_rightPart ul li.reg_ok a{color:#fff;}



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
        <div id="container">
          <div id="reg_leftPart">
            <div id="regist00">
              <div id="company_detail">
                <p class="company_name">일마그나</p>
                <p class="company_hp"><a href="#none" title="기업홈페이지">www.ilmagna.com</a></p>
                <p class="company_logo">logo</p>
              </div>
              <div id="detailArea">
                <p class="detail_title">기본정보</p>
                <p class="company_setting"><a href="#none" title="기본정보수정"><i class="fas fa-cog"></i>&nbsp;기본정보수정</a></p>
                <div class="tabelArea">
                  <p class="table_title">대표자</p><p class="table_desc">홍길동</p>
                  <p class="table_title">기업형태</p><p class="table_desc">벤처기업</p>
                  <p class="table_title">자본금</p><p class="table_desc">4천만원</p>
                  <p class="table_title">설립년도</p><p class="table_desc">2019년</p>
                  <p class="table_title">사원수</p><p class="table_desc">6명</p>
                  <p class="table_title">상장여부</p><p class="table_desc">비상장</p>
                  <p class="table_title">업종</p><p class="table_desc01">IT.웹.통신</p>
                  <p class="table_title">사업내용</p><p class="table_desc01">AI S/W 개발</p>
                </div>
              </div>
            </div>
            <div id="regist01">
              <form id="regForm01" action="#none" method="post">
                <fieldset>
                  <legend>채용공고 등록하기</legend>
                  <div>
                    <table>
                      <caption>채용공고 등록하기</caption>
                      <tbody>
                        <tr>
                          <th>채용유형<span class="necessary">*</span></th>
                          <td>
                            <span><input id="reg01_desc01" type="radio" name="reg01_desc01"/><label for="reg01_desc01">일반</label></span>
                            <span><input id="reg01_desc01_1" type="radio" name="reg01_desc01_1"/><label for="reg01_desc01_1">아르바이트</label></span>
                            <span><input id="reg01_desc01_2" type="radio" name="reg01_desc01_2"/><label for="reg01_desc01_2">프리랜서</label></span>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </fieldset>
              </form>
            </div>
            <div id="regist02">
              <form id="regForm02" action="#none" method="post">
                  <fieldset>
                    <legend>모집요강</legend>
                    <div>
                      <table>
                        <caption>모집요강</caption>
                        <tbody>
                          <tr>
                            <th>공고제목<span class="necessary">*</span></th>
                            <td>
                              <span><input class="reg_text" id="reg02_desc01" type="text" name="reg02_desc01" placeholder="ex)웹기획 경력직 채용"/></span>
                              <span><input id="reg02_desc01_1" type="checkbox" name="reg02_desc01_1"/><label for="reg02_desc01_1">담당업무와 동일</label>&nbsp;&nbsp;&nbsp;</span><span class="comment">공고제목은 구체적인 담당업무를 포함하여 입력하여 주시기 바랍니다.</span>
                            </td>
                          </tr>
                          <tr>
                            <th>모집업종<span class="necessary">*</span></th>
                            <td>
            									<select id="reg02_desc02" name="reg02_desc02" title="1차직무선택">
                                <option value="1차직무선택">1차직무선택</option>
            										<option value="IT.인터넷.게임.모바일">IT.인터넷.게임.모바일</option>
            										<option value="전문직.금융.세무.법무">전문직.금융.세무.법무</option>
            										<option value="생산.제조.기계.산업">생산.제조.기계.산업</option>
            										<option value="건설.인테리어.부동산">건설.인테리어.부동산</option>
            										<option value="유통.무역.운수">유통.무역.운수</option>
                                <option value="경영.기획.사무">경영.기획.사무</option>
                                <option value="영업.판매">영업.판매</option>
                                <option value="교육.서비스">교육.서비스</option>
            									</select>
                              <select id="reg02_desc02_1" name="reg02_desc02_1" title="2차직무선택">
            										<option value="2차직무선택">2차직무선택</option>
            									</select>
                              <select id="reg02_desc02_2" name="reg02_desc02_2" title="3차직무선택">
            										<option value="3차직무선택">3차직무선택</option>
            									</select>
                              <input id="reg02_desc02_3" type="button" name="reg02_desc02_3" value="+ 추가"/>
                            </td>
                          </tr>
                          <tr>
                            <th>산업분야<span class="necessary">*</span></th>
                            <td>
            									<select id="res02_desc03" name="res02_desc03" title="1차산업선택">
                                <option value="1차산업선택">1차산업선택</option>
            										<option value="IT.인터넷.게임.모바일">IT.인터넷.게임.모바일</option>
            										<option value="전문직.금융.세무.법무">전문직.금융.세무.법무</option>
            										<option value="생산.제조.기계.산업">생산.제조.기계.산업</option>
            										<option value="건설.인테리어.부동산">건설.인테리어.부동산</option>
            										<option value="유통.무역.운수">유통.무역.운수</option>
                                <option value="경영.기획.사무">경영.기획.사무</option>
                                <option value="영업.판매">영업.판매</option>
                                <option value="교육.서비스">교육.서비스</option>
            									</select>
                              <select id="res02_desc03_1" name="res02_desc03_1" title="2차산업선택">
            										<option value="2차산업선택">2차산업선택</option>
            									</select>
                              <select id="res02_desc03_2" name="res02_desc03_2" title="3차산업선택">
            										<option value="3차산업선택">3차산업선택</option>
            									</select>
                              <input id="res02_desc03_3" type="button" name="res02_desc03_3" value="+ 추가"/>
                            </td>
                          </tr>
                          <tr>
                            <th>빠른선택</th>
                            <td>
                              <span><input id="reg02_desc04" type="radio" name="reg02_desc04"/><label for="reg02_desc04">&nbsp;운전전문직군</label></span>
                              <span><input id="reg02_desc04_1" type="radio" name="reg02_desc04_1"/><label for="reg02_desc04_1">&nbsp;경비직군</label></span>
                              <span><input id="reg02_desc04_2" type="radio" name="reg02_desc04_2"/><label for="reg02_desc04_2">&nbsp;일반관리직</label></span>&nbsp;&nbsp;
                              <span class="comment">빠른선택 진행시 모집업종은 선택할 수 없습니다.</span>
                            </td>
                          </tr>
                          <tr>
                            <th>근무지역<span class="necessary">*</span></th>
                            <td>
            									<select id="reg02_desc05" name="reg02_desc05" title="1차지역선택">
                                <option value="1차직무선택">1차직무선택</option>
            										<option value="IT.인터넷.게임.모바일">IT.인터넷.게임.모바일</option>
            										<option value="전문직.금융.세무.법무">전문직.금융.세무.법무</option>
            										<option value="생산.제조.기계.산업">생산.제조.기계.산업</option>
            										<option value="건설.인테리어.부동산">건설.인테리어.부동산</option>
            										<option value="유통.무역.운수">유통.무역.운수</option>
                                <option value="경영.기획.사무">경영.기획.사무</option>
                                <option value="영업.판매">영업.판매</option>
                                <option value="교육.서비스">교육.서비스</option>
            									</select>
                              <select id="reg02_desc05_1" name="reg02_desc05_1" title="2차지역선택">
            										<option value="2차직무선택">2차직무선택</option>
            									</select>
                              <select id="reg02_desc05_2" name="reg02_desc05_2" title="3차지역선택">
            										<option value="3차직무선택">3차직무선택</option>
            									</select>
                              <input id="reg02_desc05_3" type="button" name="reg02_desc05_3" value="+ 추가"/>
                              <span class="comment">최대 3개까지 선택 가능</span>
                            </td>
                          </tr>
                          <tr>
                            <th>담당업무<span class="necessary">*</span></th>
                            <td><input id="reg02_desc06" type="text" name="reg02_desc06"/></td>
                          </tr>
                          <tr>
                            <th>고용형태<span class="necessary">*</span></th>
                            <td>
                              <span><input id="reg02_desc07" type="checkbox" name="reg02_desc07"/><label for="reg02_desc07">정규직</label></span>
                              <span><input id="reg02_desc07_1" type="checkbox" name="reg02_desc07_1"/><label for="reg02_desc07_1">계약직</label></span>
                              <span><input id="reg02_desc07_2" type="checkbox" name="reg02_desc07_2"/><label for="reg02_desc07_2">프리랜서</label></span>
                              <span><input id="reg02_desc07_3" type="checkbox" name="reg02_desc07_3"/><label for="reg02_desc07_3">아르바이트</label></span>
                              <span><input id="reg02_desc07_4" type="checkbox" name="reg02_desc07_4"/><label for="reg02_desc07_4">추후협의</label></span>
                            </td>
                          </tr>
                          <tr>
                            <th>모집인원<span class="necessary">*</span></th>
                            <td>
                              <span><input id="reg02_desc08" type="checkbox" name="reg02_desc08"/><label for="reg02_desc08">직접입력</label></span>
                              <span><input id="reg02_desc08_1" type="text" name="reg02_desc08_1"/><label for="reg02_desc08_1">&nbsp;명</label></span>
                              <span><input id="reg02_desc08_2" type="checkbox" name="reg02_desc08_2"/><label for="reg02_desc08_2">0명</label></span>
                              <span><input id="reg02_desc08_3" type="checkbox" name="reg02_desc08_3"/><label for="reg02_desc08_3">00명</label></span>
                              <span><input id="reg02_desc08_4" type="checkbox" name="reg02_desc08_4"/><label for="reg02_desc08_4">000명</label></span>
                            </td>
                          </tr>
                          <tr>
                            <th>경력사항<span class="necessary">*</span></th>
                            <td>
                              <span><input id="reg02_desc09" type="checkbox" name="reg02_desc09"/><label for="reg02_desc09">신입</label></span>
                              <span><input id="reg02_desc09_1" type="checkbox" name="reg02_desc09_1"/><label for="reg02_desc09_1">경력</label></span>
                              <span>
                                <select id="reg02_desc09_2" name="reg02_desc09_2" title="경력연차">
              										<option value="선택">선택</option>
              										<option value="1">1</option>
              										<option value="2">2</option>
              										<option value="3">3</option>
              										<option value="4">4</option>
                                  <option value="5">5</option>
                                  <option value="6">6</option>
              										<option value="7">7</option>
              										<option value="8">8</option>
              										<option value="9">9</option>
                                  <option value="10">10</option>
                                  <option value="11">11</option>
              										<option value="12">12</option>
              										<option value="13">13</option>
              										<option value="14">14</option>
                                  <option value="15">15</option>
                                  <option value="16">16</option>
              										<option value="17">17</option>
              										<option value="18">18</option>
              										<option value="19">19</option>
                                  <option value="20">20</option>
              									</select>
                              </span>
                              <span><input id="reg02_desc09_3" type="checkbox" name="reg02_desc09_3"/><label for="reg02_desc09_3">경력무관</label></span>
                            </td>
                          </tr>
                          <tr>
                            <th>급여조건<span class="necessary">*</span></th>
                            <td>
                              <select id="res02_desc10" name="res02_desc10" title="연봉/시급선택">
            										<option value="연봉/시급선택">연봉/시급선택</option>
            										<option value="연봉">연봉</option>
                                <option value="시급">시급</option>
            									</select>
            									<select id="reg02_desc10_1" name="reg02_desc10_1" title="연봉선택">
            										<option value="2,600만원 이하">2,600만원 이하</option>
            										<option value="2,600~2,800만원">2,600~2,800만원</option>
            										<option value="2,800~3,000만원">2,800~3,000만원</option>
            										<option value="3,000~3,500만원">3,000~3,500만원</option>
            										<option value="3,500~4,000만원">3,500~4,000만원</option>
                                <option value="4,000~4,500만원">4,000~4,500만원</option>
            										<option value="4,500~5,000만원">4,500~5,000만원</option>
                                <option value="5,000~6,000만원">5,000~6,000만원</option>
                                <option value="6,000~7,000만원">6,000~7,000만원</option>
                                <option value="7,000~8,000만원">7,000~8,000만원</option>
            										<option value="8,000~9,000만원">8,000~9,000만원</option>
                                <option value="1억 이상">1억 이상</option>
                                <option value="회사 내규에 따름">회사내규에 따름</option>
                                <option value="면접후 결정">면접후 결정</option>
            									</select>
                            </td>
                          </tr>
                          <tr>
                            <th>최종학력<span class="necessary">*</span></th>
                            <td>
            									<select id="reg02_desc11" name="reg02_desc11" title="학력 선택">
            										<option value="학력 선택">학력 선택</option>
            										<option value="고등학교졸업">고등학교졸업</option>
            										<option value="대학졸업(2,3년)">대학졸업(2,3년)</option>
            										<option value="대학졸업(4년)">대학졸업(4년)</option>
            										<option value="석사">석사</option>
                                <option value="박사">박사</option>
            									</select>
                            </td>
                          </tr>
                          <tr>
                            <th>나이제한<span class="necessary">*</span></th>
                            <td>
                              <span><input id="reg02_desc12" type="radio" name="reg02_desc12"/><label for="reg02_desc12">연령무관</label></span>
                              <span><input id="reg02_desc12_1" type="radio" name="reg02_desc12_1"/><label for="reg02_desc12_1">연령제한</label></span>
                              <span>
                                <input id="reg02_desc12_2" type="text" name="reg02_desc12_2"/>&nbsp;세 이상
                                <span>~</span>
                                <input id="reg02_desc12_3" type="text" name="reg02_desc12_3"/>&nbsp;세 이하
                              </span>
                              <span class="comment">모집·채용에서 합리적인 이유 없이 연령제한을 하는 경우는 연령차별금지법 위반에 따른 500만원 이하의 벌금이 부과될 수 있습니다.</span>
                            </td>
                          </tr>
                          <tr>
                            <th>성별</th>
                            <td>
                              <span><input id="reg02_desc13" type="radio" name="reg02_desc13"/><label for="reg02_desc13">성별무관</label></span>
                              <span><input id="reg02_desc13_1" type="radio" name="reg02_desc13_1"/><label for="reg02_desc13_1">남자</label></span>
                              <span><input id="reg02_desc13_2" type="radio" name="reg02_desc13_2"/><label for="reg02_desc13_2">여자</label></span>
                              <span class="comment">
                                채용에서 남녀를 차별하거나, 여성근로자를 채용할 때 직무수행에 불필요한 용모, 키, 체중 등의 신체조건, 미혼조건을 제시 또는 요구하는 경우
                                남녀고용평등법 위반에 따른 500만원이하의 벌금이 부과될 수 있습니다.
                              </span>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </fieldset>
                </form>
            </div>
            <div id="regist03">
              <form id="regForm03" action="#none" method="post">
                <fieldset>
                <legend>상세요강</legend>
                  <div>
                    <table>
                      <caption>상세요강</caption>
                      <tbody>
                        <tr>
                          <th>상세요강</th>
                          <td>
                            <p>
                              ㆍ모집직종 및 담당업무에 관련된 상세한 정보, 모집내용에 관련된자격요건, 제출서류, 전형방법, 근무조건, 회사위치 등을 입력해 주십시오.<br/>
                              ㆍ상세모집요강 작성에 많은 시간이 필요할 경우 메모장이나 워드프로그램에서 작성한 다음 붙여넣기를 하시기 바랍니다.
                            </p>
                            <textarea id="reg03_desc01" name="reg03_desc01"></textarea>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </fieldset>
              </form>
            </div>
            <div id="regist04">
              <form id="regForm04" action="#none" method="post">
                <fieldset>
                <legend>근무환경</legend>
                  <div>
                    <table>
                      <caption>근무환경</caption>
                      <tbody>
                        <tr>
                          <th>우대조건</th>
                          <td>
                            <span><input id="reg04_desc01" type="checkbox" name="reg04_desc01"/><label for="reg04_desc01">국가유공자</label></span>
                            <span><input id="reg04_desc01_1" type="checkbox" name="reg04_desc01_1"/><label for="reg04_desc01_1">보훈대상자</label></span>
                            <span><input id="reg04_desc01_2" type="checkbox" name="reg04_desc01_2"/><label for="reg04_desc01_2">고용촉진장려금 대상자</label></span>
                            <span><input id="reg04_desc01_3" type="checkbox" name="reg04_desc01_3"/><label for="reg04_desc01_3">장애인</label></span>
                            <span><input id="reg04_desc01_4" type="checkbox" name="reg04_desc01_4"/><label for="reg04_desc01_4">취업보호대상자</label></span>
                            <span><input id="reg04_desc01_5" type="checkbox" name="reg04_desc01_5"/><label for="reg04_desc01_5">영어가능자</label></span>
                            <span><input id="reg04_desc01_6" type="checkbox" name="reg04_desc01_6"/><label for="reg04_desc01_6">일본어가능자</label></span>
                            <span><input id="reg04_desc01_7" type="checkbox" name="reg04_desc01_7"/><label for="reg04_desc01_7">주부우대</label></span>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </fieldset>
              </form>
            </div>
            <div id="regist05">
              <form id="regForm05" action="#none" method="post">
                <fieldset>
                <legend>접수기간/방법</legend>
                  <div>
                    <table>
                      <caption>접수기간/방법</caption>
                      <tbody>
                        <tr>
                          <th>접수기간<span class="necessary">*</span></th>
                          <td>
                            <span><input id="reg05_desc01" type="date" name="reg05_desc01"/></span><span>~</span><span><input id="reg05_desc01_1" type="date" name="reg05_desc01_1"/></span>
                            <span><input id="reg05_desc01_2" type="checkbox" name="reg05_desc01_2"/><label for="reg05_desc01_2">상시채용</label></span>
                            <span><input id="reg05_desc01_3" type="checkbox" name="reg05_desc01_3"/><label for="reg05_desc01_3">채용시 마감</label></span>
                          </td>
                        </tr>
                        <tr>
                          <th>제출서류</th>
                          <td>
                            <span><input id="reg05_desc02" type="checkbox" name="reg05_desc02"/><label for="reg05_desc02">이력서</label></span>
                            <span><input id="reg05_desc02_1" type="checkbox" name="reg05_desc02_1"/><label for="reg05_desc02_1">자기소개서</label></span>
                            <span><input id="reg05_desc02_2" type="checkbox" name="reg05_desc02_2"/><label for="reg05_desc02_2">졸업증명서</label></span>
                            <span><input id="reg05_desc02_3" type="checkbox" name="reg05_desc02_3"/><label for="reg05_desc02_3">주민등록등본</label></span>
                            <span><input id="reg05_desc02_4" type="checkbox" name="reg05_desc02_4"/><label for="reg05_desc02_4">성적증명서</label></span>
                          </td>
                        </tr>
                        <tr>
                          <th>접수방법<span class="necessary">*</span></th>
                          <td>
                            <span><input id="reg05_desc03" type="checkbox" name="reg05_desc03"/><label for="reg05_desc03">이메일 입사지원</label></span>
                            <span><input id="reg05_desc03_1" type="checkbox" name="reg05_desc03_1"/><label for="reg05_desc03_1">온라인 입사지원</label></span>
                            <span><input id="reg05_desc03_1" type="checkbox" name="reg05_desc03_1"/><label for="reg05_desc03_1">모바일 입사지원</label></span>
                          </td>
                        </tr>
                        <tr>
                          <th>이력서 양식</th>
                          <td>
                            <span><input id="reg05_desc04" type="checkbox" name="reg05_desc04"/><label for="reg05_desc04">온라인 이력서</label></span>
                            <span><input id="reg05_desc04_1" type="checkbox" name="reg05_desc04_1"/><label for="reg05_desc04_1">자사 입사지원서 양식</label></span>
                          </td>
                        </tr>
                        <tr>
                          <th>이력서 양식 첨부</th>
                          <td>
                            <span class="file_btn"><input class="upload-name" id="reg05_desc05"/><label class="fileUp" for="reg05_desc05_1">파일첨부</label><input id="reg05_desc05_1" type="file" name="reg05_desc05_1"/></span>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </fieldset>
              </form>
            </div>
            <div id="regist06">
              <form id="regForm06" action="#none" method="post">
                <fieldset>
                <legend>담당자정보</legend>
                <div>
                  <table>
                    <caption>담당자정보</caption>
                    <tbody>
                      <tr>
                        <th>담당자명<span class="necessary">*</span></th>
                        <td><input id="reg06_desc01" type="text" name="reg06_desc01" title="담당자명"/></td>
                      </tr>
                      <tr>
                        <th>전화번호<span class="necessary">*</span></th>
                        <td>
                          <span>
                            <select id="reg06_desc02" name="reg06_desc02" title="전화번호 앞자리 선택">
                              <option value="010">010</option>
                              <option value="011">011</option>
                              <option value="016">016</option>
                              <option value="help">문의</option>
                            </select>
                          </span>
                          <span>-</span>
                          <span><input id="reg06_desc02_1" type="text" name="reg06_desc02_1" title="전화번호 가운데 자리 선택"/></span>
                          <span>-</span>
                          <span><input id="reg06_desc02_3" type="text" name="reg06_desc02_3" title="전화번호 마지막 자리 선택"/></span>
                        </td>
                      </tr>
                      <tr>
                        <th>팩스<span class="necessary">*</span></th>
                        <td>
                          <span><input id="reg06_desc03" type="text" name="reg06_desc03" title="전화번호 가운데 자리 선택"/></span>
                          <span>-</span>
                          <span><input id="reg06_desc03_1" type="text" name="reg06_desc03_1" title="전화번호 가운데 자리 선택"/></span>
                          <span>-</span>
                          <span><input id="reg06_desc03_2" type="text" name="reg06_desc03_2" title="전화번호 마지막 자리 선택"/></span>
                        </td>
                      </tr>
                      <tr>
                        <th>이메일<span class="necessary">*</span></th>
                        <td>
                          <span><input id="reg06_desc04" type="text" name="reg06_desc04" title="아이디만 입력"/></span><span>@</span><span><input id="reg06_desc04_1" type="text" name="reg06_desc04_1" title="이메일 주소 선택"/></span>
                          <span>
                            <select id="reg06_desc04_2" name="reg06_desc04_2" title="이메일 선택">
                              <option value="direct">직접입력</option>
                              <option value="gmail.com">gmail.com</option>
                              <option value="naver.com">naver.com</option>
                              <option value="daum.net">daum.net</option>
                              <option value="nate.com">nate.com</option>
                            </select>
                          </span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                </fieldset>
              </form>
            </div>
            <ul>
              <li><a href="#none" title="임시저장">취소</a></li>
              <li class="reg_ok"><a href="#none" title="등록완료">등록완료</a></li>
            </ul>
          </div>
          <div id="reg_rightPart">
            <ul>
              <li><a href="#none" title="임시저장">취소</a></li>
              <li class="reg_ok"><a href="#none" title="등록완료">등록완료</a></li>
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

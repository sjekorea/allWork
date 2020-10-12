<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8"/>
  <title> 이력서 등록 </title>
  <link rel="stylesheet" type="text/css" href="/css/header.css"/>
	<link rel="stylesheet" type="text/css" href="/css/footer.css"/>
	<link rel="stylesheet" type="text/css" href="/css/font.css"/>
  <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
  <link  rel="stylesheet" type="text/css" href="/css/all.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
  <style>


  body{background: #EDF0F5;font-family:"NotoSansKR-Regular";}
  /*###################################   Header    ###################################*/
  #allworkWrap{width:100%;}
    #headerWrap{width:100%;height:40px;border-bottom:1px solid #333;}
      #topWrap{width:1280px;height:40px;margin:0 auto;font-family:"NotoSansKR-Bold";}
      #topWrap h1{width:100px;height:100%;font-size:18px;line-height: 40px;float: left;}
      #topWrap h1 a{display: block;width:100%;height: 100%;}

      #topWrap ul{width:1180px;height:100%;font-size: 12px;line-height: 40px;text-align: right;float: left;}
      #topWrap ul li{display: inline-block;font-family:"NotoSansKR-Regular";}
      #topWrap ul li a{color:#333;}

  /*###################################   containerWrap  ###################################*/
      #containerWrap{width:100%;margin: 20px auto 80px;overflow: hidden;}
      #container{width:1280px;margin:0 auto;}

  /*###################################   reg_leftPart   ###################################*/
      #res_leftPart{width:1060px;float:left;margin-right:10px;}

      #res_leftPart ul{width:610px;margin:30px auto 0;}
      #res_leftPart ul li{width:198px;height:48px;margin-bottom:5px;margin-right:5px;text-align:center;line-height:50px;background-color:#fff;border:1px solid #ccc;float:left;}
      #res_leftPart ul li:last-child{margin-right:0px;}
      #res_leftPart ul li a{display:block;width:100%;height:100%;color:#666;}
      #res_leftPart ul li.res_ok{background-color:#4F60E3;border:1px solid #4F60E3;}
      #res_leftPart ul li.res_ok a{color:#fff;}

      /*###############################   resume00   ###############################*/
      #resume00{width:980px;margin-bottom:10px;padding:40px;overflow: hidden;background-color:#fff;}

      #resume00 #imgArea{width:148px;height:198px;float: left;margin-right:20px;border:1px solid #ccc;}
      #resume00 #imgArea p{width:100%;height:100%;}

      #resume00 #detailArea{width:810px;float: left;}
      #resume00 #detailArea .detail_title{width:100%;padding-top:9px;height:30px;font-size:24px;font-family:"NotoSansKR-Thin";}
      #resume00 #detailArea .personal_setting{width:110px;height:28px;line-height:28px;font-size:14px;margin-bottom:10px;margin-left:700px;text-align:center;border:1px solid #808495;}
      #resume00 #detailArea .tabelArea{width:100%;text-indent:10px;overflow: hidden;border-top:1px solid #808495;}
      #resume00 #detailArea .tabelArea p{float: left;}
      #resume00 #detailArea .tabelArea .table_title{width:120px;height:39px;line-height:40px;border-bottom:1px solid #ccc;background-color:#808495;color:#fff;}
      #resume00 #detailArea .tabelArea .table_desc{width:285px;height:39px;line-height:40px;border-bottom:1px solid #808495;color:#333;}
      #resume00 #detailArea .tabelArea .table_desc01{width:690px;height:39px;line-height:40px;border-bottom:1px solid #808495;color:#333;}

                            #resume00 #detailArea .personal_setting:hover{background-color:#eee;}

      /*###############################   resume01  ###############################*/
      #resume01{width:100%;overflow:hidden;margin-bottom:10px;}
      #resForm01{width:980px;background-color:#fff;padding:40px;}



      fieldset{border:none;}
      legend{font-size:24px;padding-bottom:20px;font-family:"NotoSansKR-Thin";}
      #resForm01 div{width:100%;}
      caption{display:none;}
      tbody{width:100%;text-align:left;}
      tr{width:100%;font-size:16px;height:80px;}
      th{width:180px;font-family:"NotoSansKR-Medium";}
      th .necessary{padding-left:3px;color:red;}

      td{width:800px;font-size:14px;padding-top:10px;}
      td input[type="button"]{width:120px;height:40px;padding:0 10px;text-align:center;font-size:16px;
                              background-color:#fff;
                              border:1px solid #999;vertical-align:top;margin-right:20px;}
      td input[type="text"]{width:800px;height:40px;background-color:#fff;border:1px solid #999;text-indent:10px;}
      td input::placeholder{color:#ccc;font-size:16px;}
      td input[type="checkbox"]{width:20px;height:20px;vertical-align:bottom;margin-right:5px;border:1px solid #999;}
      td input[type="radio"]{width:20px;height:20px;vertical-align:bottom;margin-right:5px;border:1px solid #999;}

      td span{display:inline-block;padding-right:20px;padding-bottom:10px;}
      td select{width:200px;height:42px;border:1px solid #999;font-size:16px;text-indent:10px;color:#666;vertical-align:top;}
      td textarea{width:100%;height:200px;}
      td input[type="date"]{width:160px;height:40px;border:1px solid #999;font-size:14px;padding:0 10px;color:#666;}
      .comment{color:red;font-size:12px;}


      .moreTab{width:100%;height:40px;border-top:1px solid #ccc;}
      .moreTab input{width:100%;height:100%;border:none;background-color:#fff;font-size:14px;}




      /*###############################   resume02  ###############################*/
      #resume02{width:100%;overflow:hidden;margin-bottom:10px;}
      #resForm02{width:980px;background-color:#fff;padding:40px;}

      /*###############################   resume03  ###############################*/
      #resume03{width:100%;overflow:hidden;margin-bottom:10px;}
      #resForm03{width:980px;background-color:#fff;padding:40px;}
      #resForm03 .final_education{width:980px;height:40px;display: table;background-color:#eee;}
      #resForm03 .final_education th{text-indent:40px;line-height:50px;font-size:14px;}
      #resForm03 .final_education td{padding-top:0;}
      #resForm03 .final_education select{height:40px;vertical-align:middle;margin:5px 0;}
      #resForm03 .education{width:980px;height:120px;}
      #resForm03 .education th{display:none;}
      #resForm03 .education span{padding:0;margin-bottom:5px;}
      #resForm03 #res03_desc02_3{width:40px;height:42px;background-color:#43425D;color:#fff;font-size:14px;padding:0;margin-right:0;}
      #resForm03 #res03_desc03_2{width:280px;}
      #resForm03 #res03_desc03_3{width:274px;}

      #resForm03 input[type="text"]{width:556px;height:40px;}
      #resForm03 input::placeholder{text-indent:10px;font-size:16px;color:#ccc;}

      /*###############################   resume03  ###############################*/
      #resume04{width:100%;overflow:hidden;margin-bottom:10px;}
      #resForm04{width:980px;background-color:#fff;padding:40px;}
      #resForm04 #res04_desc02_2{width:40px;height:42px;background-color:#43425D;color:#fff;font-size:14px;padding:0;margin-right:0;}

      #resForm04 .total_experience{width:980px;height:50px;display: table;background-color:#eee;}
      #resForm04 .total_experience th{text-indent:40px;line-height:50px;font-size:14px;}
      #resForm04 .total_experience td{padding-top:0;}
      #resForm04 .total_experience select{height:40px;vertical-align:middle;margin:5px 0;}
      #resForm04 .experience{width:980px;height:120px;}
      #resForm04 .experience th{display:none;}
      #resForm04 .experience span{padding:0;margin-bottom:5px;}

      #resForm04 input[type="text"]{width:756px;height:40px;}
      #resForm04 input::placeholder{text-indent:10px;font-size:16px;color:#ccc;}
      #resForm04 input[type="checkbox"]{vertical-align:middle;}

      /*###############################   resume05  ###############################*/
      #resume05{width:100%;overflow:hidden;margin-bottom:10px;}
      #resForm05{width:980px;background-color:#fff;padding:40px;}
      #resForm05 th{display:none;}
      #resForm05 td{width:980px;}

      /*###############################   resForm06   ###############################*/
      #resume06{width:100%;overflow:hidden;margin-bottom:10px;}
      #resForm06{width:980px;background-color:#fff;padding:40px;}
      #resForm06 th{display:none;}
      #resForm06 td{width:980px;}
      #resForm06 td p{height:60px;padding:0;float:left;}
      #resForm06 td span{display:inline;font-size:12px;font-family:"NotoSansKR-Medium";}
      #resForm06 td .part01{width:200px;height:40px;}
      #resForm06 td .part01 input{padding:0 10px;width:180px;}
      #resForm06 td .part02{width:570px;height:40px;}
      #resForm06 td .part02 select{display: inline-block;margin:0;width:190px;}
      #resForm06 td .part03{width:166px;height:40px;}
      #resForm06 td .part04{width:40px;height:42px;margin-top:20px;}
      #resForm06 td .part04 input{width:100%;height:100%;background-color:#43425D;color:#fff;font-size:14px;margin-right:0;}
      #resForm06 td input{width:100%;padding:0;}

      /*###############################   resForm07   ###############################*/
      #resume07{width:100%;overflow:hidden;margin-bottom:10px;}
      #resForm07{width:980px;background-color:#fff;padding:40px;}
      #resForm07 th{display:none;}
      #resForm07 td{width:980px;}
      #resForm07 td p{height:60px;padding:0;float:left;}
      #resForm07 td span{display:inline;font-size:12px;font-family:"NotoSansKR-Medium";}
      #resForm07 td .part01{width:200px;height:40px;}
      #resForm07 td .part01 input{padding:0 10px;width:180px;}
      #resForm07 td .part02{width:276px;}
      #resForm07 td .part03{width:90px;}
      #resForm07 td .part04{width:200px;height:44px;}
      #resForm07 td .part05{width:80px;}
      #resForm07 td .part06{width:90px;}
      #resForm07 td .part07{width:80px;}
      #resForm07 td .part08{width:40px;height:42px;margin-top:20px;}
      #resForm07 td .part08 input{width:100%;height:100%;background-color:#43425D;color:#fff;font-size:14px;margin-right:0;}
      #resForm07 td p input{width:100%;padding:0;}
      #resForm07 select{width:100%;}

      /*###############################   resForm08   ###############################*/
      #resume08{width:100%;overflow:hidden;margin-bottom:10px;}
      #resForm08{width:980px;background-color:#fff;padding:40px;}
      #resForm08 legend span{font-size:16px;font-family:"NotoSansKR-Regular";}
      #resForm08 th{display:none;}
      #resForm08 td{width:980px;}
      #resForm08 input[type="text"]{width:980px;}
      #resForm08 textarea{width:980px;}

      /*###############################   resForm09   ###############################*/
      #resume09{width:100%;overflow:hidden;margin-bottom:10px;}
      #resForm09{width:980px;background-color:#fff;padding:40px;}
      #resForm09 th{display:none;}
      #resForm09 td{width:980px;}

      #resForm09 .file_btn{border:none;}
      #resForm09 input[type="file"]{position: absolute;
                                    width: 0;
                                    height: 0;
                                    padding: 0;
                                    overflow: hidden;
                                    border: 0;
                                }
    #resForm09 label {font-family:"NotoSansKR-Medium";
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
    #resForm09 #res09_desc01{

                        display: inline-block;
                        width:832px;
                        height: 40px;
                        font-size:16px;
                        color:#ccc;
                        padding: 0 10px;
                          vertical-align: middle;
                          background-color: #f5f5f5;
                        border: 1px solid #ebebeb;


                      }





  /*###################################   reg_rightPart   ###################################*/
      #res_rightPart{width:210px;float:left;}
      #res_rightPart ul{width:100%;}
      #res_rightPart ul li{width:198px;height:78px;margin-bottom:5px;text-align:center;line-height:80px;background-color:#fff;border:1px solid #ccc;}
      #res_rightPart ul li a{display:block;width:100%;height:100%;color:#666;}
      #res_rightPart ul li.res_ok{background-color:#4F60E3;border:1px solid #4F60E3;}
      #res_rightPart ul li.res_ok a{color:#fff;}



	 </style>
  </head>
  <body>
      <div id="allworkWrap">
        <div id="headerWrap">
          <div id="topWrap">
            <h1><a href="/index.do" title="올워크홈">Allwork</a></h1>
            <ul class="topMenu">
              <li><a href="/personalHome.do" title="개인회원 홈">개인회원 홈&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
              <li><a href="#none" title="이력서 관리">이력서 관리</a></li>
            </ul>
          </div>
        </div>
        <div id="containerWrap">
          <div id="container">
            <div id="res_leftPart">
              <div id="resume00">
                <div id="imgArea">
                  <p></p>
                </div>
                <div id="detailArea">
                  <p class="detail_title">기본정보</p>
                  <p class="personal_setting"><a href="#none" title="기본정보수정"><i class="fas fa-cog"></i>&nbsp;기본정보수정</a></p>
                  <div class="tabelArea">
                    <p class="table_title">이름</p><p class="table_desc">홍길동</p>
                    <p class="table_title">이메일</p><p class="table_desc">asdf@naver.com</p>
                    <p class="table_title">휴대폰</p><p class="table_desc">010-000-0000</p>
                    <p class="table_title">연락처</p><p class="table_desc">-</p>
                    <p class="table_title">주소</p><p class="table_desc01">[463-869] 경기 성남시 분당구 정자일로 156</p>
                  </div>
                </div>
              </div>
              <div id="resume01">
                <form id="resForm01" action="#none" method="post">
                  <fieldset>
                    <legend>이력서 등록하기</legend>
                    <div>
                      <table>
                        <caption>이력서 등록하기</caption>
                        <tbody>
                          <tr>
                            <th>이력서 공개<span class="necessary">*</span></th>
                            <td>
                              <span><input id="res01_desc01" type="radio" name="res01_desc01"/><label for="res01_desc01">&nbsp;공개</label></span>
                              <span><input id="res01_desc01_1" type="radio" name="res01_desc01_1"/><label for="res01_desc01_1">&nbsp;비공개</label></span>
                            </td>
                          </tr>
                          <tr>
                            <th>이력서 유형<span class="necessary">*</span></th>
                            <td>
                              <span><input id="res01_desc02" type="radio" name="res01_desc02"/><label for="res01_desc02">&nbsp;모두</label></span>
                              <span><input id="res01_desc02_1" type="radio" name="res01_desc02_1"/><label for="res01_desc02_1">&nbsp;일반</label></span>
                              <span><input id="res01_desc02_2" type="radio" name="res01_desc02_2"/><label for="res01_desc02_2">&nbsp;아르바이트</label></span>
                              <span><input id="res01_desc02_3" type="radio" name="res01_desc02_3"/><label for="res01_desc02_3">&nbsp;프리랜서</label></span>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </fieldset>
                </form>
              </div>
              <div id="resume02">
                <form id="resForm02" action="#none" method="post">
                  <fieldset>
                    <legend>희망구직 정보</legend>
                    <table>
                      <caption>희망구직 정보</caption>
                      <tbody>
                        <tr>
                          <th>이력서 제목<span class="necessary">*</span></th>
                          <td>
                            <span><input id="res02_desc01" type="text" name="res02_desc01" placeholder="(예 : ASP, SQL, MT 웹프로그래밍)"/></span>
                            <span>이력서 제목은 이력서 열람여부를 결정짓는 중요한 부분이므로 희망직무 또는 구체적인 지원분야를 쓰시는 것이 좋습니다.</span>
                          </td>
                        </tr>
                        <tr>
                          <th>현재상태</th>
                            <td>
                            <span><input id="res02_desc02" type="radio" name="res02_desc02"/><label for="res02_desc02">&nbsp;&nbsp;구직희망(미취업)</label></span>
                            <span><input id="res02_desc02_1" type="radio" name="res02_desc02_1"/><label for="res02_desc02_1">&nbsp;&nbsp;이직희망(재직중)</label></span>
                            <span><input id="res02_desc02_2" type="radio" name="res02_desc02_2"/><label for="res02_desc02_2">&nbsp;&nbsp;구직희망안함</label></span>
                          </td>
                        </tr>
                        <tr>
                          <th>근무지역<span class="necessary">*</span></th>
                          <td>
          									<select id="res02_desc03" name="res02_desc03" title="1차지역선택">
                              <option value="1차지역선택">1차지역선택</option>
          										<option value="전체">전체</option>
          										<option value="서울">서울</option>
          										<option value="인천">인천</option>
          										<option value="경기">경기</option>
          										<option value="광주">광주</option>
                              <option value="대전">대전</option>
                              <option value="대구">대구</option>
                              <option value="부산">부산</option>
                              <option value="세종">세종</option>
          										<option value="울산">울산</option>
          										<option value="강원">강원</option>
          										<option value="경북">경북</option>
          										<option value="경남">경남</option>
                              <option value="전남">전남</option>
                              <option value="전북">전북</option>
                              <option value="충남">충남</option>
                              <option value="충북">충북</option>
                              <option value="제주">제주</option>
          									</select>
                            <select id="res02_desc03_1" name="res02_desc03_1" title="2차지역선택">
          										<option value="2차지역선택">2차지역선택</option>
          									</select>
                            <select id="res02_desc03_2" name="res02_desc03_2" title="3차지역선택">
          										<option value="3차지역선택">3차지역선택</option>
          									</select>
                            <input id="res02_desc03_3" type="button" name="res02_desc03_3" value="+ 추가"/>
                          </td>
                        </tr>
                        <tr>
                          <th>직무분야<span class="necessary">*</span></th>
                          <td>
          									<select id="res02_desc04" name="res02_desc04" title="1차직무선택">
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
                            <select id="res02_desc04_1" name="res02_desc04_1" title="2차직무선택">
          										<option value="2차직무선택">2차직무선택</option>
          									</select>
                            <select id="res02_desc04_2" name="res02_desc04_2" title="3차직무선택">
          										<option value="3차직무선택">3차직무선택</option>
          									</select>
                            <input id="res02_desc04_3" type="button" name="res02_desc04_3" value="+ 추가"/>
                          </td>
                        </tr>
                        <tr>
                          <th>산업분야<span class="necessary">*</span></th>
                          <td>
          									<select id="res02_desc05" name="res02_desc05" title="1차산업선택">
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
                            <select id="res02_desc05_1" name="res02_desc05_1" title="2차산업선택">
          										<option value="2차산업선택">2차산업선택</option>
          									</select>
                            <select id="res02_desc05_2" name="res02_desc05_2" title="3차산업선택">
          										<option value="3차산업선택">3차산업선택</option>
          									</select>
                            <input id="res02_desc05_3" type="button" name="res02_desc05_3" value="+ 추가"/>
                          </td>
                        </tr>
                        <tr>
                          <th>선택적 직무</th>
                          <td>
                            <span><input id="res02_desc06" type="radio" name="res02_desc06"/><label for="res02_desc06">&nbsp;운전전문직군</label></span>
                            <span><input id="res02_desc06_1" type="radio" name="res02_desc06_1"/><label for="res02_desc06_1">&nbsp;경비직군</label></span>
                            <span><input id="res02_desc06_2" type="radio" name="res02_desc06_2"/><label for="res02_desc06_2">&nbsp;일반관리직</label></span>
                            <span class="comment">위 직무분야 외 선택적 직무</span>
                          </td>
                        </tr>
                        <tr>
                          <th>희망근무형태<span class="necessary">*</span></th>
                          <td>
                            <span><input id="res02_desc07" type="checkbox" name="res02_desc07"/><label for="res02_desc07">정규직</label></span>
                            <span><input id="res02_desc07_1" type="checkbox" name="res02_desc07_1"/><label for="res02_desc07_1">계약직</label></span>
                            <span><input id="res02_desc07_2" type="checkbox" name="res02_desc07_2"/><label for="res02_desc07_2">프리랜서</label></span>
                            <span><input id="res02_desc07_3" type="checkbox" name="res02_desc07_3"/><label for="res02_desc07_3">아르바이트</label></span>
                            <span><input id="res02_desc07_4" type="checkbox" name="res02_desc07_4"/><label for="res02_desc07_4">추후협의</label></span>
                          </td>
                        </tr>
                        <tr>
                          <th>희망연봉<span class="necessary">*</span></th>
                          <td>
          									<select id="res02_desc08" name="res02_desc08" title="연봉/시급선택">
          										<option value="연봉/시급선택">연봉/시급선택</option>
          										<option value="연봉">연봉</option>
                              <option value="시급">시급</option>
          									</select>
                            <select id="res02_desc08_1" name="res02_desc08_1" title="연봉선택">
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
                      </tbody>
                    </table>
                  </fieldset>
                </form>
              </div>
              <div id="resume03">
                <form id="resForm03" action="#none" method="post">
                  <fieldset>
                  <legend>학력사항</legend>
                    <table>
                      <caption>학력사항</caption>
                      <tbody>
                        <tr class="final_education">
                          <th>최종학력</th>
                          <td>
                            <select id="res03_desc01" name="res03_desc01" title="학력 선택">
                              <option value="학력 무관">학력 무관</option>
                              <option value="고등학교졸업">고등학교졸업</option>
                              <option value="대학졸업(2,3년)">대학졸업(2,3년)</option>
                              <option value="대학졸업(4년)">대학졸업(4년)</option>
                              <option value="대학원 석사졸업">대학원 석사졸업</option>
                              <option value="대학원 박사졸업">대학원 박사졸업</option>
                            </select>
                          </td>
                        </tr>
                        <tr class="education">
                          <th>학력</th>
                          <td>
                            <span>
                              <input id="res03_desc02" type="date" name="res03_desc02"/><!--
                              --><select id="res03_desc02_1" name="res03_desc02_1" title="학교구분">
                                <option value="학교구분">학교구분</option>
                                <option value="학력 무관">학력 무관</option>
                                <option value="고등학교졸업">고등학교졸업</option>
                                <option value="대학졸업(2,3년)">대학졸업(2,3년)</option>
                                <option value="대학졸업(4년)">대학졸업(4년)</option>
                                <option value="대학원 석사졸업">대학원 석사졸업</option>
                                <option value="대학원 박사졸업">대학원 박사졸업</option>
                              </select><!--
                              --><input id="res03_desc02_2" type="text" name="res03_desc02_2" placeholder="학교명"/><!--
                              --><input id="res03_desc02_3" type="button" name="res03_desc02_3" value="삭제"/>
                            </span>
                            <span>
                              <input id="res03_desc03" type="date" name="res03_desc03"/><!--
                              --><select id="res03_desc03_1" name="res03_desc03_1" title="졸업상태">
                                <option value="졸업상태">졸업상태</option>
                                <option value="졸업">졸업</option>
                                <option value="재학">재학</option>
                                <option value="퇴학">퇴학</option>
                                <option value="휴학">휴학</option>
                                <option value="졸업예정">졸업예정</option>
                                <option value="수료">수료</option>
                              </select><!--
                              --><input id="res03_desc03_2" type="text" name="res03_desc03_2" placeholder="학교명"/><!--
                              --><input id="res03_desc03_3" type="text" name="res03_desc03_3" placeholder="전공명"/>
                            </span>
                            <span class="comment"> 다중 경력자는 [추가]를 클릭하면 현재 입력폼에서 추가 경력을 작성할 수 있습니다.</span>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </fieldset>
                </form>
                <p class="moreTab"><input id="more_btn" type="button" name="more_btn" value="+ 추가"/></p>
              </div>
              <div id="resume04">
                <form id="resForm04" action="#none" method="post">
                  <fieldset>
                  <legend>경력사항</legend>
                    <table>
                      <caption>경력사항</caption>
                      <tbody>
                        <tr class="total_experience">
                          <th>총 경력년수</th>
                          <td>
                              <select id="res04_desc01" name="res04_desc01" title="경력연차">
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
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                              </select>&nbsp;년
                              <select id="res04_desc01_1" name="res04_desc01_1" title="경력연차">
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
                              </select>&nbsp;개월
                              <input id="res04_desc01_2" type="checkbox" name="res04_desc01_2"/><label for="res04_desc01_2">신입</label>
                          </td>
                        </tr>
                        <tr class="experience">
                          <th>경력</th>
                          <td>
                            <span>
                              <input id="res04_desc02" type="date" name="res04_desc02"/><!--
                              --><input id="res04_desc02_1" type="text" name="res04_desc02_1" placeholder="회사명"/><!--
                              --><input id="res04_desc02_2" type="button" name="res04_desc02_2" value="삭제"/>
                            </span>
                            <span>
                              <input id="res04_desc03" type="date" name="res04_desc03"/><!--
                              --><input id="res04_desc03_1" type="text" name="res04_desc03_1" placeholder="담당업무"/>
                            </span>
                            <span class="comment"> 다중 경력자는 [추가]를 클릭하면 현재 입력폼에서 추가 경력을 작성할 수 있습니다.</span>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </fieldset>
                </form>
                <p class="moreTab"><input id="more_btn01" type="button" name="more_btn01" value="+ 추가"/></p>
              </div>
              <div id="resume05">
                <form id="resForm05" action="#none" method="post">
                  <fieldset>
                  <legend>보유기술</legend>
                    <table>
                      <caption>보유기술</caption>
                      <tbody>
                        <tr>
                          <th>보유기술</th>
                          <td><textarea id="res05_desc01" name="res05_desc01"></textarea></td>
                        </tr>
                      </tbody>
                    </table>
                  </fieldset>
                </form>
              </div>
              <div id="resume06">
                <form id="resForm06" action="#none" method="post">
                  <fieldset>
                  <legend>자격사항</legend>
                    <table>
                      <caption>자격사항</caption>
                      <tbody>
                        <tr>
                          <th>자격사항</th>
                          <td>
                            <p class="part01"><span>취득일자</span><br/><input id="res06_desc01" type="date" name="res06_desc01" value="년/월/일"/></p>
                            <p class="part02"><span>자격증명</span><br/>
                              <select id="res06_desc01_1" name="res06_desc01_1" title="자격증1차선택">
                                <option value="자격증 1차선택">자격증 1차선택</option>
                                <option value="기계·전자">기계·전자</option>
                                <option value="생산·공정·품질">생산·공정·품질</option>
                                <option value="건설·건축·화학">건설·건축·화학</option>
                                <option value="경제·경영·금융·무역">경제·경영·금융·무역</option>
                                <option value="산업·안전·환경">산업·안전·환경</option>
                                <option value="IT·정보통신	보건·복지·위생">IT·정보통신	보건·복지·위생</option>
                              </select><!--
                              --><select id="res06_desc01_2" name="res06_desc01_2" title="자격증2차선택">
                                <option value="자격증 2차선택">자격증 2차선택</option>
                                <option value="기계">기계</option>
                                <option value="전자">전자</option>
                              </select><!--
                              --><select id="res06_desc01_3" name="res06_desc01_3" title="자격증2차선택">
                                <option value="자격증 3차선택">자격증 3차선택</option>
                                <option value="건설기계기술사">건설기계기술사</option>
                                <option value="건설기계설비기사">건설기계설비기사</option>
                                <option value="건설기계설비산업기사">건설기계설비산업기사</option>
                                <option value="건설기계정비기능사">건설기계정비기능사</option>
                                <option value="건설기계정비기능장">건설기계정비기능장</option>
                                <option value="건설기계정비기사">건설기계정비기사</option>
                                <option value="건설기계정비산업기사">건설기계정비산업기사</option>
                                <option value="건축기계설비기술사">건축기계설비기술사</option>
                                <option value="공조냉동기계기능사">공조냉동기계기능사</option>
                                <option value="공조냉동기계기사">공조냉동기계기사</option>
                                <option value="공조냉동기계기술사">공조냉동기계기술사</option>
                                <option value="공조냉동기계산업기사">공조냉동기계산업기사</option>
                                <option value="기계가공기능장">기계가공기능장</option>
                                <option value="기계가공조립기능사">기계가공조립기능사</option>
                                <option value="기계기술사">기계기술사</option>
                                <option value="기계설계기사">기계설계기사</option>
                                <option value="기계설계산업기사">기계설계산업기사</option>
                                <option value="기계안전기술사">기계안전기술사</option>
                                <option value="기계정비기능사">기계정비기능사</option>
                                <option value="기계정비산업기사">기계정비산업기사</option>
                                <option value="기계조립산업기사">기계조립산업기사</option>
                                <option value="농기계정비기능사">농기계정비기능사</option>
                                <option value="농업기계기사">농업기계기사</option>
                                <option value="농업기계산업기사">농업기계산업기사</option>
                                <option value="동력기계정비기능사">동력기계정비기능사</option>
                                <option value="산업기계설비기술사">산업기계설비기술사</option>
                                <option value="소방설비기사(기계분야)">소방설비기사(기계분야)</option>
                                <option value="소방설비산업기사(기계분야)">소방설비산업기사(기계분야)</option>
                                <option value="일반기계기사">일반기계기사</option>
                                <option value="전산응용기계제도기능사">전산응용기계제도기능사</option>
                              </select>
                            </p>
                            <p class="part03"><span>발행처</span><br/><input id="res06_desc01_4" type="text" name="res06_desc01_4"/></p>
                            <p class="part04"><input id="res06_desc01_5" type="button" name="res06_desc01_5" value="삭제"/></p>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </fieldset>
                </form>
                <p class="moreTab"><input id="more_btn03" type="button" name="more_btn03" value="+ 추가"/></p>
              </div>
              <div id="resume07">
                <form id="resForm07" action="#none" method="post">
                  <fieldset>
                  <legend>외국어</legend>
                    <table>
                      <caption>외국어</caption>
                      <tbody>
                        <tr>
                          <th>외국어</th>
                          <td>
                            <p class="part01"><span>취득일자</span><br/><input id="res07_desc01" type="date" name="res07_desc01"/></p>
                            <p class="part02"><span>외국어명</span><br/><input id="res07_desc01_1" type="text" name="res07_desc01_1"/></p>
                            <p class="part03">
                              <span>수준</span><br/>
                              <select id="res07_desc01_2" name="res07_desc01_2" title="선택">
                                <option value="선택">선택</option>
                                <option value="상">상</option>
                                <option value="중">중</option>
                                <option value="하">하</option>
                              </select>
                            </p>
                            <p class="part04"><span>발행처</span><br/><input id="res07_desc01_3" type="text" name="res07_desc01_3"/></p>
                            <p class="part05"><span>점수</span><br/><input id="res07_desc01_4" type="text" name="res07_desc01_4"/></p>
                            <p class="part06">
                              <span>점수/등급</span><br/>
                              <select id="res07_desc01_5" name="res07_desc01_5" title="선택">
                                <option value="선택">선택</option>
                                <option value="상">점</option>
                                <option value="중">중</option>
                                <option value="하">하</option>
                              </select>
                            </p>
                            <p class="part08"><input id="res07_desc01_6" type="button" name="res07_desc01_6" value="삭제"/></p>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </fieldset>
                </form>
                <p class="moreTab"><input id="more_btn02" type="button" name="more_btn02" value="+ 추가"/></p>
              </div>
              <div id="resume08">
                <form id="resForm08" action="#none" method="post">
                  <fieldset>
                  <legend>자기소개서<span>(경력위주로 작성해주세요)</span></legend>
                    <table>
                      <caption>자기소개서</caption>
                      <tbody>
                        <tr>
                          <th>자기소개서</th>
                          <td>
                            <span><input id="res08_desc01" type="text" name="res08_desc01" placeholder="자기소개서 제목"/></span>
                            <textarea id="res08_desc01_1"></textarea>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </fieldset>
                </form>
              </div>
              <div id="resume09">
                <form id="resForm09" action="#none" method="post">
                  <fieldset>
                  <legend>파일 첨부하기</legend>
                    <table>
                      <caption>파일 첨부하기</caption>
                      <tbody>
                        <tr>
                          <th>파일 첨부하기</th>
                          <td>
                            <span class="file_btn"><input id="res09_desc01"/><label for="res09_desc01_1">파일첨부</label><input id="res09_desc01_1" type="file" name="res09_desc01"/></span>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </fieldset>
                </form>
              </div>
              <ul>
                <li><a href="#none" title="미리보기">미리보기</a></li>
                <li><a href="#none" title="임시저장">임시저장</a></li>
                <li class="res_ok"><a href="#none" title="등록완료">등록완료</a></li>
              </ul>
            </div>
            <div id="res_rightPart">
              <ul>
                <li><a href="#none" title="미리보기">미리보기</a></li>
                <li><a href="#none" title="임시저장">임시저장</a></li>
                <li class="res_ok"><a href="#none" title="등록완료">등록완료</a></li>
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

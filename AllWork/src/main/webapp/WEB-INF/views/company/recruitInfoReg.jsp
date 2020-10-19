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
  <link rel="stylesheet" type="text/css" href="/css/company_01.css"/>
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
        <div id="topWrap">
          <h1><a href="/index.do" title="올워크홈">Allwork</a></h1>
          <ul class="topMenu">
            <li><a href="/index.do" title="기업정보/관리">올워크&nbsp;&nbsp;<i class="fas fa-chevron-down"></i>&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
            <li><a href="#none" title="고객센터">고객센터&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
            <li><a href="/companyHome.do" title="기업회원 홈">기업회원 홈</a></li>
          </ul>
        </div>
        <div id="headWrap">
          <div id="head">
            <p><a href="/companyHome.do" title="기업홈">${SE_USER_NM}</a></p>
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
                <p class="company_name">${SE_USER_NM}</p>
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
            									<select id="reg02_desc05" name="reg02_desc05" title="시도선택">
                                <option value="시도선택">시도선택</option>
            										<option value="전체">전국</option>
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
                                <option value="해외">해외</option>
            									</select>
                              <select id="reg02_desc05_1" name="reg02_desc05_1" title="시군선택">
                                <option value="시군선택">시구군선택</option>
                                <option value="서울전체">서울전체</option>
            										<option value="강남구">강남구</option>
            										<option value="강동구">강동구</option>
            										<option value="강북구">강북구</option>
            										<option value="강서구">강서구</option>
                                <option value="관악구">관악구</option>
                                <option value="광진구">광진구</option>
                                <option value="구로구">구로구</option>
                                <option value="금천구">금천구</option>
            										<option value="노원구">노원구</option>
            										<option value="도봉구">도봉구</option>
            										<option value="동대문구">동대문구</option>
            										<option value="동작구">동작구</option>
                                <option value="마포구">마포구</option>
                                <option value="서대문구">서대문구</option>
                                <option value="서초구">서초구</option>
                                <option value="성동구">성동구</option>
                                <option value="성북구">성북구</option>
                                <option value="송파구">송파구</option>
                                <option value="양천구">양천구</option>
                                <option value="영등포구">영등포구</option>
                                <option value="용산구">용산구</option>
                                <option value="은평구">은평구</option>
                                <option value="종로구">종로구</option>
                                <option value="중구">중구</option>
                                <option value="중랑구">중랑구</option>
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
            										<option value="연봉">연봉</option>
                                <option value="시급">월급</option>
                                <option value="시급">주급</option>
                                <option value="시급">일급</option>
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
            										<option value="고등학교졸업">고등학교졸업 이상</option>
            										<option value="대학졸업(2,3년)">대학졸업(2,3년) 이상</option>
            										<option value="대학졸업(4년)">대학졸업(4년) 이상</option>
            										<option value="석사">석사 이상</option>
                                <option value="박사">박사 이상</option>
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

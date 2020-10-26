<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_connectSetting.css"/>

<div id="containerWrap">
<div id="container">
<div id="leftPart">
<jsp:include page="/personSubMenu.do" />
</div>
<div id="rightPart">
<div id="resume02">
<form id="resForm02" action="#none" method="post">
<fieldset>
<legend>맞춤서비스설정</legend>
<table>
<caption>맞춤서비스설정</caption>
<tbody>
<tr>
<th>모집업종</th>
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
<th>근무지역</th>
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
<select id="reg02_desc05_1" name="reg02_desc05_1" title="시구군선택">
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
<input id="res02_desc03_3" type="button" name="res02_desc03_3" value="+ 추가"/>
</td>
</tr>
<tr>
<th>성별</th>
<td>
<span><input id="reg02_desc13" type="radio" name="reg02_desc13"/><label for="reg02_desc13">성별무관</label></span>
<span><input id="reg02_desc13_1" type="radio" name="reg02_desc13_1"/><label for="reg02_desc13_1">남자</label></span>
<span><input id="reg02_desc13_2" type="radio" name="reg02_desc13_2"/><label for="reg02_desc13_2">여자</label></span>
</td>
</tr>
<tr>
<th>고용형태</th>
<td>
<span><input id="res02_desc07" type="checkbox" name="res02_desc07"/><label for="res02_desc07">정규직</label></span>
<span><input id="res02_desc07_1" type="checkbox" name="res02_desc07_1"/><label for="res02_desc07_1">계약직</label></span>
<span><input id="res02_desc07_2" type="checkbox" name="res02_desc07_2"/><label for="res02_desc07_2">프리랜서</label></span>
<span><input id="res02_desc07_3" type="checkbox" name="res02_desc07_3"/><label for="res02_desc07_3">아르바이트</label></span>
<span><input id="res02_desc07_4" type="checkbox" name="res02_desc07_4"/><label for="res02_desc07_4">추후협의</label></span>
</td>
</tr>
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
<tr>
<th>경력사항</th>
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
<th>급여정도</th>
<td>
<select id="res02_desc08" name="res02_desc08" title="연봉/시급선택">
<option value="연봉">연봉</option>
<option value="시급">월급</option>
<option value="시급">주급</option>
<option value="시급">일급</option>
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
<ul>
<li><a href="#none" title="보러가기">보러가기</a></li>
<li class="reg_ok"><a href="#none" title="설정하기">설정하기</a></li>
</ul>
</div>
</div>
</div>
</div>

<jsp:include page="/footer.do" />


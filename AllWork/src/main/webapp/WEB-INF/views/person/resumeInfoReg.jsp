<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/resume.css"/>


<div id="containerWrap">
<div id="container">
<div id="leftPart">
<jsp:include page="/personSubMenu.do" />
<div id="leftPart_buttom">
<ul>
<li><a href="#none" title="미리보기">미리보기</a></li>
<li><a href="#none" title="임시저장">임시저장</a></li>
<li class="res_ok"><a href="#none" title="등록완료">등록완료</a></li>
</ul>
</div>
</div>
<div id="rightPart">
<div id="resume00">
<div id="detailArea">
<p class="detail_title">기본정보</p>
<p class="personal_setting"><a href="#none" title="기본정보수정"><i class="fas fa-cog"></i>&nbsp;기본정보수정</a></p>
<div id="imgArea">
<p><img src="img/company_home/img00.jpeg" alt="본인사진"/></p>
</div>
<table>
<caption>이력 등록하기</caption>
<tbody class="tabelArea">
<tr><th class="table_title">이름</th><td class="table_desc">${memberMap.name }</td></tr>
<tr><th class="table_title">이메일</th><td class="table_desc">${memberMap.email }</td></tr>
<tr><th class="table_title">휴대폰</th><td class="table_desc">${memberMap.hphone }</td></tr>
<tr><th class="table_title">연락처</th><td class="table_desc">${memberMap.phone }</td></tr>
<tr><th class="table_title">주소</th><td class="table_desc">[${memberMap.post }] ${memberMap.address1 } ${memberMap.address2 }</td></tr>
</tbody>
</table>
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
<span><input id="inidTitle" type="radio" name="inidTitle"/><label for="res01_desc01">&nbsp;공개</label></span>
<span><input id="inidTitle" type="radio" name="inidTitle"/><label for="res01_desc01_1">&nbsp;비공개</label></span>
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
<th>보유기술</th>
<td><textarea id="res02_desc09" name="res02_desc09"></textarea></td>
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
<select id="reg02_desc05" name="reg02_desc05" title="시도선택" value="시도선택">
<option value="hidden">시도선택</option>
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
<option value="hidden">시구군선택</option>
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
<input id="res02_desc03_3" type="button" name="res02_desc03_3" value="+ 삭제"/>
</td>
</tr>
<tr>
<th>직무분야<span class="necessary">*</span></th>
<td>
<select id="res02_desc04" name="res02_desc04" title="1차직무선택">
<option value="hidden">1차직무선택</option>
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
<option value="hidden">2차직무선택</option>
</select>
<select id="res02_desc04_2" name="res02_desc04_2" title="3차직무선택">
<option value="hidden">3차직무선택</option>
</select>
<input id="res02_desc04_3" type="button" name="res02_desc04_3" value="+ 추가"/>
<input id="res02_desc03_3" type="button" name="res02_desc03_3" value="+ 삭제"/>
</td>
</tr>
<tr>
<th>산업분야<span class="necessary">*</span></th>
<td>
<select id="res02_desc05" name="res02_desc05" title="1차산업선택">
<option value="hidden">1차산업선택</option>
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
<option value="hidden">2차산업선택</option>
</select>
<select id="res02_desc05_2" name="res02_desc05_2" title="3차산업선택">
<option value="hidden">3차산업선택</option>
</select>
<input id="res02_desc05_3" type="button" name="res02_desc05_3" value="+ 추가"/>
<input id="res02_desc03_3" type="button" name="res02_desc03_3" value="+ 삭제"/>
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
<input id="res03_desc02" type="date" placeholder="yyyy-mm-dd" name="res03_desc02"/>
<select id="res03_desc02_1" name="res03_desc02_1" title="학교구분">
<option value="학교구분">학교구분</option>
<option value="학력 무관">학력 무관</option>
<option value="고등학교졸업">고등학교졸업</option>
<option value="대학졸업(2,3년)">대학졸업(2,3년)</option>
<option value="대학졸업(4년)">대학졸업(4년)</option>
<option value="대학원 석사졸업">대학원 석사졸업</option>
<option value="대학원 박사졸업">대학원 박사졸업</option>
</select>
<input id="res03_desc02_2" type="text" name="res03_desc02_2" placeholder="학교명"/>
</span>
<span>
<input id="res03_desc03" type="date" placeholder="yyyy-mm-dd" name="res03_desc03"/>
<select id="res03_desc03_1" name="res03_desc03_1" title="졸업상태">
<option value="졸업상태">졸업상태</option>
<option value="졸업">졸업</option>
<option value="재학">재학</option>
<option value="퇴학">퇴학</option>
<option value="휴학">휴학</option>
<option value="졸업예정">졸업예정</option>
<option value="수료">수료</option>
</select>
<input id="res03_desc03_2" type="text" name="res03_desc03_2" placeholder="학교명"/>
<input id="res03_desc03_3" type="text" name="res03_desc03_3" placeholder="전공명"/>
</span>
<span class="comment"> 다중 경력자는 [추가]를 클릭하면 현재 입력폼에서 추가 경력을 작성할 수 있습니다.</span>
</td>
</tr>
</tbody>
</table>
</fieldset>
</form>
<p class="moreTab">
<input id="more_btn" type="button" name="more_btn" value="+ 추가"/>
<input id="res03_desc02_3" type="button" name="res03_desc02_3" value="-  삭제"/>
</p>
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
<input id="res04_desc02" type="date" placeholder="yyyy-mm-dd" name="res04_desc02"/>
<input id="res04_desc02_1" type="text" name="res04_desc02_1" placeholder="회사명"/>
</span>
<span>
<input id="res04_desc03" type="date" placeholder="yyyy-mm-dd" name="res04_desc03"/>
<input id="res04_desc03_1" type="text" name="res04_desc03_1" placeholder="담당업무"/>
</span>
<span class="comment"> 다중 경력자는 [추가]를 클릭하면 현재 입력폼에서 추가 경력을 작성할 수 있습니다.</span>
</td>
</tr>
</tbody>
</table>
</fieldset>
</form>
<p class="moreTab">
<input id="more_btn01" type="button" name="more_btn01" value="+ 추가"/>
<input id="res04_desc02_2" type="button" name="res04_desc02_2" value="삭제"/>
</p>
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
<p class="part01"><span>취득일자</span><br/><input id="res06_desc01" type="date" placeholder="yyyy-mm-dd" name="res06_desc01"/></p>
<p class="part02"><span>자격증명</span><br/>
<select id="res06_desc01_1" name="res06_desc01_1" title="자격증1차선택">
<option value="hidden">자격증 1차선택</option>
<option value="기계·전자">기계·전자</option>
<option value="생산·공정·품질">생산·공정·품질</option>
<option value="건설·건축·화학">건설·건축·화학</option>
<option value="경제·경영·금융·무역">경제·경영·금융·무역</option>
<option value="산업·안전·환경">산업·안전·환경</option>
<option value="IT·정보통신	보건·복지·위생">IT·정보통신	보건·복지·위생</option>
</select>
<select id="res06_desc01_2" name="res06_desc01_2" title="자격증2차선택">
<option value="hidden">자격증 2차선택</option>
<option value="기계">기계</option>
<option value="전자">전자</option>
</select>
<select id="res06_desc01_3" name="res06_desc01_3" title="자격증2차선택">
<option value="hidden">자격증 3차선택</option>
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
</td>
</tr>
</tbody>
</table>
</fieldset>
</form>
<p class="moreTab">
<input id="more_btn03" type="button" name="more_btn03" value="+ 추가"/>
<input id="res04_desc02_2" type="button" name="res04_desc02_2" value="삭제"/>
</p>
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
<p class="part01"><span>취득일자</span><br/><input id="res07_desc01" type="date" placeholder="yyyy-mm-dd"  name="res07_desc01"/></p>
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
</td>
</tr>
</tbody>
</table>
</fieldset>
</form>
<p class="moreTab">
<input id="more_btn02" type="button" name="more_btn02" value="+ 추가"/>
<input id="res04_desc02_2" type="button" name="res04_desc02_2" value="삭제"/>
</p>
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
</div>
</div>

<jsp:include page="/footer.do" />


<script type="text/javascript">

	var bizDetail_object = [];	

	$(document).ready(function(){
		
		nhn.husky.EZCreator.createInIFrame({
	        oAppRef: bizVision_object,
	        elPlaceHolder: "bizDetail",
	        sSkinURI: "/smartEditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	        }
	    });
		
		$(".reg_ok").on("click", function(e){
			registResume();
		});
	});	
	
	
	function registResume(){
		var callback = function(data){
			alert("저장 되었습니다.");
		};
		
		var param = {
					
				};
		ajax('post', '/registResume.ajax', param, callback);
	}
	
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/myCompany.css"/>

<div id="containerWrap">
<div id="container">
<div id="leftPart">
<jsp:include page="/companySubMenu.do" />
</div>
<div id="rightPart">
<h4>회원정보수정</h4>
<form action="#none" method="post">
<fieldset>
<legend>회원정보수정</legend>
<div class="myCompanyBox01">
<table>
<caption>기업정보<span>*표시는 필수 입력사항</span></caption>
<tbody>
<tr>
<th>대표자명(CEO)<span class="necessary">*</span></th>
<td><input id="username" type="text" name="username" title="이름"/></td>
</tr>
<tr>
<th>회사명<span class="necessary">*</span></th>
<td>
<input id="userid" type="text" name="userid" title="아이디"/>
</td>
</tr>
<tr class="companyNum">
<th>사업자번호<span class="necessary">*</span></th>
<td>
<select>
<option value="선택">개인사업자</option>
<option value="경영·사무">법인사업자</option>
</select>
<span><input type="text"/></span>
</td>
</tr>
<tr>
<th>업종<span class="necessary">*</span></th>
<td>
<select>
<option value="선택">선택</option>
<option value="경영·사무">경영·사무</option>
<option value="마케팅·광고·홍보">마케팅·광고·홍보</option>
<option value="IT·인터넷">IT·인터넷</option>
<option value="디자인">디자인</option>
<option value="무역·유통">무역·유통</option>
<option value="영업·고객상담">영업·고객상담</option>
<option value="서비스">서비스</option>
<option value="연구개발·설계">연구개발·설계</option>
<option value="생산·제조">생산·제조</option>
<option value="교육">교육</option>
<option value="건설">건설</option>
<option value="의료">의료</option>
<option value="미디어">미디어</option>
<option value="전문·특수직">전문·특수직</option>
</select>
</td>
</tr>
<tr>
<th>상장여부</th>
<td>
<select>
<option value="비상장">비상장</option>
<option value="상장">상장</option>
</select>
</td>
</tr>
<tr>
<th>기업형태</th>
<td>
<select>
<option value="선택">선택</option>
<option value="중소기업(300명이하)">중소기업(300명이하)</option>
<option value="중견기업(300명이상)">중견기업(300명이상)</option>
<option value="대기업">대기업</option>
<option value="대기업 자회사·계열사">대기업 자회사·계열사</option>
<option value="벤처기업">벤처기업</option>
<option value="외국계(외국 투자기업)">외국계(외국 투자기업)</option>
<option value="외국계(외국 법인기업)">외국계(외국 법인기업)</option>
<option value="국내공공기관·공기업">국내공공기관·공기업</option>
<option value="국내 비영리단체·협회·교육재단">국내 비영리단체·협회·교육재단</option>
<option value="외국기관·비영리기구·단체">외국기관·비영리기구·단체</option>
</select>
</td>
</tr>
<tr class="businessDesc">
<th>주요사업내용<span class="necessary">*</span></th>
<td>
<input type="text"/>
<span class="comment">&nbsp;&nbsp;&nbsp;예 : 네트워크 트래픽 관리제품 개발 및 판매</span>
</td>
</tr>
<tr class="companyPhone">
<th>대표번호<span class="necessary">*</span></th>
<td>
<span><input type="text"/></span><span>&nbsp;-</span>
<span><input type="text"/></span><span>&nbsp;-</span>
<span><input type="text"/></span>
</td>
</tr>
<tr class="companyFax">
<th>팩스번호</th>
<td>
<span><input type="text"/></span><span>&nbsp;-</span>
<span><input type="text"/></span><span>&nbsp;-</span>
<span><input type="text"/></span>
</td>
</tr>
<tr class="email">
<th>이메일<span class="necessary">*</span></th>
<td>
<span><input id="email01" type="text" name="email01" title="아이디만 입력"/></span><span>&nbsp;@&nbsp;</span><span><input id="email02" type="text" name="email02" title="이메일 주소 선택"/></span>
<span>
<select id="email03" name="email03" title="이메일 선택">
<option value="direct">직접입력</option>
<option value="gmail.com">gmail.com</option>
<option value="naver.com">naver.com</option>
<option value="daum.net">daum.net</option>
<option value="nate.com">nate.com</option>
</select>
</span>
</td>
</tr>
<tr>
<th>홈페이지</th>
<td>
http:// <span><input type="text"/></span>
</td>
</tr>
<tr class="address">
<th>회사주소<span class="necessary">*</span></th>
<td>
<p class="postNumber"><input id="postNum01" type="text" name="postNum01" title="우편번호01"/>-<input id="postNum02" type="text" name="postNum02" title="우편번호02"/>&nbsp;<input type="submit" value="중복확인" title="중복확인"/></p>
<p><input id="address01" type="text" name="address01" title="주소01"/></p>
<p><input id="address02" type="text" name="address02" title="주소02"/></p>
</td>
</tr>
<tr>
<th>설립년도</th>
<td>
<span><input type="text"/></span>&nbsp;년 설립
</td>
</tr>
<tr>
<th>사원수</th>
<td>
<span><input type="text"/></span>&nbsp;명 (예:200)
</td>
</tr>
<tr>
<th>자본금</th>
<td>
<span><input type="text"/></span>&nbsp;원 (예:3억5천만)
</td>
</tr>
<tr>
<th>매출액</th>
<td>
<span><input type="text"/></span>&nbsp;원 (예:3억5천만)
</td>
</tr>
<tr class="logoArea">
<th>회사로고</th>
<td>
<p class="imgPart"><img src="img/myCompany/noimage.jpg" alt="회사로고"/></p>
<p class="descPart">
<span><input type="file"/></span><br/>
<span>
※ 이미지 파일형식은 확장자 *.jpg, *.gif만 가능합니다.<br/>
※ 로고 이미지 권장사이즈는 가로120 * 세로34입니다.
</span>
</p>
</td>
</tr>
<tr class="comPhoto">
<th>회사사진</th>
<td>
<ul class="imgArea">
<li><img src="img/myCompany/noimage.jpg" alt="회사이미지1"/></li>
<li><img src="img/myCompany/noimage.jpg" alt="회사이미지2"/></li>
<li><img src="img/myCompany/noimage.jpg" alt="회사이미지3"/></li>
<li><img src="img/myCompany/noimage.jpg" alt="회사이미지4"/></li>
</ul>
<ul class="upLoadArea">
<li>
회사사진1<span><input type="file"/></span>
</li>
<li>
회사사진2<span><input type="file"/></span>
</li>
<li>
회사사진3<span><input type="file"/></span>
</li>
<li>
회사사진4<span><input type="file"/></span>
</li>
</ul>
</td>
</tr>
<tr>
<th>기업개요/비전</th>
<td>
<textarea></textarea>
</td>
</tr>
<tr class="history">
<th>연혁/실적</th>
<td>
<textarea></textarea>
<span>
[입력예]<br/>
2008.12 웹어워드위원회 주최,"2008 웹어워드코리아 대상"2년 연속 수상<br/>
2008.11 방송통신위원회 주최,"대학민국 인터넷대상 국무총리상 수상"<br/>
2008.10 한국능률협회컨설팅 주관,"2008 한국의 경영대상 마케팅 대상"6년 연속 수상<br/>
한국소비자포럼 주최,"2008 올해의 브랜드 대상"4년 연속 수상<br/>
브랜드스톡 주최,"2008 올해의 하이스트 브랜드"부문 1위 수상<br/>
</span>
</td>
</tr>
</tbody>
</table>
</div>
<div class="myCompanyBox02">
<table>
<caption>담당자 정보</caption>
<tbody>
<tr>
<th>이름<span class="necessary">*</span></th>
<td><input id="username_01" type="text" name="username_01" title="이름"/></td>
</tr>
<tr>
<th>아이디<span class="necessary">*</span></th>
<td>
<input id="userid_01" type="text" name="userid_01" title="아이디"/>
<input type="submit" value="중복확인" title="중복확인"/>
<span class="comment">영문과 숫자를 조합하여 4~20자 이내</span>
</td>
</tr>
<tr>
<th>비밀번호<span class="necessary">*</span></th>
<td>
<input id="userpass" type="password" name="userpass" title="비밀번호"/>
<span class="comment">비밀번호는 6~16자 영문, 숫자를 조합하여 사용</span>
</td>
</tr>
<tr>
<th>비밀번호 확인<span class="necessary">*</span></th>
<td>
<input id="userpass01" type="password" name="userpass01" title="비밀번호확"/>
<span class="comment">비밀번호 재입력</span>
</td>
</tr>
<tr class="birthday">
<th>생년월일<span class="necessary">*</span></th>
<td>
<span><input id="year" type="text" name="year"/><label for="year">&nbsp;년</label></span>
<span><input id="month" type="text" name="month"/><label for="month">&nbsp;월</label></span>
<span><input id="day" type="text" name="day"/><label for="day">&nbsp;일</label></span>
</td>
</tr>
<tr>
<th>성별<span class="necessary">*</span></th>
<td>
<span class="male"><input id="gender_male" type="radio" name="gender_male" checked="checked"/><label for="gender_male">남자</label></span>
<span class="female"><input id="gender_female" type="radio" name="gender_female"/><label for="gender_female">여자</label></span>
</td>
</tr>
<tr class="email">
<th>이메일<span class="necessary">*</span></th>
<td>
<span><input id="email01_01" type="text" name="email01_01" title="아이디만 입력"/></span><span>&nbsp;@&nbsp;</span><span><input id="email02_01" type="text" name="email02_01" title="이메일 주소 선택"/></span>
<span>
<select id="email03_01" name="email03_01" title="이메일 선택">
<option value="direct">직접입력</option>
<option value="gmail.com">gmail.com</option>
<option value="naver.com">naver.com</option>
<option value="daum.net">daum.net</option>
<option value="nate.com">nate.com</option>
</select>
</span>
</td>
</tr>
<tr>
<th>이메일 수신여부<span class="necessary">*</span></th>
<td>
<span><input id="yes" type="radio" checked="checked"/><label for="yes">예</label></span>
<span><input id="no" type="radio" /><label for="no">아니오</label></span>
</td>
</tr>
<tr class="mobile">
<th>휴대폰<span class="necessary">*</span></th>
<td>
<span><input type="text"/></span><span>&nbsp;-</span>
<span><input type="text"/></span><span>&nbsp;-</span>
<span><input type="text"/></span>
</td>
</tr>
<tr>
<th>SNS 수신여부</th>
<td>
<span><input id="yes_01" type="radio" checked="checked"/><label for="yes_01">예</label></span>
<span><input id="no_01" type="radio" /><label for="no_01">아니오</label></span>
</td>
</tr>
<tr class="phone">
<th>연락처</th>
<td>
<span><input type="text"/></span><span>&nbsp;-</span>
<span><input type="text"/></span><span>&nbsp;-</span>
<span><input type="text"/></span>
</td>
</tr>
<tr class="address">
<th>주소<span class="necessary">*</span></th>
<td>
<p class="postNumber"><input id="postNum01_01" type="text" name="postNum01_01" title="우편번호01"/>-<input id="postNum02_01" type="text" name="postNum02_01" title="우편번호02"/>&nbsp;<input type="submit" value="중복확인" title="중복확인"/></p>
<p><input id="address01_01" type="text" name="address01_01" title="주소01"/></p>
<p><input id="address02_01" type="text" name="address02_01" title="주소02"/></p>
</td>
</tr>
</tbody>
</table>
</div>
</fieldset>
</form>
<div class="agree_ok">
<ul>
<li><a href="#none" title="취소">취소</a></li>
<li><a href="#none" title="가입하기">수정하기</a></li>
</ul>
</div>
</div>
</div>
</div>
<jsp:include page="/footer.do" />

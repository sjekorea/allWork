<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/myPage.css"/>

<div id="containerWrap">
<div id="container">
<div id="leftPart">
<jsp:include page="/personSubMenu.do" />
</div>
<div id="rightPart">
<h4>회원정보수정<span>*표시는 필수 입력사항</span></h4>
<form action="#none" method="post">
<fieldset>
<legend>회원가입</legend>
<div class="registerBox">
<table>
<caption>모집요강</caption>
<tbody>
<tr>
<th>이름<span class="necessary">*</span></th>
<td><input id="username" type="text" name="username" title="이름"/></td>
</tr>
<tr>
<th>아이디<span class="necessary">*</span></th>
<td>
<input id="userid" type="text" name="userid" title="아이디"/>
<input type="submit" value="중복확인" title="중복확인"/>
<span class="comment">영문과 숫자를 조합하여 4~20자 이내로 입력</span>
</td>
</tr>
<tr>
<th>비밀번호<span class="necessary">*</span></th>
<td>
<input id="userpass" type="password" name="userpass" title="비밀번호"/>
<span class="comment">비밀번호는 6~16자 영문, 숫자를 조합</span>
</td>
</tr>
<tr>
<th>비밀번호 확인<span class="necessary">*</span></th>
<td>
<input id="userpass01" type="password" name="userpass01" title="비밀번호확"/>
<span class="comment">비밀번호 재입력</span>
</td>
</tr>
<tr>
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

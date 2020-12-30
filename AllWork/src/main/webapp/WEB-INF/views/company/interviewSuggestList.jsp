<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/company_interviewControl.css"/>

<div id="containerWrap">
<div id="container">
<div id="leftPart">
<jsp:include page="/companySubMenu.do" />
</div>
<div id="rightPart">
<div id="listPart">
<h4>면접제의요청 관리</h4>
<p class="listTotal">면접제의요청관리 총<span>0</span>명</p>
<select id="align">
<option value="시도선택">진행중인 채용공고</option>
</select>
<p class="delete"><a href="#none" title="선택삭제">선택삭제</a></p>
<table class="list">
<caption>리스트</caption>
<tbody>
<tr class="list_title">
<th class="desc00"><input type="checkbox"/></th>
<th class="desc01">지원자명</th>
<th class="desc02">사업내용</th>
<th class="desc03">이력서보기</th>
<th class="desc04">면접요청메일 발송일</th>
</tr>
<tr class="desc">
<td class="desc00"><input type="checkbox"/></td>
<td class="desc01">홍길동</td>
<td class="desc02">
<a href="#none" title="맞춤채용공고">영업기사모집</a><br/>
</td>
<td class="desc03">
<a href="#none" title="이력서 보기">이력서 보기</a><br/>
</td>
<td class="desc04">20-10-22</td>
</tr>
</tbody>
</table>
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
</div>
<jsp:include page="/footer.do" />

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/personHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/resume_list.css"/>

<div id="containerWrap">
<div id="container">
<div id="leftPart">
<jsp:include page="/personSubMenu.do" />
</div>
<div id="rightPart">
<div id="listPart">
<h4>이력서 목록</h4>
<p class="upload"><a href="#none" title="이력서등록">이력서등록</a></p>
<p class="delete"><a href="#none" title="선택삭제">선택삭제</a></p>
<table class="list">
<caption>리스트</caption>
<tbody>
<tr class="list_title">
<th class="desc00"><input type="checkbox"/></th>
<th class="desc01">이력서</th>
<th class="desc02">등록일</th>
<th class="desc03">공개</th>
<th class="desc04">비공개</th>
</tr>
<tr class="desc">
<td class="desc00"><input type="checkbox"/></td>
<td class="desc01">
<a href="#none" title="이력서">
S/W 컨설팅및 유통(오피스,보안,문서관리시스템등),정부과제,PLC,CAD등 관련
</a>
</td>
<td class="desc02">2020-11-21</td>
<td class="desc03"><input type="radio"/></td>
<td class="desc04"><input type="radio"/></td>
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



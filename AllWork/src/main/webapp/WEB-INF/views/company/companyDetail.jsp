<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8"/>
		<title> 기업정보 상세보기 </title>
		<link rel="stylesheet" type="text/css" href="/css/header_company.css"/>
		<link rel="stylesheet" type="text/css" href="/css/myCompanyView.css"/>
		<link rel="stylesheet" type="text/css" href="/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="/css/footer.css"/>
		<link rel="stylesheet" type="text/css" href="/css/font.css"/>
		<link rel="stylesheet" type="text/css" href="/css/reset.css"/>
		<link  rel="stylesheet" type="text/css" href="/css/all.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="/js/jquery-1.12.4.js"></script>
		<script src="/js/jquery-ui.min.js"></script>
		<script src="/js/common.js"></script>
		<style></style>
	</head>
	<body>
		<div id="rightPart">
			<div id="company_detail">
				<p class="company_name">${companyMap.bizName }</p>
				<p class="company_logo">
					<c:choose>
						<c:when test="${companyMap.bizLogo eq '' }">
							<img src="/img/company_view/logoNo.jpg" alt="로고"/>	
						</c:when>
						<c:otherwise>
							<img src="/peg/${companyMap.bizLogo }" alt="로고"/>
						</c:otherwise>
					</c:choose>
				</p>
			</div>
			<div class="myCompanyBox01">
				<table class="part01">
					<colgroup>
						<col style="width:20%;">
						<col style="width:30%;">
						<col style="width:20%;">
						<col style="width:30%;">
					</colgroup>
					<caption>기업정보</caption>
					<tbody>
						<tr class="short">
							<th>대표자</th>
							<td>${companyMap.bizRecharger }</td>
							<th>설립년도</th>
							<td><c:if test="${companyMap.bizFonundation ne ''}">${companyMap.bizFonundation}년</c:if></td>
						</tr>
						<tr class="short">
							<th>자본금</th>
							<td>
								${companyMap.bizCapital}
							</td>
							<th>매출액</th>
							<td>
								${companyMap.bizSelling }
							</td>
						</tr>
						<tr class="short">
							<th>업종</th>
							<td>${companyMap.bizCategoryName }</td>
							<th>상장여부</th>
							<td>${companyMap.bizListName }</td>
						</tr>
						<tr class="short">
							<th>기업형태</th>
							<td>${companyMap.bizFormName }</td>
							<th>이메일</th>
							<td>
								<span>${companyMap.bizEmail }</span>
							</td>
						</tr>
						<tr class="companyPhone short">
							<th>대표번호</th>
							<td>
								<span>${companyMap.bizPhone }</span>
							</td>
							<th>팩스번호</th>
							<td>
								<span>${companyMap.bizFax }</span>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="part02">
					<colgroup>
						<col style="width:19.8%;">
						<col style="width:80.2%;">
					</colgroup>
					<caption>기업정보</caption>
					<tbody>
						<tr class="address long">
							<th>회사주소</th>
							<td>
								<span>
									(${companyMap.bizPost}) ${companyMap.bizAddress1}
								</span>
								<span>
									${companyMap.bizAddress2}
								</span>
							</td>
						</tr>
						<tr class="businessDesc">
							<th>주요사업내용</th>
							<td>
								<div>
									${companyMap.bizSubject}
								</div>
							</td>
						</tr>
						<tr class="comPhoto long">
							<th>포토 회사정보 </th>
							<td>
								<ul class="imgArea">
									<li>
										<c:choose>
											<c:when test="${companyMap.photo1 eq '' }">
												<img id="photoImg1" src="/img/myCompany/noimage.jpg" alt="회사이미지1">
											</c:when>
											<c:otherwise>
												<img src="/peg/${companyMap.photo1 }" alt="로고"/>
											</c:otherwise>
										</c:choose>
									</li>
									<li>
										<c:choose>
											<c:when test="${companyMap.photo2 eq '' }">
												<img id="photoImg2" src="/img/myCompany/noimage.jpg" alt="회사이미지2">
											</c:when>
											<c:otherwise>
												<img src="/peg/${companyMap.photo2 }" alt="로고"/>
											</c:otherwise>
										</c:choose>
									</li>
									<li>
										<c:choose>
											<c:when test="${companyMap.photo3 eq '' }">
												<img id="photoImg3" src="/img/myCompany/noimage.jpg" alt="회사이미지3">
											</c:when>
											<c:otherwise>
												<img src="/peg/${companyMap.photo3 }" alt="로고"/>
											</c:otherwise>
										</c:choose>
									</li>
									<li>
										<c:choose>
											<c:when test="${companyMap.photo4 eq '' }">
												<img id="photoImg4" src="/img/myCompany/noimage.jpg" alt="회사이미지4">
											</c:when>
											<c:otherwise>
												<img src="/peg/${companyMap.photo4 }" alt="로고"/>
											</c:otherwise>
										</c:choose>
									</li>
								</ul>
							</td>
						</tr>
						<tr class="vision">
							<th>기업개요 및 비전</th>
							<td>
								<div>
									${companyMap.bizVision }
								</div>
							</td>
						</tr>
						<tr class="history">
							<th>기업 연혁 및 실적</th>
							<td>
								<div>
									${companyMap.bizHistory }
								</div>
							</td>
						</tr>
						<!-- <tr class="map">
							<th>회사 위치정보</th>
							<td>
								<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12663.612089588483!2d127.0156792!3d37.4866148!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa1b74f4c4f18b8bd!2zKOyjvCnsmKzsm4ztgaw!5e0!3m2!1sko!2skr!4v1605014812648!5m2!1sko!2skr" width="530" height="280" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
							</td>
						</tr> -->
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>

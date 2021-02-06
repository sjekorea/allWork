<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/personal_payDetails.css"/>

<style type="text/css">
	/*현재메뉴 언더라인*/
	#menuTree ul .gnb .subMenu04_03{text-decoration: underline;}
</style>


<script type="text/javascript" src="/js/moments.js"></script>
<div id="containerWrap">
	<div id="container">
		<div id="leftPart">
			<jsp:include page="/companySubMenu.do" />
		</div>
		<div id="rightPart">
			<h4>결제내역 조회</h4>
			<div id="listPart">
				<div class="part01">
					<div class="date">
						<form name="searchForm" id="searchForm" action="/resumeSearchPaidList.do">
							<input type="hidden" name="pageNo" id="pageNo" value="${map.pageNo }" />
							<fieldset>
								<legend>기간별 조회</legend>
								<p>
									<span>기간별 조회</span>
									<span><input type="date" id="startDt" name="startDt" value="${map.startDt }" placeholder="yyyy-mm-dd"/></span>~
									<span><input type="date" id="endDt" name="endDt" value="${map.endDt }"placeholder="yyyy-mm-dd"/></span>
									<span><input type="button" id="searchBtn" value="조회하기"/></span>
								</p>
							</fieldset>
						</form>
					</div>
					<ul class="list">
						<li class="list_title">
							<div class="desc01">신청일</div>
							<div class="desc02">신청상품</div>
							<div class="desc03">결제금액</div>
							<div class="desc04">결제상태</div>
							<div class="desc05">환불</div>
						</li>
						<c:choose>
							<c:when test="${paymentList.size() > 0 }">
								<c:forEach var="result" items="${paymentList}" varStatus="status">
									<li>
										<div class="desc">
										<p class="desc01">${result.payDate}</p>
										<p class="desc02">${result.productName }</p>
										<p class="desc03"><fmt:formatNumber value="${result.payAmount}" pattern="#,###.##"/>원</p>
										<p class="desc04">
											<c:choose>
												<c:when test="${result.refundStatus eq 'cancelled' }">
													결제 취소
												</c:when>
												<c:otherwise>
													${result.status eq 'paid' ? '결제완료' : '' }	
												</c:otherwise>	
											</c:choose>
										</p>
										<p class="desc05">
											<c:if test="${result.refundStatus ne 'cancelled' and ((result.productType ne '3' and result.dateDiff <= 7) or (result.productType eq '3' and result.viewCnt <= 0)) }">
												<a href="javascript:requestRefund('${result.merchantUid }', '${result.impUid }', '${result.productType }', '${result.payAmount }');">환불요청</a>
											</c:if>
										</p>
										</div>
									</li>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<li>
									<div class="desc">
										<p class="desc01">검색 내용이 없습니다.</p>
									</div>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div class="numareaWrap">
					<ul class="numArea">
						${pageMap.pageHtml }
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#startDt").val(moment(addDay(new Date(), -14)).format('YYYY-MM-DD'));
		$("#endDt").val(moment(addDay(new Date(), 0)).format('YYYY-MM-DD'));
		
		$("#searchBtn").on("click", function(e){
			
			if($("#startDt").val() == "" || $("#startDt").val() == null){
				alert("검색 시작일을 선택하세요.");
				return;
			}
			
			if($("#endDt").val() == "" || $("#endDt").val() == null){
				alert("검색 종료일을 선택하세요.");
				return;
			}
			
			$("#pageNo").val("1");
			$("#searchForm").submit();
		});
		
	});
	
	
	function requestRefund(merchantUid, impUid, productType, payAmount){
		if (!confirm("환불요청을 진행할까요?")) return;

    	loadingOn();
    	
		// 결제 성공 시 로직
        var callback = function(data){
        	alert("환불요청을 처리했습니다.");
			location.href = "/resumeSearchPaidList.do";
		};
		var param = {
						merchantUid : merchantUid 
						, impUid : impUid
						, productType : productType
						, refundAmount : payAmount
					};
		ajax('post', '/updateRefundPaymentInfo.ajax', param, callback);
	}
</script>
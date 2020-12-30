<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/pay_searching.css"/>

<div id="popupWrap_payService" style="display:none;">
	<div class="textArea">
		<p>서비스의 요금 환급 및 환불</p>
		회사는 다음 각호의 해당 경우에 따라 환불 유무를 결정한다.<br/>
		회사의 귀책사유로 서비스 이용이 지속적으로 불가능한 경우 환불한다.<br/>
		유료서비스의 이용이 개시되기 전 환불을 요청한 경우에 환불한다. 단, 환불수수료 및 제작비, 결제수수료를 제외한 금액을 전액 또는 부분 환불한다.<br/>
		유료서비스 잔여기간이 7일 이하일 경우의 기간에 대해서는 환불하지 않는다.<br/>
		유료회원의 서비스 이용 기간이 2/3 이상이 지났을 경우에는 환불하지 않는다. 만약 2/3이상이 지나지 않았을 경우 “회사”는 환불에 대한 이용일수를 1일기준금액으로 계산하여 이용금액을 공제 후 환급한다.<br/>
		회사는  유료서비스 및 유료회원 이용자에 대해 직권해지를 할 수 있다. 이경우, 불량 공고에 대한 광고료는 일체 반환되지 않는다.<br/>
		회사는 환불을 요청 받았을 경우 다음 각 호의 기준으로 환불한다.<br/>
		이용자가 지정하는 계좌로 환불한다.<br/>
		환불요청한 일로부터 3일 이내에 처리한다.<br/>
		기업회원의 환불 요청이 환불 요건에 부합하는 것으로 판단될 경우, 회사는 제2항의 통지일로부터 3영업일 이내에 약관에서 정한 금액을 환불한다.<br/>
		유료서비스 및 유료회원의 결제 당일 취소 시 무통장 입금방식을 제외한 결제방식에 대해서는 결제수수료 없이 취소처리가 가능하다.<br/>
		회사의 귀책사유가 아닌 경우의 환불 시 적용되는 환불수수료는 상품가격의 10%를 적용한다.<br/>
		유료서비스 및 유료회원이 환불을 요청한 경우, 해당 상품 구매 시 서비스로 적립된 남은 포인트는 회사에 반환되며, 이용한 포인트는 제하여 금액을 환불한다.<br/>
		환불은 환불공식에 의거 처리한다.
	</div>
	<div class="buttonArea">
		<p class="popup_close"><span>닫기</span></p>
	</div>
</div>

<div id="containerWrap">
<div id="container">
<div id="leftPart">
<jsp:include page="/companySubMenu.do" />
</div>
<div id="rightPart">
<h4>인재검색 서칭 서비스</h4>
<p class="imgArea"><img src="img/pay_searching/img01.jpg" alt="이미지00"/></p>
<div>
<form>
<fieldset>
<legend>인재검색 서칭 서비스</legend>
<p class="refund_btn"><a href="" title="환불정책 보기">환불정책 보기</a></p>
<div class="allPart">
<h5>가격</h5>
<div>
<p>
<span class="day">7일</span><span class="count">100건</span><span class="fee">100,000원</span><span class="desc">/ vat포함</span><span><input type="radio" checked="checked"/></span>
</p>
<p>
<span class="day">15일</span><span class="count">200건</span><span class="fee">150,000원</span><span class="desc">/ vat포함</span><span><input type="radio"/></span>
</p>
<p>
<span class="day">30일</span><span class="count">400건</span><span class="fee">200,000원</span><span class="desc">/ vat포함</span><span><input type="radio"/></span>
</p>
</div>
<h5 class="period">이용기간</h5>
<div class="periodDesc"><input type="date" placeholder="yyyy-mm-dd"/></div>
</div>
<p class="apply"><input type="submit" value="신청하기"/></p>
</fieldset>
</form>
</div>
</div>
</div>
</div>
<jsp:include page="/footer.do" />

<script type="text/javascript">
	$(document).ready(function(){
		$(".refund_btn a").on("click", function(e){
			$(".containerWrap").scrollTop(0);
			$("#popupWrap_payService").css("display", "block");
		});
		
		$(".popupClose span").on("click", function(e){
			$("#popupWrap_payService").css("display", "none");
		});
	});	
</script>	
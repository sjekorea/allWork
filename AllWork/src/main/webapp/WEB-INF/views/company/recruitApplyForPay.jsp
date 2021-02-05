<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/companyHeader.do" />

<link rel="stylesheet" type="text/css" href="/css/pay_recruit.css"/>

<script type="text/javascript" src="/js/moments.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
		환불은 환불공식에 의거 처리한다. <br/>
		<br />
		휴대폰 결제의 경우 당월은 결제 취소만 가능하며, <br />
		익월 이후 휴대폰결제 환불 건은 입금 확인 후 결제자 본인 계좌로만 환불 가능하다.
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
			<h4>유료채용광고 서비스</h4>
			<p class="imgArea"><img src="/img/pay_recruit/img01.jpg" alt="이미지00"/></p>
			<div>
			<form>
				<fieldset>
					<legend>올워크 메인페이지 상단 노출 배너</legend>
					<p class="refund_btn"><a href="" title="환불정책 보기">환불정책 보기</a></p>
					<div class="allPart">
						<h5>가격</h5>
						<div>
						<p>
							<span class="day">7일</span><span class="fee">100,000원</span><span class="desc">/ vat포함</span>
							<span><input type="radio" name="payAmount" value="100000" checked="checked"/></span>
						</p>
						<p>
							<span class="day">15일</span><span class="fee">150,000원</span><span class="desc">/ vat포함</span>
							<span><input type="radio" name="payAmount" value="150000" /></span>
						</p>
						<p>
							<span class="day">30일</span><span class="fee">200,000원</span><span class="desc">/ vat포함</span>
							<span><input type="radio" name="payAmount" value="200000" /></span>
						</p>
						</div>
						<h5 class="period">이용기간</h5>
						<div class="periodDesc"><input type="date" id="serviceEndDate" placeholder="yyyy-mm-dd" readonly/></div>
					</div>
					<div>
						<select name="payMethodSel" id="payMethodSel">
							<option value="">결제 방법 선택</option>
							<option value="card">신용카드 결제</option>
							<option value="phone">휴대폰 결제</option>
						</select>
					</div>
					<p class="apply"><input type="button" value="신청하기"/></p>
				</fieldset>
			</form>
		</div>
		</div>
	</div>
</div>
<jsp:include page="/footer.do" />

<script type="text/javascript">

	IMP.init("imp57220421");
	var pgType = "danal_tpay";
	var payMethod = "card";
	
	$(document).ready(function(){
		
		$("#serviceEndDate").val(moment(addDay(new Date(), 7)).format('YYYY-MM-DD'));
		
		$(".refund_btn a").on("click", function(e){
			//$(".containerWrap").scrollTop(0);
			e.preventDefault();
			$('html').scrollTop(0);
			$("#popupWrap_payService").css("display", "block");
		});
		
		$(".popup_close span").on("click", function(e){
			$("#popupWrap_payService").css("display", "none");
		});
		
		$("input[name=payAmount]").on("click", function(e){
			var amount = $(this).val();
			var serviceEndDate = "";
			if(amount == 100000){
				serviceEndDate= moment(addDay(new Date(), 7)).format('YYYY-MM-DD');
			}
			if(amount == 150000){
				serviceEndDate = moment(addDay(new Date(), 15)).format('YYYY-MM-DD');
			}
			if(amount == 200000){
				serviceEndDate = moment(addDay(new Date(), 30)).format('YYYY-MM-DD');
			}
			$("#serviceEndDate").val(serviceEndDate);
		});
		
		$(".apply").on("click", function(e){
			
			if("${SE_SERVICE1}" == "Y"){
				alert("현재 유료서비스 이용중입니다.");
			}else{
				payMethod = $("#payMethodSel option:selected").val(); 
				if(checkNull(payMethod)){
					alert("결제 방법을 선택하세요.");
				}else{
					if(payMethod == 'phone'){
						pgType = "danal";
					}else{
						pgType = "danal_tpay";
					}
					requestPay();
				}
			}
		});
		
		//Default는 카드결제.
		$("#payMethodSel").val("card").prop("selected", true);		
	});	
	
	
	function requestPay() {
		
		var amount = $("input[name=payAmount]:checked").val();
		var productName = "유료 채용광고 서비스"; // 개인회원 유료옵션 서비스, 유료 채용광고 서비스, 인재검색서칭 서비스
		var productType = "2";
		var serviceEndDate = "";
		if(amount == 100000){
			serviceEndDate = moment(addDay(new Date(), 7)).format('YYYY-MM-DD');
		}
		if(amount == 150000){
			serviceEndDate = moment(addDay(new Date(), 15)).format('YYYY-MM-DD');
		}
		if(amount == 200000){
			serviceEndDate = moment(addDay(new Date(), 30)).format('YYYY-MM-DD');
		}
		
		// IMP.request_pay(param, callback) 호출
		IMP.request_pay({ // param
			pg : pgType, //아임포트 관리자에서 danal_tpay를 기본PG로 설정하신 경우는 생략 가능
		    pay_method : payMethod, //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
		    merchant_uid : 'merchant_' + new Date().getTime()+'_${SE_LOGIN_ID}', //상점에서 관리하시는 고유 주문번호를 전달
		    name : productName,
		    amount : amount,
		    buyer_email : "${memberInfoMap.email}",
		    buyer_name : "${memberInfoMap.name}",
		    buyer_tel : "${memberInfoMap.hphone}", //누락되면 카드사 인증에 실패할 수 있으니 기입해주세요
		    buyer_addr : "${memberInfoMap.address1}"+" "+"${memberInfoMap.address2}",
		    buyer_postcode : "${memberInfoMap.post}"
		}, function (rsp) { // callback
			
			console.log(JSON.stringify(rsp));
		
		    if (rsp.success) {

		    	// 결제 성공 시 로직
		        var callback = function(data){
		        	alert("유료서비스 신청을 처리했습니다.");
		        	loadingOn();
					location.href = "/resumeSearchPaidList.do";
				};
				var param = {
								merchantUid : rsp.merchant_uid 
								, impUid : rsp.imp_uid
								, buyerType : "2"
								, productName : rsp.name
								, productType : productType
								, payMethod : rsp.pay_method
								, payAmount : rsp.paid_amount
								, buyerName : rsp.buyer_name
								, buyerEmail : rsp.buyer_email
								, buyerTel : rsp.buyer_tel
								, buyerAddr : rsp.buyer_addr
								, buyerPostcode : rsp.buyer_postcode
								, applyNum : rsp.apply_num
								, status : rsp.status
								, successStatus : rsp.success
								, receiptUrl : rsp.receipt_url
								, cardName : rsp.card_name
								, bankName : rsp.bank_name
								, cardQuota : rsp.card_quota
								, cardNumber : rsp.card_number
								, service1EndDate : serviceEndDate
								, service2EndDate : ""
								, viewCount : 0
								, dealType : "buy"
							};
				ajax('post', 'insertPaymentInfo.ajax', param, callback);
				
		    } else {
		    	alert(rsp.error_msg);
		    }
		});
	}
</script>	
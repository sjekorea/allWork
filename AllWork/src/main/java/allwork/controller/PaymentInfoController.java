package allwork.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import allwork.common.CommandMap;
import allwork.common.LoginSuccessProcess;
import allwork.common.QueryParser;
import allwork.common.util.CommonColumnUtil;
import allwork.common.util.ConvertUtil;
import allwork.common.util.PaginationUtil;
import allwork.service.NetfuMemberService;
import allwork.service.PaymentInfoService;

@Controller
public class PaymentInfoController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="paymentInfoService")
	private PaymentInfoService paymentInfoService;
	
	@Resource(name="netfuMemberService")
	private NetfuMemberService netfuMemberService;
	
	
	/*
	 * 결제 정보 저장
	 */
	@RequestMapping(value="/insertPaymentInfo.ajax")
	public ModelAndView insertPaymentInfo(CommandMap commandMap, HttpSession session) throws IOException{
		
		ModelAndView mv = new ModelAndView();
		
		try{
			commandMap.put("uid", (String)session.getAttribute("SE_LOGIN_ID"));
			int rstCnt = paymentInfoService.insertPaymentInfo(commandMap.getMap());
			rstCnt += netfuMemberService.updatePayServiceInfo(commandMap.getMap());
			
			String service1EndDate = ConvertUtil.checkNull((String)commandMap.get("service1EndDate"));
			if(!"".equals(service1EndDate)){
				session.setAttribute("SE_SERVICE1", "Y");
				session.setAttribute("SE_SERVICE1_END", (String)commandMap.get("service1EndDate"));
			}
			
			String service2EndDate = ConvertUtil.checkNull((String)commandMap.get("service2EndDate"));
			int viewCount = ConvertUtil.checkNullToInt((String)commandMap.get("viewCount"));			
			if(viewCount > 0 && !"".equals(service2EndDate)){
				session.setAttribute("SE_SERVICE2", "Y");
				session.setAttribute("SE_SERVICE2_END", (String)commandMap.get("service2EndDate"));
				session.setAttribute("SE_VIEW_COUNT", viewCount);
			}
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".insertPaymentInfo.ajax Excepion!!!!!!!!! =====> "+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 결제 취소 (환불 )정보 저장
	 */
	@RequestMapping(value="/updateRefundPaymentInfo.ajax")
	public ModelAndView updateRefundPaymentInfo(CommandMap commandMap, HttpSession session) throws IOException{
		
		ModelAndView mv = new ModelAndView();
		
		try{
			
			String api_key = "8582761692674432";
			String api_secret = "3kRjvBjj9bxWQEBNSfvlHRDdAVvFnLNq5EJBf2Vodsl47XRZcnlUeZ7PUDvipiIvWs6cu1BIuWNCTEC6";
			IamportClient client = new IamportClient(api_key, api_secret);
			
			String test_already_cancelled_imp_uid = (String)commandMap.get("impUid");
			CancelData cancel_data = new CancelData(test_already_cancelled_imp_uid, true); //imp_uid를 통한 전액취소
			cancel_data.setChecksum(BigDecimal.valueOf(Integer.valueOf((String)commandMap.get("refundAmount")))); // checksum 으로 검증 추가

			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			
			//System.out.println("payment_response : "+payment_response.getResponse().getStartedAt());
			
			commandMap.put("uid", (String)session.getAttribute("SE_LOGIN_ID"));
			commandMap.put("refundStatus", payment_response.getResponse().getStatus());
			int rstCnt = paymentInfoService.updateRefundPaymentInfo(commandMap.getMap());
			rstCnt += netfuMemberService.updatePayServiceInfo(commandMap.getMap());
			
			int productType = ConvertUtil.checkNullToInt((String)commandMap.get("productType"));
			
			if("1".equals(productType) || "2".equals(productType)){
				session.setAttribute("SE_SERVICE1", "N");
				session.setAttribute("SE_SERVICE1_END", "");
			}
			
			if("3".equals(productType)){
				session.setAttribute("SE_SERVICE2", "N");
				session.setAttribute("SE_SERVICE2_END", "");
				session.setAttribute("SE_VIEW_COUNT", "0");
			}
						
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".updateRefundPaymentInfo.ajax Excepion!!!!!!!!! =====> "+e.toString());
		}
		return mv;
	}
	
	/*
	 * 이력서 유료 게시 서비스 신청 
	 */
	@RequestMapping(value="/resumeApplyForPay.do")
	public ModelAndView recruitApplyPayService(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/resumeApplyForPay");
		
		try{
			
			commandMap.put("uid", (String)session.getAttribute("SE_LOGIN_ID"));
			Map<String, Object> memberInfoMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
			
			mv.addObject("memberInfoMap", memberInfoMap);
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitApplyPayService Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	/*
	 * 결제 내역 조회 - 이력서 유료 게시
	 */
	@RequestMapping(value="/resumePaidList.do")
	public ModelAndView recruitPaidServiceList(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/person/resumePaidList");
		
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			
			String startDtTime = ((String) commandMap.get("startDt")) + " 00:00:00";
			commandMap.put("startDtTime", startDtTime);
			String endDtTime = ((String) commandMap.get("endDt")) + " 23:59:59";
			commandMap.put("endDtTime", endDtTime);
			
			List<Map<String, Object>> paymentList = paymentInfoService.selectPaymentInfoList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(paymentList.size() > 0){
				totalSize = paymentInfoService.selectPaymentInfoCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("paymentList", paymentList);
			mv.addObject("pageMap", pageMap);
		
		}catch(Exception e){
			e.printStackTrace();
			log.info(this.getClass().getName()+".resumePaidList Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	
	
	
	/*
	 *  유료 채용광고 서비스 신청
	 */
	@RequestMapping(value="/recruitApplyForPay.do")
	public ModelAndView recruitApplyForPay(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/company/recruitApplyForPay");
		try{
			
			commandMap.put("uid", (String)session.getAttribute("SE_LOGIN_ID"));
			Map<String, Object> memberInfoMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
			
			mv.addObject("memberInfoMap", memberInfoMap);
		}catch(Exception e){
			log.info(this.getClass().getName()+".recruitApplyForPay Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 채용검색 서비스 신청
	 */
	@RequestMapping(value="/resumeSearchApplyForPay.do")
	public ModelAndView resumeApplyPayService(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/company/resumeSearchApplyForPay");
		try{
			
			commandMap.put("uid", (String)session.getAttribute("SE_LOGIN_ID"));
			Map<String, Object> memberInfoMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
			
			mv.addObject("memberInfoMap", memberInfoMap);
		}catch(Exception e){
			log.info(this.getClass().getName()+".resumeSearchApplyForPay Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 결제 내역 조회 - 채용공고 검색
	 */
	@RequestMapping(value="/resumeSearchPaidList.do")
	public ModelAndView resumePaidServiceList(CommandMap commandMap, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/company/resumeSearchPaidList");
		int pageSize = 10;
		int totalSize = 0;
		
		try{
				
			if("".equals(ConvertUtil.checkNull(commandMap.get("pageNo")))){
				commandMap.put("pageNo", "1");
			}
			commandMap.put("start", pageSize * (Integer.parseInt((String)commandMap.get("pageNo"))-1));
			commandMap.put("pageSize", pageSize);
			
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			
			String startDtTime = ((String) commandMap.get("startDt")) + " 00:00:00";
			commandMap.put("startDtTime", startDtTime);
			String endDtTime = ((String) commandMap.get("endDt")) + " 23:59:59";
			commandMap.put("endDtTime", endDtTime);

			List<Map<String, Object>> paymentList = paymentInfoService.selectPaymentInfoList(commandMap.getMap());
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(paymentList.size() > 0){
				totalSize = paymentInfoService.selectPaymentInfoCnt(commandMap.getMap());
				pageMap = PaginationUtil.makePageInfo(totalSize, pageSize, (String)commandMap.get("pageNo"));
				commandMap.put("totalSize", totalSize);
			}
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("paymentList", paymentList);
			mv.addObject("pageMap", pageMap);
			
		}catch(Exception e){
			log.info(this.getClass().getName()+".resumeSearchPaidList Exception !!!!! \n"+e.toString());
		}
		return mv;
	}


	/*
	 * 이력서에 대한 유료인재정보 확인신청 등록.
	 */
	@RequestMapping(value="/insertPaidResumeSearch.ajax")
	public ModelAndView insertPaidResumeSearch(CommandMap commandMap, HttpSession session) throws IOException{
		
		ModelAndView mv = new ModelAndView();
		
		try{
			//유료인재정보 신청요청 등록.
			commandMap.put("uid", (String)session.getAttribute("SE_LOGIN_ID"));
			int rstCnt = paymentInfoService.insertPaidResumeSearch(commandMap.getMap());
			
			//사용자가 이용한 유료열람서비스 개수 1 감소.
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			netfuMemberService.updateViewCount(commandMap.getMap());
			//유료열람 서비스를 모두 사용한 경우, 유료서비스 기능을 disable 시킴.
			int viewCount = ConvertUtil.checkNullToInt(((Integer)session.getAttribute("SE_VIEW_COUNT")).toString());
			/*
			if(viewCount < 1){
				netfuMemberService.updatePayService2Info(commandMap.getMap());
				session.setAttribute("SE_SERVICE2", "");
			}
			*/
			session.setAttribute("SE_VIEW_COUNT", (viewCount - 1));

			//작업결과 전달.
			mv.addObject("map", commandMap.getMap());
			mv.addObject("paidResume", true);
			mv.setViewName("jsonView");
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".insertPaidResumeSearch.ajax Excepion!!!!!!!!! =====> "+e.toString());
		}
		return mv;
	}
	

}

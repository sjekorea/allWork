package allwork.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
			String service2EndDate = ConvertUtil.checkNull((String)commandMap.get("service1EndDate"));
			
			if(!"".equals(service1EndDate)){
				session.setAttribute("SE_SERVICE1", "Y");
				session.setAttribute("SE_SERVICE1_END", (String)commandMap.get("service1EndDate"));
			}
			
			if(!"".equals(service2EndDate)){
				session.setAttribute("SE_SERVICE2", "Y");
				session.setAttribute("SE_SERVICE2_END", (String)commandMap.get("service2EndDate"));
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
	
}

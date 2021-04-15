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
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.Certification;
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
public class CheckIdentityController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="paymentInfoService")
	private PaymentInfoService paymentInfoService;
	
	@Resource(name="netfuMemberService")
	private NetfuMemberService netfuMemberService;
	
	
	/*
	 * 본인인증 정보 획득.
	 */
	@RequestMapping(value="/chkPhoneNo.ajax")
	public ModelAndView chkPhoneNo(CommandMap commandMap, HttpSession session) throws IOException{
		
		ModelAndView mv = new ModelAndView();
		
		int rstCnt = 1;
		try{
			
			String api_key = "8582761692674432";
			String api_secret = "3kRjvBjj9bxWQEBNSfvlHRDdAVvFnLNq5EJBf2Vodsl47XRZcnlUeZ7PUDvipiIvWs6cu1BIuWNCTEC6";
			IamportClient client = new IamportClient(api_key, api_secret);
			
			String impUid = (String)commandMap.get("impUid");
			IamportResponse<Certification> certification = client.certificationByImpUid(impUid);
			if (certification != null && certification.getResponse() != null) {
				Certification cert = certification.getResponse();
			
				rstCnt = 0;
				
				mv.addObject("certification", certification.getResponse());
				//mv.addObject("rstCnt", rstCnt);
			}
			mv.setViewName("jsonView");
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".chkPhoneNo.ajax Excepion!!!!!!!!! =====> "+e.toString());
		}
		
		mv.addObject("rstCnt", rstCnt);
		return mv;
	}
	
}

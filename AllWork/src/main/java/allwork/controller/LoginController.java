package allwork.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.common.LoginSuccessProcess;
import allwork.service.NetfuMemberService;

@Controller
public class LoginController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuMemberService")
	private NetfuMemberService netfuMemberService;
	
	//소셜 Login 정보.
	@Value("${naver.clientId}")
	private String naverClientId;

	@Value("${kakao.clientId}")
	private String kakaoClientId;

	@Value("${google.clientId}")
	private String googleClientId;

	
	@RequestMapping(value="/login.do")
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("/login/login");
		commandMap.put("requestUri", request.getSession().getAttribute("requestUri"));
		mv.addObject("map", commandMap.getMap());
		mv.addObject("naverClientId", naverClientId); 
		mv.addObject("kakaoClientId", kakaoClientId); 
		mv.addObject("googleClientId", googleClientId); 
		return mv;
	}
	
	
	/********
	 * 로그인 처리
	 */
	@RequestMapping(value="/loginProcess.ajax")
	public ModelAndView loginProcess(CommandMap commandMap, HttpServletRequest req, HttpServletResponse rep) throws IOException{
		
		ModelAndView mv = new ModelAndView();
		
		try{
			
			int userInfoCnt = netfuMemberService.selectNetfuMemberLoginCnt(commandMap.getMap());
			
			Map<String, Object> memberInfoMap = new HashMap<String, Object>();
			
			if(userInfoCnt > 0){
				
				netfuMemberService.updatePayService1Info(commandMap.getMap());
				netfuMemberService.updatePayService2Info(commandMap.getMap());
				
				memberInfoMap = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
				LoginSuccessProcess loginSuccessProcess = new LoginSuccessProcess();
				loginSuccessProcess.loginSuccessMakeSession(req, memberInfoMap);
				
				//(begin) 2021.01.03 by s.yoo
				//가장 최근의 login 시각 등록.
				netfuMemberService.updateLoginInfo(commandMap.getMap());
				//(end) 2021.01.03 by s.yoo
			}
			
			mv.addObject("rstCnt", userInfoCnt);
			mv.addObject("memberInfoMap", memberInfoMap);
			mv.setViewName("jsonView");
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".loginProcess.ajax Excepion!!!!!!!!! =====> "+e.toString());
		}
		return mv;
	}
	
	
	/********
	 * 로그아웃 처리
	 */
	@RequestMapping(value="/logout.do")
	public void logout(CommandMap commandMap, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		session.invalidate();
		
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<script type='text/javascript'>");
		out.print("location.href='/';");
		out.print("</script>");
		out.flush();
		out.close();
		return;
		
	}

}

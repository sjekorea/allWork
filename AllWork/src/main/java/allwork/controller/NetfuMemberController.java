package allwork.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import allwork.common.CommandMap;
import allwork.common.util.CommonUtil;
import allwork.service.NetfuCateService;
import allwork.service.NetfuCompanyService;
import allwork.service.NetfuMemberService;


@Controller
public class NetfuMemberController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuMemberService")
	private NetfuMemberService netfuMemberService;
	
	@Resource(name="netfuCompanyService")
	private NetfuCompanyService netfuCompanyService;

	@Resource(name="netfuCateService")
	private NetfuCateService netfuCateService;
	
	
	@RequestMapping(value="/memberAgree1.do")
	public ModelAndView memberAgree1(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/memberAgree1");
		
		return mv;
	}
	
	
	@RequestMapping(value="/memberAgree2.do")
	public ModelAndView memberAgree2(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/memberAgree2");
		
		return mv;
	}
	
	
	@RequestMapping(value="/memberAgree3.do")
	public ModelAndView memberAgree3(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/memberAgree3");
		
		return mv;
	}
	
	
	@RequestMapping(value="/personJoin.do")
	public ModelAndView personalJoin(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/person/personJoin");
		
		return mv;
	}
	
	
	@RequestMapping(value="/companyJoin.do")
	public ModelAndView companyJoin(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/company/companyJoin");
		
		try{
			
			// 기업회원 가입  - 업종 ( netfu_cate : type = 'job')
			commandMap.put("type", "businesstype");
			List<Map<String, Object>> businesstypeList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 기업회원 가입  - 상장여부 ( netfu_cate : type = 'biz_list')
			commandMap.put("type", "biz_list");
			List<Map<String, Object>> bizList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 기업회원 가입  - 기업 형태( netfu_cate : type = 'biz_form')
			commandMap.put("type", "biz_form");
			List<Map<String, Object>> bizFormList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			mv.addObject("map", commandMap.getMap());
			mv.addObject("businesstypeList", businesstypeList);
			mv.addObject("bizList", bizList);
			mv.addObject("bizFormList", bizFormList);
			
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".companyJoin.do Exception!!! \n"+e.toString());
		}
		
		
		return mv;
	}

	
	/*
	 * ID 중복 확인
	 */
	@RequestMapping(value="/chkDupUid.ajax")
	public ModelAndView chkDupUid(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			int rstCnt = netfuMemberService.selectUidExistCnt(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".chkDupUid Exception !!!!! \n"+e.toString());
		}
		return mv;
	}

	
	/*
	 * 사업자 번호 중복 확인
	 */
	@RequestMapping(value="/chkDupBizNo.ajax")
	public ModelAndView chkDupBizNo(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			int rstCnt = netfuCompanyService.selectBizNoCnt(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".chkDupBizNo Exception !!!!! \n"+e.toString());
		}
		return mv;
	}

	
	/*
	 * 회원가입(회원정보 등록)
	 */
	@RequestMapping(value="/registNetfuMember.ajax")
	public ModelAndView registNetfuMember(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			int rstCnt = netfuMemberService.insertNetfuMember(commandMap.getMap());
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			log.info(this.getClass().getName()+".registNetfuMember Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * ID 찾기
	 */
	@RequestMapping(value="/findId.do")
	public ModelAndView findId(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/login/findId");
		try{
			mv.addObject("map", commandMap.getMap());
		}catch(Exception e){
			log.info(this.getClass().getName()+".findId Exception !!!!! \n"+e.toString());
		}
		return mv;
	}

	
	/*
	 * ID 찾기 - ajax
	 */
	//(begin) 2021.01.03 by s.yoo
	@RequestMapping(value="/findIdProcess.ajax")
	public ModelAndView findIdProcess(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			Map<String, Object> mapResult = netfuMemberService.findId(commandMap.getMap());
			Map<String, Object> memberInfoMap = new HashMap<String, Object>();
			int rstCnt = 0;
			if (!mapResult.isEmpty()) {
				rstCnt = 1;
				commandMap.put("uid", mapResult.get("uid"));
			}
			
			mv.addObject("rstCnt", rstCnt);
			mv.addObject("map", commandMap.getMap());
			mv.setViewName("jsonView");
		}catch(Exception e){
			mv.addObject("rstCnt", 0);
			log.info(this.getClass().getName()+".findIdProcess Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	//(end) 2021.01.03 by s.yoo

	
	/*
	 * 비밀번호 찾기
	 */
	@RequestMapping(value="/findPw.do")
	public ModelAndView findPw(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/login/findPw");
		try{
			mv.addObject("map", commandMap.getMap());
		}catch(Exception e){
			log.info(this.getClass().getName()+".findPw Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	
	/*
	 * 비밀번호 찾기 - ajax
	 */
	//(begin) 2021.01.03 by s.yoo
	@RequestMapping(value="/findPwProcess.ajax")
	public ModelAndView findPwProcess(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			int rstCnt = 0;
			
			Map<String, Object> mapResult = netfuMemberService.findPw(commandMap.getMap());
			if (!mapResult.isEmpty()) {
				commandMap.put("passwd", CommonUtil.getShortRandomString());
				netfuMemberService.resetPw(commandMap.getMap());
				rstCnt = 1;
			}
				
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			mv.addObject("rstCnt", 0);
			log.info(this.getClass().getName()+".findPwProcess Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	//(end) 2021.01.03 by s.yoo

	
	
	/*
	 * 개인 회원정보 수정 페이지 이동
	 */
	@RequestMapping(value="/personModify.do")
	public ModelAndView personModify(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/person/personModify");
			
		return mv;
	}
	

	/*
	 * 기업 회원정보 수정 페이지 이동
	 */
	@RequestMapping(value="/companyModify.do")
	public ModelAndView companyModify(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/company/companyModify");
			
		return mv;
	}
	

	//(begin) 2021.01.03 by s.yoo
	/*
	 * 회원 탈퇴.
	 */
	@RequestMapping(value="/memberUnregister.do")
	public ModelAndView memberUnregister(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/login/memberUnregister");
		try{
			mv.addObject("map", commandMap.getMap());
		}catch(Exception e){
			log.info(this.getClass().getName()+".memberUnregister Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	
	@RequestMapping(value="/memberUnregisterProcess.ajax")
	public ModelAndView memberUnregisterProcess(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			int rstCnt = netfuMemberService.selectUidExistCnt(commandMap.getMap());
			if (rstCnt > 0) {
				netfuMemberService.memberUnregister(commandMap.getMap());
			}
				
			mv.addObject("map", commandMap.getMap());
			mv.addObject("rstCnt", rstCnt);
			mv.setViewName("jsonView");
		}catch(Exception e){
			mv.addObject("rstCnt", 0);
			log.info(this.getClass().getName()+".memberUnregisterProcess Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	//(end) 2021.01.03 by s.yoo

	
}

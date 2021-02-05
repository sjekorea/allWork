package allwork.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.domains.ApiSiteBasicModel;
import com.ilmagna.allworkadmin.api.services.ApiSiteBasicService;

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

   	//(begin) 2021.01.04 by s.yoo
	//@Autowired protected ApiSiteBasicService siteBasicService;
	@Resource(name="apiSiteBasicService")
	protected ApiSiteBasicService siteBasicService;

	//이력서 사진의 Upload folder 경로명.
	@Value("${upload.path.photo}")
	private String filePathPhoto;

	//소셜 Login 정보.
	@Value("${naver.clientId}")
	private String naverClientId;

	@Value("${kakao.clientId}")
	private String kakaoClientId;

	@Value("${google.clientId}")
	private String googleClientId;
   	//(end) 2021.01.04 by s.yoo

	
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
		
		ModelAndView mv = new ModelAndView("/login/personJoin");

		//(begin) 2021.01.05 by s.yoo
		try {
			// 기업회원 가입  - 업종 ( netfu_cate : type = 'job')
			commandMap.put("type", "businesstype");
			List<Map<String, Object>> businesstypeList = netfuCateService.selectNetfuCateList(commandMap.getMap());

			//이용약관과 개인정보 취급방침 전달.
			ApiSiteBasicModel modeSiteBasic = new ApiSiteBasicModel();
			ApiSiteBasicModel item = siteBasicService.getSiteBasic(modeSiteBasic);
			if (item == null) {
				item = new ApiSiteBasicModel(); 
			}
			
			mv.addObject("item", item);
			mv.addObject("rstCnt", 2);
			mv.addObject("map", commandMap.getMap());
			mv.addObject("businesstypeList", businesstypeList);
		}catch(Exception e){
			System.out.println(this.getClass().getName()+".personalJoin.do Exception!!! \n"+e.toString());
		}
		//(end) 2021.01.05 by s.yoo

		return mv;
	}
	
	
	@RequestMapping(value="/companyJoin.do")
	public ModelAndView companyJoin(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/login/companyJoin");
		
		try {
			// 기업회원 가입  - 업종 ( netfu_cate : type = 'job')
			commandMap.put("type", "businesstype");
			List<Map<String, Object>> businesstypeList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 기업회원 가입  - 상장여부 ( netfu_cate : type = 'biz_list')
			commandMap.put("type", "biz_list");
			List<Map<String, Object>> bizList = netfuCateService.selectNetfuCateList(commandMap.getMap());
			
			// 기업회원 가입  - 기업 형태( netfu_cate : type = 'biz_form')
			commandMap.put("type", "biz_form");
			List<Map<String, Object>> bizFormList = netfuCateService.selectNetfuCateList(commandMap.getMap());

			//(begin) 2021.01.05 by s.yoo
			//이용약관과 개인정보 취급방침 전달.
			ApiSiteBasicModel modeSiteBasic = new ApiSiteBasicModel();
			ApiSiteBasicModel item = siteBasicService.getSiteBasic(modeSiteBasic);
			if (item == null) {
				item = new ApiSiteBasicModel(); 
			}
			
			mv.addObject("item", item);
			mv.addObject("rstCnt", 2);
			//(end) 2021.01.05 by s.yoo

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
			commandMap.put("showAll", 1);						//탈퇴한 회원의 사용자 ID도 중복검사를 통해 다시 사용하지 못하도록 함.
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

	//(begin) 2021.01.05 by s.yoo
	//개인회원 등록.
	@RequestMapping(value="/registNetfuMemberProcess.do")
	public ModelAndView registNetfuMemberProcess(CommandMap commandMap, HttpSession session, MultipartHttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView("/login/personJoin");

		try{
			String uid = (String) commandMap.get("uid");
			
			//첨부파일 Upload.
			String strFilename = "";
			MultipartFile photoFile = request.getFile("filePhoto");
			if(photoFile != null && !photoFile.isEmpty()) {
				strFilename = ApiCommonUtils.uploadPhotoFile("photo", uid, photoFile, filePathPhoto);
			}

			//회원 등록.
			int rstCnt = 0;
			if (!ApiCommonUtils.isNullOrEmpty(strFilename))
				commandMap.put("photo", strFilename);
			rstCnt = netfuMemberService.insertNetfuMember(commandMap.getMap());
			rstCnt = 1;
				
			mv.addObject("rstCnt", rstCnt);
			mv.addObject("map", commandMap.getMap());
		}catch(Exception e){
			mv.addObject("rstCnt", 0);
			mv.addObject("map", commandMap.getMap());
			log.info(this.getClass().getName()+".registNetfuMemberProcess Exception !!!!! \n"+e.toString());
		}

		return mv;
	}

	//기업회원 등록.
	@RequestMapping(value="/registNetfuCompanyProcess.do")
	public ModelAndView registNetfuCompanyProcess(CommandMap commandMap, HttpSession session, MultipartHttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView("/login/companyJoin");

		try{
			String uid = (String) commandMap.get("uid");

			//첨부파일 Upload - 회사 Logo 및 회사 사진들.
			String strFileLogo = "";
			MultipartFile fileLogo = request.getFile("fileLogo");
			if(fileLogo != null && !fileLogo.isEmpty()) {
				strFileLogo = ApiCommonUtils.uploadPhotoFile("logo", uid, fileLogo, filePathPhoto);
			}
			String strFilePhoto1 = "";
			MultipartFile filePhoto1 = request.getFile("filePhoto1");
			if(filePhoto1 != null && !filePhoto1.isEmpty()) {
				strFilePhoto1 = ApiCommonUtils.uploadPhotoFile("photo", uid, filePhoto1, filePathPhoto);
			}
			String strFilePhoto2 = "";
			MultipartFile filePhoto2 = request.getFile("filePhoto2");
			if(filePhoto2 != null && !filePhoto2.isEmpty()) {
				strFilePhoto2 = ApiCommonUtils.uploadPhotoFile("photo", uid, filePhoto2, filePathPhoto);
			}
			String strFilePhoto3 = "";
			MultipartFile filePhoto3 = request.getFile("filePhoto3");
			if(filePhoto3 != null && !filePhoto3.isEmpty()) {
				strFilePhoto3 = ApiCommonUtils.uploadPhotoFile("photo", uid, filePhoto3, filePathPhoto);
			}
			String strFilePhoto4 = "";
			MultipartFile filePhoto4 = request.getFile("filePhoto4");
			if(filePhoto4 != null && !filePhoto4.isEmpty()) {
				strFilePhoto4 = ApiCommonUtils.uploadPhotoFile("photo", uid, filePhoto4, filePathPhoto);
			}

			//첨부파일 Upload - 담당자 사진.
			String strFilename = "";
			MultipartFile photoFile = request.getFile("filePhoto");
			if(photoFile != null && !photoFile.isEmpty()) {
				strFilename = ApiCommonUtils.uploadPhotoFile("photo", uid, photoFile, filePathPhoto);
			}
			
			//회사정보 등록.
			if (!ApiCommonUtils.isNullOrEmpty(strFileLogo))	commandMap.put("bizLogo", strFileLogo);
			if (!ApiCommonUtils.isNullOrEmpty(strFilePhoto1))	commandMap.put("photo1", strFilePhoto1);
			if (!ApiCommonUtils.isNullOrEmpty(strFilePhoto2))	commandMap.put("photo2", strFilePhoto2);
			if (!ApiCommonUtils.isNullOrEmpty(strFilePhoto3))	commandMap.put("photo3", strFilePhoto3);
			if (!ApiCommonUtils.isNullOrEmpty(strFilePhoto4))	commandMap.put("photo4", strFilePhoto4);
			netfuCompanyService.insertNetfuCompany(commandMap.getMap());

			//회원정보 등록.
			int rstCnt = 0;
			if (!ApiCommonUtils.isNullOrEmpty(strFilename))
				commandMap.put("photo", strFilename);
			rstCnt = netfuMemberService.insertNetfuMember(commandMap.getMap());
			
			rstCnt = 1;
				
			mv.addObject("rstCnt", rstCnt);
			mv.addObject("map", commandMap.getMap());
		}catch(Exception e){
			mv.addObject("rstCnt", 0);
			mv.addObject("map", commandMap.getMap());
			log.info(this.getClass().getName()+".registNetfuCompanyProcess Exception !!!!! \n"+e.toString());
		}

		return mv;
	}
	//(end) 2021.01.05 by s.yoo

	
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
	@RequestMapping(value="/updateMyInfo.do")
	public ModelAndView updateMyInfo(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/login/updateMyInfo");

		//(begin) 2021.01.04 by s.yoo
		try {
			// 기업회원 가입  - 업종 ( netfu_cate : type = 'job')
			commandMap.put("type", "businesstype");
			List<Map<String, Object>> businesstypeList = netfuCateService.selectNetfuCateList(commandMap.getMap());

			//Login 사용자의 회원정보 전달.
			commandMap.put("loginId", (String)session.getAttribute("SE_LOGIN_ID"));
			Map<String, Object> mapResult = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
		
			mv.addObject("rstCnt", 2);
			mv.addObject("map", mapResult);
			mv.addObject("businesstypeList", businesstypeList);
		}catch(Exception e){
			log.info(this.getClass().getName()+".updateMyInfo Exception !!!!! \n"+e.toString());
		}
		//(end) 2021.01.04 by s.yoo

		return mv;
	}
	
	//(begin) 2021.01.04 by s.yoo
	@RequestMapping(value="/updateMyInfoProcess.do")
	public ModelAndView updateMyInfoProcess(CommandMap commandMap, HttpSession session, MultipartHttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView("/login/updateMyInfo");

		try{
			String uid = (String) commandMap.get("uid");
			
			//첨부파일 Upload.
			String strFilename = "";
			MultipartFile photoFile = request.getFile("filePhoto");
			if(photoFile != null && !photoFile.isEmpty()) {
				strFilename = ApiCommonUtils.uploadPhotoFile("photo", uid, photoFile, filePathPhoto);
			}

			//회원정보 등록.
			int rstCnt = 0;
			commandMap.put("loginId", uid);
			if (!ApiCommonUtils.isNullOrEmpty(strFilename))
				commandMap.put("photo", strFilename);
			Map<String, Object> mapResult = netfuMemberService.selectNetfuMemberMap(commandMap.getMap());
			if (!mapResult.isEmpty()) {
				netfuMemberService.updateMyInfo(commandMap.getMap());
				rstCnt = 1;
			}
				
			mv.addObject("rstCnt", rstCnt);
			mv.addObject("map", commandMap.getMap());
		}catch(Exception e){
			mv.addObject("rstCnt", 0);
			log.info(this.getClass().getName()+".updateMyInfoProcess Exception !!!!! \n"+e.toString());
		}
		return mv;
	}
	//(end) 2021.01.04 by s.yoo


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
		
		mv.addObject("naverClientId", naverClientId); 
		mv.addObject("kakaoClientId", kakaoClientId); 
		mv.addObject("googleClientId", googleClientId); 
		return mv;
	}
	
	@RequestMapping(value="/memberUnregisterProcess.ajax")
	public ModelAndView memberUnregisterProcess(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		try{
			commandMap.put("showAll", 0);						//유효한 사용자 계정에 대해서만 존재여부를 검사한다.
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

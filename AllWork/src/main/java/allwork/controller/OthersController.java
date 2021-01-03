package allwork.controller;

import java.util.Locale;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ilmagna.allworkadmin.api.domains.ApiSiteBasicModel;
import com.ilmagna.allworkadmin.api.services.ApiSiteBasicService;

import allwork.common.CommandMap;

@Controller
public class OthersController {
	
	Logger log = Logger.getLogger(this.getClass());

	
	//(begin) 2020.12.30 by s.yoo
	//@Autowired protected ApiSiteBasicService siteBasicService;
	@Resource(name="apiSiteBasicService")
	protected ApiSiteBasicService siteBasicService;
	//(end) 2020.12.30 by s.yoo

	
	//(begin) 2020.12.30 by s.yoo
	/*
	 * 사이트 맵.
	 */
	@RequestMapping(value="/sitemap.do")
	public ModelAndView sitemap(CommandMap commandMap, Locale locale) {
		
		ModelAndView mv = new ModelAndView("/others/sitemap");
		
		return mv;
	}
	

	/*
	 * 고객센터.
	 */
	@RequestMapping(value="/termsOfService.do")
	public ModelAndView termsOfService(CommandMap commandMap, Locale locale) {
		log.info("/termsOfService.do");

		commandMap.put("siteCode", "1");
		return procSiteBasicView(commandMap, locale);
	}
	
	@RequestMapping(value="/privacyPolicy.do")
	public ModelAndView privacyPolicy(CommandMap commandMap, Locale locale) {
		log.info("/privacyPolicy.do");

		commandMap.put("siteCode", "2");
		return procSiteBasicView(commandMap, locale);
	}
	
	@RequestMapping(value="/mobileGuide.do")
	public ModelAndView mobileGuide(CommandMap commandMap, Locale locale) {
		log.info("/mobileGuide.do");

		commandMap.put("siteCode", "3");
		return procSiteBasicView(commandMap, locale);
	}
	
	@RequestMapping(value="/paymentGuide.do")
	public ModelAndView paymentGuide(CommandMap commandMap, Locale locale) {
		log.info("/paymentGuide.do");

		commandMap.put("siteCode", "4");
		return procSiteBasicView(commandMap, locale);
	}
	

	@RequestMapping(value="/siteBasicView.do")
	public ModelAndView siteBasicView(CommandMap commandMap, Locale locale) {
		log.info("/siteBasicView.do");
		return procSiteBasicView(commandMap, locale);
	}

	protected ModelAndView procSiteBasicView(CommandMap commandMap, Locale locale) {		
		String strView = "";
		int nSiteCode = Integer.parseInt((String) commandMap.get("siteCode"));
		if (nSiteCode == 1) strView = "/others/termsOfService";
		else if (nSiteCode == 2) strView = "/others/privacyPolicy";
		else if (nSiteCode == 3) strView = "/others/mobileGuide";
		else if (nSiteCode == 4) strView = "/others/paymentGuide";
		ModelAndView mv = new ModelAndView(strView);
		
		try {
			//DB에서 Site Basic 정보 검색.
			ApiSiteBasicModel modeSiteBasic = new ApiSiteBasicModel();
			ApiSiteBasicModel item = siteBasicService.getSiteBasic(modeSiteBasic);
			if (item == null) {
				item = new ApiSiteBasicModel(); 
			}
			
			//View에 데이터 전달.
			mv.addObject("item", item);
		} catch(Exception e) {
			log.info(this.getClass().getName()+".siteBasicView Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}
	//(end) 2020.12.30 by s.yoo

}

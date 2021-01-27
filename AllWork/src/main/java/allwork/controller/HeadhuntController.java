package allwork.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ilmagna.allworkadmin.admin.domains.AdminBbsSetupModel;
import com.ilmagna.allworkadmin.admin.services.AdminBbsSetupService;
import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.domains.ApiBbsDataModel;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitItemModel;
import com.ilmagna.allworkadmin.api.services.ApiBbsDataService;
import com.ilmagna.allworkadmin.api.services.ApiRecruitItemService;

import allwork.common.CommandMap;
import allwork.common.util.PaginationUtil;

@Controller
public class HeadhuntController {
	
	Logger log = Logger.getLogger(this.getClass());

	
	//(begin) 2020.12.30 by s.yoo
	private String strBbsType = "netfu_58558_26593";				//채용진행현황 테이블.
	private String strDefaultBoardCode =  "netfu_52508_48920";		//default는 면접진행.
	
	
	@Resource(name="apiRecruitItemService")
	protected ApiRecruitItemService headhuntService;
	
	@Resource(name="adminBbsSetupService")
	protected AdminBbsSetupService bbsSetupService;

	@Resource(name="apiBbsDataService")
	protected ApiBbsDataService bbsService;


	/*
	 * 헤드헌팅 목록.
	 */
	@RequestMapping(value="/headhuntList.do")
	public ModelAndView headhuntList(CommandMap commandMap, Locale locale) {
		log.info("/headhuntList.do");
		
		ModelAndView mv = new ModelAndView("/headhunt/headhuntList");
		
		try {
			//DB에서 헤드헌팅 목록 정보 검색.
			List<ApiRecruitItemModel> item = new ArrayList<ApiRecruitItemModel>();

			ApiRecruitItemModel model = new ApiRecruitItemModel();
			int pageNo = getPageNo(commandMap);
			int pageSize = model.getRows();
			commandMap.put("pageNo", pageNo);

			model.setPagerEnableYn("Y");
			//model.setRows(pageSize);
			model.setPage(pageNo);

			//(1) 전체 항목 개수.
			int totalRows = headhuntService.getRecruitItemTotalCnt(model);
			model.calOffsetValue(totalRows);
			//commandMap.put("total", model.getTotalPage());
			commandMap.put("pageSize", pageSize);

			//(2) 이번 페이지의 데이터 목록.
			model.setShowAll("Y");
			if (commandMap.get("keyword") != null)
				model.setKeyword((String) commandMap.get("keyword"));
			item = headhuntService.getRecruitItemList(model);
			
			//(3) 항목 번호 할당 - N/A.

			//(4) Page 목록.
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(totalRows > 0){
				pageMap = PaginationUtil.makePageInfo(totalRows, pageSize, ("" + pageNo));
				commandMap.put("totalSize", totalRows);
			}

			//View에 데이터 전달.
			mv.addObject("item", item);
			mv.addObject("map", commandMap.getMap());
			mv.addObject("pageMap", pageMap);
		} catch(Exception e) {
			log.info(this.getClass().getName()+".headhuntList Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}


	
	/*
	 * 채용진행현황 인터페이스.
	 */
	//채용진행현황 - 면접진행.
	@RequestMapping(value="/progressInterview.do")
	public ModelAndView progressInterview(CommandMap commandMap, Locale locale) {
		commandMap.put("boardCode", "netfu_52508_48920");
		commandMap.put("pageNo", 1);
		return progressList(commandMap, locale);
	}

	//채용진행현황 - 기업방문.
	@RequestMapping(value="/progressVisitCompany.do")
	public ModelAndView progressVisitCompany(CommandMap commandMap, Locale locale) {
		commandMap.put("boardCode", "netfu_52508_50000");
		commandMap.put("pageNo", 1);
		return progressList(commandMap, locale);
	}

	//채용진행현황 - 이력서제공.
	@RequestMapping(value="/progressProvideResume.do")
	public ModelAndView progressProvideResume(CommandMap commandMap, Locale locale) {
		commandMap.put("boardCode", "netfu_52508_60000");
		commandMap.put("pageNo", 1);
		return progressList(commandMap, locale);
	}

	//채용진행현황 - 재취업성공.
	@RequestMapping(value="/progressSuccess.do")
	public ModelAndView progressSuccess(CommandMap commandMap, Locale locale) {
		commandMap.put("boardCode", "netfu_52508_70000");
		commandMap.put("pageNo", 1);
		return progressList(commandMap, locale);
	}

	//채용진행현황 - 사전면접.
	@RequestMapping(value="/progressPreMeeting.do")
	public ModelAndView progressPreMeeting(CommandMap commandMap, Locale locale) {
		commandMap.put("boardCode", "netfu_52508_80000");
		commandMap.put("pageNo", 1);
		return progressList(commandMap, locale);
	}

	//채용진행현황 - 적응컨설팅.
	@RequestMapping(value="/progressConsulting.do")
	public ModelAndView progressConsulting(CommandMap commandMap, Locale locale) {
		commandMap.put("boardCode", "netfu_52508_90000");
		commandMap.put("pageNo", 1);
		return progressList(commandMap, locale);
	}

	
	/*
	 * 채용진행현황 목록.
	 */
	@RequestMapping(value="/progressList.do")
	public ModelAndView progressList(CommandMap commandMap, Locale locale) {
		log.info("/progressList.do");
		
		ModelAndView mv = new ModelAndView("/headhunt/progressList");
		
		try {
			AdminBbsSetupModel modelSetup = getBoardInfo(commandMap);
			String boardCode = (String) commandMap.get("boardCode");
			String boardName = modelSetup.getBoardName();

			//DB에서 채용진행현황 목록 정보 검색.
			List<ApiBbsDataModel> item = new ArrayList<ApiBbsDataModel>();

			ApiBbsDataModel model = new ApiBbsDataModel();
			int pageNo = getPageNo(commandMap);
			int pageSize = model.getRows();
			commandMap.put("pageNo", pageNo);

			model.setType(strBbsType);
			model.setBoardCode(boardCode);
			model.setPagerEnableYn("Y");
			//model.setRows(pageSize);
			model.setPage(pageNo);

			//(1) 전체 항목 개수.
			int totalRows = bbsService.getBbsDataTotalCnt(model);
			model.calOffsetValue(totalRows);
			//commandMap.put("total", model.getTotalPage());
			commandMap.put("pageSize", pageSize);

			//(2) 이번 페이지의 데이터 목록.
			item = bbsService.getBbsDataList(model);
			
			//(3) 항목 번호 할당.
			int itemNo = totalRows - ((pageNo - 1) * pageSize);
			for (int i = 0; i < item.size(); i++) {
				ApiBbsDataModel data = item.get(i);
				data.setItemNo(itemNo);
				itemNo--;
			}

			//(4) Page 목록.
			Map<String, Object> pageMap = new HashMap<String, Object>();
			if(totalRows > 0){
				pageMap = PaginationUtil.makePageInfo(totalRows, pageSize, ("" + pageNo));
				commandMap.put("totalSize", totalRows);
			}

			//View에 데이터 전달.
			mv.addObject("boardCode", boardCode);
			mv.addObject("boardName", boardName);
			mv.addObject("item", item);
			mv.addObject("map", commandMap.getMap());
			mv.addObject("pageMap", pageMap);
		} catch(Exception e) {
			log.info(this.getClass().getName()+".progressList Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}

	/*
	 * 채용진행현황 상세보기.
	 */
	@RequestMapping(value="/progressView.do")
	public ModelAndView progressView(CommandMap commandMap, Locale locale) {
		log.info("/progressView.do");
		
		ModelAndView mv = new ModelAndView("/headhunt/progressView");
		
		try {
			AdminBbsSetupModel modelSetup = getBoardInfo(commandMap);
			String boardCode = (String) commandMap.get("boardCode");
			String boardName = modelSetup.getBoardName();

			//View 데이터 구성.
			ApiBbsDataModel model = new ApiBbsDataModel();
			int id = getItemId(commandMap);
			model.setType(strBbsType);
			model.setBoardCode(boardCode);
			model.setId(id);
			model = bbsService.getBbsData(model);

			//참조회수 증가.
			incRefCount(commandMap);

			//View에 데이터 전달.
			mv.addObject("boardCode", boardCode);
			mv.addObject("boardName", boardName);
			mv.addObject("item", model);
			mv.addObject("map", commandMap.getMap());
		} catch(Exception e) {
			log.info(this.getClass().getName()+".progressView Exception !!!!! \n"+e.toString());
		}
		
		return mv;
	}


	/*
	 * 채용진행현황 지원기능들.
	 */
	//채용진행현황 설정정보 획득.
	protected AdminBbsSetupModel getBoardInfo(CommandMap commandMap) {

		AdminBbsSetupModel modelSetup = new AdminBbsSetupModel();

		try {
			String boardCode = (String) commandMap.get("boardCode");
			if (ApiCommonUtils.isNullOrEmpty(boardCode)) {
				boardCode = strDefaultBoardCode;
				commandMap.put("boardCode", boardCode);
			}

			//채용진행현황 설정정보.
			modelSetup.setBoardCode(boardCode);
			modelSetup = bbsSetupService.getBbsSetup(modelSetup);
			//String boardName = modelSetup.getBoardName();
		} catch(Exception e) {
			log.info(this.getClass().getName()+".getBoardInfo Exception !!!!! \n"+e.toString());
		}

		return modelSetup;
	}

	//채용진행현황 ID 획득.
	protected int getItemId(CommandMap commandMap) {
		int id = 0;
		try {
			if (commandMap.get("no") == null) return id;
			id = Integer.parseInt((String) commandMap.get("no"));
		} catch(Exception e) {
			log.info(this.getClass().getName()+".getItemId Exception !!!!! \n"+e.toString());
		}
		return id;
	}

	//Page No 획득.
	protected int getPageNo(CommandMap commandMap) {
		int pageNo = 1;
		try {
			if (commandMap.get("pageNo") == null) return pageNo;
			pageNo = Integer.parseInt((String) commandMap.get("pageNo"));
			if (pageNo < 1) pageNo = 1;
		} catch(Exception e) {
			log.info(this.getClass().getName()+".getPageNo Exception !!!!! \n"+e.toString());
		}
		return pageNo;
	}
	
	//채용진행현황 참조 Count 증가.
	protected void incRefCount(CommandMap commandMap) {
		try {
			ApiBbsDataModel model = new ApiBbsDataModel();
			model.setType(strBbsType);
			model.setBoardCode((String) commandMap.get("boardCode"));
			int id = getItemId(commandMap);
			if (id > 0) {
				model.setId(id);
				bbsService.incRefCount(model);
			}
		} catch(Exception e) {
			log.info(this.getClass().getName()+".incRefCount Exception !!!!! \n"+e.toString());
		}
	}

	//(end) 2020.12.30 by s.yoo

}

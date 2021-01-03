package allwork.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ilmagna.allworkadmin.admin.domains.AdminBbsSetupModel;
import com.ilmagna.allworkadmin.admin.services.AdminBbsSetupService;
import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.domains.ApiBbsDataModel;
import com.ilmagna.allworkadmin.api.services.ApiBbsDataService;

import allwork.common.CommandMap;
import allwork.common.util.PaginationUtil;

@Controller
public class CommunityController {
	
	Logger log = Logger.getLogger(this.getClass());

	//(begin) 2020.12.30 by s.yoo
	private String strBbsType = "netfu_58558_26593";				//게시판 테이블.
	private String strDefaultBoardType =  "1";						//default는 List형 게시판.
	private String strDefaultBoardCode =  "netfu_57809_60663";		//default는 공지사항.
	
	
	//@Autowired protected AdminBbsSetupService bbsSetupService;
	//@Autowired protected ApiBbsDataService bbsService;
	
	@Resource(name="adminBbsSetupService")
	protected AdminBbsSetupService bbsSetupService;

	@Resource(name="apiBbsDataService")
	protected ApiBbsDataService bbsService;


	/*
	 * 커뮤니티.
	 */
	@RequestMapping(value="/noticeList.do")
	public ModelAndView noticeList(CommandMap commandMap, Locale locale) {
		log.info("/noticeList.do");

		commandMap.put("pageNo", 1);
		commandMap.put("boardCode", "netfu_57809_60663");
		return procBoardList(commandMap);
	}

	@RequestMapping(value="/faqList.do")
	public ModelAndView faqList(CommandMap commandMap, Locale locale) {
		log.info("/faqList.do");

		commandMap.put("pageNo", 1);
		commandMap.put("boardCode", "netfu_92829_39479");
		return procBoardList(commandMap);
	}

	@RequestMapping(value="/libraryList.do")
	public ModelAndView libraryList(CommandMap commandMap, Locale locale) {
		log.info("/libraryList.do");

		commandMap.put("pageNo", 1);
		commandMap.put("boardCode", "netfu_94498_34711");
		return procBoardList(commandMap);
	}

	
	/*
	 * 게시판 목록
	 */
	@RequestMapping(value="/boardList.do")
	public ModelAndView boardList(CommandMap commandMap) {
		log.info("/boardList.do");
		return procBoardList(commandMap);
	}

	protected ModelAndView procBoardList(CommandMap commandMap) {
		
		ModelAndView mv = new ModelAndView("/community/boardList");

		try {
			AdminBbsSetupModel modelSetup = getBoardInfo(commandMap);
			String boardCode = (String) commandMap.get("boardCode");
			String boardType = (String) commandMap.get("boardType");
			String boardName = modelSetup.getBoardName();

			//게시판 Type에 따른 화면 결정: 1 = List형, 2 = Tile형.
			if (boardType.equalsIgnoreCase("2")) {
				//바둑판식 게시판 구성.
				mv = new ModelAndView("/community/boardTile");
			}

			//DB에서 게시판 목록 정보 검색.
			List<ApiBbsDataModel> item = new ArrayList<ApiBbsDataModel>();

			ApiBbsDataModel model = new ApiBbsDataModel();
			int pageNo = getPageNo(commandMap);
			int pageSize = model.getRows();
			if (boardType.equalsIgnoreCase("2")) pageSize = 18;
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
			mv.addObject("boardType", boardType);
			mv.addObject("boardCode", boardCode);
			mv.addObject("boardName", boardName);
			mv.addObject("item", item);
			mv.addObject("map", commandMap.getMap());
			mv.addObject("pageMap", pageMap);
		} catch(Exception e) {
			log.info(this.getClass().getName()+".boardList Exception !!!!! \n"+e.toString());
		}

		return mv;
	}
	
	
	/*
	 * 게시판 보기
	 */
	@RequestMapping(value="/boardView.do")
	public ModelAndView boardView(CommandMap commandMap) {
		log.info("/boardView.do");

		ModelAndView mv = new ModelAndView("/community/boardView");
		
		try {
			AdminBbsSetupModel modelSetup = getBoardInfo(commandMap);
			String boardCode = (String) commandMap.get("boardCode");
			String boardType = (String) commandMap.get("boardType");
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
			mv.addObject("boardType", boardType);
			mv.addObject("boardCode", boardCode);
			mv.addObject("boardName", boardName);
			mv.addObject("item", model);
			mv.addObject("map", commandMap.getMap());
		} catch(Exception e) {
			log.info(this.getClass().getName()+".boardView Exception !!!!! \n"+e.toString());
		}

		return mv;
	}
	
	
	/*
	 * 게시판 등록
	 */
	@RequestMapping(value="/boardEdit.do")
	public ModelAndView boardEdit(CommandMap commandMap, HttpSession session) {
		log.info("/boardEdit.do");

		ModelAndView mv = new ModelAndView("/community/boardEdit");
		
		try {
			AdminBbsSetupModel modelSetup = getBoardInfo(commandMap);
			String boardCode = (String) commandMap.get("boardCode");
			String boardType = (String) commandMap.get("boardType");
			String boardName = modelSetup.getBoardName();

			//View 데이터 구성.
			ApiBbsDataModel model = new ApiBbsDataModel();
			model.setType(strBbsType);
			model.setBoardCode(boardCode);
			int id = getItemId(commandMap);
			if (id > 0) {
				model.setId(id);
				model = bbsService.getBbsData(model);				
			} else {
				model.setId(0);
				model.setUid((String)session.getAttribute("SE_LOGIN_ID"));
			}

			//View에 데이터 전달.
			mv.addObject("boardType", boardType);
			mv.addObject("boardCode", boardCode);
			mv.addObject("boardName", boardName);
			mv.addObject("item", model);
			mv.addObject("map", commandMap.getMap());
		} catch(Exception e) {
			log.info(this.getClass().getName()+".boardEdit Exception !!!!! \n"+e.toString());
		}

		return mv;
	}


	/*
	 * 게시판 지원기능들.
	 */
	//게시판 설정정보 획득.
	protected AdminBbsSetupModel getBoardInfo(CommandMap commandMap) {

		AdminBbsSetupModel modelSetup = new AdminBbsSetupModel();

		try {
			String boardCode = (String) commandMap.get("boardCode");
			if (ApiCommonUtils.isNullOrEmpty(boardCode)) {
				boardCode = strDefaultBoardCode;
				commandMap.put("boardCode", boardCode);
			}

			//게시판 Type에 따른 화면 결정: 1 = List형, 2 = Tile형.
			modelSetup.setBoardCode(boardCode);
			modelSetup = bbsSetupService.getBbsSetup(modelSetup);
			String boardType = strDefaultBoardType;
			//String boardName = modelSetup.getBoardName();
			if (modelSetup.getType().equalsIgnoreCase("2")) {
				//바둑판식 게시판 구성.
				boardType = "2";
			}

			if (ApiCommonUtils.isNullOrEmpty((String) commandMap.get("boardType"))) {
				commandMap.put("boardType", boardType);
			}
		} catch(Exception e) {
			log.info(this.getClass().getName()+".getBoardInfo Exception !!!!! \n"+e.toString());
		}

		return modelSetup;
	}

	//게시글 ID 획득.
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
	
	//게시판 참조 Count 증가.
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
	//(End) 2020.12.30 by s.yoo

}

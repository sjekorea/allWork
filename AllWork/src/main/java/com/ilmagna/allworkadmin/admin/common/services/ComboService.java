package com.ilmagna.allworkadmin.admin.common.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.admin.common.domains.InputParam;
import com.ilmagna.allworkadmin.admin.common.domains.ListObj;
import com.ilmagna.allworkadmin.admin.common.domains.ListType;
import com.ilmagna.allworkadmin.admin.common.domains.ListValue;
import com.ilmagna.allworkadmin.admin.common.domains.SelectReq;
import com.ilmagna.allworkadmin.admin.daos.AdminBbsGroupSetupDAO;
import com.ilmagna.allworkadmin.admin.daos.AdminBbsSetupDAO;
import com.ilmagna.allworkadmin.admin.domains.AdminBbsGroupSetupModel;
import com.ilmagna.allworkadmin.admin.domains.AdminBbsSetupModel;
import com.ilmagna.allworkadmin.api.config.ApiConstant;
import com.ilmagna.allworkadmin.api.daos.ApiMemberDAO;
import com.ilmagna.allworkadmin.api.daos.ApiRecruitCompanyDAO;
import com.ilmagna.allworkadmin.api.daos.ApiRecruitItemDAO;
import com.ilmagna.allworkadmin.api.domains.ApiMemberModel;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitCompanyModel;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitItemModel;
import com.ilmagna.allworkadmin.api.domains.ApiCategoryModel;


@Service
public class ComboService {
	private Log logger = LogFactory.getLog(ComboService.class);
	
	/*
	@Autowired private ApiMemberDAO memberDAO;
	@Autowired private AdminBbsGroupSetupDAO bbsGroupDAO;
	@Autowired private AdminBbsSetupDAO bbsDAO;
	@Autowired private ApiRecruitCompanyDAO recruitCompanyDAO;
	@Autowired private ApiRecruitItemDAO recruitItemDAO;
	@Autowired private ApiCategoryDAO categoryDAO;
	

	public void getCodes(InputParam inputParam, Map<String, Object> resultMap) throws Exception {
		if (inputParam.getSelectReq() != null && inputParam.getSelectReq().getParam() != null && inputParam.getSelectReq().getParam().size() > 0) {
			
			resultMap.put(ApiConstant.Result.RESULT_CODE_KEY, ApiConstant.Result.RESULT_SUCCESS);
			resultMap.put("selCodes", getSelect(inputParam.getCodes(), inputParam.getSelectReq()));
		}
	}

	//public ListValues getSelect(SelectReq selectReq) {
	public Map<ListType, List<ListValue>> getSelect(List<String> codes, SelectReq selectReq) {
		logger.trace(String.format("/list/getSelect"));
		//ListValues res = new ListValues();

		Map<ListType, List<ListValue>> resultData = new HashMap<ListType, List<ListValue>>();
		
		try {
			for (ListType type : selectReq.getParam()) {
				List<ListValue> list = getList(type, codes);
				if (list != null)
					resultData.put(type, list);		
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		//return res;
		return resultData;
	}

	public List<ListValue> getList(ListType type, List<String> codes) {
		List<ListValue> res = new ArrayList<ListValue>();
		
		try {
			//사용자(회원)
			if (type == ListType.userId || type == ListType.userName) {
				List<ApiMemberModel> listUser = null;
				listUser = memberDAO.getMemberIdList(null);

				if (type == ListType.userId) {
					for (ApiMemberModel user : listUser)
						res.add(new ListValue(user.getId().toString(), user.getUser_id(), user.getUser_name()));
				} else if (type == ListType.userName) {
					for (ApiMemberModel user : listUser)
						res.add(new ListValue(user.getId().toString(), user.getUser_name(), user.getUser_id()));
				}
			}
			
			//회원관리.
			else if (type == ListType.recruitCompanyCode || type == ListType.recruitCompanyName) {
				//게시판 그룹 목록.
				List<ApiRecruitCompanyModel> listRecruitCompany = null;
				ApiRecruitCompanyModel model = new ApiRecruitCompanyModel();
				listRecruitCompany = recruitCompanyDAO.getRecruitCompanyCodeList(model);
				
				if (type == ListType.recruitCompanyCode || type == ListType.recruitCompanyName) {
					for (ApiRecruitCompanyModel recruitCompany : listRecruitCompany) {
						res.add(new ListValue(recruitCompany.getId().toString(), recruitCompany.getCompany_title(), recruitCompany.getId().toString()));
					}
				}
			}
			else if (type == ListType.recruitItemCode || type == ListType.recruitItemName) {
				//게시판 그룹 목록.
				List<ApiRecruitItemModel> listRecruitItem = null;
				ApiRecruitItemModel model = new ApiRecruitItemModel();
				model.setCompany_id(Integer.parseInt(codes.get(0)));
				listRecruitItem = recruitItemDAO.getRecruitItemCodeList(model);
				
				if (type == ListType.recruitItemCode || type == ListType.recruitItemName) {
					for (ApiRecruitItemModel recruitCompany : listRecruitItem) {
						res.add(new ListValue(recruitCompany.getId().toString(), recruitCompany.getRecruit_item_contents(), recruitCompany.getId().toString()));
					}
				}
			}

			//게시판 관리.
			else if (type == ListType.bbsGroupCode || type == ListType.bbsGroupName) {
				//게시판 그룹 목록.
				List<AdminBbsGroupSetupModel> listBbsGroup = null;
				AdminBbsGroupSetupModel model = new AdminBbsGroupSetupModel();
				model.setSidx("name");
				model.setSord("asc");
				listBbsGroup = bbsGroupDAO.getBbsGroupSetupCodeList(model);
				
				if (type == ListType.bbsGroupCode || type == ListType.bbsGroupName) {
					for (AdminBbsGroupSetupModel bbsGroup : listBbsGroup) {
						res.add(new ListValue(bbsGroup.getCode(), bbsGroup.getName(), bbsGroup.getCode()));
					}
				}
			}
			else if (type == ListType.bbsSubGroupCode || type == ListType.bbsSubGroupName) {
				//게시판 Sub 그룹 목록.
				List<AdminBbsSetupModel> listBbs = null;
				AdminBbsSetupModel model = new AdminBbsSetupModel();
				model.setCode(codes.get(0));
				model.setSidx("name");
				model.setSord("asc");
				listBbs = bbsDAO.getBbsSubGroupSetupCodeList(model);
				
				if (type == ListType.bbsSubGroupCode || type == ListType.bbsSubGroupName) {
					for (AdminBbsSetupModel bbs : listBbs) {
						res.add(new ListValue(bbs.getP_code(), bbs.getBoard_name(), bbs.getP_code()));
					}
				}
			}
			else if (type == ListType.bbsCode || type == ListType.bbsName) {
				//게시판 목록.
				List<AdminBbsSetupModel> listBbs = null;
				AdminBbsSetupModel model = new AdminBbsSetupModel();
				//model.setCode(codes.get(0));
				//model.setP_code(codes.get(1));
				model.setSidx("name");
				model.setSord("asc");
				listBbs = bbsDAO.getBbsSetupCodeList(model);
				
				if (type == ListType.bbsCode || type == ListType.bbsName) {
					for (AdminBbsSetupModel bbs : listBbs) {
						res.add(new ListValue(bbs.getBoard_code(), bbs.getBoard_name(), bbs.getBoard_code()));
					}
				}
			}
			
			//직종 관리.
			else if (type == ListType.bizTypeCode || type == ListType.bizTypeName) {
				res.add(new ListValue("1",  "[일반직/프리] 제조·생산·화학업", "IA000000"));
				res.add(new ListValue("2",  "[일반직/프리] IT·정보통신업", "IB000000"));
				res.add(new ListValue("3",  "[일반직/프리] 건설유통·무역·판매현장", "IC000000"));
				res.add(new ListValue("4",  "[일반직/프리] 의료·제약", "ID000000"));
				res.add(new ListValue("5",  "[일반직/프리] 미디어·광고·디자인", "IE000000"));
				res.add(new ListValue("6",  "[일반직/프리] 금융·교육업", "IF000000"));
				res.add(new ListValue("7",  "[일반직/프리] 건설·건축", "IG000000"));
				res.add(new ListValue("8",  "[일반직/프리] 서비스업", "IH000000"));
				res.add(new ListValue("9",  "[일반직/프리] 기관·협회", "II000000"));
				res.add(new ListValue("10", "[일반직/프리] 기타", "IJ000000"));
				res.add(new ListValue("21", "[알바] 건설현장", "PA000000"));
				res.add(new ListValue("22", "[알바] 물류/택배/배송", "PB000000"));
				res.add(new ListValue("23", "[알바] 운전", "PC000000"));
				res.add(new ListValue("24", "[알바] 경비/주차", "PD000000"));
				res.add(new ListValue("25", "[알바] IT 프로그래머", "PE000000"));
				res.add(new ListValue("26", "[알바] 카페/베이커리", "PF000000"));
				res.add(new ListValue("27", "[알바] 음식점 주방/서빙", "PG000000"));
				res.add(new ListValue("28", "[알바] 음식배달", "PH000000"));
				res.add(new ListValue("29", "[알바] 사무/회계", "PI000000"));
				res.add(new ListValue("30", "[알바] 간병", "PJ000000"));
				res.add(new ListValue("31", "[알바] 강사/교육", "PK000000"));
				res.add(new ListValue("32", "[알바] 판매/도소매", "PL000000"));
				res.add(new ListValue("33", "[알바] 창고관리", "PM000000"));
				res.add(new ListValue("34", "[알바] 호텔/숙박업", "PN000000"));
				res.add(new ListValue("35", "[알바] 생산/제조", "PO000000"));
				res.add(new ListValue("36", "[알바] 영업/상담", "PP000000"));
				res.add(new ListValue("37", "[알바] 농업/임업/축산업", "PQ000000"));
				res.add(new ListValue("38", "[알바] 단순노무/기타 서비스", "PR000000"));
			}

			//근무지 관리.
			else if (type == ListType.bizAreaCode || type == ListType.bizAreaName) {
				List<ApiCategoryModel> listCodeType = null;
				ApiCategoryModel model = new ApiCategoryModel();
				model.setType("area");
				model.setSidx("rank");
				model.setSord("asc");
				model.setPagerEnableYn("N");
				listCodeType = categoryDAO.getArea1stList(model);
				
				if (type == ListType.bizAreaCode || type == ListType.bizAreaName) {
					int nId = 0;
					for (ApiCategoryModel codeType : listCodeType) {
						nId++;
						res.add(new ListValue(nId + "", codeType.getName(), codeType.getCode()));
					}
				}
			}

			//코드 관리.
			else if (type == ListType.categoryTypeId || type == ListType.categoryTypeName) {
				List<String> listCodeType = null;
				ApiCategoryModel model = new ApiCategoryModel();
				model.setSidx("name");
				model.setSord("asc");
				listCodeType = categoryDAO.getCategoryTypeList(model);
				
				if (type == ListType.categoryTypeId || type == ListType.categoryTypeName) {
					int nId = 0;
					for (String codeType : listCodeType) {
						nId++;
						res.add(new ListValue(nId + "", codeType, codeType));
					}
				}
			}
			else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	
	
	public void getCodeObjs(InputParam inputParam, Map<String, Object> resultMap) throws Exception {
		if (inputParam.getSelectReq() != null && inputParam.getSelectReq().getParam() != null && inputParam.getSelectReq().getParam().size() > 0) {
			
			resultMap.put(ApiConstant.Result.RESULT_CODE_KEY, ApiConstant.Result.RESULT_SUCCESS);
			resultMap.put("selCodes", getSelectObj(inputParam.getCodes(), inputParam.getSelectReq()));
		}
	}

	public Map<ListType, List<ListObj>> getSelectObj(List<String> codes, SelectReq selectReq) {
		logger.trace(String.format("/list/getSelectObj"));
		//ListObj res = new ListObj();

		Map<ListType, List<ListObj>> resultData = new HashMap<ListType, List<ListObj>>();
		
		try {
			for (ListType type : selectReq.getParam()) {
				
				List<ListObj> list = getListObj(type, codes);
				if (list != null)
					resultData.put(type, list);		
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		//return res;
		return resultData;
	}	
	*/
}

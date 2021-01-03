package com.ilmagna.allworkadmin.api.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.common.ApiConvertorUtil;
import com.ilmagna.allworkadmin.api.daos.ApiMemberDAO;
import com.ilmagna.allworkadmin.api.domains.ApiMemberModel;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitModel;
import com.ilmagna.allworkadmin.api.domains.ApiResumeModel;

@Service
public class ApiMemberService {
		
	@Autowired private ApiMemberDAO memberDAO;
	
	
	public List<ApiMemberModel> getMemberList(ApiMemberModel model) throws Exception {
		//return memberDAO.getMemberList(model);
		List<ApiMemberModel> list = memberDAO.getMemberList(model);

		List<ApiMemberModel> listResult = new ArrayList<ApiMemberModel>();
		for(int i = 0; i < list.size(); i++) {
			listResult.add(procDataItem(list.get(i)));
		}
		return listResult;
	}
	
	public ApiMemberModel getMember(ApiMemberModel model) throws Exception {
		//return userDAO.getMember(model);
		ApiMemberModel item = new ApiMemberModel();		
		if((model.getId() != null && model.getId() > 0) || !ApiCommonUtils.isNullOrEmpty(model.getUser_id())) {
			List<ApiMemberModel> list = memberDAO.getMember(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
				item = procDataItem(item);
			}
		}
		return item;
	}

	protected ApiMemberModel procDataItem(ApiMemberModel item) {
		try {
			//성별.
			String strSex = ApiConvertorUtil.getSex(item.getSex());
			item.setStrSex(strSex);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return item;
	}
	
	
	
	public int getMemberTotalCnt(ApiMemberModel model) throws Exception {
		return memberDAO.getMemberTotalCnt(model);
	}

	public Integer getMemberMaxId(ApiMemberModel model) throws Exception {
		return memberDAO.getMemberMaxId(model);
	}

	public Integer getMemberDuplicatedCount(ApiMemberModel model) throws Exception {
		return memberDAO.getMemberDuplicatedCount(model);
	}

	public Integer findMember(ApiMemberModel model) throws Exception {
		return memberDAO.findMember(model);
	}

	public Integer findMemberWithUserID(String user_id) throws Exception {
		return memberDAO.findMemberWithUserID(user_id);
	}

	public Integer findMemberWithUserIDPw(ApiMemberModel model) throws Exception {
		int count =0;
		try {
			count = memberDAO.findMemberWithUserIDPw(model);
		} catch(Exception ex) {}
		return count;
	}

	public ApiMemberModel findMemberID(ApiMemberModel model) throws Exception {
		//return userDAO.findMemberID(model);
		ApiMemberModel item = new ApiMemberModel();		
		if(!ApiCommonUtils.isNullOrEmpty(model.getUser_name())) {
			List<ApiMemberModel> list = memberDAO.findMemberID(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			}
		}
		return item;
	}

	public Integer findMemberPw(ApiMemberModel model) throws Exception {
		return memberDAO.findMemberPw(model);
	}

	public void insertMember(ApiMemberModel model) throws Exception {
		memberDAO.insertMember(model);
	}

	public void registerMember(ApiMemberModel model) throws Exception {
		memberDAO.registerMember(model);
	}

	public void unregisterMember(ApiMemberModel model) throws Exception {
		memberDAO.unregisterMember(model);
	}

	public void updateMember(ApiMemberModel model) throws Exception {
		memberDAO.updateMember(model);
	}
	
	public void deleteMember(ApiMemberModel model) throws Exception {
		memberDAO.deleteMember(model);
	}
	
	public void deleteMemberList(List<ApiMemberModel> map) throws Exception {
		memberDAO.deleteMemberList(map);
	}

	public void insertExcelMember(List<ApiMemberModel> map) throws Exception {
		memberDAO.insertExcelMember(map);
	}
	
	public List<ApiMemberModel> getMemberIdList(ApiMemberModel model) throws Exception {
		return memberDAO.getMemberIdList(model);
	}
	
	public void resetMemberPw(ApiMemberModel model) throws Exception {
		memberDAO.resetMemberPw(model);
	}

	public void changeMemberPw(ApiMemberModel model) throws Exception {
		memberDAO.changeMemberPw(model);
	}

	public void updateMemberInfo(ApiMemberModel model) throws Exception {
		memberDAO.updateMemberInfo(model);
	}
	
	
	
	

	public void updatePushToken(ApiMemberModel model) throws Exception {
		memberDAO.updatePushToken(model);
	}
	
	public List<ApiMemberModel> getPushMemberList(ApiRecruitModel model) throws Exception {
		//지역과 직종이 Null 또는 전체인 항목 제외.
		if ( (ApiCommonUtils.isNullOrEmpty(model.getBiz_area1()) || model.getBiz_area1().equalsIgnoreCase("netfu_78942_85121"))
					&& (ApiCommonUtils.isNullOrEmpty(model.getBiz_type1())) ) {
			return new ArrayList<ApiMemberModel>();
		}
		
		//return memberDAO.getPushMemberList(model);
		List<ApiMemberModel> list = memberDAO.getPushMemberList(model);

		List<ApiMemberModel> listResult = new ArrayList<ApiMemberModel>();
		for(int i = 0; i < list.size(); i++) {
			listResult.add(procDataItem(list.get(i)));
		}
		return listResult;
	}
	
	public List<ApiMemberModel> getPushCompanyList(ApiResumeModel model) throws Exception {
		//지역과 직종이 Null 또는 전체인 항목 제외.
		if ( (ApiCommonUtils.isNullOrEmpty(model.getInid_area1()) || model.getInid_area1().equalsIgnoreCase("netfu_78942_85121"))
				&& (ApiCommonUtils.isNullOrEmpty(model.getInid_type1())) ) {
			return new ArrayList<ApiMemberModel>();
		}
		
		//return memberDAO.getPushCompanyList(model);
		List<ApiMemberModel> list = memberDAO.getPushCompanyList(model);

		List<ApiMemberModel> listResult = new ArrayList<ApiMemberModel>();
		for(int i = 0; i < list.size(); i++) {
			listResult.add(procDataItem(list.get(i)));
		}
		return listResult;
	}

}

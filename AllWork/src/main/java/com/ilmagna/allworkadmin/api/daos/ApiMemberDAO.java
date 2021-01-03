package com.ilmagna.allworkadmin.api.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiMemberModel;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitModel;
import com.ilmagna.allworkadmin.api.domains.ApiResumeModel;


@Repository
public interface ApiMemberDAO {

	List<ApiMemberModel> getMemberList(ApiMemberModel model) throws Exception;

	List<ApiMemberModel> getMember(ApiMemberModel model) throws Exception;
	
	Integer getMemberTotalCnt(ApiMemberModel model) throws Exception;

	Integer getMemberMaxId(ApiMemberModel model) throws Exception;

	Integer getMemberDuplicatedCount(ApiMemberModel model) throws Exception;

	Integer findMember(ApiMemberModel model) throws Exception;

	Integer findMemberWithUserID(String user_id) throws Exception;

	Integer findMemberWithUserIDPw(ApiMemberModel model) throws Exception;

	List<ApiMemberModel> findMemberID(ApiMemberModel model) throws Exception;
	
	Integer findMemberPw(ApiMemberModel model) throws Exception;

	void insertMember(ApiMemberModel model) throws Exception;

	void registerMember(ApiMemberModel model) throws Exception;

	void unregisterMember(ApiMemberModel model) throws Exception;

	void updateMember(ApiMemberModel model) throws Exception;
	
	void deleteMember(ApiMemberModel model) throws Exception;

	void deleteMemberList(List<ApiMemberModel> map) throws Exception;

	void insertExcelMember(List<ApiMemberModel> map) throws Exception;

	List<ApiMemberModel> getMemberIdList(ApiMemberModel model) throws Exception;
	
	void resetMemberPw(ApiMemberModel model) throws Exception;

	void changeMemberPw(ApiMemberModel model) throws Exception;

	void updateMemberInfo(ApiMemberModel model) throws Exception;
	
	

	void updatePushToken(ApiMemberModel model) throws Exception;

	List<ApiMemberModel> getPushMemberList(ApiRecruitModel model) throws Exception;

	List<ApiMemberModel> getPushCompanyList(ApiResumeModel model) throws Exception;

}

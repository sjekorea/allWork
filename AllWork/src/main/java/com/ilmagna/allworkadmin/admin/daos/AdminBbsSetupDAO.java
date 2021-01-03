package com.ilmagna.allworkadmin.admin.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.admin.domains.AdminBbsSetupModel;

import allwork.common.dao.AbstractDAO;


@Repository("adminBbsSetupDAO")
public class AdminBbsSetupDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public AdminBbsSetupModel getBbsSetup(AdminBbsSetupModel model) throws Exception {
		//return (AdminBbsSetupModel) selectOne("com.ilmagna.allworkadmin.api.daos.ApiCategoryDAO.getBbsSetup", model);

		List<AdminBbsSetupModel> list = (List<AdminBbsSetupModel>) selectList("com.ilmagna.allworkadmin.admin.daos.AdminBbsSetupDAO.getBbsSetup", model);
		if (list == null || list.size() < 1) return new AdminBbsSetupModel();
		
		return list.get(0);
	}

	/*
	List<AdminBbsSetupModel> getBbsSetupList(AdminBbsSetupModel model) throws Exception;

	List<AdminBbsSetupModel> getBbsSetup(AdminBbsSetupModel model) throws Exception;
	
	Integer getBbsSetupTotalCnt(AdminBbsSetupModel model) throws Exception;

	Integer getBbsSetupDuplicatedCount(AdminBbsSetupModel model) throws Exception;

	Integer findBbsSetup(AdminBbsSetupModel model) throws Exception;

	Integer findBbsSetupWithCode(String user_id) throws Exception;

	Integer findBbsSetupWithName(AdminBbsSetupModel model) throws Exception;

	void insertBbsSetup(AdminBbsSetupModel model) throws Exception;

	void updateBbsSetup(AdminBbsSetupModel model) throws Exception;
	
	void deleteBbsSetup(AdminBbsSetupModel model) throws Exception;

	void deleteBbsSetupList(List<AdminBbsSetupModel> map) throws Exception;

	void insertExcelBbsSetup(List<AdminBbsSetupModel> map) throws Exception;

	List<AdminBbsSetupModel> getBbsSetupCodeList(AdminBbsSetupModel model) throws Exception;
	List<AdminBbsSetupModel> getBbsSubGroupSetupCodeList(AdminBbsSetupModel model) throws Exception;
	*/
}

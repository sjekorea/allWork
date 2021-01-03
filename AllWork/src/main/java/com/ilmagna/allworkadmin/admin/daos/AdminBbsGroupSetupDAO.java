package com.ilmagna.allworkadmin.admin.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.admin.domains.AdminBbsGroupSetupModel;


@Repository
public interface AdminBbsGroupSetupDAO {

	List<AdminBbsGroupSetupModel> getBbsGroupSetupList(AdminBbsGroupSetupModel model) throws Exception;

	List<AdminBbsGroupSetupModel> getBbsGroupSetup(AdminBbsGroupSetupModel model) throws Exception;
	
	Integer getBbsGroupSetupTotalCnt(AdminBbsGroupSetupModel model) throws Exception;

	Integer getBbsGroupSetupDuplicatedCount(AdminBbsGroupSetupModel model) throws Exception;

	Integer findBbsGroupSetup(AdminBbsGroupSetupModel model) throws Exception;

	Integer findBbsGroupSetupWithCode(String user_id) throws Exception;

	void insertBbsGroupSetup(AdminBbsGroupSetupModel model) throws Exception;

	void updateBbsGroupSetup(AdminBbsGroupSetupModel model) throws Exception;
	
	void deleteBbsGroupSetup(AdminBbsGroupSetupModel model) throws Exception;

	void deleteBbsGroupSetupList(List<AdminBbsGroupSetupModel> map) throws Exception;

	void insertExcelBbsGroupSetup(List<AdminBbsGroupSetupModel> map) throws Exception;

	List<AdminBbsGroupSetupModel> getBbsGroupSetupCodeList(AdminBbsGroupSetupModel model) throws Exception;
}

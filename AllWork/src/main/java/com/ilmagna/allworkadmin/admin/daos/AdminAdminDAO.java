package com.ilmagna.allworkadmin.admin.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.admin.domains.AdminAdminModel;


@Repository
public interface AdminAdminDAO {

	List<AdminAdminModel> getAdminList(AdminAdminModel model) throws Exception;

	List<AdminAdminModel> getAdmin(AdminAdminModel model) throws Exception;
	
	Integer getAdminTotalCnt(AdminAdminModel model) throws Exception;

	Integer getAdminDuplicatedCount(AdminAdminModel model) throws Exception;

	Integer findAdmin(AdminAdminModel model) throws Exception;

	Integer findAdminWithUserID(String user_id) throws Exception;

	Integer findAdminWithUserIDPw(AdminAdminModel model) throws Exception;

	void insertAdmin(AdminAdminModel model) throws Exception;

	void registerAdmin(AdminAdminModel model) throws Exception;

	void updateAdmin(AdminAdminModel model) throws Exception;
	
	void deleteAdmin(AdminAdminModel model) throws Exception;

	void deleteAdminList(List<AdminAdminModel> map) throws Exception;

	void insertExcelAdmin(List<AdminAdminModel> map) throws Exception;

	List<AdminAdminModel> getAdminIdList(AdminAdminModel model) throws Exception;
	
	void resetAdminPw(AdminAdminModel model) throws Exception;

	void changeAdminPw(AdminAdminModel model) throws Exception;

	void updateAdminInfo(AdminAdminModel model) throws Exception;
}

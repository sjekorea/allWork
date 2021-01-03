package com.ilmagna.allworkadmin.admin.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.admin.domains.AdminPopupModel;


@Repository
public interface AdminPopupDAO {

	List<AdminPopupModel> getPopupList(AdminPopupModel model) throws Exception;

	List<AdminPopupModel> getPopup(AdminPopupModel model) throws Exception;
	
	Integer getPopupTotalCnt(AdminPopupModel model) throws Exception;

	Integer getPopupDuplicatedCount(AdminPopupModel model) throws Exception;

	Integer findPopup(AdminPopupModel model) throws Exception;

	void insertPopup(AdminPopupModel model) throws Exception;

	void updatePopup(AdminPopupModel model) throws Exception;
	
	void deletePopup(AdminPopupModel model) throws Exception;

	void deletePopupList(List<AdminPopupModel> map) throws Exception;

	void insertExcelPopup(List<AdminPopupModel> map) throws Exception;
}

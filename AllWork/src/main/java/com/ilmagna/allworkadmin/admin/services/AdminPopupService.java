package com.ilmagna.allworkadmin.admin.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.admin.daos.AdminPopupDAO;
import com.ilmagna.allworkadmin.admin.domains.AdminPopupModel;
import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;

@Service
public class AdminPopupService {
		
	@Autowired private AdminPopupDAO recommendDAO;
	
	
	public List<AdminPopupModel> getPopupList(AdminPopupModel model) throws Exception {
		return recommendDAO.getPopupList(model);
	}
	
	public AdminPopupModel getPopup(AdminPopupModel model) throws Exception {
		//return userDAO.getPopup(model);
		AdminPopupModel item = new AdminPopupModel();		
		if(!ApiCommonUtils.isNullOrEmpty(model.getId())) {
			List<AdminPopupModel> list = recommendDAO.getPopup(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			}
		}
		return item;
	}

	public int getPopupTotalCnt(AdminPopupModel model) throws Exception {
		return recommendDAO.getPopupTotalCnt(model);
	}

	public Integer getPopupDuplicatedCount(AdminPopupModel model) throws Exception {
		return recommendDAO.getPopupDuplicatedCount(model);
	}

	public Integer findPopup(AdminPopupModel model) throws Exception {
		return recommendDAO.findPopup(model);
	}

	public void insertPopup(AdminPopupModel model) throws Exception {
		recommendDAO.insertPopup(model);
	}

	public void updatePopup(AdminPopupModel model) throws Exception {
		recommendDAO.updatePopup(model);
	}
	
	public void deletePopup(AdminPopupModel model) throws Exception {
		recommendDAO.deletePopup(model);
	}
	
	public void deletePopupList(List<AdminPopupModel> map) throws Exception {
		recommendDAO.deletePopupList(map);
	}

	public void insertExcelPopup(List<AdminPopupModel> map) throws Exception {
		recommendDAO.insertExcelPopup(map);
	}
}

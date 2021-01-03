package com.ilmagna.allworkadmin.admin.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.admin.daos.AdminBbsGroupSetupDAO;
import com.ilmagna.allworkadmin.admin.domains.AdminBbsGroupSetupModel;

@Service
public class AdminBbsGroupSetupService {
		
	@Autowired private AdminBbsGroupSetupDAO bbsDAO;
	
	
	public List<AdminBbsGroupSetupModel> getBbsGroupSetupList(AdminBbsGroupSetupModel model) throws Exception {
		return bbsDAO.getBbsGroupSetupList(model);
	}
	
	public AdminBbsGroupSetupModel getBbsGroupSetup(AdminBbsGroupSetupModel model) throws Exception {
		//return userDAO.getBbsGroupSetup(model);
		AdminBbsGroupSetupModel item = new AdminBbsGroupSetupModel();		
		if(model.getId() > 0) {
			List<AdminBbsGroupSetupModel> list = bbsDAO.getBbsGroupSetup(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			}
		}
		return item;
	}

	public int getBbsGroupSetupTotalCnt(AdminBbsGroupSetupModel model) throws Exception {
		return bbsDAO.getBbsGroupSetupTotalCnt(model);
	}

	public Integer getBbsGroupSetupDuplicatedCount(AdminBbsGroupSetupModel model) throws Exception {
		return bbsDAO.getBbsGroupSetupDuplicatedCount(model);
	}

	public Integer findBbsGroupSetup(AdminBbsGroupSetupModel model) throws Exception {
		return bbsDAO.findBbsGroupSetup(model);
	}

	public Integer findBbsGroupSetupWithCode(String user_id) throws Exception {
		return bbsDAO.findBbsGroupSetupWithCode(user_id);
	}

	public void insertBbsGroupSetup(AdminBbsGroupSetupModel model) throws Exception {
		bbsDAO.insertBbsGroupSetup(model);
	}

	public void updateBbsGroupSetup(AdminBbsGroupSetupModel model) throws Exception {
		bbsDAO.updateBbsGroupSetup(model);
	}
	
	public void deleteBbsGroupSetup(AdminBbsGroupSetupModel model) throws Exception {
		bbsDAO.deleteBbsGroupSetup(model);
	}
	
	public void deleteBbsGroupSetupList(List<AdminBbsGroupSetupModel> map) throws Exception {
		bbsDAO.deleteBbsGroupSetupList(map);
	}

	public void insertExcelBbsGroupSetup(List<AdminBbsGroupSetupModel> map) throws Exception {
		bbsDAO.insertExcelBbsGroupSetup(map);
	}
	
	public List<AdminBbsGroupSetupModel> getBbsGroupSetupCodeList(AdminBbsGroupSetupModel model) throws Exception {
		return bbsDAO.getBbsGroupSetupCodeList(model);
	}
}

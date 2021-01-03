package com.ilmagna.allworkadmin.admin.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.admin.daos.AdminAdminDAO;
import com.ilmagna.allworkadmin.admin.domains.AdminAdminModel;
import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;

@Service
public class AdminAdminService {
		
	@Autowired private AdminAdminDAO adminDAO;
	
	
	public List<AdminAdminModel> getAdminList(AdminAdminModel model) throws Exception {
		return adminDAO.getAdminList(model);
	}
	
	public AdminAdminModel getAdmin(AdminAdminModel model) throws Exception {
		//return userDAO.getAdmin(model);
		AdminAdminModel item = new AdminAdminModel();		
		if(!ApiCommonUtils.isNullOrEmpty(model.getId())) {
			List<AdminAdminModel> list = adminDAO.getAdmin(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			}
		}
		return item;
	}

	public int getAdminTotalCnt(AdminAdminModel model) throws Exception {
		return adminDAO.getAdminTotalCnt(model);
	}

	public Integer getAdminDuplicatedCount(AdminAdminModel model) throws Exception {
		return adminDAO.getAdminDuplicatedCount(model);
	}

	public Integer findAdmin(AdminAdminModel model) throws Exception {
		return adminDAO.findAdmin(model);
	}

	public Integer findAdminWithUserID(String user_id) throws Exception {
		return adminDAO.findAdminWithUserID(user_id);
	}

	public Integer findAdminWithUserIDPw(AdminAdminModel model) throws Exception {
		int count =0;
		try {
			count = adminDAO.findAdminWithUserIDPw(model);
		} catch(Exception ex) {}
		return count;
	}

	public void insertAdmin(AdminAdminModel model) throws Exception {
		adminDAO.insertAdmin(model);
	}

	public void registerAdmin(AdminAdminModel model) throws Exception {
		adminDAO.registerAdmin(model);
	}

	public void updateAdmin(AdminAdminModel model) throws Exception {
		adminDAO.updateAdmin(model);
	}
	
	public void deleteAdmin(AdminAdminModel model) throws Exception {
		adminDAO.deleteAdmin(model);
	}
	
	public void deleteAdminList(List<AdminAdminModel> map) throws Exception {
		adminDAO.deleteAdminList(map);
	}

	public void insertExcelAdmin(List<AdminAdminModel> map) throws Exception {
		adminDAO.insertExcelAdmin(map);
	}
	
	public List<AdminAdminModel> getAdminIdList(AdminAdminModel model) throws Exception {
		return adminDAO.getAdminIdList(model);
	}
	
	public void resetAdminPw(AdminAdminModel model) throws Exception {
		adminDAO.resetAdminPw(model);
	}

	public void changeAdminPw(AdminAdminModel model) throws Exception {
		adminDAO.changeAdminPw(model);
	}

	public void updateAdminInfo(AdminAdminModel model) throws Exception {
		adminDAO.updateAdminInfo(model);
	}
}

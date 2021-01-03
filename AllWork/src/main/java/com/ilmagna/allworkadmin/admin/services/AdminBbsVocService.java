package com.ilmagna.allworkadmin.admin.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.admin.daos.AdminBbsVocDAO;
import com.ilmagna.allworkadmin.admin.domains.AdminBbsVocModel;

@Service
public class AdminBbsVocService {
		
	@Autowired private AdminBbsVocDAO bbsDAO;
	
	
	public List<AdminBbsVocModel> getBbsVocList(AdminBbsVocModel model) throws Exception {
		return bbsDAO.getBbsVocList(model);
	}
	
	public AdminBbsVocModel getBbsVoc(AdminBbsVocModel model) throws Exception {
		//return userDAO.getBbsVoc(model);
		AdminBbsVocModel item = new AdminBbsVocModel();		
		if(model.getId() > 0) {
			List<AdminBbsVocModel> list = bbsDAO.getBbsVoc(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			}
		}
		return item;
	}

	public int getBbsVocTotalCnt(AdminBbsVocModel model) throws Exception {
		return bbsDAO.getBbsVocTotalCnt(model);
	}

	public Integer findBbsVoc(AdminBbsVocModel model) throws Exception {
		return bbsDAO.findBbsVoc(model);
	}

	public void insertBbsVoc(AdminBbsVocModel model) throws Exception {
		bbsDAO.insertBbsVoc(model);
	}

	public void updateBbsVoc(AdminBbsVocModel model) throws Exception {
		bbsDAO.updateBbsVoc(model);
	}
	
	public void deleteBbsVoc(AdminBbsVocModel model) throws Exception {
		bbsDAO.deleteBbsVoc(model);
	}
	
	public void deleteBbsVocList(List<AdminBbsVocModel> map) throws Exception {
		bbsDAO.deleteBbsVocList(map);
	}

	public void insertExcelBbsVoc(List<AdminBbsVocModel> map) throws Exception {
		bbsDAO.insertExcelBbsVoc(map);
	}
}

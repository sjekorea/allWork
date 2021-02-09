package com.ilmagna.allworkadmin.admin.services;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.admin.daos.AdminBbsSetupDAO;
import com.ilmagna.allworkadmin.admin.domains.AdminBbsSetupModel;


@Service("adminBbsSetupService")
public class AdminBbsSetupService {
		
	//@Autowired private AdminBbsSetupDAO bbsSetupDAO;
	@Resource(name="adminBbsSetupDAO")
	private AdminBbsSetupDAO bbsSetupDAO;

	/*
	public List<AdminBbsSetupModel> getBbsSetupList(AdminBbsSetupModel model) throws Exception {
		return bbsSetupDAO.getBbsSetupList(model);
	}
	*/
	
	public AdminBbsSetupModel getBbsSetup(AdminBbsSetupModel model) throws Exception {
		return bbsSetupDAO.getBbsSetup(model);
		/*
		AdminBbsSetupModel item = new AdminBbsSetupModel();		
		if(model.getId() != null && model.getId() > 0) {
			List<AdminBbsSetupModel> list = bbsSetupDAO.getBbsSetup(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			}
		}
		return item;
		*/
	}

	/*
	public int getBbsSetupTotalCnt(AdminBbsSetupModel model) throws Exception {
		return bbsSetupDAO.getBbsSetupTotalCnt(model);
	}

	public Integer getBbsSetupDuplicatedCount(AdminBbsSetupModel model) throws Exception {
		return bbsSetupDAO.getBbsSetupDuplicatedCount(model);
	}

	public Integer findBbsSetup(AdminBbsSetupModel model) throws Exception {
		return bbsSetupDAO.findBbsSetup(model);
	}

	public Integer findBbsSetupWithCode(String user_id) throws Exception {
		return bbsSetupDAO.findBbsSetupWithCode(user_id);
	}

	public Integer findBbsSetupWithName(AdminBbsSetupModel model) throws Exception {
		int count =0;
		try {
			count = bbsSetupDAO.findBbsSetupWithName(model);
		} catch(Exception ex) {}
		return count;
	}

	public void insertBbsSetup(AdminBbsSetupModel model) throws Exception {
		bbsSetupDAO.insertBbsSetup(model);
	}

	public void updateBbsSetup(AdminBbsSetupModel model) throws Exception {
		bbsSetupDAO.updateBbsSetup(model);
	}
	
	public void deleteBbsSetup(AdminBbsSetupModel model) throws Exception {
		bbsSetupDAO.deleteBbsSetup(model);
	}
	
	public void deleteBbsSetupList(List<AdminBbsSetupModel> map) throws Exception {
		bbsSetupDAO.deleteBbsSetupList(map);
	}

	public void insertExcelBbsSetup(List<AdminBbsSetupModel> map) throws Exception {
		bbsSetupDAO.insertExcelBbsSetup(map);
	}
	
	public List<AdminBbsSetupModel> getBbsSetupCodeList(AdminBbsSetupModel model) throws Exception {
		return bbsSetupDAO.getBbsSetupCodeList(model);
	}
	public List<AdminBbsSetupModel> getBbsSubGroupSetupCodeList(AdminBbsSetupModel model) throws Exception {
		return bbsSetupDAO.getBbsSubGroupSetupCodeList(model);
	}
	*/
}

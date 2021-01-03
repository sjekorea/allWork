package com.ilmagna.allworkadmin.api.services;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.daos.ApiRecruitItemDAO;
import com.ilmagna.allworkadmin.api.domains.ApiRecruitItemModel;

@Service("apiRecruitItemService")
public class ApiRecruitItemService {
		
	//@Autowired private ApiRecruitItemDAO headhuntDAO;
	@Resource(name="apiRecruitItemDAO")
	private ApiRecruitItemDAO headhuntDAO;

	
	public List<ApiRecruitItemModel> getRecruitItemList(ApiRecruitItemModel model) throws Exception {
		return headhuntDAO.getRecruitItemList(model);
	}
	
	public ApiRecruitItemModel getRecruitItem(ApiRecruitItemModel model) throws Exception {
		return headhuntDAO.getRecruitItem(model);
		/*
		ApiRecruitItemModel item = new ApiRecruitItemModel();		
		if(model.getId() > 0) {
			List<ApiRecruitItemModel> list = headhuntDAO.getRecruitItem(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			}
		}
		return item;
		*/
	}

	public int getRecruitItemTotalCnt(ApiRecruitItemModel model) throws Exception {
		return headhuntDAO.getRecruitItemTotalCnt(model);
	}

	/*
	public Integer getRecruitItemDuplicatedCount(ApiRecruitItemModel model) throws Exception {
		return headhuntDAO.getRecruitItemDuplicatedCount(model);
	}

	public Integer findRecruitItem(ApiRecruitItemModel model) throws Exception {
		return headhuntDAO.findRecruitItem(model);
	}

	public void insertRecruitItem(ApiRecruitItemModel model) throws Exception {
		headhuntDAO.insertRecruitItem(model);
	}

	public void updateRecruitItem(ApiRecruitItemModel model) throws Exception {
		headhuntDAO.updateRecruitItem(model);
	}
	
	public void deleteRecruitItem(ApiRecruitItemModel model) throws Exception {
		headhuntDAO.deleteRecruitItem(model);
	}
	
	public void deleteRecruitItemList(List<ApiRecruitItemModel> map) throws Exception {
		headhuntDAO.deleteRecruitItemList(map);
	}

	public void insertExcelRecruitItem(List<ApiRecruitItemModel> map) throws Exception {
		headhuntDAO.insertExcelRecruitItem(map);
	}
	*/
}

package com.ilmagna.allworkadmin.api.services;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.common.ApiCommonUtils;
import com.ilmagna.allworkadmin.api.daos.ApiBbsDataDAO;
import com.ilmagna.allworkadmin.api.domains.ApiBbsDataModel;

@Service("apiBbsDataService")
public class ApiBbsDataService {
		
	//@Autowired private ApiBbsDataDAO bbsDAO;
	@Resource(name="apiBbsDataDAO")
	private ApiBbsDataDAO bbsDAO;

	
	public List<ApiBbsDataModel> getBbsDataList(ApiBbsDataModel model) throws Exception {
		return bbsDAO.getBbsDataList(model);
	}
	
	public ApiBbsDataModel getBbsData(ApiBbsDataModel model) throws Exception {
		return bbsDAO.getBbsData(model);
		/*
		ApiBbsDataModel item = new ApiBbsDataModel();		
		if(model.getId() != null && model.getId() > 0) {
			List<ApiBbsDataModel> list = bbsDAO.getBbsData(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			}
		}
		return item;
		*/
	}
	
	public void incRefCount(ApiBbsDataModel model) throws Exception {
		bbsDAO.incRefCount(model);
	}

	public int getBbsDataTotalCnt(ApiBbsDataModel model) throws Exception {
		return bbsDAO.getBbsDataTotalCnt(model);
	}

	public void insertBbsData(ApiBbsDataModel model) throws Exception {
		//bbsDAO.insertBbsData(model);
		int id = 0;
		if (model.getId() != null) id = model.getId();

		//답글 등록
		//	1. reply_req 값을 1씩 증가.
		if (model.getReplyReq() != null && model.getReplyReq() > 0) {
			bbsDAO.updateRepyReq(model);
		}	

		//데이터 등록.
		bbsDAO.insertBbsData(model);
		
		//답글 등록
		//	2. ref에 값을 id 값으로 갱신.
		if (id < 1) {
			bbsDAO.updateRef(model);
		}	
	}

	public void updateBbsData(ApiBbsDataModel model) throws Exception {
		bbsDAO.updateBbsData(model);
	}
	
	public void deleteBbsData(ApiBbsDataModel model) throws Exception {
		bbsDAO.deleteBbsData(model);
	}

	/*
	public ApiBbsDataModel getBbsBoardType(ApiBbsDataModel model) throws Exception {
		//return bbsDAO.getBbsBoardType(model);
		ApiBbsDataModel item = new ApiBbsDataModel();		
		if(!ApiCommonUtils.isNullOrEmpty(model.getBoard_code())) {
			List<ApiBbsDataModel> list = bbsDAO.getBbsBoardType(model);
			
			if(list != null && list.size() > 0) {
				item = list.get(0);
			}
		}
		return item;
	}

	public Integer findBbsData(ApiBbsDataModel model) throws Exception {
		return bbsDAO.findBbsData(model);
	}

	public Integer findBbsDataWithCode(String user_id) throws Exception {
		return bbsDAO.findBbsDataWithCode(user_id);
	}

	public void insertBbsData(ApiBbsDataModel model) throws Exception {
		bbsDAO.insertBbsData(model);
	}

	public void updateBbsData(ApiBbsDataModel model) throws Exception {
		bbsDAO.updateBbsData(model);
	}
	
	public void deleteBbsData(ApiBbsDataModel model) throws Exception {
		bbsDAO.deleteBbsData(model);
	}
	
	public void deleteBbsDataList(List<ApiBbsDataModel> map) throws Exception {
		bbsDAO.deleteBbsDataList(map);
	}

	public void insertExcelBbsData(List<ApiBbsDataModel> map) throws Exception {
		bbsDAO.insertExcelBbsData(map);
	}
	*/
}

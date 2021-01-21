package com.ilmagna.allworkadmin.api.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiBbsDataModel;

import allwork.common.dao.AbstractDAO;


@Repository("apiBbsDataDAO")
public class ApiBbsDataDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<ApiBbsDataModel> getBbsDataList(ApiBbsDataModel model) throws Exception {
		return (List<ApiBbsDataModel>) selectList("com.ilmagna.allworkadmin.api.daos.ApiBbsDataDAO.getBbsDataList", model);
	}

	@SuppressWarnings("unchecked")
	public ApiBbsDataModel getBbsData(ApiBbsDataModel model) throws Exception {
		//return (ApiBbsDataModel) selectOne("com.ilmagna.allworkadmin.api.daos.ApiBbsDataDAO.getCategory", model);

		List<ApiBbsDataModel> list = (List<ApiBbsDataModel>) selectList("com.ilmagna.allworkadmin.api.daos.ApiBbsDataDAO.getBbsData", model);
		if (list == null || list.size() < 1) return new ApiBbsDataModel();
		
		return list.get(0);
	}

	public void incRefCount(ApiBbsDataModel model) throws Exception {
		//return update("com.ilmagna.allworkadmin.api.daos.ApiBbsDataDAO.incRefCount", model);
		update("com.ilmagna.allworkadmin.api.daos.ApiBbsDataDAO.incRefCount", model);
	};
	
	public Integer getBbsDataTotalCnt(ApiBbsDataModel model) throws Exception {
		return selectCnt("com.ilmagna.allworkadmin.api.daos.ApiBbsDataDAO.getBbsDataTotalCnt", model);
	}


	public int insertBbsData(ApiBbsDataModel model) throws Exception {
		return insert("com.ilmagna.allworkadmin.api.daos.ApiBbsDataDAO.insertBbsData", model);
	}

	public void updateBbsData(ApiBbsDataModel model) throws Exception {
		update("com.ilmagna.allworkadmin.api.daos.ApiBbsDataDAO.updateBbsData", model);		
	}
	
	public void deleteBbsData(ApiBbsDataModel model) throws Exception {
		delete("com.ilmagna.allworkadmin.api.daos.ApiBbsDataDAO.deleteBbsData", model);		
	}

	public void updateRepyReq(ApiBbsDataModel model) throws Exception {
		update("com.ilmagna.allworkadmin.api.daos.ApiBbsDataDAO.updateRepyReq", model);		
	}

	public void updateRef(ApiBbsDataModel model) throws Exception {
		update("com.ilmagna.allworkadmin.api.daos.ApiBbsDataDAO.updateRef", model);		
	}

	
	/*
	List<ApiBbsDataModel> getBbsDataList(ApiBbsDataModel model) throws Exception;

	List<ApiBbsDataModel> getBbsData(ApiBbsDataModel model) throws Exception;

	List<ApiBbsDataModel> getBbsBoardType(ApiBbsDataModel model) throws Exception;
	
	Integer getBbsDataTotalCnt(ApiBbsDataModel model) throws Exception;

	Integer findBbsData(ApiBbsDataModel model) throws Exception;

	Integer findBbsDataWithCode(String user_id) throws Exception;

	void insertBbsData(ApiBbsDataModel model) throws Exception;

	void updateBbsData(ApiBbsDataModel model) throws Exception;
	
	void deleteBbsData(ApiBbsDataModel model) throws Exception;

	void deleteBbsDataList(List<ApiBbsDataModel> map) throws Exception;

	void insertExcelBbsData(List<ApiBbsDataModel> map) throws Exception;

	void incRefCount(ApiBbsDataModel model) throws Exception;
	*/
}

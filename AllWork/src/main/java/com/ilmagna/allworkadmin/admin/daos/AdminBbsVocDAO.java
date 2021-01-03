package com.ilmagna.allworkadmin.admin.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.admin.domains.AdminBbsVocModel;


@Repository
public interface AdminBbsVocDAO {

	List<AdminBbsVocModel> getBbsVocList(AdminBbsVocModel model) throws Exception;

	List<AdminBbsVocModel> getBbsVoc(AdminBbsVocModel model) throws Exception;
	
	Integer getBbsVocTotalCnt(AdminBbsVocModel model) throws Exception;

	Integer findBbsVoc(AdminBbsVocModel model) throws Exception;

	void insertBbsVoc(AdminBbsVocModel model) throws Exception;

	void updateBbsVoc(AdminBbsVocModel model) throws Exception;
	
	void deleteBbsVoc(AdminBbsVocModel model) throws Exception;

	void deleteBbsVocList(List<AdminBbsVocModel> map) throws Exception;

	void insertExcelBbsVoc(List<AdminBbsVocModel> map) throws Exception;
}

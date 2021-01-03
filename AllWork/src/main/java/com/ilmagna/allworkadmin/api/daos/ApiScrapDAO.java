package com.ilmagna.allworkadmin.api.daos;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.api.domains.ApiScrapModel;


@Repository
public interface ApiScrapDAO {

	List<ApiScrapModel> getScrapList(ApiScrapModel model) throws Exception;

	List<ApiScrapModel> getScrap(ApiScrapModel model) throws Exception;
	
	Integer getScrapTotalCnt(ApiScrapModel model) throws Exception;

	Integer getScrapDuplicatedCount(ApiScrapModel model) throws Exception;

	Integer findScrap(ApiScrapModel model) throws Exception;

	void insertScrap(ApiScrapModel model) throws Exception;

	void updateScrap(ApiScrapModel model) throws Exception;
	
	void deleteScrap(ApiScrapModel model) throws Exception;

	void deleteScrapList(List<ApiScrapModel> map) throws Exception;
}

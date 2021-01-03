package com.ilmagna.allworkadmin.api.services;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.api.daos.ApiSiteBasicDAO;
import com.ilmagna.allworkadmin.api.domains.ApiSiteBasicModel;

@Service("apiSiteBasicService")
public class ApiSiteBasicService {
		
	//@Autowired private ApiSiteBasicDAO siteBasicDAO;
	@Resource(name="apiSiteBasicDAO")
	private ApiSiteBasicDAO siteBasicDAO;

   
	public ApiSiteBasicModel getSiteBasic(ApiSiteBasicModel model) throws Exception {
		return siteBasicDAO.getSiteBasic(model);
	}

	/*
	public void updateSiteBasic(ApiSiteBasicModel model) throws Exception {
		siteBasicDAO.updateSiteBasic(model);
	}
	*/
}

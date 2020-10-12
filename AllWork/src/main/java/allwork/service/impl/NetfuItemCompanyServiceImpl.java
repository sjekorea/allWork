package allwork.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.NetfuItemCompanyDao;
import allwork.service.NetfuItemCompanyService;

@Service("netfuItemCompanyService")
public class NetfuItemCompanyServiceImpl implements NetfuItemCompanyService{
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="netfuItemCompanyDao")
	private NetfuItemCompanyDao netfuItemCompanyDao;

	
	@Override
	public int selectNetfuItemCompanyCnt(Map<String, Object> map) throws Exception {
		return netfuItemCompanyDao.selectNetfuItemCompanyCnt(map);
	}

}

package allwork.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.NetfuCateDao;
import allwork.service.NetfuCateService;

@Service("netfuCateService")
public class NetfuCateServiceImpl implements NetfuCateService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuCateDao")
	private NetfuCateDao netfuCateDao;
	

	@Override
	public List<Map<String, Object>> selectNetfuCateList(Map<String, Object> map) throws Exception {
		return netfuCateDao.selectNetfuCateList(map);
	}

	@Override
	public Map<String, Object> selectNetfuCateMap(Map<String, Object> map) throws Exception {
		return netfuCateDao.selectNetfuCateMap(map);
	}
	

}

package allwork.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.NetfuScrapDao;
import allwork.service.NetfuScrapService;

@Service("netfuScrapService")
public class NetfuScrapServiceImpl implements NetfuScrapService{
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="netfuScrapDao")
	private NetfuScrapDao netfuScrapDao;

	
	@Override
	public int selectNetfuScrapCnt(Map<String, Object> map) throws Exception {
		return netfuScrapDao.selectNetfuScrapCnt(map);
	}

}

package allwork.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.NetfuItemResumeDao;
import allwork.service.NetfuItemResumeService;

@Service("netfuItemResumeService")
public class NetfuItemResumeServiceImpl implements NetfuItemResumeService{
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="netfuItemResumeDao")
	private NetfuItemResumeDao netfuItemResumeDao;

	
	@Override
	public int selectNetfuItemResumeCnt(Map<String, Object> map) throws Exception {
		return netfuItemResumeDao.selectNetfuItemResumeCnt(map);
	}


}

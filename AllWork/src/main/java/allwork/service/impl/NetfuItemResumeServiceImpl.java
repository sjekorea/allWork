package allwork.service.impl;

import java.util.List;
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
	public int selectRecentlyResumeNo(Map<String, Object> map) throws Exception {
		return netfuItemResumeDao.selectRecentlyResumeNo(map);
	}

	
	@Override
	public int selectNetfuItemResumeCnt(Map<String, Object> map) throws Exception {
		return netfuItemResumeDao.selectNetfuItemResumeCnt(map);
	}

	@Override
	public List<Map<String, Object>> selectNetfuItemResumeList(Map<String, Object> map) throws Exception {
		return netfuItemResumeDao.selectNetfuItemResumeList(map);
	}
	
	@Override
	public Map<String, Object> selectNetfuItemResumeMap(Map<String, Object> map) throws Exception {
		return netfuItemResumeDao.selectNetfuItemResumeMap(map);
	}


}

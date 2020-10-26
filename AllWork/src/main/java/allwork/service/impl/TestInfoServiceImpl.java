package allwork.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.service.TestInfoService;
import allwork.dao.TestInfoDao;

@Service("testInfoService")
public class TestInfoServiceImpl implements TestInfoService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="testInfoDao")
	private TestInfoDao testInfoDao;
	

	@Override
	public List<Map<String, Object>> selectTestInfoList(Map<String, Object> map) throws Exception {
		return testInfoDao.selectTestInfoList(map);
	}

	@Override
	public int selectTestInfoCnt(Map<String, Object> map) throws Exception {
		return testInfoDao.selectTestInfoCnt(map);
	}
	
	@Override
	public int insertTestInfo(Map<String, Object> map) throws Exception {
		return testInfoDao.insertTestInfo(map);
	}
	
	@Override
	public int updateTestInfo(Map<String, Object> map) throws Exception {
		return testInfoDao.updateTestInfo(map);
	}
	
	@Override
	public int deleteTestInfo(Map<String, Object> map) throws Exception {
		return testInfoDao.deleteTestInfo(map);
	}
	
	
	
}

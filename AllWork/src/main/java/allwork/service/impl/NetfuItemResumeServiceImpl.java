package allwork.service.impl;

import java.util.ArrayList;
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
		int rtnCnt = 0;
		if("keyword".equals((String)map.get("searchFlag"))){
			rtnCnt = netfuItemResumeDao.selectKeywordNetfuItemResumeCnt(map);
		}else{
			rtnCnt = netfuItemResumeDao.selectNetfuItemResumeCnt(map);
		}
		return rtnCnt;
	}

	@Override
	public List<Map<String, Object>> selectNetfuItemResumeList(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> rtnList = new ArrayList<Map<String, Object>>();
		if("keyword".equals((String)map.get("searchFlag"))){
			rtnList = netfuItemResumeDao.selectKeywordNetfuItemResumeList(map);
		}else{
			rtnList = netfuItemResumeDao.selectNetfuItemResumeList(map);
		}
		return rtnList;
	}
	
	@Override
	public Map<String, Object> selectNetfuItemResumeMap(Map<String, Object> map) throws Exception {
		return netfuItemResumeDao.selectNetfuItemResumeMap(map);
	}
	
	
	// 이력서 정보 등록
	@Override
	public int insertNetfuItemResume(Map<String, Object> map) throws Exception {
		return netfuItemResumeDao.insertNetfuItemResume(map);
	}


}

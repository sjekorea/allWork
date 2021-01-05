package allwork.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.NetfuMyServiceDao;
import allwork.service.NetfuMyServiceService;

@Service("netfuMyServiceService")
public class NetfuMyServiceServiceImpl implements NetfuMyServiceService{
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="netfuMyServiceDao")
	private NetfuMyServiceDao netfuMyServiceDao;
	

	// 맞춤 채용 정보  검색 Count
	@Override
	public int selectMyServiceRecruitCnt(Map<String, Object> map) throws Exception {
		return netfuMyServiceDao.selectMyServiceRecruitCnt(map);
	}
	
	// 맞춤 채용 정보  목록 
	@Override
	public List<Map<String, Object>> selectMyServiceRecruitList(Map<String, Object> map) throws Exception {
		return netfuMyServiceDao.selectMyServiceRecruitList(map);
	}
	
	// 맞춤 인재 정보  검색 Count
	@Override
	public int selectMyServiceResumeCnt(Map<String, Object> map) throws Exception {
		return netfuMyServiceDao.selectMyServiceResumeCnt(map);
	}
	
	// 맞춤 인재 정보  목록 
	@Override
	public List<Map<String, Object>> selectMyServiceResumeList(Map<String, Object> map) throws Exception {
		return netfuMyServiceDao.selectMyServiceResumeList(map);
	}
	
	// 맞춤 정보 설정 정보
	@Override
	public Map<String, Object> selectNetfuMyServiceMap(Map<String, Object> map) throws Exception {
		return netfuMyServiceDao.selectNetfuMyServiceMap(map);
	}
	
	// 맞춤 채용정보 등록
	@Override
	public int insertNetfuMyService(Map<String, Object> map) throws Exception {
		return netfuMyServiceDao.insertNetfuMyService(map);
	}
	
	// 맞춤 채용정보 수정
	@Override
	public int updateNetfuMyService(Map<String, Object> map) throws Exception {
		return netfuMyServiceDao.updateNetfuMyService(map);
	}

}

package allwork.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.NetfuConcernDao;
import allwork.service.NetfuConcernService;

@Service("netfuConcernService")
public class NetfuConcernServiceImpl implements NetfuConcernService{
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="netfuConcernDao")
	private NetfuConcernDao netfuConcernDao;
	
	// 관심기업 수
	@Override
	public int selectNetfuConcernRegistCnt(Map<String, Object> map) throws Exception {
		return netfuConcernDao.selectNetfuConcernRegistCnt(map);
	}
	
	// 관심기업 수
	@Override
	public int selectNetfuConcernCnt(Map<String, Object> map) throws Exception {
		return netfuConcernDao.selectNetfuConcernCnt(map);
	}

	// 관심기업 채용정보 목록 
	@Override
	public List<Map<String, Object>> selectNetfuConcernList(Map<String, Object> map) throws Exception {
		return netfuConcernDao.selectNetfuConcernList(map);
	}
	
	// 관심기업 채용정보 Count 
	@Override
	public int selectNetfuConcernRecruitCnt(Map<String, Object> map) throws Exception {
		return netfuConcernDao.selectNetfuConcernRecruitCnt(map);
	}
	
	// 관심기업 채용정보 목록 
	@Override
	public List<Map<String, Object>> selectNetfuConcernRecruitList(Map<String, Object> map) throws Exception {
		return netfuConcernDao.selectNetfuConcernRecruitList(map);
	}
	
	// 관심기업 채용정보 등록
	@Override
	public int insertNetfuConcern(Map<String, Object> map) throws Exception {
		return netfuConcernDao.insertNetfuConcern(map);
	}
	
	// 관심기업 채용정보 삭제
	@Override
	public int deleteNetfuConcernMulti(Map<String, Object> map) throws Exception {
		return netfuConcernDao.deleteNetfuConcernMulti(map);
	}

}

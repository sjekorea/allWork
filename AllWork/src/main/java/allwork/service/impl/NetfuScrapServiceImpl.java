package allwork.service.impl;

import java.util.List;
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

	
	// 스크랩한 채용정보 Count 
	@Override
	public int selectRecruitScrapCnt(Map<String, Object> map) throws Exception {
		return netfuScrapDao.selectRecruitScrapCnt(map);
	}
	
	// 스크랩한 채용정보 목록 
	@Override
	public List<Map<String, Object>> selectRecruitScrapList(Map<String, Object> map) throws Exception {
		return netfuScrapDao.selectRecruitScrapList(map);
	}
	
	// 스크랩한 이력서 정보 Count 
	@Override
	public int selectResumeScrapCnt(Map<String, Object> map) throws Exception {
		return netfuScrapDao.selectResumeScrapCnt(map);
	}
	
	// 스크랩한 이력서 정보 목록 
	@Override
	public List<Map<String, Object>> selectResumeScrapList(Map<String, Object> map) throws Exception {
		return netfuScrapDao.selectResumeScrapList(map);
	}
	
	// 스크랩한 채용정보 Count 
	@Override
	public int selectNetfuScrapRegistCnt(Map<String, Object> map) throws Exception {
		return netfuScrapDao.selectNetfuScrapRegistCnt(map);
	}
	
	// 스크랩한 채용정보 등록
	@Override
	public int insertNetfuScrap(Map<String, Object> map) throws Exception {
		return netfuScrapDao.insertNetfuScrap(map);
	}
	
	// 스크랩한 채용정보 삭제
	@Override
	public int deleteNetfuScrapMulti(Map<String, Object> map) throws Exception {
		return netfuScrapDao.deleteNetfuScrapMulti(map);
	}

}

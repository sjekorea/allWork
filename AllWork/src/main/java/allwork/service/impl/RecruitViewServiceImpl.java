package allwork.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.dao.RecruitViewDao;
import allwork.service.RecruitViewService;

@Service("recruitViewService")
public class RecruitViewServiceImpl implements RecruitViewService{

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="recruitViewDao")
	private RecruitViewDao recruitViewDao;
	
	@Override
	public int selectRecruitViewCnt(Map<String, Object> map) throws Exception {
		return recruitViewDao.selectRecruitViewCnt(map);
	}
	
	@Override
	public int selectReferenceViewCnt(Map<String, Object> map) throws Exception {
		return recruitViewDao.selectReferenceViewCnt(map);
	}

	@Override
	public List<Map<String, Object>> selectRecruitViewList(Map<String, Object> map) throws Exception {
		return recruitViewDao.selectRecruitViewList(map);
	}

	@Override
	public List<Map<String, Object>> selectResumeViewList(Map<String, Object> map) throws Exception {
		return recruitViewDao.selectResumeViewList(map);
	}
	
	
	// 이력서 정보 등록
	@Override
	public int insertRecruitView(Map<String, Object> map) throws Exception {
		return recruitViewDao.insertRecruitView(map);
	}
	
}

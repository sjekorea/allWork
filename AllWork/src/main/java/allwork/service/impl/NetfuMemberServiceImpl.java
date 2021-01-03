package allwork.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import allwork.service.NetfuMemberService;
import allwork.dao.NetfuMemberDao;

@Service("netfuMemberService")
public class NetfuMemberServiceImpl implements NetfuMemberService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="netfuMemberDao")
	private NetfuMemberDao netfuMemberDao;
	
	@Override
	public Map<String, Object> selectNetfuMemberMap(Map<String, Object> map) throws Exception {
		return netfuMemberDao.selectNetfuMemberMap(map);
	}
	
	@Override
	public int selectNetfuMemberLoginCnt(Map<String, Object> map) throws Exception {
		return netfuMemberDao.selectNetfuMemberLoginCnt(map);
	}
	
	@Override
	public int selectUidExistCnt(Map<String, Object> map) throws Exception {
		return netfuMemberDao.selectUidExistCnt(map);
	}
	
	// 회원가입(회원정보 등록)
	@Override
	public int insertNetfuMember(Map<String, Object> map) throws Exception {
		return netfuMemberDao.insertNetfuMember(map);
	}
	
	@Override
	public int updatePw(Map<String, Object> map) throws Exception {
		return netfuMemberDao.updatePw(map);
	}
	
	@Override
	public int updateMemberStatus(Map<String, Object> map) throws Exception {
		return netfuMemberDao.updateMemberStatus(map);
	}

}

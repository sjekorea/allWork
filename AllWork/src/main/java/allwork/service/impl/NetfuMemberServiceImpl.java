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
	public int selectNetfuMemberSNSLoginCnt(Map<String, Object> map) throws Exception {
		return netfuMemberDao.selectNetfuMemberSNSLoginCnt(map);
	}
	
	@Override
	public int updateNetfuMemberSNS(Map<String, Object> map) throws Exception {
		return netfuMemberDao.updateNetfuMemberSNS(map);
	}
	
	@Override
	public int selectUidExistCnt(Map<String, Object> map) throws Exception {
		return netfuMemberDao.selectUidExistCnt(map);
	}
	
	//(begin) 2021.01.03 by s.yoo
	@Override
	public Map<String, Object> findId(Map<String, Object> map) throws Exception {
		return netfuMemberDao.findId(map);
	}

	@Override
	public Map<String, Object> findPw(Map<String, Object> map) throws Exception {
		return netfuMemberDao.findPw(map);
	}

	@Override
	public int resetPw(Map<String, Object> map) throws Exception {
		return netfuMemberDao.resetPw(map);
	}

	@Override
	public int memberUnregister(Map<String, Object> map) throws Exception {
		return netfuMemberDao.memberUnregister(map);
	}

	@Override
	public int updateLoginInfo(Map<String, Object> map) throws Exception {
		return netfuMemberDao.updateLoginInfo(map);
	}

	@Override
	public int updateMyInfo(Map<String, Object> map) throws Exception {
		return netfuMemberDao.updateMyInfo(map);
	}
	//(end) 2021.01.03 by s.yoo

	// 회원가입(회원정보 등록)
	@Override
	public int insertNetfuMember(Map<String, Object> map) throws Exception {
		return netfuMemberDao.insertNetfuMember(map);
	}
	
	@Override
	public int updatePw(Map<String, Object> map) throws Exception {
		return netfuMemberDao.updatePw(map);
	}
	
	// 유료 서비스 정보 update
	@Override
	public int updatePayServiceInfo(Map<String, Object> map) throws Exception {
		return netfuMemberDao.updatePayServiceInfo(map);
	}
	

	// 유료 서비스1 기한 만료 update
	@Override
	public int updatePayService1Info(Map<String, Object> map) throws Exception {
		return netfuMemberDao.updatePayService1Info(map);
	}
	

	// 유료 서비스2 기한 만료 update
	@Override
	public int updatePayService2Info(Map<String, Object> map) throws Exception {
		return netfuMemberDao.updatePayService2Info(map);
	}
	
	@Override
	public int updateViewCount(Map<String, Object> map) throws Exception {
		return netfuMemberDao.updateViewCount(map);
	}

}

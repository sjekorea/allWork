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

}

package allwork.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import allwork.common.dao.AbstractDAO;

@Repository("netfuMemberDao")
public class NetfuMemberDao extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNetfuMemberMap(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("netfuMember.selectNetfuMemberMap", map);
	}
	
	public int selectNetfuMemberLoginCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuMember.selectNetfuMemberLoginCnt", map);
	}
	
	// 회원 가입
	public int insertNetfuMember(Map<String, Object> map) throws Exception{ 
		return insert("netfuMember.insertNetfuMember", map);
	}

}

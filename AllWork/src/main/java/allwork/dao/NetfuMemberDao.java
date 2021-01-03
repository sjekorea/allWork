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
	
	public int selectUidExistCnt(Map<String, Object> map) throws Exception{
		return selectCnt("netfuMember.selectUidExistCnt", map);
	}
	
	// 회원 가입
	public int insertNetfuMember(Map<String, Object> map) throws Exception{ 
		int rtnCnt = 0;
		rtnCnt = insert("netfuMember.insertNetfuMember", map);
		if("2".equals((String)map.get("type"))){
			rtnCnt = insert("netfuCompany.insertNetfuCompany", map);
		}	
		return rtnCnt;
	}
	
	// 비밀번호 찾기 - 비밀번호 수정
	public int updatePw(Map<String, Object> map) throws Exception{ 
		return update("netfuMember.updatePw", map);
	}
	
	// 회원 탈퇴 처리
	public int updateMemberStatus(Map<String, Object> map) throws Exception{ 
		return update("netfuMember.updateMemberStatus", map);
	}

}

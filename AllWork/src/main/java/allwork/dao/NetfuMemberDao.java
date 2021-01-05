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
	
	//(begin) 2021.01.03 by s.yoo
	@SuppressWarnings("unchecked")
	public Map<String, Object> findId(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("netfuMember.findId", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> findPw(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("netfuMember.findPw", map);
	}

	public int resetPw(Map<String, Object> map) throws Exception{ 
		return update("netfuMember.resetPw", map);
	}

	public int memberUnregister(Map<String, Object> map) throws Exception{ 
		return update("netfuMember.memberUnregister", map);
	}

	public int updateLoginInfo(Map<String, Object> map) throws Exception{ 
		return update("netfuMember.updateLoginInfo", map);
	}

	public int updateMyInfo(Map<String, Object> map) throws Exception{ 
		return update("netfuMember.updateMyInfo", map);
	}
	//(end) 2021.01.03 by s.yoo

	// 회원 가입
	public int insertNetfuMember(Map<String, Object> map) throws Exception{ 
		int rtnCnt = 0;
		rtnCnt = insert("netfuMember.insertNetfuMember", map);
		//(begin) 2021.01.05 by s.yoo
		/*
		if("2".equals((String)map.get("type"))){
			rtnCnt = insert("netfuCompany.insertNetfuCompany", map);
		}
		*/
		//(end) 2021.01.05 by s.yoo
		return rtnCnt;
	}
	
	// 비밀번호 찾기 - 비밀번호 수정
	public int updatePw(Map<String, Object> map) throws Exception{ 
		return update("netfuMember.updatePw", map);
	}

}

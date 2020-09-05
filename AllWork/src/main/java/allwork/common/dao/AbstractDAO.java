package allwork.common.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.mybatis.spring.SqlSessionFactoryBean;

import allwork.common.util.ConvertUtil;

public class AbstractDAO {
		
	protected Log log = LogFactory.getLog(AbstractDAO.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	
	protected void printQueryId(String queryId) {
		if(log.isDebugEnabled()){
			log.debug("\t QueryId \t: " + queryId);
		}
	}
	
	public int insert(String queryId, Object params){
		//printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}
	
	public int update(String queryId, Object params){
		//printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}
	
	public int delete(String queryId, Object params){
		//printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}
	
	public int selectOne(String queryId){
		//printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}
	
	public Object selectOne(String queryId, Object params){
		//printQueryId(queryId);
		return ConvertUtil.converObjectToMap(sqlSession.selectOne(queryId, params));
	}
	
	public Object selectOneNotVo(String queryId, Object params){
		//printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}
	
	public int selectCnt(String queryId){
		//printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}
	
	public int selectCnt(String queryId, Object params){
		//printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}
	
	public int selectCnt(String queryId, String params){
		//printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId){
		//printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params){
		//printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
		
		
}

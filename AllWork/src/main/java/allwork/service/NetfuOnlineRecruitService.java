package allwork.service;

import java.util.List;
import java.util.Map;

public interface NetfuOnlineRecruitService {

	int selectOnlineRecruitCnt(Map<String, Object> map) throws Exception;
	int selectNetfuOnlineRecruitRegistCnt(Map<String, Object> map) throws Exception;
	int selectInterviewRequestCompanyCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectInterviewRequestCompanyList(Map<String, Object> map) throws Exception;
	int selectApplyCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectApplyList(Map<String, Object> map) throws Exception;
	int selectApplicantCnt(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectApplicantList(Map<String, Object> map) throws Exception;
	int deleteNetfuOnlineRecruitMulti(Map<String, Object> map) throws Exception;
	int insertNetfuOnlineRecruit(Map<String, Object> map) throws Exception;
}

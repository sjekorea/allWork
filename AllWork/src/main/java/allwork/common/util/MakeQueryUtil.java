package allwork.common.util;

import java.util.Map;
import allwork.common.CommandMap;

public class MakeQueryUtil {
	
	public static CommandMap makeMyResumeQuery(CommandMap commandMap, Map<String, Object> msMap) throws Exception{
		
		try{
			
			String jobCondition = "";
			String job1 = (String)msMap.get("job1");
			String job2 = (String)msMap.get("job2");
			String job3 = (String)msMap.get("job3");
			String job4 = (String)msMap.get("job4");
			String job5 = (String)msMap.get("job5");
			String job6 = (String)msMap.get("job6");
			String job7 = (String)msMap.get("job7");
			String job8 = (String)msMap.get("job8");
			String job9 = (String)msMap.get("job9");
			
			if(job1 != null && job1 != ""){
				
				jobCondition += "and ( ( nir.inid_type1 = '"+job1+"'";

				if(job2 != null && job2 != ""){
					jobCondition += " and nir.inid_type2 = '"+job2+"'";
				}
			
				if(job3 != null && job3 != ""){
					jobCondition += " and nir.inid_type3 = '"+job3+"'";
				}
			
				jobCondition += " ) ";
			
				if(job4 != null && job4 != ""){
					
					jobCondition += "or ( nir.inid_type4 = '"+job4+"'";

					if(job5 != null && job5 != "")
						jobCondition += " and nir.inid_type5 = '"+job5+"'";
			
					if(job6 != null && job6 != "")
						jobCondition += " and nir.inid_type6 = '"+job6+"'";
					
					jobCondition += " ) ";
				}
			
				if(job7 != null && job7 != ""){
					jobCondition += "or ( nir.inid_type7 = '"+job7+"'";

					if(job8 != null && job8 != "")
						jobCondition += " and nir.inid_type8 = '"+job8+"'";
			
					if(job9 != null && job9 != "")
						jobCondition += " and nir.inid_type9 = '"+job9+"'";
			
					jobCondition += " ) ";
				}
				
				jobCondition += " ) ";
			}	
				
			
			commandMap.put("jobCondition", jobCondition);
			
			
			String areaCondition = "";
			String area1 = (String)msMap.get("area");
			String area2 = (String)msMap.get("area2");
			String area3 = (String)msMap.get("area3");
			String area4 = (String)msMap.get("area4");
			String area5 = (String)msMap.get("area5");
			String area6 = (String)msMap.get("area6");
			
			if(area1 != null && area1 != ""){
				
				areaCondition += "and ( ( nir.inid_area1 = '"+area1+"'";

				if(area2 != null && area2 != "")
					areaCondition += " and nir.inid_area2 = '"+area2+"'";
			
				areaCondition += " ) ";
			
				if(area3 != null && area3 != ""){
					
					areaCondition += "or ( nir.inid_area3 = '"+area3+"'";

					if(area4 != null && area4 != "")
						areaCondition += " and nir.inid_area4 = '"+area4+"'";
			
					areaCondition += " ) ";
				}
			
				if(area5 != null && area5 != ""){
					
					areaCondition += "or ( nir.inid_area5 = '"+area5+"'";

					if(area6 != null && area6 != "")
						areaCondition += " and nir.inid_area6 = '"+area6+"'";
			
					areaCondition += " ) ";
				}	
			
				areaCondition += " ) ";
			}
			
			commandMap.put("areaCondition", areaCondition);
			
			
			String tmpCareer[] = ((String)msMap.get("career")).split(",");
			String careerCondition = "";
			if(tmpCareer != null && tmpCareer.length > 0){
				if (tmpCareer[0] == "102") { // 신입
					if (tmpCareer[1] != "100") {
						careerCondition += " and left(nir.inid_career,3) = '"+tmpCareer[0]+"'";
					} else { // 무관포함
						careerCondition += "";
					}
				} else if (tmpCareer[0] == "101") { // 경력
					if (tmpCareer[3] != "100") {
						careerCondition += " and ( left(nir.inid_career, 2) >= '"+tmpCareer[1]+"' and left(nir.inid_career, 2) <= '"+tmpCareer[2]+"')";
					} else { // 무관포함
						careerCondition += "";
					}
				}
			}
			commandMap.put("careerCondition", careerCondition);
			
			
			String tmpFormArr[] = ((String)msMap.get("form")).split(",");
			String formCondition = "";
			if(tmpFormArr != null && tmpFormArr.length > 0){
				formCondition += "and (";
				for(int i = 0 ; i < tmpFormArr.length ; i++){
					formCondition += " inid_jobform like '%"+tmpFormArr[i]+"%'";
					if(i < (tmpFormArr.length-1)){
						formCondition += " or ";
					}
				}
				formCondition += " )";
			}
			commandMap.put("formCondition", formCondition);
			
			
			String tmpSchoolArr[] = ((String)msMap.get("school")).split(",");
			String tmpSchool = (String)msMap.get("school");
			String schoolCondition = "";
			if(tmpSchoolArr != null && tmpSchoolArr.length > 0){
				if (tmpSchool.indexOf("100") > -1){
					schoolCondition = " and left(nir.inid_last_school, 1) >= "+tmpSchoolArr[0];
				} 
			}
			commandMap.put("schoolCondition", schoolCondition);
			commandMap.put("payType", (String)msMap.get("payType"));
			commandMap.put("pay", (String)msMap.get("pay"));
			
		}catch(Exception e){
			System.out.println("MakeQueryUtil.makeMyServiceQuery Exception!!! \n"+e.toString());
		}
		return commandMap;
	}
	
	
	public static CommandMap makeMyRecruitQuery(CommandMap commandMap, Map<String, Object> msMap) throws Exception{
		
		try{
			
			String jobCondition = "";
			String job1 = (String)msMap.get("job1");
			String job2 = (String)msMap.get("job2");
			String job3 = (String)msMap.get("job3");
			String job4 = (String)msMap.get("job4");
			String job5 = (String)msMap.get("job5");
			String job6 = (String)msMap.get("job6");
			String job7 = (String)msMap.get("job7");
			String job8 = (String)msMap.get("job8");
			String job9 = (String)msMap.get("job9");
			
			if(job1 != null && job1 != ""){
				
				jobCondition += "and ( ( nic.biz_type1 = '"+job1+"'";

				if(job2 != null && job2 != ""){
					jobCondition += " and nic.biz_type2 = '"+job2+"'";
				}
			
				if(job3 != null && job3 != ""){
					jobCondition += " and nic.biz_type3 = '"+job3+"'";
				}
			
				jobCondition += " ) ";
			
				if(job4 != null && job4 != ""){
					
					jobCondition += "or ( nic.biz_type4 = '"+job4+"'";

					if(job5 != null && job5 != "")
						jobCondition += " and nic.biz_type5 = '"+job5+"'";
			
					if(job6 != null && job6 != "")
						jobCondition += " and nic.biz_type6 = '"+job6+"'";
					
					jobCondition += " ) ";
				}
			
				if(job7 != null && job7 != ""){
					jobCondition += "or ( nic.biz_type7 = '"+job7+"'";

					if(job8 != null && job8 != "")
						jobCondition += " and nic.biz_type8 = '"+job8+"'";
			
					if(job9 != null && job9 != "")
						jobCondition += " and nic.biz_type9 = '"+job9+"'";
			
					jobCondition += " ) ";
				}
				
				jobCondition += " ) ";
			}	
				
			
			commandMap.put("jobCondition", jobCondition);
			
			
			String areaCondition = "";
			String area1 = (String)msMap.get("area");
			String area2 = (String)msMap.get("area2");
			String area3 = (String)msMap.get("area3");
			String area4 = (String)msMap.get("area4");
			String area5 = (String)msMap.get("area5");
			String area6 = (String)msMap.get("area6");
			
			if(area1 != null && area1 != ""){
				
				areaCondition += "and ( ( nic.biz_area1 = '"+area1+"'";

				if(area2 != null && area2 != "")
					areaCondition += " and nic.biz_area2 = '"+area2+"'";
			
				areaCondition += " ) ";
			
				if(area3 != null && area3 != ""){
					
					areaCondition += "or ( nic.biz_area3 = '"+area3+"'";

					if(area4 != null && area4 != "")
						areaCondition += " and nic.biz_area4 = '"+area4+"'";
			
					areaCondition += " ) ";
				}
			
				if(area5 != null && area5 != ""){
					
					areaCondition += "or ( nic.biz_area5 = '"+area5+"'";

					if(area6 != null && area6 != "")
						areaCondition += " and nic.biz_area6 = '"+area6+"'";
			
					areaCondition += " ) ";
				}	
			
				areaCondition += " ) ";
			}
			
			commandMap.put("areaCondition", areaCondition);
			
			
			String tmpCareer[] = ((String)msMap.get("career")).split(",");
			String careerCondition = "";
			if(tmpCareer != null && tmpCareer.length > 0){
				if (tmpCareer[0] == "102") { // 신입
					if (tmpCareer[1] != "100") {
						careerCondition += " and nic.biz_career >= '"+tmpCareer[0]+"'";
					} else { // 무관포함
						careerCondition += "";
					}
				} else if (tmpCareer[0] == "101") { // 경력
					if (tmpCareer[3] != "100") {
						careerCondition += " and nic.biz_career >= '"+tmpCareer[1]+"')";
					} else { // 무관포함
						careerCondition += "";
					}
				}
			}
			commandMap.put("careerCondition", careerCondition);
			
			
			String tmpFormArr[] = ((String)msMap.get("form")).split(",");
			String formCondition = "";
			if(tmpFormArr != null && tmpFormArr.length > 0){
				formCondition += "and (";
				for(int i = 0 ; i < tmpFormArr.length ; i++){
					formCondition += " nic.biz_jobfrom like '%"+tmpFormArr[i]+"%'";
					if(i < (tmpFormArr.length-1)){
						formCondition += " or ";
					}
				}
				formCondition += " )";
			}
			commandMap.put("formCondition", formCondition);
			
			
			String tmpSchoolArr[] = ((String)msMap.get("school")).split(",");
			String tmpSchool = (String)msMap.get("school");
			String schoolCondition = "";
			if(tmpSchoolArr != null && tmpSchoolArr.length > 0){
				if (tmpSchool.indexOf("100") > -1){
					schoolCondition = " and nic.biz_ability >= "+tmpSchoolArr[0];
				} 
			}
			commandMap.put("schoolCondition", schoolCondition);
			commandMap.put("payType", (String)msMap.get("payType"));
			commandMap.put("pay", (String)msMap.get("pay"));
			
		}catch(Exception e){
			System.out.println("MakeQueryUtil.makeMyServiceQuery Exception!!! \n"+e.toString());
		}
		return commandMap;
	}

}

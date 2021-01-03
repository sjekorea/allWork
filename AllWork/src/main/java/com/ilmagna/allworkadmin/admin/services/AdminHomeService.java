package com.ilmagna.allworkadmin.admin.services;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ilmagna.allworkadmin.admin.daos.AdminHomeDAO;
import com.ilmagna.allworkadmin.admin.domains.AdminDashboardModel;

@Service
public class AdminHomeService {
		
	@Autowired private AdminHomeDAO homeDAO;
	
	
	public Integer getRecruitCount(AdminDashboardModel model) throws Exception {
		return homeDAO.getRecruitCount(model);
	}
	
	public Integer getResumeCount(AdminDashboardModel model) throws Exception {
		return homeDAO.getResumeCount(model);
	}
	
	public Integer getMemberCount(AdminDashboardModel model) throws Exception {
		return homeDAO.getMemberCount(model);
	}
	
	public Integer getBbsCount(AdminDashboardModel model) throws Exception {
		return homeDAO.getBbsCount(model);
	}


	
	//Dashboard 정보
	public AdminDashboardModel getDashboard(Integer year) throws Exception {
		//Dashboard 정보 준비.
		AdminDashboardModel item = new AdminDashboardModel();
		
		try {
			//날짜정보 준비.
			String format = "yyyy-MM-dd";
			SimpleDateFormat sdf = new SimpleDateFormat(format);

			Calendar cal = Calendar.getInstance();
			int thisYear = cal.get(Calendar.YEAR);
			int thisMonth = cal.get(Calendar.MONTH);
			//int thisDay = year;	//cal.get(Calendar.DAY_OF_MONTH);
			
			String dateToday = sdf.format(cal.getTime());					//오늘.
			String dateTodayFrom = dateToday + " 00:00:00";
			String dateTodayTo = dateToday + " 23:59:59";

			cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);					//금주.
			String dateWeekFrom = sdf.format(cal.getTime()) + " 00:00:00";
			for (int i = 0; i < 6; i++) {
				cal.add(Calendar.DATE, 1);
			}
			String dateWeekTo = sdf.format(cal.getTime()) + " 23:59:59";
			
			cal.set(Calendar.MONTH, thisMonth);								//금월.
			cal.set(Calendar.DAY_OF_MONTH, 1);
			String dateMonthFrom = sdf.format(cal.getTime()) + " 00:00:00";
			int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			cal.set(Calendar.DAY_OF_MONTH, maxDay);
			String dateMonthTo = sdf.format(cal.getTime()) + " 23:59:59";

			String dateYearFrom = thisYear + "-01-01 00:00:00";
			String dateYearTo = thisYear + "-12-31 00:00:00";
			//System.out.println(dateToday + ": " + dateWeekFrom + "~" + dateWeekTo + ": " + dateMonthFrom + "~" + dateMonthTo + ": " + dateYearFrom + "~" + dateYearTo);

			//Dashboard 내용 검색.
			AdminDashboardModel dashboardModel = new AdminDashboardModel();

			//(0) 각 월별 통계정보 구성.
			item = this.getDashBoardYearRecord(year);

			//(1) 금일.
			dashboardModel.setFromDate(dateTodayFrom);
			dashboardModel.setToDate(dateTodayTo);
			int nCountRecruit = this.getRecruitCount(dashboardModel);
			item.getDb_today().setRecruit_count(nCountRecruit);
			int nCountResume = this.getResumeCount(dashboardModel);
			item.getDb_today().setResume_count(nCountResume);
			int nCountMember = this.getMemberCount(dashboardModel);
			item.getDb_today().setMember_count(nCountMember);
			int nCountBbs = this.getBbsCount(dashboardModel);
			item.getDb_today().setBbs_count(nCountBbs);
			
			//(2) 금주.
			dashboardModel.setFromDate(dateWeekFrom);
			dashboardModel.setToDate(dateWeekTo);
			nCountRecruit = this.getRecruitCount(dashboardModel);
			item.getDb_week().setRecruit_count(nCountRecruit);
			nCountResume = this.getResumeCount(dashboardModel);
			item.getDb_week().setResume_count(nCountResume);
			nCountMember = this.getMemberCount(dashboardModel);
			item.getDb_week().setMember_count(nCountMember);
			nCountBbs = this.getBbsCount(dashboardModel);
			item.getDb_week().setBbs_count(nCountBbs);
			
			//(3) 금월.
			dashboardModel.setFromDate(dateMonthFrom);
			dashboardModel.setToDate(dateMonthTo);
			nCountRecruit = this.getRecruitCount(dashboardModel);
			item.getDb_month().setRecruit_count(nCountRecruit);
			nCountResume = this.getResumeCount(dashboardModel);
			item.getDb_month().setResume_count(nCountResume);
			nCountMember = this.getMemberCount(dashboardModel);
			item.getDb_month().setMember_count(nCountMember);
			nCountBbs = this.getBbsCount(dashboardModel);
			item.getDb_month().setBbs_count(nCountBbs);
			
			//(4) 금년.
			dashboardModel.setFromDate(dateYearFrom);
			dashboardModel.setToDate(dateYearTo);
			nCountRecruit = this.getRecruitCount(dashboardModel);
			item.getDb_year().setRecruit_count(nCountRecruit);
			nCountResume = this.getResumeCount(dashboardModel);
			item.getDb_year().setResume_count(nCountResume);
			nCountMember = this.getMemberCount(dashboardModel);
			item.getDb_year().setMember_count(nCountMember);
			nCountBbs = this.getBbsCount(dashboardModel);
			item.getDb_year().setBbs_count(nCountBbs);
			
			//(5) 전체.
			dashboardModel.setFromDate("");
			dashboardModel.setToDate("");
			nCountRecruit = this.getRecruitCount(dashboardModel);
			item.getDb_total().setRecruit_count(nCountRecruit);
			nCountResume = this.getResumeCount(dashboardModel);
			item.getDb_total().setResume_count(nCountResume);
			nCountMember = this.getMemberCount(dashboardModel);
			item.getDb_total().setMember_count(nCountMember);
			nCountBbs = this.getBbsCount(dashboardModel);
			item.getDb_total().setBbs_count(nCountBbs);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return item;
	}

	public AdminDashboardModel getDashBoardYearRecord(Integer year) throws Exception {
		//Dashboard 정보 준비.
		AdminDashboardModel item = new AdminDashboardModel();
		
		try {
			//날짜정보 준비.
			String format = "yyyy-MM-dd";
			SimpleDateFormat sdf = new SimpleDateFormat(format);

			//Dashboard 내용 검색.
			AdminDashboardModel dashboardModel = new AdminDashboardModel();

			//각 월별 통계정보 구성.
			Calendar calYear = Calendar.getInstance();
			calYear.set(Calendar.YEAR, year);
			for (int i = 0; i < 12; i++) {
				calYear.set(Calendar.MONTH, i);

				calYear.set(Calendar.DAY_OF_MONTH, 1);
				String dateFrom = sdf.format(calYear.getTime()) + " 00:00:00";
				int maxDayMonth = calYear.getActualMaximum(Calendar.DAY_OF_MONTH);
				calYear.set(Calendar.DAY_OF_MONTH, maxDayMonth);
				String dateTo = sdf.format(calYear.getTime()) + " 23:59:59";

				dashboardModel.setFromDate(dateFrom);
				dashboardModel.setToDate(dateTo);
				int nCountRecruit = this.getRecruitCount(dashboardModel);
				item.getYear_by_month().get(i).setRecruit_count(nCountRecruit);
				int nCountResume = this.getResumeCount(dashboardModel);
				item.getYear_by_month().get(i).setResume_count(nCountResume);
				int nCountMember = this.getMemberCount(dashboardModel);
				item.getYear_by_month().get(i).setMember_count(nCountMember);
				int nCountBbs = this.getBbsCount(dashboardModel);
				item.getYear_by_month().get(i).setBbs_count(nCountBbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return item;
	}
}

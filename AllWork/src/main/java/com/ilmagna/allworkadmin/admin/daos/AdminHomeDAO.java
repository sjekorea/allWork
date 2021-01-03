package com.ilmagna.allworkadmin.admin.daos;

import org.springframework.stereotype.Repository;

import com.ilmagna.allworkadmin.admin.domains.AdminDashboardModel;


@Repository
public interface AdminHomeDAO {

	Integer getRecruitCount(AdminDashboardModel model) throws Exception;

	Integer getResumeCount(AdminDashboardModel model) throws Exception;

	Integer getMemberCount(AdminDashboardModel model) throws Exception;

	Integer getBbsCount(AdminDashboardModel model) throws Exception;
}

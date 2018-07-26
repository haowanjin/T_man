package com.xsxk.service;

import java.util.List;

import com.xsxk.pojo.TCourse;
import com.xsxk.pojo.TStudent;
import com.xsxk.pojo.customer.CourseCustomer;
import com.xsxk.pojo.customer.StuCourse;

public interface CourseService {

	TCourse getCourse(Integer id);
	int insertCourse(TCourse course);
	List<TCourse> getCourseAll();
	int updateCourse(TCourse course);
	int deleteCourse(Integer id);
	List<CourseCustomer> getCourseInfo();
	CourseCustomer getCourseInfoById(Integer id);
	List<CourseCustomer> getCourseInfoBySid(Integer sid);
	List<CourseCustomer> getCoursesByTid(Integer tid);
	List<TStudent> getStudentsByTid(Integer tid);
}

package com.xsxk.mapper;

import java.util.List;

import com.xsxk.pojo.TStudent;
import com.xsxk.pojo.customer.CourseCustomer;

public interface CourseCustomerMapper {
	public List<CourseCustomer> selectCourses();
	public CourseCustomer getCoursInfoByid(Integer id);
	public List<CourseCustomer> getCourseInfoBySid(Integer sid);
	public List<CourseCustomer> getTeacherCourses(Integer tid);
	List<TStudent> getStudentsByTid(Integer tid);
}

package com.xsxk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xsxk.mapper.CourseCustomerMapper;
import com.xsxk.mapper.TCourseMapper;
import com.xsxk.pojo.TCourse;
import com.xsxk.pojo.TCourseExample;
import com.xsxk.pojo.TCourseExample.Criteria;
import com.xsxk.pojo.TStudent;
import com.xsxk.pojo.customer.CourseCustomer;
import com.xsxk.pojo.customer.StuCourse;
import com.xsxk.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService{

	@Autowired
	private TCourseMapper courseMapper;
	@Autowired
	private CourseCustomerMapper courseCustomerMapper;
	
	@Override
	public TCourse getCourse(Integer id) {
		TCourse course = courseMapper.selectByPrimaryKey(id);
		return course;
	}

	@Override
	public int insertCourse(TCourse course) {
		int result = courseMapper.insertSelective(course);
		return result;
	}

	@Override
	public List<TCourse> getCourseAll() {
		TCourseExample example = new TCourseExample();
		List<TCourse> list = courseMapper.selectByExample(example);
		return list;
	}

	@Override
	public int updateCourse(TCourse course) {
		int resul = courseMapper.updateByPrimaryKeySelective(course);
		return resul;
	}

	@Override
	public int deleteCourse(Integer id) {
		int result = courseMapper.deleteByPrimaryKey(id);
		return result;
	}

	@Override
	public List<CourseCustomer> getCourseInfo() {
		List<CourseCustomer> courseInfoList = courseCustomerMapper.selectCourses();
		return courseInfoList;
	}

	@Override
	public CourseCustomer getCourseInfoById(Integer id) {
		CourseCustomer courseInfo = courseCustomerMapper.getCoursInfoByid(id);
		return courseInfo;
	}

	@Override
	public List<CourseCustomer> getCourseInfoBySid(Integer sid) {
		List<CourseCustomer> selectedCourses = courseCustomerMapper.getCourseInfoBySid(sid);
		return selectedCourses;
	}

	@Override
	public List<CourseCustomer> getCoursesByTid(Integer tid) {
		List<CourseCustomer> teacherCourses = courseCustomerMapper.getTeacherCourses(tid);
		return teacherCourses;
	}

	@Override
	public List<TStudent> getStudentsByTid(Integer tid) {
		List<TStudent> studentList = courseCustomerMapper.getStudentsByTid(tid);
		return studentList;
	}

}

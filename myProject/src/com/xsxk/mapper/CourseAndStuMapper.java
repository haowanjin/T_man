package com.xsxk.mapper;

import com.xsxk.pojo.customer.StuCourse;

public interface CourseAndStuMapper {
	int inserCidAndSid(StuCourse sc);
	Integer checkExist(StuCourse sc);
	Integer deleteSidAndCid(StuCourse sc);
}

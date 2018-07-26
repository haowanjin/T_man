package com.xsxk.service;

import java.util.List;

import com.xsxk.pojo.TStudent;
import com.xsxk.pojo.customer.StuCourse;

public interface StudentService {
	TStudent getStudentBySid(String sid);
	List<TStudent> getStudentAll();
	int updateStudent(TStudent student);
	int insertStudent(TStudent student);
	int deleteStudentBySid(String sid);
	int insertCidAndSid(StuCourse sc);
	int checkExist(StuCourse sc);
	int deleteSidAndCid(StuCourse sc);
}

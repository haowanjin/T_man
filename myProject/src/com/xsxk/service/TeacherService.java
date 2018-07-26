package com.xsxk.service;

import java.util.List;

import com.xsxk.pojo.TTeacher;

public interface TeacherService {
	TTeacher getTeacherByTid (String id);
	List<TTeacher> getTeacherAll();
	int insertTeacher(TTeacher teacher);
	int updateTeacher(TTeacher teacher);
	int deleteTeacher(String tid);
}

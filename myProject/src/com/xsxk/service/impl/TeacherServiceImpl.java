package com.xsxk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xsxk.mapper.TTeacherMapper;
import com.xsxk.pojo.TStudent;
import com.xsxk.pojo.TStudentExample;
import com.xsxk.pojo.TTeacher;
import com.xsxk.pojo.TTeacherExample;
import com.xsxk.pojo.TTeacherExample.Criteria;
import com.xsxk.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService{

	@Autowired
	private TTeacherMapper teacherMapper;

	@Override
	public TTeacher getTeacherByTid(String id) {
		TTeacherExample example = new TTeacherExample();
		Criteria criteria = example.createCriteria();
		criteria.andTidEqualTo(id);
		List<TTeacher> list = teacherMapper.selectByExample(example);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		else {
			return null;			
		}
	}

	@Override
	public List<TTeacher> getTeacherAll() {
		TTeacherExample example = new TTeacherExample();
		List<TTeacher> resultList = teacherMapper.selectByExample(example);
		return resultList;
	}

	@Override
	public int insertTeacher(TTeacher teacher) {
		int result = teacherMapper.insertSelective(teacher);
		return result;
	}

	@Override
	public int updateTeacher(TTeacher teacher) {
		int result = teacherMapper.updateByPrimaryKeySelective(teacher);
		return result;
	}

	@Override
	public int deleteTeacher(String tid) {
		TTeacherExample example = new TTeacherExample();
		Criteria criteria = example.createCriteria();
		criteria.andTidEqualTo(tid);
		int result = teacherMapper.deleteByExample(example);
		return result;
	}
}

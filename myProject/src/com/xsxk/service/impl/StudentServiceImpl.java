package com.xsxk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xsxk.mapper.CourseAndStuMapper;
import com.xsxk.mapper.TStudentMapper;
import com.xsxk.pojo.TStudent;
import com.xsxk.pojo.TStudentExample;
import com.xsxk.pojo.TStudentExample.Criteria;
import com.xsxk.pojo.customer.StuCourse;
import com.xsxk.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService{
	@Autowired
	private TStudentMapper studentMapper;
	@Autowired
	private CourseAndStuMapper courseAndStuMapper;
	
	@Override
	public TStudent getStudentBySid(String sid) {
		// TODO Auto-generated method stub
		//根据学生学号查询学生
		TStudentExample example = new TStudentExample();
		Criteria criteria = example.createCriteria();
		criteria.andSidEqualTo(sid);
		List<TStudent> list = studentMapper.selectByExample(example);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		else {
			return null;			
		}
	}


	@Override
	public List<TStudent> getStudentAll() {
			TStudentExample example = new TStudentExample();
			List<TStudent> resultList = studentMapper.selectByExample(example);
			return resultList;
	}


	@Override
	public int updateStudent(TStudent student) {
		int result = studentMapper.updateByPrimaryKeySelective(student);
		return result;
	}


	@Override
	public int insertStudent(TStudent student) {
		int result = studentMapper.insertSelective(student);
		return result;
	}

	@Override
	public int deleteStudentBySid(String sid) {
		TStudentExample example = new TStudentExample();
		Criteria criteria = example.createCriteria();
		criteria.andSidEqualTo(sid);
		int result = studentMapper.deleteByExample(example);
		return result;
	}


	@Override
	public int insertCidAndSid(StuCourse sc) {
		int result = courseAndStuMapper.inserCidAndSid(sc);
		return result;
	}


	@Override
	public int checkExist(StuCourse sc) {
		int exist = courseAndStuMapper.checkExist(sc);
		return exist;
	}


	@Override
	public int deleteSidAndCid(StuCourse sc) {
		int del = courseAndStuMapper.deleteSidAndCid(sc);
		return del;
	}

}

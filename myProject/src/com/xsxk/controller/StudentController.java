package com.xsxk.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xsxk.pojo.TCourse;
import com.xsxk.pojo.TStudent;
import com.xsxk.pojo.customer.CourseCustomer;
import com.xsxk.pojo.customer.StuCourse;
import com.xsxk.service.CourseService;
import com.xsxk.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	private StudentService studentService;
	@Autowired
	private CourseService courseService;
	
	@RequestMapping("/login")
	public void login (HttpServletResponse response,String id,String pwd,HttpSession session){
		TStudent student = studentService.getStudentBySid(id);
		
		try {
			if (student == null) {
				response.getWriter().print("0");
			}
			else if(!(student.getPwd().equals(pwd))){
				response.getWriter().print("0");
			}
			else{
				session.setAttribute("user", student);
				response.getWriter().print("1");				
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("/index")
	public String index(){
		return "student/student";
	}
	
	@RequestMapping("/showCourse")
	@ResponseBody
	public List<CourseCustomer> showCourse(){
		List<CourseCustomer> list = courseService.getCourseInfo();
		return list;
	}
	@RequestMapping("/chooseCourse")
	@ResponseBody
	public int chooseCourse(StuCourse sc){
		int res = studentService.insertCidAndSid(sc);
		return res;
	}
	@RequestMapping("/selectedCourse")
	@ResponseBody
	public List<CourseCustomer> selectedCourses(Integer sid){
		List<CourseCustomer> selectedCourses = courseService.getCourseInfoBySid(sid);
		return selectedCourses;
	}
	
	@RequestMapping("/checkIt")
	@ResponseBody
	public int checkIt(StuCourse sc){
		 int checkExist= studentService.checkExist(sc);
		if(checkExist > 0){
			return 1;
		}
		return 0;
	}
	
	@RequestMapping("/cancelCourse")
	@ResponseBody
	public int cancelCourse(StuCourse sc){
		int del = studentService.deleteSidAndCid(sc);
		return del;
	}
	
	@RequestMapping("/showMyself/{sid}")
	public String showMyself(@PathVariable String sid,Model model){
		TStudent studentInfo = studentService.getStudentBySid(sid);
		model.addAttribute("student", studentInfo);
		return "student/showSelf";
	}
}

package com.xsxk.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xsxk.pojo.TStudent;
import com.xsxk.pojo.TTeacher;
import com.xsxk.pojo.customer.CourseCustomer;
import com.xsxk.service.CourseService;
import com.xsxk.service.TeacherService;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	@Autowired 
	private TeacherService teacherService;
	@Autowired
	private CourseService courseService;
	
	@RequestMapping("/login")
	public  void login(HttpServletResponse response,String id,String pwd,HttpSession session) {
		TTeacher teacher = teacherService.getTeacherByTid(id);
		
		try {
			if (teacher == null) {
				response.getWriter().print("0");
				return;
			}
			else if(!(teacher.getPwd().equals(pwd))){
				response.getWriter().print("0");
				return;
			}
			else{
				session.setAttribute("user", teacher);
				response.getWriter().print("2");
			}
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/index")
	public String index() {
		return "teacher/teacher";
	}
	
	//得到老师任教的课程
	@RequestMapping("/showCourse")
	@ResponseBody
	public List<CourseCustomer> showCourse(Integer tid){
		List<CourseCustomer> courseList = courseService.getCoursesByTid(tid);
		return courseList;
	}
	
	//得到选了该老师课程的学生
	@RequestMapping("/getStudents")
	@ResponseBody
	public List<TStudent> getStudents(Integer tid){
		List<TStudent> list = courseService.getStudentsByTid(tid);
		return list;
	}
	
	@RequestMapping("/showMyself/{tid}")
	public String showSelf(@PathVariable String tid,Model model){
		TTeacher teacher = teacherService.getTeacherByTid(tid);
		model.addAttribute("teacher", teacher);
		return "teacher/selfinfo";
	}
}

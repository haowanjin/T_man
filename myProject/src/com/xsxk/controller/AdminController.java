package com.xsxk.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xsxk.pojo.TCourse;
import com.xsxk.pojo.TManager;
import com.xsxk.pojo.TRoom;
import com.xsxk.pojo.TStudent;
import com.xsxk.pojo.TTeacher;
import com.xsxk.pojo.customer.CourseCustomer;
import com.xsxk.service.CourseService;
import com.xsxk.service.ManangerService;
import com.xsxk.service.RoomService;
import com.xsxk.service.StudentService;
import com.xsxk.service.TeacherService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private ManangerService manangerService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private RoomService roomService;
	
	//管理员登录
	@RequestMapping("/login")
	public  void login(HttpServletResponse response,String id,String pwd,HttpSession session) {
		TManager manager = manangerService.getManagerByName(id);
		try {
			if (manager == null) {
				response.getWriter().print("0");
				return ;
			}
			else if(!(manager.getPwd().equals(pwd))){
				response.getWriter().print("0");
				return;
			}
			else{
				session.setAttribute("user", manager);
				response.getWriter().print("3");
			}
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	@RequestMapping("/logins")
	public String login(HttpServletRequest request)
	{
		Object user = request.getSession().getAttribute("user");
		if(user==null){
			
			return "login";
		}
		return null;
				 
	}
	
	
	//管理员登录成功，跳转到管理员首页
	@RequestMapping("/index")
	public String index()
	{
		return "admin/admin";
	}
	
	//退出系统
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.setAttribute("user", null);
		return "redirect:/";
	}
	
	//跳转到添加课程的页面
	@RequestMapping("/addCourse")
	public String addCourse(Model model)
	{
		List<TTeacher> teacherlist = teacherService.getTeacherAll();
		List<TRoom> roomlist = roomService.getRoomAll();
		model.addAttribute("teacherlist", teacherlist);
		model.addAttribute("roomlist", roomlist);
		return "admin/addcourse";
	}
	//跳转到查看课程页面
	@RequestMapping("/showCourse")
	public String showCourse(HttpSession session){
		List<TTeacher> teacherlist = teacherService.getTeacherAll();
		List<TRoom> roomlist = roomService.getRoomAll();
		session.setAttribute("TEACHER", teacherlist);
		session.setAttribute("ROOM", roomlist);
		return "admin/course";
	}
	
	//显示所有学生
	@RequestMapping("/showstu")
	@ResponseBody
	public List<TStudent> showstu(){
		List<TStudent> list = studentService.getStudentAll();
		return list;
	}
	
	//根据学号得到要修改的学生
	@RequestMapping(value="/getStudent")
	@ResponseBody
	public TStudent getStudentBySid(String sid) throws IOException{
		TStudent student = studentService.getStudentBySid(sid);
		return student;
	}
	
	//修改学生
	@RequestMapping(value="/updatestudent",method=RequestMethod.POST)
	@ResponseBody
	public int updateStudent(TStudent student)
	{
		int result = studentService.updateStudent(student);
		return result;
	}
	
	//添加学生
	@RequestMapping(value="/insertStudent",method=RequestMethod.POST)
	@ResponseBody
	public int inserStudent(TStudent student){
		int result = studentService.insertStudent(student);
		return result;
	}
	
	//删除学生
	@RequestMapping("/deleteStudent")
	@ResponseBody
	public int deleteStudent(String sid){
		int result = studentService.deleteStudentBySid(sid);
		return result;
	}
	
	//根据职工号得到要修改的老师
	@RequestMapping("/getTeacher")
	@ResponseBody
	public TTeacher getTeacherByTid(String tid){
		TTeacher teacher = teacherService.getTeacherByTid(tid);
		return teacher;
	}
	
	//显示所有老师
	@RequestMapping("/showTeacher")
	@ResponseBody
	public List<TTeacher> showTeacher(){
		List<TTeacher> resultList = teacherService.getTeacherAll();
		return resultList;
	}
	
	//添加老师
	@RequestMapping(value="/insertTeacher",method=RequestMethod.POST)
	@ResponseBody
	public int insertTeacher(TTeacher teacher){
		int result = teacherService.insertTeacher(teacher);
		return result;
	}
	
	//修改老师信息
	@RequestMapping(value="/updateTeacher",method=RequestMethod.POST)
	@ResponseBody
	public int updateTeacher(TTeacher teacher){
		int result = teacherService.updateTeacher(teacher);
		return result;
	}
	
	//删除老师信息
	@RequestMapping("/deleteTeacher")
	@ResponseBody
	public int deleteTeacher (String tid){
		int result = teacherService.deleteTeacher(tid);
		return result;
	}
	
	//添加课程
	@RequestMapping(value="/insertCourse",method=RequestMethod.POST)
	@ResponseBody
	public int insertCourse(TCourse course){
		int result = courseService.insertCourse(course);
		return result;
	}
	
	//得到所有课程
	@RequestMapping(value="/listCourse")
	@ResponseBody
	public List<CourseCustomer> listCourse(){
		List<CourseCustomer> list = courseService.getCourseInfo();
		return list;
	}
	
	//修改课程
	@RequestMapping(value="/updateCourse",method=RequestMethod.POST)
	@ResponseBody
	public int updateCourse(TCourse course){
		int result = courseService.updateCourse(course);
		return result;
	}
	
	//根据课程id得到要修改的课程
	@RequestMapping("/getCourse")
	@ResponseBody
	public CourseCustomer getCourse(Integer id){
		CourseCustomer course = courseService.getCourseInfoById(id);
		return course;
	}
	
	//根据课程id删除课程信息
	@RequestMapping("/deleteCourse")
	@ResponseBody
	public int deleteCourse(Integer id){
		int result = courseService.deleteCourse(id);
		return result;
	}
	
	//添加教室
	@RequestMapping(value="/insertRoom",method=RequestMethod.POST)
	@ResponseBody
	public int insertRoom(TRoom room){
		int data = roomService.insertRoom(room);
		return data;
	}
	
	//得到所有的教室
	@RequestMapping("showRoom")
	@ResponseBody
	public List<TRoom> showRoom(){
		List<TRoom> list = roomService.getRoomAll();
		return list;
	}
	
	//根据id得到教室的信息
	@RequestMapping("/getRoom")
	@ResponseBody
	public TRoom getRoomById(Integer id){
		TRoom room = roomService.getRoomById(id);
		return room;
	}
	
	//修改教室的信息
	@RequestMapping(value="/updateRoom",method=RequestMethod.POST)
	@ResponseBody
	public int updateRoom(TRoom room){
		int data = roomService.updateRoom(room);
		return data;
	}
	
	//删除教室信息
	@RequestMapping(value="/deleteRoom")
	@ResponseBody
	public int deleteRoom(Integer id){
		int data = roomService.deleteRoom(id);
		return data;
	}
}

package com.xsxk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

	@RequestMapping("/logout")
	public String showIndex(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	//跳转到管理员下的其他页面
	@RequestMapping("/admin/{page}")
	public String showAdminPage(@PathVariable String page) {
		return "admin/"+page;
	}
	
	//跳转到老师下的其他页面
	@RequestMapping("/teacher/{page}")
	public String showTeacherPage(@PathVariable String page){
		return "teacher/"+page;
	}
	
	//跳转到老师下的其他页面
		@RequestMapping("/student/{page}")
		public String showStudentPage(@PathVariable String page){
			return "student/"+page;
		}
}

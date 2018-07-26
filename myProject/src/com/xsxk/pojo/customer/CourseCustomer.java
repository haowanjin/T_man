package com.xsxk.pojo.customer;

import com.xsxk.pojo.TCourse;

public class CourseCustomer extends TCourse {
	private String tname;
	private String room;
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
}

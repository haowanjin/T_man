package com.xsxk.service;

import java.util.List;

import com.xsxk.pojo.TRoom;

public interface RoomService {
	int insertRoom(TRoom room);
	int updateRoom(TRoom room);
	int deleteRoom(Integer id);
	List<TRoom> getRoomAll();
	TRoom getRoomById(Integer id);
}

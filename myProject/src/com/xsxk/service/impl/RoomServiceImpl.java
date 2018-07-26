package com.xsxk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xsxk.mapper.TRoomMapper;
import com.xsxk.pojo.TRoom;
import com.xsxk.pojo.TRoomExample;
import com.xsxk.service.RoomService;

@Service
public class RoomServiceImpl implements RoomService{

	@Autowired
	private TRoomMapper roomMapper;
	
	@Override
	public int insertRoom(TRoom room) {
		int result = roomMapper.insertSelective(room);
		return result;
	}

	@Override
	public int updateRoom(TRoom room) {
		int result = roomMapper.updateByPrimaryKeySelective(room);
		return result;
	}

	@Override
	public int deleteRoom(Integer id) {
		int result = roomMapper.deleteByPrimaryKey(id);
		return result;
	}

	@Override
	public List<TRoom> getRoomAll() {
		TRoomExample example = new TRoomExample();
		List<TRoom> list = roomMapper.selectByExample(example);
		return list;
	}

	@Override
	public TRoom getRoomById(Integer id) {
		TRoom room = roomMapper.selectByPrimaryKey(id);
		return room;
	}

}

package com.xsxk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xsxk.mapper.TManagerMapper;
import com.xsxk.pojo.TManager;
import com.xsxk.pojo.TManagerExample;
import com.xsxk.pojo.TManagerExample.Criteria;
import com.xsxk.service.ManangerService;

@Service
public class ManagerServiceImpl implements ManangerService{

	@Autowired
	private TManagerMapper managerMapper;
	
	@Override
	public TManager getManagerByName(String id) {
		TManagerExample example = new TManagerExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(id);
		List<TManager> list = managerMapper.selectByExample(example);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		else {
			return null;			
		}
	}

}

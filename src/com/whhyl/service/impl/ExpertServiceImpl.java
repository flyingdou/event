package com.whhyl.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.whhyl.dao.ExpertForecastMapper;
import com.whhyl.entity.ExpertForecast;
import com.whhyl.service.ExpertService;

@Transactional
@Service
public class ExpertServiceImpl implements ExpertService {
	
	@Autowired
	ExpertForecastMapper expertDao;

	/**
	 * 发起活动时添加的专家数据
	 */
	@Override
	public void expertAddByLaunch(Long activeId, Integer expertId) {
		ExpertForecast expertForecast = new ExpertForecast();
		expertForecast.setActiveId(activeId.intValue());
		expertForecast.setMember(expertId);
		expertForecast.setAutoTime(new Date());
		expertDao.insert(expertForecast);
	}

}

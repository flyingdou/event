package com.whhyl.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whhyl.dao.ActiveMapper;
import com.whhyl.entity.Active;
import com.whhyl.schedule.OrderBalance;
import com.whhyl.service.BalanceService;

import net.sf.json.JSONObject;

/**
 * @author hw
 * @version 创建时间：2018年4月17日 下午2:34:03
 * @ClassName 类名称
 * @Description 类描述
 */
@Service
public class BalanceServiceImpl implements BalanceService {

	@Autowired
	private ActiveMapper activeMapper;

	@Autowired
	private OrderBalance orderBalance;

	@Override
	public JSONObject balanceByReferee(JSONObject param) {
		JSONObject result = new JSONObject();
		Active active = activeMapper.selectByPrimaryKey(param.getLong("activeId"));
		// 调用结算业务
		orderBalance.balanceData(active);
		// 修改活动状态
		active.setStatus("1");
		activeMapper.updateByPrimaryKey(active);
		result.accumulate("success", true);
		return result;
	}

}

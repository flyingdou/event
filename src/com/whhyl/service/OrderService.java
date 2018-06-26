package com.whhyl.service;

import com.whhyl.entity.Order;

import net.sf.json.JSONObject;

/**
 * 订单业务接口
 * @author dou
 */
public interface OrderService {

	/**
	 * 生成订单接口
	 * @return
	 */
	public JSONObject create (JSONObject obj);
	
	
	public JSONObject updateOrderStatus(String no);
	
	/**
	 * 查询用户余额
	 * @param member
	 * @return
	 */
	public Double checkBalance(Integer member);
	
	
	/**
	 * 通过id查询订单
	 * @param id
	 * @return
	 */
	public Order findOrderById(Integer id);
}

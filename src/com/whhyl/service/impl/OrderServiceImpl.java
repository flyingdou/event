package com.whhyl.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.whhyl.dao.OrderMapper;
import com.whhyl.entity.Order;
import com.whhyl.service.OrderService;
import com.whhyl.util.commentsUtil;

import net.sf.json.JSONObject;

@Transactional
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderDao;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * 生成订单业务逻辑
	 */
	@Override
	public JSONObject create(JSONObject obj) {
		// 订单类型 1虚拟币订单 2rmb订单
		String orderType = obj.getString("orderType");

		JSONObject ret = new JSONObject();
		Order order = new Order();

		// 虚拟币
		if ("1".equals(orderType)) {
			// 查询用户余额
			Double balance = checkBalance(obj.getInt("member"));
			if (balance >= obj.getDouble("funcoin")) {
				order.setStatus("1");
			} else {
				ret.accumulate("success", false).accumulate("msg", "您当前余额不足，请充值！");
				return ret;
			}

		} else {
			// rmb订单
			order.setStatus("0");
			order.setMoney(obj.getDouble("money"));
		}
		// 订单号
		order.setNo(sdf.format(new Date()).replace("-", "") + commentsUtil.getRandomString());
		order.setProductType(obj.getString("productType"));
		order.setProduct(obj.getInt("product"));
		order.setFuncoin(obj.getString("funcoin"));
		order.setMember(obj.getInt("member"));
		order.setTomember(obj.getInt("toMember"));
		order.setAutoTime(new Date());
		order.setRemark(obj.get("remark") == null ? null : obj.getString("remark"));

		// 生成订单dao
		int i = orderDao.insert(order);
		if (i < 0) {
			// 生成订单失败
			ret.accumulate("success", false).accumulate("msg", "生成订单失败！");
		} else {
			// 生成订单成功
			ret.accumulate("success", true).accumulate("msg", "OK").accumulate("id", order.getId());
		}

		return ret;
	}

	/**
	 * 查询用户账户funcion余额
	 */
	public Double checkBalance(Integer member) {
		// 查询用户余额
		Double balance = orderDao.queryBalance(member);
		return balance;
	}

	/**
	 * 修改订单状态
	 */
	@Override
	public JSONObject updateOrderStatus(String no) {
		JSONObject ret = new JSONObject();
		// 将要修改的订单查询出来
		Order order = orderDao.findOrderByNo(no);
		order.setStatus("1");
		order.setAutoTime(new Date());
		int i = orderDao.updateByPrimaryKey(order);
		if (i > 0) {
			ret.accumulate("success", true).accumulate("msg", "修改订单状态成功!");
		} else {
			ret.accumulate("success", false).accumulate("msg", "修改订单状态失败！");
		}
		return ret;
	}

	/**
	 * 通过id查询order
	 */
	public Order findOrderById(Integer id) {
		Order order = orderDao.selectById(id);
		return order;
	}

}

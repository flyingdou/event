package com.whhyl.controller;

import java.net.URLDecoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whhyl.entity.Member;
import com.whhyl.entity.Order;
import com.whhyl.service.OrderService;

import net.sf.json.JSONObject;

/**
 * 订单控制器
 * 
 * @author dou
 */
@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;

	/**
	 * 充值funcoin
	 * 
	 * @param json
	 * @param session
	 * @return
	 */
	@RequestMapping("/Recharge")
	@ResponseBody
	public JSONObject Recharge(String json, HttpSession session) {
		JSONObject ret = new JSONObject();
		Member member = (Member) session.getAttribute("member");
		try {
			// 处理请求参数
			JSONObject obj = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			obj.accumulate("member", 10);
			obj.accumulate("orderType", 2);
			obj.accumulate("product", 0);
			obj.accumulate("productType", "A");
			obj.accumulate("funcoin", Math.round(obj.getDouble("money")*10));
			obj.accumulate("toMember", member.getId());
			obj.accumulate("remark", "充值" + obj.get("money") + "元");

			// 调用生成订单业务逻辑
			ret = orderService.create(obj);
			if ((boolean) ret.get("success")) {
				// 生成订单后，获取订单号
				Order order = orderService.findOrderById(ret.getInt("id"));
				return new JSONObject().accumulate("success", true).accumulate("orderId", order.getId());
			} else {
				return new JSONObject().accumulate("success", false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

}

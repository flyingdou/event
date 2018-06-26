package com.whhyl.controller;

import javax.servlet.http.HttpServletRequest;

import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whhyl.common.Constants;
import com.whhyl.entity.Member;
import com.whhyl.entity.Order;
import com.whhyl.service.OrderService;
import com.whhyl.util.SDK_WX;
import com.whhyl.util.commentsUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/wechat")
public class WechatController {

	@Autowired
	private OrderService orderService;

	/**
	 * 获取微信sdk信息
	 */
	@RequestMapping("/sign")
	@ResponseBody
	public String sign(HttpServletRequest request) {
		SDK_WX wx = new SDK_WX(request);
		String url = request.getParameter("url");
		String result = wx.sign(url);
		return result;
	}

	/**
	 * 微信公众号支付签名
	 */
	@RequestMapping("/paySign")
	@ResponseBody
	public String paySign(String orderId, HttpServletRequest request) {
		try {
			SDK_WX wx = new SDK_WX(request);
			Member member = (Member) request.getSession().getAttribute("member");
			Order order = orderService.findOrderById(Integer.valueOf(orderId));
			return wx.paySign(member.getWechatId(), order);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e).toString();
		}
	}

	/**
	 * 微信公众号支付回调
	 */
	@RequestMapping("/weixinNotify")
	@ResponseBody
	public String weixinNotify(HttpServletRequest request) {
		// 返回结果
		String result = "";
		// 获取微信请求的参数
		org.json.JSONObject param = XML.toJSONObject(commentsUtil.readStream(request)).getJSONObject("xml");
		// 获取微信处理结果
		String return_code = param.getString("return_code");
		// 通知微信.异步确认成功.必写.不然微信会一直通知后台.八次之后就认为交易失败了.
		if (Constants.SUCCESS.equals(return_code)) {
			// 修改订单状态,传入订单号
			orderService.updateOrderStatus(param.getString("out_trade_no"));
			// 告诉微信支付成功
			result = "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";
		} else {
			result = "<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[error]]></return_msg></xml>";
		}
		return result;
	}
}

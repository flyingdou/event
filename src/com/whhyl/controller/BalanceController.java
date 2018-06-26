package com.whhyl.controller;

import java.net.URLDecoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whhyl.service.BalanceService;

import net.sf.json.JSONObject;

/**
 * @author hw
 * @version 创建时间：2018年4月17日 下午2:41:55
 * @ClassName 类名称
 * @Description 类描述
 */
@Controller
public class BalanceController {

	@Autowired
	private BalanceService balanceService;

	/**
	 * 结算业务(裁判模式)
	 */
	@RequestMapping("/balanceByReferee")
	@ResponseBody
	public JSONObject balanceByReferee(String json) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			return balanceService.balanceByReferee(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}
}

package com.whhyl.controller;

import java.net.URLDecoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whhyl.entity.Member;
import com.whhyl.service.ActiveService;

import net.sf.json.JSONObject;

/**
 * 活动控制器
 * 
 * @author dou
 *
 */
@Controller
@RequestMapping("/active")
public class ActiveController {

	@Autowired
	private ActiveService activeService;

	/**
	 * 发起活动
	 * 
	 * @param json
	 * @param session
	 * @return
	 */
	@RequestMapping("/launch")
	@ResponseBody
	public JSONObject launch(String json, HttpSession session) {
		JSONObject ret = new JSONObject();
		Member member = (Member) session.getAttribute("member");
		try {
			// 接收请求参数
			JSONObject obj = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			obj.accumulate("creator", member.getId());
			// 调用业务逻辑
			ret = activeService.launch(obj);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	/**
	 * 活动列表
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/activeList")
	public String activeList(Model model) {
		JSONObject ret = new JSONObject();
		try {
			// 调用业务逻辑
			ret = activeService.list();
			model.addAttribute("json", ret);
			return "activeList";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	
	/**
	 * 用于验证用户需要登录才能发起活动
	 * @return
	 */
	@RequestMapping("/launchActive")
	public String launchActive(){
        return "launchActive";
	}
	

	/**
	 * 活动详情
	 * 
	 * @param json
	 * @return
	 */
	@RequestMapping("/activeDetail")
	public String activeDetail(String json, HttpSession session, Model model) {
		JSONObject ret = new JSONObject();
		Member member = (Member) session.getAttribute("member");
		try {
			// 接收请求参数
			JSONObject obj = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			obj.accumulate("currentMember", member.getId());
			// 调用后台业务逻辑
			ret = activeService.detail(obj);
			model.addAttribute("json", ret);
			return "activeDetail";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 搜索活动
	 */
	@RequestMapping("/searchActive")
	@ResponseBody
	public JSONObject searchActive(String json) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));;
			return activeService.searchActive(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}
}

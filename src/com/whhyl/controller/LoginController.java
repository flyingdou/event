package com.whhyl.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whhyl.entity.Member;
import com.whhyl.service.LoginService;
import com.whhyl.util.StringUtils;

import net.sf.json.JSONObject;

/**
 * 登录控制器
 * 
 * @author Administrator
 *
 */
@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	@RequestMapping("/login")
	@ResponseBody
	public JSONObject login(String json, HttpSession session) {
		JSONObject ret = new JSONObject();
		try {
			Member member = null;
			JSONObject obj = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			System.err.println("登录参数：" + obj.toString());
			member = loginService.login(obj);

			if (member != null) {
				// 登录成功
				session.setAttribute("member", member);
				ret.accumulate("success", true).accumulate("message", "登录成功");
			} else {
				// 登陆失败，提示用户用户名或密码错误
				ret.accumulate("success", false).accumulate("message", "用户名或密码错误，请重新登录");
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return ret;

	}

	/**
	 * 简易登录
	 * 
	 * @param id
	 * @param session
	 * @return
	 */
	@RequestMapping("/simpleLogin")
	@ResponseBody
	public JSONObject simpleLogin(String id, HttpSession session) {
		JSONObject ret = new JSONObject();
		try {
			Member member = null;
			// 默认1用户登录
			if (StringUtils.isEmpty(id)) {
				id = "1";
			}
			member = loginService.simpleLogin(id);
			session.setAttribute("member", member);
			ret.accumulate("success", true).accumulate("msg", "登录成功！").accumulate("id", member.getId());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	/**
	 * 微信登录,(微信回调方法)
	 */
	@RequestMapping("/wechatLogin")
	public void wechatLogin(HttpServletRequest request, HttpServletResponse response) {
		try {
			JSONObject ret = new JSONObject();
			// 获取微信返回的code
			String code = request.getParameter("code");
			JSONObject obj = new JSONObject();
			obj.accumulate("code", code);
			// 调用微信登录业务接口
			ret = loginService.wechatLogin(obj, request);
			if (ret.containsKey("openId") && ret.get("openId") != null) {
				// 登录成功
				request.getSession().setAttribute("status", 1);
				request.getSession().setAttribute("openId", ret.get("openId"));
				// 跳转登录页面
			} else if (ret.containsKey("subscribe")) {
				// 该用户暂未关注本公众号，应该跳转到本公众号二维码页面，让用户关注
			}
			request.getSession().setAttribute("loginResult", ret);
			response.sendRedirect("event/requestOpenid.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

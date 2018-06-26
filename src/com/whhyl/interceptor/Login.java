package com.whhyl.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.whhyl.entity.Member;
import com.whhyl.util.StringUtils;

/**
 * 登录拦截器
 * 
 * @author Administrator
 *
 */
public class Login implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		String[] paths = { "/register", "/login", "/simpleLogin","/wechatLogin", "/weixinNotify" };
		boolean check = false;
		for (String path : paths) {
			if (request.getRequestURI().indexOf(path) != -1) {
				check = true;
				break;
			}
		}

		if (check) {
			return true;
		} else {
			HttpSession session = request.getSession();
			Member member = (Member) session.getAttribute("member");
			if (member != null) {
				return true;
			} else {
//				response.getWriter().print(new JSONObject().accumulate("success", false).accumulate("msg", "请先登录"));
				session.setAttribute("status", 0);
				String path = request.getContextPath();
				String basePath =  request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/" + path;
				String currentURL = request.getRequestURL().toString();
				if (StringUtils.isNotEmpty(request.getQueryString())) {
					currentURL += "?" + request.getQueryString();
				}
				session.setAttribute("upUrl", currentURL);
				response.sendRedirect(basePath + "event/requestOpenid.jsp");
				return false;
			}
		}

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}

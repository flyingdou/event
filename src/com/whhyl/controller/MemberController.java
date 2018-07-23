package com.whhyl.controller;

import java.net.URLDecoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whhyl.entity.Member;
import com.whhyl.service.MemberService;

import net.sf.json.JSONObject;

/**
 * 会员相关业务控制器
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	
	/**
	 * 测试方法
	 */
	@RequestMapping("/test4dou")
	@ResponseBody
	public JSONObject test4dou () {
		JSONObject ret = new JSONObject();
		ret.accumulate("success", true)
		   .accumulate("msg", "OK")
		   ;
		return ret;
	}
	
	
	
	/**
	 * 注册
	 * 
	 * @param json
	 * @return
	 */
	@RequestMapping("/register")
	@ResponseBody
	public JSONObject register(String json) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			return memberService.register(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 完善资料
	 * 
	 * @param json
	 * @return
	 */
	@RequestMapping("/perfect")
	@ResponseBody
	public JSONObject perfect(String json, HttpSession session) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			Member member = (Member) session.getAttribute("member");
			param.accumulate("id", member.getId());
			return memberService.perfect(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 查询用户详细信息
	 */
	@RequestMapping("/memberInfo")
	public String memberInfo(HttpSession session, Model model) {
		try {
			JSONObject param = new JSONObject();
			Member member = (Member) session.getAttribute("member");
			param.accumulate("memberId", member.getId());
			model.addAttribute("json", memberService.getMemberInfo(param));
			return "wd";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 查询用户详细信息
	 */
	@RequestMapping("/memberInfoAjax")
	@ResponseBody
	public JSONObject memberInfoAjax(HttpSession session) {
		try {
			JSONObject param = new JSONObject();
			Member member = (Member) session.getAttribute("member");
			param.accumulate("memberId", member.getId());
			return memberService.getMemberInfo(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 我的活动
	 * 
	 * @param json
	 * @return
	 */
	@RequestMapping("/findActiveByMember")
	public String findActiveByMember(HttpSession session, Model model) {
		JSONObject ret = new JSONObject();
		try {
			JSONObject obj = new JSONObject();
			Member member = (Member) session.getAttribute("member");
			obj.accumulate("member", member.getId());

			// 调用业务逻辑层
			ret = memberService.findActiveByMember(obj);
			model.addAttribute("active", ret);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "myActive";

	}

	/**
	 * 我的投票
	 */
	@RequestMapping("/myVote")
	@ResponseBody
	public JSONObject myVote(String json, HttpSession session) {
		try {
			JSONObject param = null;
			if (json == null) {
				param = new JSONObject().accumulate("status", "0");
			} else {
				param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			}
			Member member = (Member) session.getAttribute("member");
			param.accumulate("memberId", member.getId());
			return memberService.myVote(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 我的投票
	 */
	@RequestMapping("/myWorks")
	@ResponseBody
	public JSONObject myWorks(HttpSession session) {
		try {
			JSONObject param = new JSONObject();
			Member member = (Member) session.getAttribute("member");
			param.accumulate("memberId", member.getId());
			return memberService.myWorks(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 我的钱包
	 * @return
	 */
	@RequestMapping("/myWallet")
	@ResponseBody
	public JSONObject myWallet(HttpSession session) {
		JSONObject ret = new JSONObject();
		try {
			JSONObject obj = new JSONObject();
			Member member = (Member) session.getAttribute("member");
			obj.accumulate("member", member.getId());
			// 调用业务逻辑
			ret = memberService.myWallet(obj);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	
	/**
	 * 用于前台用户点击跳转到我的钱包中
	 * @return
	 */
	@RequestMapping("/gotoMyWallet")
	public String gotoMyWallet () {
		return "wdqb.jsp";
	}
	
	

	/**
	 * 获取用户(选择裁判)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectMembers")
	public String selectMembers(Model model, HttpSession session) {
		JSONObject ret = new JSONObject();
		JSONObject obj = new JSONObject();
		try {
			// 调用业务逻辑
			Member member = (Member) session.getAttribute("member");
			if (member != null) {
				obj.accumulate("member", member.getId());
			}
			ret = memberService.selectMembers(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("json", ret);
		return "searchReferee";
	}

	/**
	 * 获取用户(专家时用)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectExperts")
	public String selectExperts(Model model, HttpSession session) {
		JSONObject ret = new JSONObject();
		JSONObject obj = new JSONObject();
		try {
			// 调用业务逻辑
			Member member = (Member) session.getAttribute("member");
			if (member != null) {
				obj.accumulate("member", member.getId());
			}
			ret = memberService.selectMembers(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("json", ret);
		return "searchExpert";
	}

	/**
	 * 获取用户(选择裁判、专家时用)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectMembersByName")
	@ResponseBody
	public JSONObject selectMembersByName(String json, HttpSession session) {
		JSONObject ret = new JSONObject();
		try {
			// 处理参数
			JSONObject obj = JSONObject.fromObject(URLDecoder.decode(json, "utf-8"));
			// 调用业务逻辑
			Member member = (Member) session.getAttribute("member");
			if (member != null) {
				obj.accumulate("member", member.getId());
			}
			ret = memberService.selectMembers(obj);
		} catch (Exception e) {
			ret.accumulate("json", e);
			e.printStackTrace();
		}
		return ret;
	}

	/**
	 * 获取用户(赠送funcoin是选择用户)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectGiveMembers")
	@ResponseBody
	public JSONObject selectGiveMembers(String json, HttpSession session) {
		JSONObject ret = new JSONObject();
		JSONObject obj = new JSONObject();
		try {
			if (json != null) {
				obj = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			}
			// 调用业务逻辑
			Member member = (Member) session.getAttribute("member");
			if (member != null) {
				obj.accumulate("member", member.getId());
			}
			ret = memberService.selectGiveMembers(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

}

package com.whhyl.controller;

import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whhyl.entity.Member;
import com.whhyl.service.WorksService;
import com.whhyl.util.SDK_WX;
import com.whhyl.util.SaveImgByUrl;
import com.whhyl.util.commentsUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 作品相关业务控制器
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/works")
public class WorksController {

	@Autowired
	private WorksService worksService;

	/**
	 * 查询作品列表
	 */
	@RequestMapping("/listWorks")
	@ResponseBody
	public JSONObject listWorks(String json) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			return worksService.listWorks(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 作品详情
	 */
	@RequestMapping("/worksDetail")
	@ResponseBody
	public JSONObject worksDetail(String json, HttpSession session) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			Member member = (Member) session.getAttribute("member");
			param.accumulate("memberId", member.getId());
			return worksService.worksDetail(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 修改作品图片描述
	 */
	@RequestMapping("/updateWorkImageRemark")
	@ResponseBody
	public JSONObject updateWorkImageRemark(String json) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			return worksService.updateWorkImageRemark(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 发布作品
	 */
	@RequestMapping("/releaseWorks")
	@ResponseBody
	public JSONObject releaseWorks(String json, HttpSession session, HttpServletRequest request) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			Member member = (Member) session.getAttribute("member");
			param.accumulate("author", member.getId().intValue());
			// 从微信服务器下载用户上传的图片
			SDK_WX sdk = new SDK_WX(request);
			JSONArray mediaIds = param.getJSONArray("imgs");
			JSONArray imgs = new JSONArray();
			for (Object mediaId : mediaIds) {
				// 拼接请求地址
				String requestUrl = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=ACCESS_TOKEN&media_id=MEDIA_ID";
				requestUrl = requestUrl.replace("ACCESS_TOKEN", sdk.getACCESS_TOKEN()).replace("MEDIA_ID",
						String.valueOf(mediaId));
				// 生成图片名, 保存图片
				String filename = commentsUtil.getRandomByDate(6) + ".jpg";
				SaveImgByUrl.download(requestUrl, filename, "D:/java/picture");
				imgs.add(filename);
			}
			param.remove("imgs");
			param.accumulate("imgs", imgs);
			return worksService.releaseWorks(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 设定赔率
	 */
	@RequestMapping("/setTheOdds")
	@ResponseBody
	public JSONObject setTheOdds(String json, HttpSession session) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			Member member = (Member) session.getAttribute("member");
			param.accumulate("memberId", member.getId());
			return worksService.setTheOdds(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 预测胜率
	 */
	@RequestMapping("/forecast")
	@ResponseBody
	public JSONObject forecast(String json, HttpSession session) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			Member member = (Member) session.getAttribute("member");
			param.accumulate("memberId", member.getId());
			return worksService.forecast(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 判胜/判负
	 */
	@RequestMapping("/judge")
	@ResponseBody
	public JSONObject judge(String json, HttpSession session) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			Member member = (Member) session.getAttribute("member");
			param.accumulate("memberId", member.getId());
			return worksService.judge(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 投票
	 */
	@RequestMapping("/vote")
	@ResponseBody
	public JSONObject vote(String json, HttpSession session) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			Member member = (Member) session.getAttribute("member");
			param.accumulate("member", member.getId());
			param.accumulate("type", "VOTE");
			return worksService.voteOrBetting(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 投注
	 */
	@RequestMapping("/betting")
	@ResponseBody
	public JSONObject betting(String json, HttpSession session) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			Member member = (Member) session.getAttribute("member");
			param.accumulate("member", member.getId());
			param.accumulate("type", "BETTING");
			return worksService.voteOrBetting(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 从我的作品中提交作品
	 */
	@RequestMapping("/releaseWorksFromMyWorks")
	@ResponseBody
	public JSONObject releaseWorksFromMyWorks(String json, HttpSession session) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			Member member = (Member) session.getAttribute("member");
			param.accumulate("memberId", member.getId());
			return worksService.releaseWorksFromMyWorks(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 查询投注获胜用户列表通过活动ID
	 */
	@RequestMapping("/listWinnerByActiveId")
	@ResponseBody
	public JSONObject listWinnerByActiveId(String json) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			return worksService.listWinnerByActiveId(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 查询作品名次列表通过活动ID(按名次正序排列)
	 */
	@RequestMapping("/listWorkRankByActiveId")
	@ResponseBody
	public JSONObject listWorkRankByActiveId(String json) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			return worksService.listWorkRankByActiveId(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 查询本活动的胜利作品数量
	 */
	@RequestMapping("/getWinnerCount")
	@ResponseBody
	public JSONObject getWinnerCount(String json) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			return worksService.getWinnerCount(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}
	
	/**
	 * 跳转获胜作品列表页面
	 */
	@RequestMapping("/getWinWorksList")
	public String getWinWorksList(HttpServletRequest request, String json, Model model) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			String activeId = param.getString("activeId");
			model.addAttribute("activeId", activeId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "workRank";
	}
}

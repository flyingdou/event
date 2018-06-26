package com.whhyl.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whhyl.dao.LoginMapper;
import com.whhyl.dao.MemberMapper;
import com.whhyl.dao.OrderMapper;
import com.whhyl.entity.Member;
import com.whhyl.entity.Order;
import com.whhyl.entity.UserInfo;
import com.whhyl.service.LoginService;
import com.whhyl.service.UserInfoService;
import com.whhyl.util.HttpRequestUtils;
import com.whhyl.util.SDK_WX;
import com.whhyl.util.SaveImgByUrl;
import com.whhyl.util.commentsUtil;

import net.sf.json.JSONObject;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginMapper loginDao;
	
	@Autowired
	private MemberMapper memberDao;
	
	@Autowired
	private UserInfoService userInfoService;
	
	@Autowired
	private OrderMapper orderMapper;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	@Override
	public Member login(JSONObject obj) {
		Member member = null;
		//正常登录
		if (obj.containsKey("mobilephone") && StringUtils.isNotEmpty(obj.getString("mobilephone"))) {
			String mobilephone = obj.getString("mobilephone");
			String password = obj.getString("password");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mobilephone", mobilephone);
			map.put("password", password);
			member = loginDao.login(map);
		}
		
		if (obj.containsKey("thirdType") && StringUtils.isNotEmpty(obj.getString("thirdType"))) {
			String thirdType = obj.getString("thirdType");
			String thirdId = obj.getString("thirdId");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("thirdType", thirdType);
			map.put("thirdId", thirdId);
			//第三方登录(非第一次登录)
			member = loginDao.checkThird(map);
			if (member == null ){
				//第三方第一次登录(即为注册)
				member = new Member();
				if ("W".equals(thirdType)){
					member.setThirdType("W");
					member.setWechatId(thirdId);
					member.setNick("wx" + commentsUtil.getRandomString());
				} else if ("Q".equals(thirdType)) {
					member.setThirdType("Q");
					member.setQqId(thirdId);
					member.setNick("qq" + commentsUtil.getRandomString());
				} else {
					member.setThirdType("S");
					member.setSinaId(thirdId);
					member.setNick("sina" + commentsUtil.getRandomString());
				}
				member.setRegisterDate(new Date());
				member.setLongitude(obj.getString("longitude"));
				member.setLatitude(obj.getString("latitude"));
				
				int i = memberDao.insert(member);
				if (i > 0){
					member = loginDao.checkThird(map);
				}
			}
			
		}
		
		return member;
	}


	@Override
	public Member simpleLogin(String id) {
		Member member = loginDao.loginById(Integer.valueOf(id));
		return member;
	}


	/**
	 * 微信公众号登录 (通过code获取用户openid)
	 */
	@Override
	public JSONObject wechatLogin(JSONObject obj, HttpServletRequest request) {
		JSONObject ret = new JSONObject();
		try {
			SDK_WX sdk = new SDK_WX();
			// 生成获取openid的链接
			StringBuilder getOpenIdUrl = new StringBuilder("https://api.weixin.qq.com/sns/oauth2/access_token");
			getOpenIdUrl.append("?appid=").append(sdk.getAPPID());
			getOpenIdUrl.append("&secret=").append(sdk.getAPPSERCRET());
			getOpenIdUrl.append("&code=").append(obj.get("code"));
			getOpenIdUrl.append("&grant_type=authorization_code");
			// 请求微信服务器
			JSONObject json = HttpRequestUtils.httpGet(getOpenIdUrl.toString());
			if (json.containsKey("openid")) {
				// 登录
			   ret = wechat4Login(json.getString("openid"), request);
			}
		} catch (Exception e) {
			ret.accumulate("success", false).accumulate("msg", e);
		}
		
		return ret;
	}

	
	
	public JSONObject wechat4Login(String openId, HttpServletRequest request) {
		Member member = new Member();
		JSONObject ret = new JSONObject();
		try {
			HttpSession session = request.getSession();

			// 获取微信用户信息
			UserInfo user = getWechatUserInfo(request, openId);
			if (user.getSubscribe() == 1 ){
				// 查询用户表，该openid是否已经存在
				Map<String, Object> checkMap = new HashMap<String, Object>();
				checkMap.put("openid", user.getOpenId());
				member = memberDao.checkByOpenId(checkMap);
				
				
				if (member == null || member.getId() == null) {
					member = new Member();
					String fileName = "funcoinLogo.png";
					// 没有记录，注册一条新数据
					if (StringUtils.isNotEmpty(user.getHeadImgUrl())) {
						String path = "D:/java/picture";
						fileName = commentsUtil.getRandomByDate(6) + ".jpg";
						SaveImgByUrl.download(user.getHeadImgUrl(), fileName, path);
					}
					
					member.setImage(fileName);
					// 非空判断
					if (StringUtils.isNotEmpty(user.getNickname())) {
						String  doux =  commentsUtil.cutStringEmoji(user.getNickname());
						member.setName(doux);
						member.setNick(doux);
					}
					
				    member.setSex(user.getSex() == 1 ? "M" : "F");
				    
				    if (StringUtils.isNotEmpty(user.getCity())) {
				    	member.setCity(user.getCity());
				    }
				    
				    if (StringUtils.isNotEmpty(user.getProvince())) {
				    	member.setProvince(user.getProvince());
				    }
				    
					member.setWechatId(user.getOpenId());
					member.setRegisterDate(new Date());
					member.setThirdType("W");
					// 持久化
					memberDao.insert(member);
					
					// 再赠送10000Funcoin
					Order order = new Order();
					order.setNo(sdf.format(new Date()).replace("-", "") + commentsUtil.getRandomString());
					order.setProductType("C");
					order.setProduct(0);
					order.setFuncoin("10000");
					order.setMember(10);
					order.setTomember(member.getId().intValue());
					order.setStatus("1");
					order.setRemark("平台赠送");
					order.setAutoTime(new Date());
					orderMapper.insert(order);
				}
				// 修改登录时间，持久化，并将用户信息返回
				member.setLoginTime(new Date());
				member.setLoginToken(commentsUtil.MD5(commentsUtil.format(new Date(), "yyyy-MM-dd HH:mm:ss")));
				memberDao.updateByPrimaryKey(member);
				member = memberDao.selectByPrimaryKey(member.getId());
				session.setAttribute("member", member);
				ret.accumulate("success", true)
				   .accumulate("msg", "ok")
				   .accumulate("openId", user.getOpenId())
				   .accumulate("status", 1)
				   ;
				
				
			} else {
				// 该用户当前没有关注本微信公众号
				session.setAttribute("openId", user.getOpenId());
				ret.accumulate("success", false)
				   .accumulate("msg", "该用户暂未关注本公众号")
				   .accumulate("subscribe", 0)
				   ;
			}

		} catch (Exception e) {
			ret.accumulate("success", false)
			   .accumulate("msg", e);
			e.printStackTrace();
		}
		return ret;

	}
	
	
	
	private UserInfo getWechatUserInfo(HttpServletRequest request, String openId) {
		UserInfo userinfo = new UserInfo();
		try {
			// 获取基础刷新的接口访问凭证
			SDK_WX sdk = new SDK_WX(request);
			userinfo = userInfoService.getUserInfo(sdk.getACCESS_TOKEN(), openId);
			if (userinfo.getSubscribe() == 1){
				userinfo.setCountry(new String(userinfo.getCountry().getBytes("ISO-8859-1"), "UTF-8"));
				userinfo.setProvince(new String(userinfo.getProvince().getBytes("ISO-8859-1"), "UTF-8"));
				userinfo.setCity(new String(userinfo.getCity().getBytes("ISO-8859-1"), "UTF-8"));
				userinfo.setNickname(new String(userinfo.getNickname().getBytes("ISO-8859-1"), "UTF-8"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userinfo;
	}
	
	
	
	
	
}

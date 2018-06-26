package com.whhyl.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.whhyl.dao.MemberMapper;
import com.whhyl.dao.ProductMapper;
import com.whhyl.entity.Member;
import com.whhyl.entity.Product;
import com.whhyl.service.OrderService;
import com.whhyl.service.ProductService;
import com.whhyl.util.JsonUtils;
import com.whhyl.util.StringUtils;

import net.sf.json.JSONObject;

@Transactional
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;

	@Autowired
	private OrderService orderService;

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public JSONObject listProduct() {
		JSONObject result = new JSONObject();
		result.accumulate("success", true).accumulate("productList",
				JsonUtils.ListBeanToJsonDateFormat(productMapper.selectAll(), "yyyy-MM-dd"));
		return result;
	}

	@Override
	public JSONObject productDetail(JSONObject param) {
		JSONObject result = new JSONObject();
		if (!param.containsKey("id") || StringUtils.isEmpty(param.getString("id"))) {
			result.accumulate("success", false).accumulate("msg", "id is not defind");
			return result;
		}
		result.accumulate("success", true).accumulate("product",
				JsonUtils.BeanToJsonDateFormat(productMapper.selectByPrimaryKey(param.getInt("id")), "yyyy-MM-dd"));
		return result;
	}

	@Override
	public JSONObject exchange(JSONObject param) {
		JSONObject result = new JSONObject();
		int resultCount = 0;
		// 空值判断
		if (!param.containsKey("product") || StringUtils.isEmpty(param.getString("product"))) {
			result.accumulate("success", false).accumulate("msg", "product is not defind");
			return result;
		}
		if (!param.containsKey("memberName") || StringUtils.isEmpty(param.getString("memberName"))) {
			result.accumulate("success", false).accumulate("msg", "memberName is not defind");
			return result;
		}
		if (!param.containsKey("mobilephone") || StringUtils.isEmpty(param.getString("mobilephone"))) {
			result.accumulate("success", false).accumulate("msg", "mobilephone is not defind");
			return result;
		}
		if (!param.containsKey("address") || StringUtils.isEmpty(param.getString("address"))) {
			result.accumulate("success", false).accumulate("msg", "address is not defind");
			return result;
		}
		// 修改用户收货人,手机号,收货地址信息
		Member member = new Member();
		member.setId(param.getLong("member"));
		member.setName(param.getString("memberName"));
		member.setMobilephone(param.getString("mobilephone"));
		member.setAddress(param.getString("address"));
		resultCount = memberMapper.updateByPrimaryKey(member);
		if (resultCount < 1) {
			result.accumulate("success", false);
			return result;
		}
		Product product = productMapper.selectByPrimaryKey(param.getInt("product"));
		// 检查商品数量是否足够
		if (product.getCount() <= 0) {
			result.accumulate("success", false).accumulate("msg", "抱歉!商品数量不足");
			return result;
		}
		// 修改商品数量-1
		product.setCount(product.getCount() - 1);
		resultCount = productMapper.updateByPrimaryKey(product);
		if (resultCount < 1) {
			result.accumulate("success", false);
		}

		// 生成兑换订单
		param.accumulate("orderType", "1").accumulate("productType", "B").accumulate("funcoin", product.getFuncoin())
				.accumulate("toMember", 10).accumulate("remark", "");
		JSONObject resultMsg = orderService.create(param);
		if (resultMsg.getBoolean("success") == false) {
			return resultMsg;
		}
		result.accumulate("success", true);
		return result;
	}

	@Override
	public JSONObject give(JSONObject param) {
		JSONObject result = new JSONObject();
		if (!param.containsKey("funcoin") || StringUtils.isEmpty(param.getString("funcoin"))) {
			result.accumulate("success", false).accumulate("msg", "funcoin is not defind");
			return result;
		}
		if (!param.containsKey("toMember") || StringUtils.isEmpty(param.getString("toMember"))) {
			result.accumulate("success", false).accumulate("msg", "toMember is not defind");
			return result;
		}
		// 生成赠送订单
		param.accumulate("orderType", "1").accumulate("productType", "C").accumulate("product", "0");
		result = orderService.create(param);
		return result;
	}
}

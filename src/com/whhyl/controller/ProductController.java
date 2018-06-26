package com.whhyl.controller;

import java.net.URLDecoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whhyl.entity.Member;
import com.whhyl.service.ProductService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;

	/**
	 * 商品列表
	 */
	@RequestMapping("/listProduct")
	@ResponseBody
	public JSONObject listProduct() {
		try {
			return productService.listProduct();
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 商品详情
	 */
	@RequestMapping("/productDetail")
	@ResponseBody
	public JSONObject productDetail(String json) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			return productService.productDetail(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 兑换
	 */
	@RequestMapping("/exchange")
	@ResponseBody
	public JSONObject exchange(String json, HttpSession session) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			Member member = (Member) session.getAttribute("member");
			param.accumulate("member", member.getId());
			return productService.exchange(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}

	/**
	 * 赠送
	 */
	@RequestMapping("/give")
	@ResponseBody
	public JSONObject give(String json, HttpSession session) {
		try {
			JSONObject param = JSONObject.fromObject(URLDecoder.decode(json, "UTF-8"));
			Member member = (Member) session.getAttribute("member");
			param.accumulate("member", member.getId());
			return productService.give(param);
		} catch (Exception e) {
			e.printStackTrace();
			return JSONObject.fromObject(e);
		}
	}
}

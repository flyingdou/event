package com.whhyl.service;

import net.sf.json.JSONObject;

public interface ProductService {

	/**
	 * 商品列表
	 */
	JSONObject listProduct();

	/**
	 * 商品详情
	 */
	JSONObject productDetail(JSONObject param);

	/**
	 * 兑换
	 */
	JSONObject exchange(JSONObject param);

	/**
	 * 赠送
	 */
	JSONObject give(JSONObject param);
}

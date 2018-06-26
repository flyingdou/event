package com.whhyl.entity;

import java.util.Date;

/**
 * 评论
 * 
 * @author Administrator
 *
 */
public class Evaluate {
	/**
	 * 主键
	 */
	private Integer id;

	/**
	 * 活动ID
	 */
	private Integer activeId;

	/**
	 * 评论者
	 */
	private Integer member;

	/**
	 * 内容
	 */
	private String content;

	/**
	 * 图片1
	 */
	private String image1;

	/**
	 * 图片2
	 */
	private String image2;

	/**
	 * 图片3
	 */
	private String image3;

	/**
	 * 评论时间
	 */
	private Date autoTime;

	/**
	 * 评论者角色:0.观众,1.专家
	 */
	private int role;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getActiveId() {
		return activeId;
	}

	public void setActiveId(Integer activeId) {
		this.activeId = activeId;
	}

	public Integer getMember() {
		return member;
	}

	public void setMember(Integer member) {
		this.member = member;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1 == null ? null : image1.trim();
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2 == null ? null : image2.trim();
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3 == null ? null : image3.trim();
	}

	public Date getAutoTime() {
		return autoTime;
	}

	public void setAutoTime(Date autoTime) {
		this.autoTime = autoTime;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
}
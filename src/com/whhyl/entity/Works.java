package com.whhyl.entity;

import java.util.Date;

/**
 * 作品
 * 
 * @author Administrator
 *
 */
public class Works {
	/**
	 * 主键
	 */
	private Integer id;

	/**
	 * 作品名称
	 */
	private String name;

	/**
	 * 作者
	 */
	private Integer author;

	/**
	 * 参赛日期
	 */
	private Date partakeDate;

	/**
	 * 作品视频
	 */
	private String video;

	/**
	 * 作品描述
	 */
	private String remark;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAuthor() {
		return author;
	}

	public void setAuthor(Integer author) {
		this.author = author;
	}

	public Date getPartakeDate() {
		return partakeDate;
	}

	public void setPartakeDate(Date partakeDate) {
		this.partakeDate = partakeDate;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
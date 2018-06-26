package com.whhyl.entity;

import java.util.Date;

/**
 * 会员
 * 
 * @author Administrator
 *
 */
public class Member {
	/**
	 * 主键
	 */
	private Long id;

	/**
	 * 昵称
	 */
	private String nick;

	/**
	 * 性别:M.男 /F.女
	 */
	private String sex;

	/**
	 * 出生日期
	 */
	private Date birthday;

	/**
	 * 头像
	 */
	private String image;

	/**
	 * 手机号
	 */
	private String mobilephone;

	/**
	 * 密码
	 */
	private String password;

	/**
	 * 用户所在位置经度
	 */
	private String longitude;

	/**
	 * 用户所在位置纬度
	 */
	private String latitude;

	/**
	 * 省份
	 */
	private String province;

	/**
	 * 城市
	 */
	private String city;

	/**
	 * 区县
	 */
	private String county;

	/**
	 * 注册时间
	 */
	private Date registerDate;

	/**
	 * 登录时间
	 */
	private Date loginTime;

	/**
	 * 第三方登录类型
	 */
	private String thirdType;

	/**
	 * 微信登录时记录的标识符
	 */
	private String wechatId;

	/**
	 * QQ登录时记录的标识符
	 */
	private String qqId;

	/**
	 * 新浪登录时记录的标识符
	 */
	private String sinaId;

	/**
	 * 登录唯一标识符
	 */
	private String loginToken;

	/**
	 * 收货人姓名
	 */
	private String name;

	/**
	 * 收货地址，具体地址以及联系方式
	 */
	private String address;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick == null ? null : nick.trim();
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex == null ? null : sex.trim();
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image == null ? null : image.trim();
	}

	public String getMobilephone() {
		return mobilephone;
	}

	public void setMobilephone(String mobilephone) {
		this.mobilephone = mobilephone == null ? null : mobilephone.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province == null ? null : province.trim();
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city == null ? null : city.trim();
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county == null ? null : county.trim();
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public String getThirdType() {
		return thirdType;
	}

	public void setThirdType(String thirdType) {
		this.thirdType = thirdType == null ? null : thirdType.trim();
	}

	public String getWechatId() {
		return wechatId;
	}

	public void setWechatId(String wechatId) {
		this.wechatId = wechatId == null ? null : wechatId.trim();
	}

	public String getQqId() {
		return qqId;
	}

	public void setQqId(String qqId) {
		this.qqId = qqId == null ? null : qqId.trim();
	}

	public String getSinaId() {
		return sinaId;
	}

	public void setSinaId(String sinaId) {
		this.sinaId = sinaId == null ? null : sinaId.trim();
	}

	public String getLoginToken() {
		return loginToken;
	}

	public void setLoginToken(String loginToken) {
		this.loginToken = loginToken == null ? null : loginToken.trim();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address == null ? null : address.trim();
	}
}
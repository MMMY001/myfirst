package com.my.pojo;

//import org.hibernate.validator.constraints.NotBlank;

public class User {
	
	private int user_id; // 用户ID 自动生成
//	@NotBlank(message = "用户名不能为空")
	private String user_name; // 用户名
	private String user_password; // 用户密码
	private String real_name; // 真实姓名
	private String user_tel; // 电话号码
	private String user_email; // 邮箱
	private int state; // 权限
	private String user_sex; // 性别
	private float user_cash; // 账户余额
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	public float getUser_cash() {
		return user_cash;
	}

	public void setUser_cash(float user_cash) {
		this.user_cash = user_cash;
	}
}

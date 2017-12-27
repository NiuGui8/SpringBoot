package com.L.niangzi.pojo;

import java.util.Comparator;
import java.util.Date;
import java.util.List;

/**
 * @Description: 用户实体类
 * @version 1.0.0
 * @author John
 * @date 2014年10月25日
 */
public class User{	
	private int id; //用户ID	
	private String uuid; //用户唯一标识
	private String username; //用户名
	private String password; //密码
	private String displayName; //用户显示名
	private String phone; //联系电话
	private String address; //地址
	private String description; //描述
	
	public User(){
	}
	
	public User(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}

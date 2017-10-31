package com.eat.domain;

import java.io.Serializable;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String username;
	private String password;
	private String relname;
	private String sex;
	private String tell;
	private String email;
	private String category;
	private String address;
	private String time;
	private String ip;
	
	
	
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public User() {
		super();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRelname() {
		return relname;
	}
	public void setRelname(String relname) {
		this.relname = relname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	
	public User(String username, String password, String relname, String sex,
			String tell, String email, String address) {
		super();
		this.username = username;
		this.password = password;
		this.relname = relname;
		this.sex = sex;
		this.tell = tell;
		this.email = email;
		this.address = address;
	}
	public User(String id, String username, String password, String relname,
			String sex, String tell, String email, String address) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.relname = relname;
		this.sex = sex;
		this.tell = tell;
		this.email = email;
		this.address = address;
	}

	public User(String id, String username, String password, String address) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.address = address;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", relname=" + relname + ", sex=" + sex
				+ ", tell=" + tell + ", email=" + email + ", category="
				+ category + ", address=" + address + ", time=" + time
				+ ", ip=" + ip + "]";
	}
	
	
}

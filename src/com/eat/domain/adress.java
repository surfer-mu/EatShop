package com.eat.domain;

public class adress {
	private String id;
	private String time;
	private String ip;
	
	public adress(String id, String time, String ip) {
		super();
		this.id = id;
		this.time = time;
		this.ip = ip;
	}
	
	public adress() {
		super();
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "��½ʱ�䣺" + time + ", ��¼ip��" + ip + "\n";
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
}

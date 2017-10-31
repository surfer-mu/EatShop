package com.eat.domain;

import java.util.List;

public class EatPage {
	private int current;
	private int maxpage;
	private int singlepage;
	private int count;
	private List<Eat> eatlist;
	
	
	public List<Eat> getEatlist() {
		return eatlist;
	}
	public void setEatlist(List<Eat> eatlist) {
		this.eatlist = eatlist;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCurrent() {
		return current;
	}
	public void setCurrent(int current) {
		this.current = current;
	}
	public int getMaxpage() {
		return maxpage;
	}
	public void setMaxpage(int maxpage) {
		this.maxpage = maxpage;
	}
	public int getSinglepage() {
		return singlepage;
	}
	public void setSinglepage(int singlepage) {
		this.singlepage = singlepage;
	}
	
}

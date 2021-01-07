package com.kh.ddoda.calendar.domain;

public class MemberInfo {
	private int userInfoNo;
	private String userId;
	private String gender;
	private int age;
	private int height;
	private int weight;
	private int period;
	private int goal;
	
	public MemberInfo() {}
	
	public MemberInfo(int userInfoNo, String userId, String gender, int age, int height, int weight, int period,
			int goal) {
		super();
		this.userInfoNo = userInfoNo;
		this.userId = userId;
		this.gender = gender;
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.period = period;
		this.goal = goal;
	}
	public int getUserInfoNo() {
		return userInfoNo;
	}
	public void setUserInfoNo(int userInfoNo) {
		this.userInfoNo = userInfoNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public int getGoal() {
		return goal;
	}
	public void setGoal(int goal) {
		this.goal = goal;
	}
	@Override
	public String toString() {
		return "MemberInfo [userInfoNo=" + userInfoNo + ", userId=" + userId + ", gender=" + gender + ", age=" + age
				+ ", height=" + height + ", weight=" + weight + ", period=" + period + ", goal=" + goal + "]";
	}
	
	
	
}

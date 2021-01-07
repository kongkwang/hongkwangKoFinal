package com.kh.ddoda.calendar.domain;

import java.sql.Date;

public class FoodCheckList {
	
	private int checkNo;
	private String userId;
	private Date addDate;
	private String meal;
	private int calorieNo;
	private String userCategory;
	
	public FoodCheckList() {}
	
	public int getCheckNo() {
		return checkNo;
	}
	public void setCheckNo(int checkNo) {
		this.checkNo = checkNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public String getMeal() {
		return meal;
	}
	public void setMeal(String meal) {
		this.meal = meal;
	}
	public int getCalorieNo() {
		return calorieNo;
	}
	public void setCalorieNo(int calorieNo) {
		this.calorieNo = calorieNo;
	}
	public String getUserCategory() {
		return userCategory;
	}
	public void setUserCategory(String userCategory) {
		this.userCategory = userCategory;
	}
	@Override
	public String toString() {
		return "FoodCheckList [checkNo=" + checkNo + ", userId=" + userId + ", addDate=" + addDate + ", meal=" + meal
				+ ", calorieNo=" + calorieNo + ", userCategory=" + userCategory + "]";
	}
	
	
}

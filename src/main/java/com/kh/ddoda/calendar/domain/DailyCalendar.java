package com.kh.ddoda.calendar.domain;

import java.sql.Date;

public class DailyCalendar {
	private Date start;
	private int kcalSum;
	private int consumption;
	private int dailyWeight;
	private int calorieResult;
	private String userId;
	
	public DailyCalendar() {}
	
	

	public DailyCalendar(Date start, int kcalSum, int consumption, int dailyWeight, int calorieResult, String userId) {
		super();
		this.start = start;
		this.kcalSum = kcalSum;
		this.consumption = consumption;
		this.dailyWeight = dailyWeight;
		this.calorieResult = calorieResult;
		this.userId = userId;
	}



	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public int getKcalSum() {
		return kcalSum;
	}

	public void setKcalSum(int kcalSum) {
		this.kcalSum = kcalSum;
	}

	public int getConsumption() {
		return consumption;
	}

	public void setConsumption(int consumption) {
		this.consumption = consumption;
	}

	public int getDailyWeight() {
		return dailyWeight;
	}

	public void setDailyWeight(int dailyWeight) {
		this.dailyWeight = dailyWeight;
	}

	public int getCalorieResult() {
		return calorieResult;
	}

	public void setCalorieResult(int calorieResult) {
		this.calorieResult = calorieResult;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "DailyCalendar [start=" + start + ", kcalSum=" + kcalSum + ", consumption=" + consumption
				+ ", dailyWeight=" + dailyWeight + ", calorieResult=" + calorieResult + ", userId=" + userId + "]";
	}

	
	
}

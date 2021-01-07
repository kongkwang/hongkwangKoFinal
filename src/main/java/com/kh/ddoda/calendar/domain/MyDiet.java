package com.kh.ddoda.calendar.domain;

import java.sql.Date;

public class MyDiet {
	private String userId;
	private int consumption;
	private Date date;
	private int water;
	private double dailyWeight;
	
	private String meal;
	private String foodName;
	private int kCal;
	private int carbohydrate;
	private int protein;
	private int fat;
	private int saccharide;
	private int natrium;
	
	public MyDiet() {}

	public MyDiet(String userId, int consumption, Date date, int water, double dailyWeight, String meal,
			String foodName, int kCal, int carbohydrate, int protein, int fat, int saccharide, int natrium) {
		super();
		this.userId = userId;
		this.consumption = consumption;
		this.date = date;
		this.water = water;
		this.dailyWeight = dailyWeight;
		this.meal = meal;
		this.foodName = foodName;
		this.kCal = kCal;
		this.carbohydrate = carbohydrate;
		this.protein = protein;
		this.fat = fat;
		this.saccharide = saccharide;
		this.natrium = natrium;
	}



	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getConsumption() {
		return consumption;
	}

	public void setConsumption(int consumption) {
		this.consumption = consumption;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getWater() {
		return water;
	}

	public void setWater(int water) {
		this.water = water;
	}

	public double getDailyWeight() {
		return dailyWeight;
	}

	public void setDailyWeight(double dailyWeight) {
		this.dailyWeight = dailyWeight;
	}

	public String getMeal() {
		return meal;
	}

	public void setMeal(String meal) {
		this.meal = meal;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public int getkCal() {
		return kCal;
	}

	public void setkCal(int kCal) {
		this.kCal = kCal;
	}

	public int getCarbohydrate() {
		return carbohydrate;
	}

	public void setCarbohydrate(int carbohydrate) {
		this.carbohydrate = carbohydrate;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public int getFat() {
		return fat;
	}

	public void setFat(int fat) {
		this.fat = fat;
	}

	public int getSaccharide() {
		return saccharide;
	}

	public void setSaccharide(int saccharide) {
		this.saccharide = saccharide;
	}

	public int getNatrium() {
		return natrium;
	}

	public void setNatrium(int natrium) {
		this.natrium = natrium;
	}

	@Override
	public String toString() {
		return "MyDiet [userId=" + userId + ", consumption=" + consumption + ", date=" + date + ", water=" + water
				+ ", dailyWeight=" + dailyWeight + ", meal=" + meal + ", foodName=" + foodName + ", kCal=" + kCal
				+ ", carbohydrate=" + carbohydrate + ", protein=" + protein + ", fat=" + fat + ", saccharide="
				+ saccharide + ", natrium=" + natrium + "]";
	}

	
	
	
}

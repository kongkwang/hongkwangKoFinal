package com.kh.ddoda.calendar.domain;

import java.sql.Date;

public class FoodSelectedList {
	
	private int calorieNo;
	private String foodName;
	private int kcal;
	private double protein;
	private double carbo;
	private double fat;
	private double natrium;
	private double saccharide;
	private String userId;
	private String unit;
	private String foodAmount;
	private String userCategory;
	
	public FoodSelectedList() {}

	
	
	public FoodSelectedList(int calorieNo, String foodName, int kcal, double protein, double carbo, double fat,
			double natrium, double saccharide, String userId, String unit, String foodAmount, String userCategory) {
		super();
		this.calorieNo = calorieNo;
		this.foodName = foodName;
		this.kcal = kcal;
		this.protein = protein;
		this.carbo = carbo;
		this.fat = fat;
		this.natrium = natrium;
		this.saccharide = saccharide;
		this.userId = userId;
		this.unit = unit;
		this.foodAmount = foodAmount;
		this.userCategory = userCategory;
	}



	public int getCalorieNo() {
		return calorieNo;
	}

	public void setCalorieNo(int calorieNo) {
		this.calorieNo = calorieNo;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public double getProtein() {
		return protein;
	}

	public void setProtein(double protein) {
		this.protein = protein;
	}

	public double getCarbo() {
		return carbo;
	}

	public void setCarbo(double carbo) {
		this.carbo = carbo;
	}

	public double getFat() {
		return fat;
	}

	public void setFat(double fat) {
		this.fat = fat;
	}

	public double getNatrium() {
		return natrium;
	}

	public void setNatrium(double natrium) {
		this.natrium = natrium;
	}

	public double getSaccharide() {
		return saccharide;
	}

	public void setSaccharide(double saccharide) {
		this.saccharide = saccharide;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getFoodAmount() {
		return foodAmount;
	}

	public void setFoodAmount(String foodAmount) {
		this.foodAmount = foodAmount;
	}

	public String getUserCategory() {
		return userCategory;
	}

	public void setUserCategory(String userCategory) {
		this.userCategory = userCategory;
	}

	@Override
	public String toString() {
		return "FoodSelectedList [calorieNo=" + calorieNo + ", foodName=" + foodName + ", kcal=" + kcal + ", protein="
				+ protein + ", carbo=" + carbo + ", fat=" + fat + ", natrium=" + natrium + ", saccharide=" + saccharide
				+ ", userId=" + userId + ", unit=" + unit + ", foodAmount=" + foodAmount + ", userCategory="
				+ userCategory + "]";
	}

	
}

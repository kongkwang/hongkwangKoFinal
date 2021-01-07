package com.kh.ddoda.calendar.domain;

public class SumCalorie {
	private int mealNo;
	private String meal;
	private int kcalSum;
	private int protein;
	private int carbo;
	private int fat;
	private int natrium;
	private int saccharide;

	
	public SumCalorie() {}
	
	

	public SumCalorie(int mealNo, String meal, int kcal, int protein, int carbo, int fat, int natrium, int saccharide) {
		super();
		this.mealNo = mealNo;
		this.meal = meal;
		this.kcalSum = kcal;
		this.protein = protein;
		this.carbo = carbo;
		this.fat = fat;
		this.natrium = natrium;
		this.saccharide = saccharide;
	}



	public int getMealNo() {
		return mealNo;
	}

	public void setMealNo(int mealNo) {
		this.mealNo = mealNo;
	}

	public String getMeal() {
		return meal;
	}

	public void setMeal(String meal) {
		this.meal = meal;
	}

	public int getKcalSum() {
		return kcalSum;
	}

	public void setKcalSum(int kcal) {
		this.kcalSum = kcal;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public int getCarbo() {
		return carbo;
	}

	public void setCarbo(int carbo) {
		this.carbo = carbo;
	}

	public int getFat() {
		return fat;
	}

	public void setFat(int fat) {
		this.fat = fat;
	}

	public int getNatrium() {
		return natrium;
	}

	public void setNatrium(int natrium) {
		this.natrium = natrium;
	}

	public int getSaccharide() {
		return saccharide;
	}

	public void setSaccharide(int saccharide) {
		this.saccharide = saccharide;
	}

	@Override
	public String toString() {
		return "SumCalorie [mealNo=" + mealNo + ", meal=" + meal + ", kcalSum=" + kcalSum + ", protein=" + protein
				+ ", carbo=" + carbo + ", fat=" + fat + ", natrium=" + natrium + ", saccharide=" + saccharide + "]";
	}

	
	
	
	
}

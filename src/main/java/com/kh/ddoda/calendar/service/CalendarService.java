package com.kh.ddoda.calendar.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.ddoda.calendar.domain.Calorie;
import com.kh.ddoda.calendar.domain.DailyCalendar;
import com.kh.ddoda.calendar.domain.FoodCheckList;
import com.kh.ddoda.calendar.domain.FoodSelectedList;
import com.kh.ddoda.calendar.domain.MyDiet;
import com.kh.ddoda.calendar.domain.SumCalorie;
import com.kh.ddoda.calendar.domain.MemberInfo;
import com.kh.ddoda.calendar.domain.MyCalorie;



public interface CalendarService {
	
	
	
	public int registerFoods(Calorie calorie);
	public int registerFoods(MyCalorie myCalorie);
	public int registerMemberInfo(MemberInfo memberInfo);
	public int registerMyDiet(MyDiet myDiet);
	public int registerFoodCheckList(FoodCheckList foodCheckList);
	
	public int registerMyDiet(Calorie calorie);
	
	public Calorie selectFood(int calorieNo);
	public MyDiet selectDietInfo(MyDiet myDiet);
	public MemberInfo selectMemberInfo(String userId);
	public int modifyMemberInfo(MemberInfo memberInfo);
	
	public int deleteMyDiet(MyDiet myDiet);
	
	public int emptyFoodCheckList(FoodCheckList foodCheckList);
	
	public ArrayList<FoodCheckList> selectCheckFoodList(FoodCheckList foodCheckList);
	
	
	public ArrayList<FoodSelectedList> selectCalorie(FoodCheckList foodCheckList);
	public ArrayList<FoodSelectedList> selectMyCalorie(FoodCheckList foodCheckList);
	
	public ArrayList<SumCalorie> selectListSum(String userId, Date dateStr);
	public ArrayList<DailyCalendar> calenderDaily(HashMap<String, Object> tempMap);
	
	
}

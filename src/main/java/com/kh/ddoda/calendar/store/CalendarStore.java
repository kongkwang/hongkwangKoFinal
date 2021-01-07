package com.kh.ddoda.calendar.store;

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


public interface CalendarStore {
	
	public int insertFoods(Calorie calorie);
	public int insertFoods(MyCalorie myCalorie);
	public int insertMemberInfo(MemberInfo memberInfo);
	public int insertMyDiet(MyDiet myDiet);
	public int insertFoodCheckList(FoodCheckList foodCheckList);
	
	public int insertMyDiet(Calorie calorie);
	
	public Calorie selectFood(int calorieNo);
	public MyDiet selectDietInfo(MyDiet myDiet);
	public MemberInfo selectMemberInfo(String userId);
	public int updateMemberInfo(MemberInfo memberInfo);

	public int deleteMyDiet(MyDiet myDiet);
	public int emptyFoodCheckList(FoodCheckList foodCheckList);
	
	public ArrayList<FoodSelectedList> selectCalorie(FoodCheckList foodCheckList);
	public ArrayList<FoodSelectedList> selectMyCalorie(FoodCheckList foodCheckList);
	
	public ArrayList<FoodCheckList> selectCheckFoodList(FoodCheckList foodCheckList);
	public ArrayList<SumCalorie> selectListSum(String userId, Date dateStr);
	public ArrayList<DailyCalendar> calenderDaily(HashMap<String, Object> tempMap);
}

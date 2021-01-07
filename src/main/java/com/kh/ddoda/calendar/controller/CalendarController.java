package com.kh.ddoda.calendar.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ddoda.calendar.domain.Calorie;
import com.kh.ddoda.calendar.domain.DailyCalendar;
import com.kh.ddoda.calendar.domain.DailyCalendarData;
import com.kh.ddoda.calendar.domain.FoodCheckList;
import com.kh.ddoda.calendar.domain.FoodSelectedList;
import com.kh.ddoda.calendar.domain.MemberInfo;
import com.kh.ddoda.calendar.domain.MyCalorie;
import com.kh.ddoda.calendar.domain.MyDiet;
import com.kh.ddoda.calendar.domain.ResultObject;
import com.kh.ddoda.calendar.domain.SumCalorie;
import com.kh.ddoda.calendar.service.CalendarService;
import com.kh.ddoda.changePhoto.domain.ChangePhoto;
import com.kh.ddoda.changePhoto.service.ChangePhotoService;
import com.kh.ddoda.diary.domain.Diary;
import com.kh.ddoda.diary.service.DiaryService;
import com.kh.ddoda.member.domain.Member;



@Controller
public class CalendarController {
	@Autowired
	private CalendarService cService;
	@Autowired
	private ChangePhotoService cpService;
	@Autowired
	private DiaryService dService;

	// 기본정보 등록  작성 폼
	@RequestMapping(value="memberInfoWrite.doa", method=RequestMethod.GET)
	public String memberInfoWrite(ModelAndView mv, HttpSession session) {

		//		Member loginUser = (Member)session.getAttribute("loginUser");

		return "calendar/memberInfoWriteForm";

	}
	// 기본정보 등록 페이지 보기
	@RequestMapping(value="memberInfoView.doa", method=RequestMethod.GET)
	public ModelAndView memberInfoView( ModelAndView mv, HttpSession session) {
		Member member = (Member)session.getAttribute("loginUser");
		if(member !=null) {
		String userId = member.getUserId();
		MemberInfo memberInfo = cService.selectMemberInfo(userId);
		
		if(memberInfo !=null) {
			
			mv.addObject("memberInfo", memberInfo).setViewName("calendar/memberInfo");
		}else if(memberInfo ==null){
			mv.setViewName("redirect:memberInfoWrite.doa");
		}else {
			mv.addObject("msg", "변화사진 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
		}else {
			mv.setViewName("redirect:loginPage.doa");
		}
		return mv;

	}
	// 기본정보 입력 컨트롤러 전송
	@RequestMapping(value="memberInfoInsert.doa", method=RequestMethod.POST)
	public String memberInfoInsert(MemberInfo memberInfo, Model model, HttpServletRequest request) {
		
		
		Member member = (Member)request.getSession().getAttribute("loginUser");
		String userId = member.getUserId();
		MemberInfo memberSelect = cService.selectMemberInfo(userId);
		
		
		if(memberSelect==null) {
			int result= cService.registerMemberInfo(memberInfo);
			if(result>0) {
				return "redirect:memberInfoView.doa";
			}else {
				model.addAttribute("msg", "정보수정 실패!");
				return "common/errorPage";
			}
		}else {
			int result= cService.modifyMemberInfo(memberInfo);
			if(result>0) {
				return "redirect:memberInfoView.doa";
			}else {
				model.addAttribute("msg", "정보수정 실패!");
				return "common/errorPage";
			}
		}
	}

	// 기본정보 수정 하기 페이지 이동
	@RequestMapping(value="memberInfoUpdateView.doa", method=RequestMethod.GET)
	public ModelAndView memberInfoUpdateView(ModelAndView mv, HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		String userId = member.getUserId();
		MemberInfo memberInfo = cService.selectMemberInfo(userId);
		if(memberInfo !=null) {
			mv.addObject("memberInfo", memberInfo).setViewName("calendar/memberInfoUpdate");
		}else {
			mv.addObject("msg", "변화사진 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 기본정보 수정하기 전송
	@RequestMapping(value="memberInfoUpdate.doa", method=RequestMethod.POST)
	public ModelAndView memberInfoUpdate(ModelAndView mv, HttpServletRequest request, MemberInfo memberInfo) {
		System.out.println(memberInfo.toString());
		int result = cService.modifyMemberInfo(memberInfo);
		System.out.println(result);
		if(result>0) {
			mv.setViewName("redirect:memberInfoView.doa");
		}
		else {
			mv.addObject("msg", "변화사진 수정 실패!").setViewName("common/errorPage");
		}
		return mv;
	}



	// 캘린더 보여주기
	@RequestMapping(value="calendarView.doa", method=RequestMethod.GET)
	public ModelAndView calendarView(ModelAndView mv,HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		
		if(member==null) {
			mv.addObject("msg", "로그인 후 사용 해주세요.");
			mv.addObject("url","home.doa");
			mv.setViewName("calendar/calendarView");
		}else {
		System.out.println(member);
		String userId=member.getUserId();
		Date now = new Date(new java.util.Date().getTime());
		
		String date = String.valueOf(now);
		date = date.substring(2,7);
		date = date.replace("-", "/");
				
		System.out.println("오늘 날짜는 ==>" + date);
		
		HashMap<String,Object> tempMap = new HashMap<>();
		tempMap.put("userId", userId);
		tempMap.put("date", date);
		
		System.out.println(tempMap);
		
		ArrayList<DailyCalendar> dailyCalendar =cService.calenderDaily(tempMap);
		
		/*
		 * MyDiet myDiet = new MyDiet(); myDiet.setUserId(userId); myDiet.setDate(now);
		 * MyDiet diet=cService.selectDietInfo(myDiet);
		 */
		
		MemberInfo memberInfo = cService.selectMemberInfo(userId);
		
		System.out.println(memberInfo);
		double basalMetabolism = 0;
		if(memberInfo.getGender().equals("M")) {
			basalMetabolism = 66.47+((double)memberInfo.getWeight()*13.75)+(5*memberInfo.getHeight())-(6.76*memberInfo.getAge());
		}else if(memberInfo.getGender().equals("W")) {
			basalMetabolism = 655.1+((double)memberInfo.getWeight()*9.56)+(1.85*memberInfo.getHeight())-(4.68*memberInfo.getAge());
		}
		
		for(DailyCalendar dc : dailyCalendar) {
			double calorieResult = dc.getKcalSum()-(basalMetabolism+dc.getConsumption());
			dc.setCalorieResult((int)calorieResult);
		}
		
		System.out.println("dailyCalendar==>" + dailyCalendar);
		
		System.out.println("===============================================================");
		ArrayList<DailyCalendarData> dailyCalendarDataList = new ArrayList<DailyCalendarData>();
		for(DailyCalendar temp : dailyCalendar) {
			if(temp.getDailyWeight() != 0) {
				dailyCalendarDataList.add(new DailyCalendarData(
						String.valueOf(temp.getDailyWeight())+"　Kg　", String.valueOf(temp.getStart()),"#FBEBDD", "#EA7D3A","/resources/images/weighing_icon.png"));
			}
			if(temp.getKcalSum() != 0) {
				dailyCalendarDataList.add(new DailyCalendarData(
						String.valueOf(temp.getKcalSum())+"　Kcal　", String.valueOf(temp.getStart()), "#FBEBDD", "#EA7D3A","/resources/images/meal_icon.png"));
			}
			if(temp.getConsumption() != 0) {
				dailyCalendarDataList.add(new DailyCalendarData(
						String.valueOf(temp.getConsumption()+"　Kcal　"), String.valueOf(temp.getStart()),"#FBEBDD","#EA7D3A","/resources/images/workout_icon.png"));
			}
			if(temp.getCalorieResult() != 0 && temp.getConsumption() != 0 ) {
				dailyCalendarDataList.add(new DailyCalendarData(
						String.valueOf(temp.getCalorieResult()+"　Kcal　"), String.valueOf(temp.getStart()), "#FBEBDD","#EA7D3A","/resources/images/calorieResult_icon.png"));
			}else if(temp.getCalorieResult() != 0 &&temp.getKcalSum() != 0) {
				dailyCalendarDataList.add(new DailyCalendarData(
						String.valueOf(temp.getCalorieResult()+"　Kcal　"), String.valueOf(temp.getStart()), "#FBEBDD","#EA7D3A","/resources/images/calorieResult_icon.png"));
				
			}
		}
		
		System.out.println("dailyCalendarDataList==>"+dailyCalendarDataList);
		
		
		mv.addObject("dailyCalendar",dailyCalendar)
		.addObject("dailyCalendarDataList",dailyCalendarDataList)
		.addObject("today", now)
		.setViewName("calendar/calendarView");
		}

		return mv;
	}
	
	// 캘린더 선택 하면 다이어트 정보 작성 페이지 이동
	@RequestMapping(value="dailyDietInfoWrite.doa", method=RequestMethod.GET)
	public ModelAndView calendarWrite(ModelAndView mv,@RequestParam("dateStr") Date dateStr,HttpServletRequest request) {

		System.out.println("dateStr==>"+dateStr);
		Member member = (Member)request.getSession().getAttribute("loginUser");
		String userId = member.getUserId();

		ChangePhoto changePhoto = new ChangePhoto();
		changePhoto.setMyChangeDate(dateStr);
		changePhoto.setUserId(userId);

		Diary diary = new Diary();
		diary.setDiaryDate(dateStr);
		diary.setUserId(userId);

		Diary diaryPick = dService.selectDiary(diary);
		ChangePhoto changePhotoPick = cpService.selectChangePhotoByDate(changePhoto);

		ArrayList<SumCalorie> sumCalorieList = cService.selectListSum(userId,dateStr);
		System.out.println(sumCalorieList.toString());
		
		int totalIntake = 0;
		for(SumCalorie sum : sumCalorieList) {
			totalIntake += sum.getKcalSum();
		}

		MyDiet myDiet = new MyDiet(); 
		myDiet.setUserId(userId);
		myDiet.setDate(dateStr);
		MyDiet diet=cService.selectDietInfo(myDiet);
		// 작성폼에서 그대로 저장 누르면 물 양 저장,  운동량은 리스트 불러와서 또 넣어줘야함.
		
		MemberInfo memberInfo = cService.selectMemberInfo(userId);
		
		if(diet == null){
			double standardWeight = ((double)memberInfo.getHeight()-100)*0.9;
			double dailyCalorie = standardWeight*25;
			double basalMetabolism = 0;
			if(memberInfo.getGender().equals("M")) {
				basalMetabolism = 66.47+((double)memberInfo.getWeight()*13.75)+(5*memberInfo.getHeight())-(6.76*memberInfo.getAge());
			}else if(memberInfo.getGender().equals("W")) {
				basalMetabolism = 655.1+((double)diet.getDailyWeight()*9.56)+(1.85*memberInfo.getHeight())-(4.68*memberInfo.getAge());
			}
			
			double BMI = ((double)memberInfo.getWeight()/(memberInfo.getHeight()*memberInfo.getHeight()/10000));
			
			mv.addObject("dateStr", dateStr)
			.addObject("changePhoto", changePhotoPick)
			.addObject("diary", diaryPick)
			.addObject("sumCalorieList",sumCalorieList)
			.addObject("myDiet",diet)
			.addObject("standardWeight",standardWeight)
			.addObject("dailyCalorie",dailyCalorie)
			.addObject("basalMetabolism",basalMetabolism)
			.addObject("totalIntake",totalIntake)
			.addObject("memberInfo",memberInfo)
			.addObject("BMI",BMI)
			.setViewName("calendar/dailyDietInfo");
			
		}else {
			double standardWeight = ((double)memberInfo.getHeight()-100)*0.9;
			double dailyCalorie = standardWeight*25;
			double basalMetabolism = 0;
			if(memberInfo.getGender().equals("M")) {
				basalMetabolism = 66.47+((double)diet.getDailyWeight()*13.75)+(5*memberInfo.getHeight())-(6.76*memberInfo.getAge());
			}else if(memberInfo.getGender().equals("W")) {
				basalMetabolism = 655.1+((double)memberInfo.getWeight()*9.56)+(1.85*memberInfo.getHeight())-(4.68*memberInfo.getAge());
			}
			
			double BMI = ((double)diet.getDailyWeight()/(memberInfo.getHeight()*memberInfo.getHeight()/10000));
			
			mv.addObject("dateStr", dateStr)
			.addObject("changePhoto", changePhotoPick)
			.addObject("diary", diaryPick)
			.addObject("sumCalorieList",sumCalorieList)
			.addObject("myDiet",diet)
			.addObject("standardWeight",standardWeight)
			.addObject("dailyCalorie",dailyCalorie)
			.addObject("basalMetabolism",basalMetabolism)
			.addObject("totalIntake",totalIntake)
			.addObject("memberInfo",memberInfo)
			.addObject("BMI",BMI)
			.setViewName("calendar/dailyDietInfo");
		}
		
		return mv;
	}
	// 다이어트  정보 전송
	@RequestMapping(value="dietInfoSave.doa", method=RequestMethod.POST)
	public String calendarSend(MyDiet myDiet, HttpServletRequest request ) { 
		System.out.println("dietInfoSave ===>"+myDiet.toString());
		
		Member member = (Member)request.getSession().getAttribute("loginUser");
		String userId = member.getUserId();
		myDiet.setUserId(userId);
		MyDiet diet = cService.selectDietInfo(myDiet);

		
		if(diet!=null) {
			int result = cService.deleteMyDiet(myDiet);
			if(result>0) {
				int result2 = cService.registerMyDiet(myDiet);
				if(result2>0) {
					return "redirect:dailyDietInfoWrite.doa?dateStr="+myDiet.getDate();
				}else {
					return "common/errorPage";
				}
			}else {
				return "common/errorPage";
			}
		}else {
			int result = cService.registerMyDiet(myDiet);
			if(result>0) {
				return "redirect:dailyDietInfoWrite.doa?dateStr="+myDiet.getDate();
			}else {
				return "common/errorPage";
			}
		}
		
	}

	// 음식 정보 보여주기
	@RequestMapping(value="foodView.doa", method=RequestMethod.GET)
	public ModelAndView foodView(ModelAndView mv, HttpServletRequest request,FoodCheckList foodCheckList) {
		System.out.println("foodView 진입 ==>"+foodCheckList.toString());
		Member member = (Member)request.getSession().getAttribute("loginUser");
		String userId = member.getUserId();

		String addDate = request.getParameter("addDate");
		String meal = request.getParameter("meal");
		foodCheckList.setUserId(userId);
		//		저장된 체크된걸 보여주려면
		//		select meal? 하는걸 담아서 또 mv.add 해야되지않나
		//		meal이랑 date로 검색하고,  mycalorie는 meal이랑 date랑 userId로 검색 해야되는데, 어떻게...?
		// 칼로리랑 , my칼로리 어떻게 나눠서 usercategory 넣지..

		foodCheckList.setUserId(userId);
		foodCheckList.setUserCategory("C");
		ArrayList<FoodCheckList> fcCalorieList = cService.selectCheckFoodList(foodCheckList);
		foodCheckList.setUserCategory("M");
		ArrayList<FoodCheckList> fcMyCalorieList = cService.selectCheckFoodList(foodCheckList);


		ArrayList<FoodSelectedList> cList = cService.selectCalorie(foodCheckList);
		ArrayList<FoodSelectedList> myCList = cService.selectMyCalorie(foodCheckList);

		System.out.println("CalendarController.foodView - cList ====> " + cList + "//myCList====>"+ myCList);


		mv.addObject("meal", meal)
		.addObject("addDate",addDate)
		.addObject("cList", cList)
		.addObject("myCList", myCList)
		.addObject("fcCalorieList",fcCalorieList)
		.addObject("fcMyCalorieList", fcMyCalorieList)
		.setViewName("calendar/foodView");
		return mv;
	}

	// 음식 정보 선택
	@ResponseBody
	@RequestMapping(value="foodSelectedAdd.doa", method=RequestMethod.POST)
	public ResponseEntity<ResultObject> foodSelect(String addDate, String meal, HttpServletRequest request,Model model) {
		String [] arr = request.getParameterValues("selectedFoodList");
		String [] selfArr = request.getParameterValues("selectedSelfFoodList");

		System.out.println("arr ==> " + arr);
		System.out.println("selfArr ==> " + selfArr);

		boolean result1 = true;
		boolean result2 = true;

		FoodCheckList foodCheckList = new FoodCheckList();
		foodCheckList.setAddDate(Date.valueOf(addDate));
		foodCheckList.setMeal(meal);
		
		Member member = (Member)request.getSession().getAttribute("loginUser");
		String userId = member.getUserId();
		foodCheckList.setUserId(userId);

		if(arr != null && arr.length>0) {
			for(int i=0; i < arr.length; i++) {
				System.out.println(arr[i]);

				int calorieNo = Integer.parseInt(arr[i]);
				foodCheckList.setCalorieNo(calorieNo);
				foodCheckList.setUserCategory("C");

				int result = cService.registerFoodCheckList(foodCheckList);
				if(result>0) {
				}else {
					result1 = false;
				}
			}
		}
		// 0보다 안클경우는 어떡한지 의문인 부분..
		if(selfArr != null && selfArr.length>0) {
			for(int j=0; j<selfArr.length; j++) {
				System.out.println(selfArr[j]);

				int calorieNo = Integer.parseInt(selfArr[j]);
				foodCheckList.setCalorieNo(calorieNo);
				foodCheckList.setUserCategory("M");

				int result = cService.registerFoodCheckList(foodCheckList);
				if(result>0) {
				}else {
					result2 = false;
				}
			}
		}

		if(result1 == false && result2 == false) {
			ResultObject resultObject = new ResultObject("ERROR", "칼로리, 마이칼로리 insert 실패");
			return new ResponseEntity<ResultObject>(resultObject, HttpStatus.OK);
		} else if (result1 == false) {
			ResultObject resultObject = new ResultObject("ERROR", "칼로리 insert 실패");
			return new ResponseEntity<ResultObject>(resultObject, HttpStatus.OK);
		} else if (result2 == false) {
			ResultObject resultObject = new ResultObject("ERROR", "마이칼로리 insert 실패");
			return new ResponseEntity<ResultObject>(resultObject, HttpStatus.OK);
		} else {
			ResultObject resultObject = new ResultObject("SUCCESS", "칼로리, 마이칼로리 insert 성공");
			return new ResponseEntity<ResultObject>(resultObject, HttpStatus.OK);
		}

	}
	
	// 푸드리스트 선택항목 비우기
	@ResponseBody
	@RequestMapping(value="foodSelectedEmpty.doa",method=RequestMethod.POST)
	public String foodSelectedEmpty(HttpServletRequest request, 
			String addDate, String meal) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		String userId = member.getUserId();
		FoodCheckList foodCheckList = new FoodCheckList();
		foodCheckList.setMeal(meal);
		foodCheckList.setAddDate(Date.valueOf(addDate));
		foodCheckList.setUserId(userId);

		int result = cService.emptyFoodCheckList(foodCheckList);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}


	}

	// 셀프로 음식정보 추가 페이지 이동
	@RequestMapping(value="foodAddWrite.doa", method=RequestMethod.GET)
	public String foodAddWrite(HttpServletRequest request) {

		return "calendar/foodAdd";
	}
	// 관리자,셀프로 음식정보 디비에 저장
	@RequestMapping(value="foodAdd.doa", method=RequestMethod.POST)
	public ModelAndView foodAdd(ModelAndView mv, Calorie calorie, MyCalorie myCalorie, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String userId = member.getUserId();


		System.out.println("foodAdd() 진입 userId ==>" + userId);
		// 관리자 아이디일 경우 수정 불가능한 음식 메뉴 추가    Calorie
		if("admin".equals(userId)) {

			calorie.setUserId(userId);
			int result = cService.registerFoods(calorie);
			if(result>0) {
				mv.setViewName("redirect:foodView.doa");
			}else {
				mv.addObject("msg", "음식 추가 실패!").setViewName("calendar/errorPage");
			}
			// 아닐경우 셀프 인서트로 변경  두개 테이블이 다름  MyCalorie
		}else {
			myCalorie.setUserId(userId);
			int result = cService.registerFoods(myCalorie);
			System.out.println("foodADD.else.UserId ==> "+result);
			if(result>0) {
				mv.setViewName("redirect:foodView.doa");
			}else {
				mv.addObject("msg", "음식 추가 실패!").setViewName("calendar/erroePage");
			}
		}
		return mv;
	}
	
	
}

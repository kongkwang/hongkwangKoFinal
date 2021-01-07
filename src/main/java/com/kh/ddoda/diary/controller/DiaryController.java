package com.kh.ddoda.diary.controller;

import java.io.File;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ddoda.common.Pagination;
import com.kh.ddoda.diary.domain.Diary;
import com.kh.ddoda.diary.domain.PageInfo;
import com.kh.ddoda.diary.domain.Reply;
import com.kh.ddoda.diary.domain.Search;
import com.kh.ddoda.diary.service.DiaryService;
import com.kh.ddoda.member.domain.Member;




@Controller
public class DiaryController {
	@Autowired
	private DiaryService dService;
	
	private Logger logger = LoggerFactory.getLogger(DiaryController.class);
	
	// 다이어리 작성 폼 이동
	@RequestMapping(value="dWriterForm.doa", method=RequestMethod.GET)
	public ModelAndView dWriterForm(@RequestParam(value="dateStr", required=false) Date diaryDate, ModelAndView mv) {
		System.out.println(diaryDate);
		if(diaryDate !=null) {
			mv.addObject("diaryDate",diaryDate).setViewName("diary/diaryWriteForm");
		}else {
			mv.setViewName("diary/diaryWriteForm");
		}
		return mv;
	}
	// 다이어리 작성 전송
	@RequestMapping(value="diaryInsert.doa", method=RequestMethod.POST)
	public String diaryInsert(Diary diary, Model model,HttpServletRequest request, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile){
		
		// 파일 서버에 저장하는 작업
		if(!uploadFile.getOriginalFilename().equals("")) {
			String renameFileName=saveFile(uploadFile, request);
			if(renameFileName != null) {
				diary.setOriginalFileName(uploadFile.getOriginalFilename());
				diary.setRenameFileName(renameFileName);
			}
		}
		//데이터를 디비에 저장하는 작업
		int result=0;
		String path = null;
		result = dService.registerDiary(diary);
		if(result>0) {
			path ="redirect:diaryList.doa";
		}else {
			model.addAttribute("msg", "게시글 등록 실패!");
			path = "common/errorPage";
		}
		return path;
		
	}
	// 파일 저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		//파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\diaryUploadFiles";
		// 저장 폴더 선택
		File folder = new File(savePath);
		
		// 만약 폴더가 없을 경우 자동 생성
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		// 다이어리 첨부파일은 파일명 변환없이 바로 저장했지만
		// 게시판 같은 경우 많은 회원들이 동시에 올릴 수도 있고?는 아닌디;; 같은 이름의 파일을 올릴 수도 있기 때문에
		// 파일명을 rename 하는 과정이 필요함. rename할땐 "년원일시분초.확장자"로 변경 필요
		SimpleDateFormat sdf=new SimpleDateFormat("yyyMMDDHHMMSS");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))+ "."
								+originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		
		String filePath = folder + "\\" + renameFileName;
		
		try{
			
		
		file.transferTo(new File(filePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return renameFileName;
	}
	
	// 다이어리 리스트 보기
	@RequestMapping(value="diaryList.doa", method=RequestMethod.GET)
	public ModelAndView diaryList(ModelAndView mv, @RequestParam(value="page", required=false)Integer page, HttpSession session ) {
		
		 //멤버연결되면 userId 같이 전달해주기 
		 Member loginUser = (Member)session.getAttribute("loginUser"); 
		 String userId = loginUser.getUserId();
		 
		
		int currentPage=(page!=null)? page:1;
		int listCount = dService.getListCount(userId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
		ArrayList<Diary> dList = dService.selectList(pi, userId);
		System.out.println(dList.toString());
		if(!dList.isEmpty()) {
			mv.addObject("dList", dList);
			mv.addObject("pi", pi);
			mv.setViewName("diary/diaryListView");
		}else if(dList.isEmpty()){
			mv.addObject("dList",dList).addObject("pi",pi).setViewName("diary/diaryListView");
		}else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
		
	}
	// 다이어리 상세보기
	@RequestMapping(value="diaryDetail.doa", method=RequestMethod.GET)
	public ModelAndView diaryDetail(ModelAndView mv, int diaryNo, Integer page, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		int currentPage = page != null? page:1;
		//조회수 증가
		/* dService.addReadCount(diaryNo); */
		
		//게시글 상세 조회
		Diary diary=dService.selectDiary(diaryNo);
		
		System.out.println(diary);
		if(diary!=null && member!=null) {
			// 메소드 체이닝 방식
			mv.addObject("diary",diary).addObject("currentPage", currentPage).setViewName("diary/diaryDetailView");
		}else {
			mv.addObject("msg", "게시글 상세 조회 실패!");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	// 공개 비공개 버튼 
	@RequestMapping(value="diaryPublic.doa", method=RequestMethod.GET)
	public ModelAndView diaryPublic(ModelAndView mv, HttpServletRequest request, Diary diary) {
		
		int result = dService.changePublicCode(diary);
		System.out.println(diary.toString());
		if(result>0) {
			Diary diaryOne = dService.selectDiary(diary.getDiaryNo());
			System.out.println(diaryOne.toString());
			mv.addObject("diary", diaryOne).setViewName("diary/diaryDetailView"); 
		}
		return mv;
	}
	
	// 다이어리 수정 폼
	@RequestMapping(value="diaryUpdateView.doa", method=RequestMethod.GET)
	public ModelAndView diaryUpdateView(ModelAndView mv, @RequestParam("diaryNo")int diaryNo,
					@RequestParam("page") Integer page, HttpSession session) {
		
		
//		Member member =  (Member)session.getAttribute("loginUser");
//		String userId = member.getUserId();
		
		mv.addObject("diary", dService.selectDiary(diaryNo)).addObject("currentPage", page).setViewName("diary/diaryUpdate");
		System.out.println(dService.selectDiary(diaryNo)); // 뭐지 diary왜 안들어감?
		return mv;
	}
	// 다이어리 수정 전송
	@RequestMapping(value="diaryUpdate.doa", method=RequestMethod.POST)
	public ModelAndView diaryUpdate(ModelAndView mv, @ModelAttribute Diary diary, HttpServletRequest request,
									@RequestParam("page") Integer page,
									@RequestParam(value="reloadFile", required=false) MultipartFile reloadFile){
		System.out.println("diaryUpdate.doa ==>"+diary);
		if(reloadFile != null && !reloadFile.isEmpty()) {
			
			if(diary.getOriginalFileName()!=null) {
				deleteFile(diary.getRenameFileName(),request);
			}
			// 새로 업로드 된 파일 저장
			String renameFileName= saveFile(reloadFile, request);
			if(renameFileName!=null) {
				diary.setOriginalFileName(reloadFile.getOriginalFilename());
				diary.setRenameFileName(renameFileName);
			}
		}
		int result=dService.modifyDiary(diary);
		if(result>0) {
			mv.addObject("page", page).setViewName("redirect:diaryList.doa");
			
		}else {
			mv.addObject("msg", "게시글 수정 실패").setViewName("common/errorPage");
		}
		return mv;
										
	}
	
	// 다이어리 삭제
	@RequestMapping(value="diaryDelete.doa", method=RequestMethod.GET)
	public String diaryDelete(@RequestParam(value="diaryNo")int diaryNo, HttpServletRequest request, Model model) {
		//파일삭제
		Diary diary=dService.selectDiary(diaryNo);
		
		if(diary.getOriginalFileName()!=null) {
			System.out.println("파일이 존재합니다.");
			deleteFile(diary.getRenameFileName(), request);
		}
		//DB에서 데이터 삭제
		int result = dService.deleteDiary(diaryNo);
		System.out.println(result);
		if(result>0) {
			return "redirect:diaryList.doa";
		}else {
			model.addAttribute("msg", "게시글 삭제 실패..");
			return "common/errorPage";
		}
	}
	// 다이어리 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		System.out.println("파일 삭제 메소드 진입");
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\diaryUploadFiles";
		
		System.out.println("root:"+root);
		System.out.println("savePath:"+savePath);
		
		String temp = savePath + "\\"+ fileName;
		System.out.println("temp:"+temp);
		// 삭제할 경로를 통한 파일 객체 생성
		File file = new File(temp);
		
		// 해당 파일이 존재할 경우 삭제
		if(file.exists()) {
			System.out.println("경로에 파일이존재합니다.");
			System.out.println("---");
			file.delete();
		}
		
		
	}
	
	
	// 댓글 달기
	@ResponseBody
	@RequestMapping(value="addReply.doa", method=RequestMethod.POST)
	public String addReply(Reply reply, HttpSession session) {
		
		 Member loginUser = (Member)session.getAttribute("loginUser"); 
		 String rWriter = loginUser.getUserId(); reply.setrWriter(rWriter);
		 reply.setrWriter(rWriter);
		int result = dService.insertReply(reply);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	// 댓글 리스트 불러오기
	@RequestMapping(value="replyList.doa", method=RequestMethod.GET)
	public void getReplyList(HttpServletResponse response,int diaryNo) throws Exception{
		
	
		System.out.println(diaryNo);
		ArrayList<Reply> rList = dService.selectReplyList(diaryNo);
		// DB에서 가져온 값을 JSON 형태로 바궈줘야함
		// 그 전에 DB데이터에 한글이 있으면 인코딩 해줘야함
		for (Reply r : rList) {
			r.setrContent(URLEncoder.encode(r.getrContent(), "utf-8"));
		}
		
		// DB데이터를 JSON형태로 만드는 방법 중 Gson을 이용해보자
		// hashmap이랑 jsonObject, jsonArray 사용하는 방법 잘 모름
		
		Gson gson = new GsonBuilder().setDateFormat("yyy-MM-dd").create();
		gson.toJson(rList, response.getWriter());
		
	}
	// 댓글 삭제하기??
	
	//게시물 검색
	@RequestMapping(value="diarySearch.doa", method=RequestMethod.GET)
	public String diarySearch(Search search, Model model) {
		ArrayList<Diary> searchList = dService.selectSearchList(search);
		if(!searchList.isEmpty()) {
			model.addAttribute("dList",searchList);
			model.addAttribute("search", search);
			return "diary/diaryListView";
		}
		else {
			model.addAttribute("msg", "공지사항 검색 실패!");
			return "common/errorPage";
		}
	}
	
	
}

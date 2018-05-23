package edu.iot.butter.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import edu.iot.butter.model.Attachment;
import edu.iot.butter.model.Board;
import edu.iot.butter.model.Diary;
import edu.iot.butter.model.Pagination;
import edu.iot.butter.service.DiaryService;

@Controller
@RequestMapping("/diary")
public class DiaryController {
	
	@Autowired
	DiaryService service;
	
	@RequestMapping("/list")
	public void list(@RequestParam(value="page", defaultValue="1") int page, Model model) throws Exception {
		Pagination pagination = service.getPagination(page);
		List<Diary> list = service.getList(pagination);
		model.addAttribute("pagination",pagination);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public void createForm(Diary diary) {
		
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String createSubmit(@Valid Diary diary, BindingResult result, MultipartHttpServletRequest request) throws Exception {

		if(result.hasErrors()) {
			System.out.println(result);
			return "diary/create";
		}
		
		//파일 읽어오기...
		List<MultipartFile> attachments = request.getFiles("files");
		if(!service.create(diary, attachments)) {
			return "diary/create";
		}
		
		return "redirect:list";
	}
	
	@RequestMapping(value="/view/{diaryId}", method=RequestMethod.GET)
	public String view(@PathVariable int diaryId, Model model) throws Exception{
		//url로 받은 boardId를 통해 board의 정보를 알아오자!
		Diary diary = service.getDiary(diaryId);
		//model로 넣어서 jsp에서 사용합시다~
		model.addAttribute("diary", diary);
		
		return "diary/view";
	}
	
	
	
	
}
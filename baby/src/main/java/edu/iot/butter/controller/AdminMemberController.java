package edu.iot.butter.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.iot.butter.model.Member;
import edu.iot.butter.model.Pagination;
import edu.iot.butter.model.Password;
import edu.iot.butter.service.MemberService;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping("/list")
	public void list(
			@RequestParam(value="page", defaultValue="1") int page,
			Model model) throws Exception{
		
		// 목록 및 페이지 정보 추출
		
		Pagination pagination = service.getPagination(page);
		
		//pagination을 매개변수로 넣는다라....
		List<Member> list = service.getList(pagination);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("list", list);		
		model.addAttribute("today", new Date());
		
		}
	
	@RequestMapping(value="/create",method=RequestMethod.GET)
	public void createForm(Member memeber){
		
	}
	
	@RequestMapping(value="/create",method=RequestMethod.POST)
	public String createSubmit(@Valid Member member, BindingResult result) throws Exception {
		if(result.hasErrors() || !service.create(member)){
			return "admin/member/create";
		}		
		return "redirect:list";		
	}
	
	
	@RequestMapping(value="/view/{userId}", method=RequestMethod.GET)
	//value값에서 정한 userId와 Pathvariable의 매개변수가 같아야 한다.
	public String view(@PathVariable String userId, Model model) throws Exception{
		Member member = service.getMember(userId);
		model.addAttribute("member",member);
		return "admin/member/view";
	}
	
	@RequestMapping(value="/edit/{userId}", method=RequestMethod.GET)
	public String editForm(@PathVariable String userId, Model model) throws Exception {
		Member member = service.getMember(userId);
		model.addAttribute("member",member);
		return "admin/member/edit";
	}
	
	
	@RequestMapping(value="/edit/{userId}", method=RequestMethod.POST)
	public String editSubmit(@Valid Member member,BindingResult result,HttpSession session,@RequestParam(value="page",defaultValue="1") int page) throws Exception{
		if(result.hasErrors()) return "admin/member/edit";
		
		//관리자 비밀번호 체크
		Member admin = (Member)session.getAttribute("USER");
		if(!admin.getPassword().equals(member.getPassword())){
			result.reject("checkPasswordFail", "비밀번호가 틀립니다.");
			return "admin/member/edit";
		}
		
		if(!service.updateByAdmin(member)) {
			result.reject("updateFail", "수정에 실패했습니다.");
			return "admin/member/edit";
		}
		
		return "redirect:/admin/member/view/"+member.getUserId()+"?page="+page;
	}
	
	@RequestMapping(value="changePassword/{userId}",method=RequestMethod.GET)
	public String changePassword(Password password,@PathVariable String userId) throws Exception {
		//id세팅
		password.setUserId(userId);
		//비밀번호 변경하러 이동~
		return "admin/member/changePassword";
	}
	
	@RequestMapping(value="changePassword/{userId}",method=RequestMethod.POST)
	public String changePasswordSubmit(@Valid Password password, BindingResult result,HttpSession session,@RequestParam(value="page",defaultValue="1") int page) throws Exception {
		if(result.hasErrors()) {
			return "admin/member/changePassword";
		}
		
		Member admin = (Member) session.getAttribute("USER");
		//관리자 비빌번호 체크
		System.out.println("admin : "+admin.getPassword()+"입력한 admin : "+password.getOldPassword());
		if(!admin.getPassword().equals(password.getOldPassword())) {
			result.reject("passwordFail","비밀번호가 일치하지않습니다.");
			return "admin/member/changePassword";
		}
		
		if(!service.changePasswordByAdmin(password)) {
			result.reject("updateFail","수정에 실패했습니다.");			
			return "admin/member/changePassword";
		}
		
		return "redirect:/admin/member/view/"+password.getUserId()+"?page="+page;
		 
	}
	
}

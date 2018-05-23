package edu.iot.butter.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.iot.butter.model.Avata;
import edu.iot.butter.model.Member;
import edu.iot.butter.model.Password;
import edu.iot.butter.service.MemberService;

@Controller
//member밑에 있는 url
@RequestMapping("/member")
public class ProfileController {
	
	//멤버는 빈에 등록 되어있어서 싱글톤으로 운영된다.
	@Autowired
	MemberService service;
	
	public void setMember(HttpSession session, Model model) throws Exception{
		Member member = (Member) session.getAttribute("USER");
		model.addAttribute("member",service.getMember(member.getUserId()));
	}
	
	@RequestMapping(value="/profile",method=RequestMethod.GET)
	public void profile(HttpSession session, Model model) throws Exception {
		//request에 넣는다.
	/*	model.addAttribute("member",session.getAttribute("USER"));*/
		setMember(session, model);
	}
	
	
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public void edit(HttpSession session, Model model) throws Exception {
		
		
		/*model.addAttribute("member", setMember(session, model););*/
		setMember(session, model);
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String editSubmit(@Valid Member member,BindingResult result,@RequestParam("avata") MultipartFile mfile, HttpSession session) throws Exception {
		if(result.hasErrors()) {
			return "member/edit";
		}
		System.out.println("수정 전 ; " + member);
		//정보수정
		//실패하면
		if(!service.update(member)) {
			//전역 오류메시지 생성
			result.reject("updateFail","비밀번호가 일치하지 않네요!");
			return "member/edit";
		}else {
			//성공하면	
			if(mfile != null && !mfile.isEmpty()) {
				
				System.out.println();
				
				service.updateAvata(new Avata(member.getUserId(),mfile.getBytes()));
			}
			
			System.out.println("수정 후 ; " + member);
			
			session.setAttribute("USER", member);
			return "redirect:profile";
		}
	}
	
	@RequestMapping(value="/changePassword",method=RequestMethod.GET)
	public void changePassword(Password password, Model model) throws Exception {
		
	}
	
	@RequestMapping(value="/changePassword",method=RequestMethod.POST)
	public String submitPassword(@Valid Password password,BindingResult result) throws Exception{
			if(result.hasErrors()) {
				return "/member/changePassword";
			}else {
				System.out.println(password.toString());
				if(service.changePassword(password)) {
					return "redirect:profile";				
				}else {
					return "/member/changePassword";
				}
			}
	}
	
	@RequestMapping(value="/avata", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getAvata(@RequestParam("userId") String userId) throws Exception {
		
		final HttpHeaders headers = new HttpHeaders();
		
		headers.setContentType(MediaType.IMAGE_JPEG);		
		
		//첫번째는 body(responseEntity와 같아야함), 두번째는 header(content type) 세번째는 상태 200???
		ResponseEntity<byte[]> image = new ResponseEntity<byte[]>(service.getAvata(userId), headers, HttpStatus.OK);
		
		
		return image;
		
	}
}

package edu.iot.butter.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.iot.butter.exception.LoginFailException;
import edu.iot.butter.model.Avata;
import edu.iot.butter.model.Login;
import edu.iot.butter.model.Member;
import edu.iot.butter.service.MemberService;
import lombok.extern.slf4j.Slf4j;

//@controller로 빈 등록해서 url 맵핑하자~~~
@Controller
@Slf4j
public class AccountController {

	// by type 형태로 bean을 만들어준다.
	@Autowired
	MemberService service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm(Login login,@ModelAttribute("url") String url) {
		login.setUrl(url);
		// 뷰의 이름이다.
		return "account/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginSubmit(@Valid Login login, BindingResult result,HttpSession session) throws Exception {

		// result에 에러가 있냐(양식을 잘 맞춰 써 줫니??)
		if (result.hasErrors()) {
			return "account/login";
		} else {
			
			Member member = service.checkLogin(login);
			System.out.println("로그인 확인 : "+member);
			
			/*			
 * if (member == null) {
				result.reject("failLogin","사용자 ID 또는 비밀번호가 일치하지 않습니다.");
				return "account/login";
			} else {
				session.setAttribute("USER", member);
				return "redirect:/";
			}*/			
			session.setAttribute("USER", member);
			String url = login.getUrl();
			if(url!=null && !url.isEmpty()) {
				return "redirect:"+url;
			}
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinFrom(Member member) {
		return "account/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinSubmit(@Valid Member member, BindingResult result,@RequestParam("avata") MultipartFile mFile, RedirectAttributes ra) throws Exception {
						
		if (result.hasErrors()) {
			return "account/join";
		} else {

			if (service.create(member)) {
				
				if(mFile!=null && !mFile.isEmpty()) {
					service.insertAvata(new Avata(member.getUserId(), mFile.getBytes()));
				}
				
				ra.addFlashAttribute("member",member);
				
				return "redirect:/join_success";
			} else {
				return "account/join";
			}
		}
	}

	// responsebody는 return값을 view이름으로 안보겠다.
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	//parameter에서 userId값 땡겨오기
	public boolean checkId(@RequestParam ("userId") String userId) {
		boolean result = false;
		try {
			//result = service.CheckId(member.getUserId());
			result = service.CheckId(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

/*	// 뷰이름을 리턴하는 것들에 한해서 예외처리시 에러메세지를 보내는 view이름을 리턴하장.
	@ExceptionHandler({ SQLException.class, DataAccessException.class })
	public String HandlerError() {
		return "error/database_error";
	}*/
	
	@ExceptionHandler(LoginFailException.class)
	public String handleLoginError(HttpServletRequest request, Exception e) {
		//커맨드객체를 전달??
		//request에 저장한거는 jsp에서 어떻게 쓰는 거지....?
		request.setAttribute("login", new Login());
		request.setAttribute("error", e.getMessage());
		return "account/login";
	}
	
	@RequestMapping(value="/join_success",method=RequestMethod.GET)
	public String joinSuccess() {
		return "account/join_success";
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "/home";
	}
	


	
}

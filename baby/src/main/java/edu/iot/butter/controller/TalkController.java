package edu.iot.butter.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.iot.butter.model.Member;
import edu.iot.butter.model.Talk;
import edu.iot.butter.service.MemberService;
import edu.iot.butter.service.TalkService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/talk")
public class TalkController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	TalkService talkService;
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public void talk(@RequestParam(value="page",defaultValue="1") int page, HttpSession session, Model model) throws Exception {
		Member member = (Member)session.getAttribute("USER");
		String userId = member.getUserId();
		//새로운 메시지 컬럼이 포함된 멤버 명단
		model.addAttribute("memberList",service.getListWithMessages(userId));
		
		model.addAttribute("talkList", talkService.selectOneListPerUser(userId));
	}
	
	@RequestMapping(value="/with",method=RequestMethod.GET)
	public void with(Talk talk) throws Exception {
		//읽지 않은 메시지 checked를 1로 변경
		talkService.updateCheck(talk);
	}
	
	// 대화상대의 talk 리스트 추출 후 리턴
	@ResponseBody
	@RequestMapping(value="/talkList", method=RequestMethod.GET)
	public List<Talk> talkList(Talk talk) throws Exception {
		System.out.println("토크리스트의 들어가는 토크 : " + talk);
		List<Talk> list = talkService.getTalkList(talk);
		for(Talk t : list) {
				System.out.println("토스리스트 나오는 토크"+list);
		}
		return talkService.getTalkList(talk);
	}
}

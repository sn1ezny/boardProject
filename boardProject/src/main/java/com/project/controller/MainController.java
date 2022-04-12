package com.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.MemberDTO;
import com.project.service.MemberService;

@Controller
public class MainController {
	
	@Inject
	private MemberService memberService;
	
	/* Go */
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "main/main";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		MemberDTO memberDTO = memberService.getMember(id);
		model.addAttribute("memberDTO", memberDTO);
		return "member/update";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	/* Pro */
	
	@RequestMapping(value = "/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO,HttpSession session) {
		MemberDTO checkMemberDTO = memberService.userCheck(memberDTO);
		if (checkMemberDTO != null) {
			session.setAttribute("id", memberDTO.getId());
			return "redirect:/main";
		} else {
			return "member/msg";
		}
	}
	
	@RequestMapping(value = "/joinPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO memberDTO) {
		memberService.insertMember(memberDTO);
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/updatePro", method = RequestMethod.POST)
	public String updatePro(MemberDTO memberDTO) {
		MemberDTO ckDTO = memberService.userCheck(memberDTO);

		if (ckDTO!=null) {
			memberService.updateMember(memberDTO);
			return "redirect:/main";
		} else {
			return "member/msg";
		}
	}
	
	
}

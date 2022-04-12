package com.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.MemberDTO;
import com.project.service.MemberService;


@RestController
public class AjaxController {
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/userCheck", method = RequestMethod.GET)
	public ResponseEntity<String> userCheck(HttpServletRequest request){
		String result = "";
		String id = request.getParameter("id");
		MemberDTO memberDTO = memberService.getMember(id);
		if (memberDTO != null) {
			result = "iddup";
		} else {
			result = "idok";
		}
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;
	}
	
}

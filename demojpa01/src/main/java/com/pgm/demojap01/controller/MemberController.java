package com.pgm.demojap01.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pgm.demojap01.domain.JpaMember;
import com.pgm.demojap01.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("list")
	public String list(Model model) {
		model.addAttribute("list", memberService.list());
		return "member/list";
	}
	
	@GetMapping("register")
	public void regisert() {
		
	}
	
	@PostMapping("insert")
	public String insert(JpaMember member) {
		memberService.insert(member);
		return "redirect:list";
	}
	
	@GetMapping("update/{id}")
	public String updateForm(@PathVariable("id") Long id,Model model) {
		model.addAttribute("member", memberService.read(id));
		return "member/update";
	}
	
	@PostMapping("update")
	public String update(JpaMember member) {
		memberService.update(member);
		return "redirect:/member/list";
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		memberService.delete(id);
		return "redirect:/member/list";
		
	}

}

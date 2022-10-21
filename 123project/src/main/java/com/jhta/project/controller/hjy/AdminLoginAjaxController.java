package com.jhta.project.controller.hjy;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.hjy.HeadadminServiceHjy;
import com.jhta.project.vo.hjy.HeadadminVo;

@RestController
public class AdminLoginAjaxController {
	@Autowired HeadadminServiceHjy adminservice;
	/**
	 * 관리자 로그인
	 * @param aid
	 * @param apw
	 * @param session
	 * @return
	 */
	@GetMapping(value="hjy/admin/login")
	public HashMap<String, Object> login(String aid, String apw,HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HeadadminVo result = adminservice.login(new HeadadminVo(aid, apw, null, null));
		if(result!=null) {
			map.put("result", "success");	
			session.setAttribute("adminid", aid);
		}else {
			map.put("result", "fail");	
		}
		return map;
	}
	/**
	 * 관리자 아이디 받아서 메인화면 오른쪽 상단에 띄우기
	 * @param aid
	 * @param apw
	 * @param session
	 * @return
	 */
	@GetMapping(value="hjy/admin/getid")
	public HashMap<String, Object> getid(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("adminid", session.getAttribute("adminid"));
		return map;
	}
	/**
	 * 관리자 로그아웃
	 * @param session
	 * @return
	 */
	@GetMapping(value="hjy/admin/logout")
	public HashMap<String, Object> logout(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		session.removeAttribute("adminid");
		return map;
	}
	
}

package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.AccountService;

@Controller
public class AccountController {
	@Autowired
	AccountService service;
	
	// loginForm
	@RequestMapping(value = "/account/loginForm.do")
	public ModelAndView loginForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "account/loginForm.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	
	// login
	@RequestMapping(value = "/account/login.do")
	public ModelAndView login() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	// loginOk
	@RequestMapping(value="/account/loginOk.do")
	public ModelAndView loginOk() {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	
	// loginFail
	@RequestMapping(value="/account/loginFail.do")
	public ModelAndView loginFail() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	
	// logout
	@RequestMapping(value="/account/logout.do")
	public ModelAndView logout() {
	
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	

	
	// checkId
	@RequestMapping(value="/account/checkId.do")
	public ModelAndView checkId() {

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	
	}
	
	// 회원가입 입력폼
	@RequestMapping(value="/account/writeForm.do")
	public ModelAndView writeForm() {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	
	
	// 회원가입
	@RequestMapping(value="/account/write.do")
	public ModelAndView write(){

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	
	// select : 회원 개별 조회
	@RequestMapping("/account/selectOne.do")
	public ModelAndView selectOne() {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}
	
	
	// selsectList : 회원 리스트 조회
	@RequestMapping(value="/account/selectList.do")
	public ModelAndView memberList() {

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}
	
	// 정보수정 입력폼
	@RequestMapping(value="/account/modifyForm.do")
	public ModelAndView modifyForm() {

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");

		
		return modelAndView;
	}
	
	// 회원 정보수정
	@RequestMapping(value="/account/modify.do")
	public ModelAndView modify() {

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");

		
		return modelAndView;
	}
	
	
	// 회원 탈퇴 입력폼
	@RequestMapping(value="/account/deleteForm.do")
	public ModelAndView deleteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");

		
		return modelAndView;
	}
	
	
	// 회원 탈퇴
	@RequestMapping(value="/account/delete.do")
	public ModelAndView delete() {

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");

		
		return modelAndView;
	}
}

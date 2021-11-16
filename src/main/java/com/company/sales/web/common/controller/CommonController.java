package com.company.sales.web.common.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.company.sales.web.common.service.ICommonService;
import com.company.sales.web.service.ISalesService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class CommonController {
	@Autowired
	public ICommonService iCommonService;
	@Autowired
	public ISalesService iCampService;
	
	
	@RequestMapping(value = "/notAllow")
	public ModelAndView notAllow(ModelAndView mav) {
		mav.setViewName("exception/NOT_ALLOW_ACCESS");
		
		return mav;
	}
	
	@RequestMapping({"/", "/login"})
	public ModelAndView login(ModelAndView mav) {
		mav.setViewName("common/login");
		
		return mav;
	}
	
	@RequestMapping(value = "/loginAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String loginAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {

			HashMap<String, String> data = iCampService.loginData(params);

			if (data != null && !data.isEmpty()) {
				session.setAttribute("user", data);
				
				modelMap.put("res", "SUCCESS");
			} else {
				modelMap.put("res", "FAILED");
			}

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "ERROR");
		}
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		session.invalidate();
		
		mav.setViewName("redirect:login");

		return mav;
	}
	
}

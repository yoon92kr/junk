package com.myspring.restful;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class MainController {
	
	@ReqeusetMapping("/abd")
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
}

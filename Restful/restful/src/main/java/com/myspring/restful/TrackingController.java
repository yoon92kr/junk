package com.myspring.restful;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TrackingController {

	// CJ 대한통운 운송조회 URL
	// http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=송장번호

	// 로젠 운송조회 URL
	// https://www.ilogen.com/web/personal/trace/송장번호

	// 우체국 운송조회 URL
	// http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=송장번호

	@ResponseBody
	@RequestMapping(value = "/search.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String, Object> craw_select(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("user") String user_id) throws Exception {

		boolean result = false;
		String url = "http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=" + user_id;
		Document doc = Jsoup.connect(url).get();

		Elements b = doc.select("b");
		Elements tr = doc.select("tr");
		Elements td = doc.select("td");

		System.out.println(b);
		System.out.println(tr);
		System.out.println(td);
		// System.out.println(doc);

//	        PrintWriter writer = resp.getWriter();
//	        resp.setCharacterEncoding("UTF-8"); 
//	        resp.setContentType("text/html;charset=UTF-8");
//	        writer.println(result);
		Map<String, Object> testmap = new HashMap<String, Object>();
		return testmap;
	}
}

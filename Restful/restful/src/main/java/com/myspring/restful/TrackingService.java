package com.myspring.restful;

import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

@Service
public class TrackingService {
	
	Map<String, Object> result = new HashMap<String, Object>();
	
	public Map<String, Object> findDelivery(Map<String, Object> inform) {
		
		String deliveryId = (String)inform.get("deliveryId");
		
		// 배송업체 정보가 null일 경우
		if(inform.get("company").equals(null) && inform.get("company").equals("") ) {
			
		}
		// 배송업체 정보가 입력된 경우
		else {
			
		}
		
		return result;
		
	}

	
	
	
	// 로젠택배 배송조회 
	private Map<String, Object> logenDelivery(String deliveryId) {
		
		
		String url = "https://www.ilogen.com/web/personal/trace/" + deliveryId;

		try {
			Document doc = Jsoup.connect(url).get();	
			Elements b = doc.select("b");
			Elements tr = doc.select("tr");
		}
		
		catch(Exception e) {
			
		}
				
		return result;
		
	}
	
	// CJ대한통운 배송조회
	private Map<String, Object> cjDelivery(String deliveryId) {
		
		String url = "http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=" + deliveryId;

		try {
			Document doc = Jsoup.connect(url).get();	
		}
		
		catch(Exception e) {
			
		}
		
		
		return result;
		
	}
	
	// 우체국 배송조회
	private Map<String, Object> PostDelivery(String deliveryId){
		
		String url = "http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=" + deliveryId;
		
		try {
			Document doc = Jsoup.connect(url).get();	
		}
		
		catch(Exception e) {
			
		}
		
		
		return result;
		
	}
	

}

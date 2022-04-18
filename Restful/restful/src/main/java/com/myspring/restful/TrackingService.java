package com.myspring.restful;

import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TrackingService {
	
	@Autowired
	CommonService commonService;
	
	public Map<String, Object> findDelivery(Map<String, Object> inform) {
		
		String deliveryId = "";
		String url = "https://apis.tracker.delivery/carriers";
				
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(!commonService.nullCheck((String)inform.get("deliveryId"))) {
			deliveryId = (String)inform.get("deliveryId");	
		}		
		
		// Modern blanco의 경우 지정 택배사가 3개이며, 각 택배사 별 운송장 번호가 상이하기때문에 아래와 같은 조건문을 사용한다.
		// 로젠
		if(deliveryId.length() == 11) {
			url = url +  "/kr.logen/tracks/" + deliveryId;
		}
		// CJ대한통운
		else if(deliveryId.length() == 10) {
			url = url +  "/kr.cjlogistics/tracks/" + deliveryId;
		}
		// 우체국
		else if(deliveryId.length() == 13) {
			url = url +  "/kr.epost/tracks/" + deliveryId;
		}
		
		// 반환된 정보를 파싱 후 url로 호출
		// 외부 api 사용할지 고민중.
		
		result = commonService.callAPI(url);
		
		return result;
		
	}

	
	
	
	// 로젠택배 배송조회 
	private Map<String, Object> logenDelivery(String deliveryId) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		// 로젠 배송조회 API 호출
		String url = "https://www.ilogen.com/web/personal/trace/" + deliveryId;

		try {
			Document doc = Jsoup.connect(url).get();	
			System.out.println(doc);
		}
		
		catch(Exception e) {
			
		}
				
		return result;
		
	}
	
	// CJ대한통운 배송조회
	private Map<String, Object> cjDelivery(String deliveryId) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		// CJ대한통운 배송조회 API 호출
		String url = "http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=" + deliveryId;

		try {
			Document doc = Jsoup.connect(url).get();	
			System.out.println(doc);
		}
		
		catch(Exception e) {
			
		}
		
		
		return result;
		
	}
	
	// 우체국 배송조회
	private Map<String, Object> PostDelivery(String deliveryId){
		
		Map<String, Object> result = new HashMap<String, Object>();
		// 우체국 배송조회 API 호출
		String url = "http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=" + deliveryId;
		
		try {
			Document doc = Jsoup.connect(url).get();	
			System.out.println(doc);
		}
		
		catch(Exception e) {
			
		}
		
		
		return result;
		
	}
	

}

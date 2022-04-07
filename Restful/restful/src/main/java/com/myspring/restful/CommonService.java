package com.myspring.restful;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class CommonService {
	
	public boolean nullCheck(String param) {
		
		boolean flag = false;
		
		if(param == "") {
			flag = true;
		}
		if(param == null) {
			flag = true;
		}
		if(param == " ") {
			flag = true;
		}
		
		
		return flag;
	}

	public Map<String, Object> callAPI(String param) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		
		try {
			URL url = new URL(param);
					
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("GET"); // http 메서드
			conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8"); // header Content-Type 정보
			conn.setDoOutput(true); // 서버로부터 받는 값이 있다면 true
			
			// 서버로부터 데이터 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;
			
			while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
				sb.append(line);
			}
				
			result = getMapFromJsonObject(new JSONObject(sb.toString()));
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String, Object> getMapFromJsonObject(JSONObject jsonObj){
	    Map<String, Object> map = null;
	    
	    try {
	       map = new ObjectMapper().readValue(jsonObj.toString(), Map.class);
	    } catch (JsonParseException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    } catch (JsonMappingException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    return map;
	}

}

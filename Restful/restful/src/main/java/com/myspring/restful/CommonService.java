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
			
			conn.setRequestMethod("GET"); // http �޼���
			conn.setRequestProperty("Content-Type", "application/json;charset=UTF-8"); // header Content-Type ����
			conn.setDoOutput(true); // �����κ��� �޴� ���� �ִٸ� true
			
			// �����κ��� ������ �о����
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;
			
			while((line = br.readLine()) != null) { // ���� �� ���� �� ���� �ݺ�
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

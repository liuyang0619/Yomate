package json.util;

import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonHelper {
	public static String serilisation(Object object){
		ObjectMapper mapper = new ObjectMapper();
		String s = null;
		try {
			s = mapper.writeValueAsString(object);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return s;
	}

	public static Map<String, Object> deserilisation(String s){
		Map<String, Object> map = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			map = mapper.readValue(s, Map.class);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return map;
	}
	
	public static Map<String, Object>[] deserilisationArray(String s){
		Map<String, Object>[] map = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			map = mapper.readValue(s, Map[].class);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return map;
	}
	
	public static String serilisation(Object object, Class inputClass){
		ObjectMapper mapper = new ObjectMapper();
		String s = null;
		try {
			s = mapper.writeValueAsString(object);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return s;
	}

	public static Object deserilisation(String s, Class inputClass){
		
		Object object = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			object = mapper.readValue(s, inputClass);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return object;
		
	}
}

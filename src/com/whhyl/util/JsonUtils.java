package com.whhyl.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

public class JsonUtils {

	public static JSONObject BeanToJsonDateFormat(Object object, String format) {
		JsonConfig jsonConfig = new JsonConfig();
		JsonDateValueProcessor processor = new JsonDateValueProcessor(format);
		jsonConfig.registerJsonValueProcessor(Date.class, processor);
		return JSONObject.fromObject(object, jsonConfig);
	}

	public static JSONArray ListBeanToJsonDateFormat(List<?> list, String format) {
		JsonConfig jsonConfig = new JsonConfig();
		JsonDateValueProcessor processor = new JsonDateValueProcessor(format);
		jsonConfig.registerJsonValueProcessor(Date.class, processor);
		return JSONArray.fromObject(list, jsonConfig);
	}

	public static JSONObject MapToJsonDateFormat(Map<String, Object> map, String format) {
		JSONObject result = new JSONObject();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Set<String> keys = map.keySet();
		for (Iterator<String> i = keys.iterator(); i.hasNext();) {
			String key = i.next();
			if (map.get(key) instanceof Date) {
				result.accumulate(key, sdf.format((Date) map.get(key)));
			} else if (map.get(key) == null) {
				result.accumulate(key, "");
			} else {
				result.accumulate(key, map.get(key));
			}
		}
		return result;
	}

	public static JSONArray ListMapToJsonDateFormat(List<Map<String, Object>> list, String format) {
		JSONArray result = new JSONArray();
		for (Map<String, Object> map : list) {
			result.add(MapToJsonDateFormat(map, format));
		}
		return result;
	}
}

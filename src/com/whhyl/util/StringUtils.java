package com.whhyl.util;

public class StringUtils {

	public static boolean isEmpty(String string) {
		String isNull = "null";
		if (string != null){
			string.trim();
		}
		return  string == null || isNull.equals(string) || string.length() == 0;
	}

	public static boolean isNotEmpty(String string) {
		return !isEmpty(string);
	}
}

package com.manager.common.util;

public class UUID {

	public static String uuid() {
		String s = java.util.UUID.randomUUID().toString();
		return s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
	}
}

package com.mm.mm.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Passgenerator {
	public static void main(String... args) {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder(4);
		System.out.println(bCryptPasswordEncoder.encode("man"));
		/*
		 * Resultado: $2a$04$YsUHfJ5njwLHW3Mb6BzrDeDqO.ZvjwNKfY8ObKGXW5qWOhBdSA/8i
		 */
	}
}

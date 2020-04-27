package com.mm.mm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	@GetMapping("/")
	public String inico() {
		return "index";
	}

	@GetMapping("/userForm")
	public String userForm() {
		return "user-form/user-form";
	}
}
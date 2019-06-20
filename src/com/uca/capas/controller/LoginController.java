package com.uca.capas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.domain.Usuario;
import com.uca.capas.request.LoginForm;
import com.uca.capas.response.LoginResponse;
import com.uca.capas.service.UsuarioService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	UsuarioService usuarioService;

	@GetMapping("")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		mav.addObject("form", new LoginForm());
		return mav;
	}

	@PostMapping(path = "/validate", consumes = "application/json")
	public @ResponseBody ResponseEntity<LoginResponse> validate(@RequestBody LoginForm form) {
		Usuario usr = usuarioService.findUsuarioLogin(form.getUsername(), form.getPassword());
		LoginResponse lr = new LoginResponse(usr != null);
		if (usr != null) {
			return new ResponseEntity<>(lr, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(lr, HttpStatus.NOT_FOUND);
		}

	}

}

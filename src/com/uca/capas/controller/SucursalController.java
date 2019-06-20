package com.uca.capas.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.domain.Empleado;
import com.uca.capas.domain.Sucursal;
import com.uca.capas.service.SucursalService;

@Controller
@RequestMapping("/sucursal")
public class SucursalController {

	@Autowired
	SucursalService sucursalService;

	@GetMapping(path = "")
	@ResponseBody
	public ModelAndView allSucursales() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sucursales");
		mav.addObject("lista", sucursalService.getAllSucursales());
		return mav;
	}

	@PostMapping(path = "/perfil")
	@ResponseBody
	public ModelAndView perfil(@RequestParam Integer code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("perfil");
		Sucursal sucursal = sucursalService.getSucursalById(Long.parseLong(code + ""));
		List<Empleado> empleados = sucursal.getEmpleados();
		mav.addObject("listaEmpleados", empleados);
		mav.addObject("sucursal", sucursal);
		return mav;
	}

	@PostMapping(path = "/editar")
	@ResponseBody
	public ModelAndView editar(@RequestParam Integer code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("editar");
		Sucursal sucursal = sucursalService.getSucursalById(Long.parseLong(code + ""));
		List<Empleado> empleados = sucursal.getEmpleados();
		mav.addObject("listaEmpleados", empleados);
		mav.addObject("sucursal", sucursal);
		return mav;
	}

}

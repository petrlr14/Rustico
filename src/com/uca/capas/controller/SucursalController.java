package com.uca.capas.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	@GetMapping(path = "/perfil")
	public ModelAndView perfil(@RequestParam Long code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("perfil");
		Sucursal sucursal = sucursalService.getSucursalById(code);
		List<Empleado> empleados = sucursal.getEmpleados();
		mav.addObject("listaEmpleados", empleados);
		mav.addObject("sucursal", sucursal);
		return mav;
	}

	@GetMapping(path = "/edit")
	public ModelAndView editar(@RequestParam Long code, final Model model, @ModelAttribute Sucursal sucursal,
			BindingResult result) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("editSucursal");

		if (!model.asMap().containsKey("BindingResult")) {
			mav.addObject("sucursal", sucursalService.getSucursalById(code));
		} else {
			mav.addObject("sucursal", (Sucursal) model.asMap().get("sucursal"));
			((BindingResult) model.asMap().get("BindingResult")).getAllErrors().forEach((element) -> {
				result.addError(element);
			});
		}
		return mav;
	}

	@GetMapping(path = "/save")
	public ModelAndView crear(@ModelAttribute Sucursal sucursal, final Model model, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("editSucursal");
		if (!model.asMap().containsKey("BindingResult")) {
			mav.addObject("sucursal", new Sucursal());
		} else {
			mav.addObject("sucursal", (Sucursal) model.asMap().get("sucursal"));
			((BindingResult) model.asMap().get("BindingResult")).getAllErrors().forEach((element) -> {
				result.addError(element);
			});
		}
		return mav;
	}

	@PostMapping(path = "/save")
	public ModelAndView save(@Valid @ModelAttribute Sucursal sucursal, BindingResult result, RedirectAttributes attr) {
		ModelAndView mav = new ModelAndView();
		if (result.hasErrors()) {
			attr.addFlashAttribute("BindingResult", result);
			attr.addFlashAttribute("sucursal", sucursal);
			if (sucursal.getSucursalC() == null) {
				return new ModelAndView("redirect:/sucursal/save");
			} else {
				attr.addAttribute("code", sucursal.getSucursalC());
				return new ModelAndView("redirect:/sucursal/edit");
			}
		}
		Long id = sucursal.getSucursalC();
		System.out.println(id);
		sucursalService.save(sucursal);
		mav.setViewName("redirect:/sucursal");
		if (id != null) {
			attr.addAttribute("code", sucursal.getSucursalC());
			mav.setViewName("redirect:/sucursal/perfil");
		}
		return mav;
	}

	@PostMapping(path = "/delete")
	public ModelAndView delete(@RequestParam Long id) {
		ModelAndView mav = new ModelAndView();
		sucursalService.delete(id);
		mav.setViewName("redirect:/sucursal/");
		return mav;
	}

}

package com.uca.capas.controller;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.uca.capas.domain.Empleado;
import com.uca.capas.domain.Sucursal;
import com.uca.capas.service.EmpleadoService;
import com.uca.capas.service.SucursalService;

@Controller
@RequestMapping("/empleado")
public class EmpleadoController {

	@Autowired
	EmpleadoService empleadoService;

	@Autowired
	SucursalService sucursalService;

	@GetMapping(path = { "/save", "/save/" })
	public ModelAndView crear(@RequestParam("id") Long id, @RequestParam Long code, @ModelAttribute Empleado empleado,
			Model model, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (!model.asMap().containsKey("BindingResult")) {
			if (id == null || id == -1) {
				mav.addObject("empleado", new Empleado());
			} else {
				mav.addObject("empleado", empleadoService.findById(id));
			}
		} else {
			mav.addObject("empleado", (Empleado) model.asMap().get("empleado"));
			((BindingResult) model.asMap().get("BindingResult")).getAllErrors().forEach((element) -> {
				result.addError(element);
			});
		}
		mav.setViewName("empleado");
		mav.addObject("idSuc", code);
		return mav;
	}

	@PostMapping(path = { "/save", "/save/" })
	public ModelAndView save(@RequestParam Long code, @Valid @ModelAttribute Empleado empleado, BindingResult result,
			RedirectAttributes attr) {
		ModelAndView mav = new ModelAndView();
		if (result.hasErrors()) {
			attr.addAttribute("code", code).addAttribute("id",
					empleado.getEmpleadoC() == null ? -1 : empleado.getEmpleadoC());
			attr.addFlashAttribute("BindingResult", result);
			attr.addFlashAttribute("empleado", empleado);
			mav.setViewName("redirect:/empleado/save");
		} else {
			Sucursal suc = sucursalService.getSucursalById(code);
			empleado.setSucursalE(suc);
			empleadoService.save(empleado);
			attr.addAttribute("code", suc.getSucursalC());
			mav.setViewName("redirect:/sucursal/perfil");
		}
		return mav;
	}

	@PostMapping(path = { "/delete", "/delete/" })
	public ModelAndView delete(@RequestParam Integer code) {
		Long id = empleadoService.findById(Long.parseLong("" + code)).getSucursalE().getSucursalC();
		empleadoService.delete(Long.parseLong("" + code));
		ModelAndView mav = new ModelAndView();
		mav.addObject("code", id);
		mav.setViewName("redirect:/sucursal/perfil");
		return mav;
	}

}

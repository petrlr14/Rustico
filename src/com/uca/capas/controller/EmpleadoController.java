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

	@GetMapping("/editar")
	public ModelAndView editar(@RequestParam Long code, Model model) {
		ModelAndView mav = new ModelAndView();
		Empleado emp = empleadoService.findById(code);
		mav.setViewName("empleado");
		mav.addObject("empleado", emp);
		mav.addObject("idSuc", emp.getSucursalE().getSucursalC());
		return mav;
	}

	@GetMapping("/crear")
	public ModelAndView crear(@RequestParam Long code, @ModelAttribute Empleado empleado, Model model,
			BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (!model.asMap().containsKey("BindingResult")) {
			mav.addObject("empleado", new Empleado());
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

	@PostMapping(path = "/save")
	public ModelAndView save(@RequestParam Long code, @Valid @ModelAttribute Empleado empleado, BindingResult result,
			RedirectAttributes attr) {
		ModelAndView mav = new ModelAndView();
		if (result.hasErrors()) {
			attr.addAttribute("code", code);
			attr.addFlashAttribute("BindingResult", result);
			attr.addFlashAttribute("empleado", empleado);
			if (empleado.getEmpleadoC() == null) {
				mav.setViewName("redirect:/empleado/crear");
			} else {
				mav.setViewName("redirect:/empleado/editar");
			}
		} else {
			Sucursal suc = sucursalService.getSucursalById(code);
			empleado.setSucursalE(suc);
			empleadoService.save(empleado);
			mav.setViewName("redirect:/sucursal/perfil");
		}

		return mav;
	}

	@PostMapping(path = "/delete")
	public ModelAndView delete(@RequestParam Integer code) {
		Long id = empleadoService.findById(Long.parseLong("" + code)).getSucursalE().getSucursalC();
		empleadoService.delete(Long.parseLong("" + code));
		ModelAndView mav = new ModelAndView();
		mav.addObject("code", id);
		mav.setViewName("redirect:/sucursal/perfil");
		return mav;
	}

}

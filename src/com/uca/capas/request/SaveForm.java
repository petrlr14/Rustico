package com.uca.capas.request;

import com.uca.capas.domain.Empleado;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Setter
@Getter
public class SaveForm extends Empleado {

	private Long id;

}

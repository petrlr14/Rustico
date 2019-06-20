package com.uca.capas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uca.capas.domain.Usuario;
import com.uca.capas.repository.UsuarioRepository;

@Service
public class UsuarioServiceImpl implements UsuarioService {

	@Autowired
	UsuarioRepository usuarioRepository;

	@Override
	public Usuario findUsuarioLogin(String usuario, String password) {
		return usuarioRepository.findByUUsuarioAndUClave(usuario, password);
	}

	@Override
	public List<Usuario> findAll() {
		return usuarioRepository.findAll();
	}

}

package com.mm.mm.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mm.mm.changepass.ChangePasswordForm;
import com.mm.mm.entity.User;
import com.mm.mm.exceptions.CustomeFieldValidationException;
import com.mm.mm.exceptions.UsernameOrIdNotFound;
import com.mm.mm.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepository;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public Iterable<User> getAllUsers() {
		return userRepository.findAll();
	}

	private boolean checkUsernameAvailable(User user) throws Exception {
		Optional<User> userFound = userRepository.findByUsername(user.getUsername());
		if (userFound.isPresent()) {
			throw new CustomeFieldValidationException("Usuario no disponible", "username");
		}
		return true;
	}

	private boolean checkDuiAvailable(User user) throws Exception {
		Optional<User> userFound = userRepository.findByDui(user.getDui());
		if (userFound.isPresent()) {
			throw new CustomeFieldValidationException("Dui no disponible", "dui");
		}
		return true;
	}

	private boolean checkPasswordValid(User user) throws Exception {
		if (user.getConfirmPassword() == null || user.getConfirmPassword().isEmpty()) {
			throw new CustomeFieldValidationException("Confirma clave es obligatorio", "confirmPassword");
		}

		if (!user.getPassword().equals(user.getConfirmPassword())) {
			throw new CustomeFieldValidationException("¡Ambas contraseñas no coinciden, intenta nuevamente!",
					"password");
		}
		return true;
	}

	@Override
	public User createUser(User user) throws Exception {
		if (checkUsernameAvailable(user) && checkDuiAvailable(user) && checkPasswordValid(user)) {
			String encodedPassword = bCryptPasswordEncoder.encode(user.getPassword());
			user.setPassword(encodedPassword);
			user = userRepository.save(user);
		}
		return user;
	}

	@Override
	public User getUserById(Long id) throws UsernameOrIdNotFound {
		return userRepository.findById(id).orElseThrow(
				() -> new UsernameOrIdNotFound("El ID del usuario no existe o fue eliminado, intenta buscando con otro!"));
	}

	@Override
	public User updateUser(User fromUser) throws Exception {
		User toUser = getUserById(fromUser.getId());
		mapUser(fromUser, toUser);
		return userRepository.save(toUser);
	}

	/**
	 * Map everythin but the password.
	 * 
	 * @param from
	 * @param to
	 */
	protected void mapUser(User from, User to) {
		to.setUsername(from.getUsername());
		to.setFirstName(from.getFirstName());
		to.setLastName(from.getLastName());
		to.setEmail(from.getEmail());
		to.setDui(from.getDui());
		to.setRoles(from.getRoles());
	}

	@Override
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	public void deleteUser(Long id) throws UsernameOrIdNotFound {
		User user = getUserById(id);
		userRepository.delete(user);
	}

	@Override
	public User changePassword(ChangePasswordForm form) throws Exception {
		User user = getUserById(form.getId());

		if (!isLoggedUserADMIN() && !bCryptPasswordEncoder.matches(form.getCurrentPassword(), user.getPassword())) {
			throw new Exception("Contraseña actual invalida");
		}

		if (bCryptPasswordEncoder.matches(form.getNewPassword(),user.getPassword())) {
			throw new Exception("Nuevo debe ser diferente al password actual.");
		}

		if (!form.getNewPassword().equals(form.getConfirmPassword())) {
			throw new Exception("Nueva clave y confirmacion de clave no coinciden.");
		}

		String encodePassword = bCryptPasswordEncoder.encode(form.getNewPassword());
		user.setPassword(encodePassword);
		return userRepository.save(user);
	}

	private boolean isLoggedUserADMIN() {
		// Obtener el usuario logeado
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		UserDetails loggedUser = null;
		Object roles = null;

		// Verificar que ese objeto traido de sesion es el usuario
		if (principal instanceof UserDetails) {
			loggedUser = (UserDetails) principal;

			roles = loggedUser.getAuthorities().stream().filter(x -> "ROLE_ADMIN".equals(x.getAuthority())).findFirst()
					.orElse(null);
		}
		return roles != null ? true : false;
	}

	private User getLoggedUser() throws Exception {
		// Obtener el usuario logeado
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		UserDetails loggedUser = null;

		// Verificar que ese objeto traido de sesion es el usuario
		if (principal instanceof UserDetails) {
			loggedUser = (UserDetails) principal;
		}

		User myUser = userRepository.findByUsername(loggedUser.getUsername())
				.orElseThrow(() -> new Exception("Error obteniendo el usuario logeado desde la sesion."));

		return myUser;
	}
}

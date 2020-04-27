package com.mm.mm.service;


import com.mm.mm.Exceptions.UsernameOrIdNotFound;
import com.mm.mm.changepass.ChangePasswordForm;
import com.mm.mm.entity.User;

public interface UserService {

	public Iterable<User> getAllUsers();

	public User createUser(User user) throws Exception;

	public User getUserById(Long id) throws Exception;
	
	public User updateUser(User user) throws Exception;
	
	public void deleteUser(Long id) throws UsernameOrIdNotFound;
	
	public User changePassword(ChangePasswordForm form) throws Exception;
}

package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Date;
import java.util.Objects;
import com.dao.ControllersDao;
import com.entity.Controllers;
@Service
public class   ControllersService {
 	@Autowired
	private ControllersDao controllersDao;

	public Controllers controllerslogin(String ctnumber,String ctpassword) 
	{
		return controllersDao.controllerslogin(ctnumber,ctpassword);
	}
	public boolean Controllersupdate(Controllers controllers) 
	{
		return controllersDao.Controllersupdate(controllers) > 0;
	}
}

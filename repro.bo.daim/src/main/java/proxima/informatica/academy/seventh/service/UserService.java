package proxima.informatica.academy.seventh.service;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.proxima.common.mail.MailUtility;

import proxima.info.app.DatabaseManagerSingleton;
import proxima.info.app.dto.UserDto;



public class UserService {
	
	private static UserService instance;

	private UserService() {
		
	}

	public static UserService getIstance() {
		if (instance == null) {
			instance = new UserService();
		}
		return instance;
	}

	public boolean login (String email, String password) {
		System.out.println("login - START");
		boolean responseValue = false ;
		UserDto userRetrieved = null;
		try {
			userRetrieved = DatabaseManagerSingleton.getInstance().selectByEmail(email, password);
			responseValue = userRetrieved!=null ;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return responseValue ;
	}
	
	public UserDto selectUser (String id) {
		System.out.println("select user - START");
		boolean responseValue = false ;
		UserDto userRetrieved = null;
		try {
			userRetrieved = DatabaseManagerSingleton.getInstance().selectById(id);
			responseValue = userRetrieved!=null ;
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(responseValue)
			return userRetrieved;
		
		return null ;
	}
	
	public boolean insert(UserDto userToInsert) {
		//insert into DB
		System.out.println("insert");
		boolean response = false;
		
		try {
			
			response = DatabaseManagerSingleton.getInstance().insertUser(userToInsert);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return response;
	}
	
	public boolean insert(String email, String password, String firstname, String lastname, String dateofbirth) throws Exception {
		
		Timestamp regdate = new Timestamp(new Date(0).getTime());
		Integer role = 10;
		String image = "image";
		String note = "nota di servizio";
		boolean enabled = false;
		
		UserDto user = new UserDto();
		user.setEmail(email);
		user.setPassword(password);
		user.setFirstname(firstname);
		user.setLastname(lastname);
		user.setDateofbirth(Date.valueOf("2023-01-17"));
		user.setRegdate(regdate);
		user.setRole(role);
		user.setImgpath(image);
		user.setNote(note);
		user.setEnabled(enabled);
		
		System.out.println("ora chiamo l'altro insert");
		boolean userInserted = insert(user);
		
		if(userInserted) {
//			boolean a = DatabaseManagerSingleton.getInstance().selectByEmail(email);
			String text = "<body> <a href=\"http://localhost:8080/repro.bo.daim/completeRegistration.jsp?id=" + user.getId() + "\">Registrati ora su!</a> </body>";
			boolean mail = MailUtility.sendSimpleMail(user.getEmail(), "Confirm registration", text);
			if(mail) {
				System.out.println("email mandata");
			}
		}
		
		return userInserted;
	}
	
	public ArrayList<UserDto> selectAllUsers(){
		
		ArrayList<UserDto> lista = null;
		
		try {
			lista = DatabaseManagerSingleton.getInstance().selectAll();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lista;
	}

	public boolean deleteUser(int id) {
		
		boolean response = false;
		
		try {
			
			response = DatabaseManagerSingleton.getInstance().deleteUserById(id);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return response;
	}
	
	public boolean updateUser(UserDto userToModify) {
		boolean result = false;
		int id = userToModify.getId();
		System.out.println("user service: utente ricevuto" + userToModify.getEmail());
		try {
			result = DatabaseManagerSingleton.getInstance().updateUserById(id, userToModify);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean insertPassword(int id, String password) {
		boolean result = false;
		String idToFind = "" + id;
		UserDto user=null;
		try {
			 user = DatabaseManagerSingleton.getInstance().selectById(idToFind);
			 user.setPassword(password);
			 result = DatabaseManagerSingleton.getInstance().updateUserById(id, user);
			 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}

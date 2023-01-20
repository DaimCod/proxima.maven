package proxima.informatica.academy.seventh.users;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.info.app.dto.UserDto;
import proxima.informatica.academy.seventh.service.UserService;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String dateofbirth = request.getParameter("birthday");
		
		boolean updated = false;
		
		UserDto userToModify = UserService.getIstance().selectUser(id);
		userToModify.setEmail(email);
		userToModify.setFirstname(firstname);
		userToModify.setLastname(lastname);
		userToModify.setDateofbirth(Date.valueOf(dateofbirth));

		System.out.println(userToModify.toString());
		
		try {
			updated = UserService.getIstance().updateUser(userToModify);
			System.out.println("Servlet update: " + updated);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (updated) {
			response.getWriter().append(
					"<body> <h2>User Updated successfully. see users list <a href=\"./users.jsp\">HERE</a></h2>");

		} else {
			response.getWriter()
					.append("<body> <h2>An error occured, please try again <a href=\"./users.jsp\">HERE</a></h2>");
		}
	}

}

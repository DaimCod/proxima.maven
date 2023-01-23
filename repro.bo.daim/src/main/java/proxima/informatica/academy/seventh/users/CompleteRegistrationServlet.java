package proxima.informatica.academy.seventh.users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.info.app.DatabaseManagerSingleton;
import proxima.informatica.academy.seventh.service.UserService;

import java.io.IOException;

/**
 * Servlet implementation class CompleteRegistrationServlet
 */
@WebServlet("/CompleteServlet")
public class CompleteRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompleteRegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pass = request.getParameter("password");
		String re_pass = request.getParameter("confirmPassword");
		String idS = request.getParameter("id");
		
		int id = Integer.parseInt(idS);
		
		if(pass.equals(re_pass) == false) {
			response.getWriter().append("<body> <h2>The 2 password doesn't match, </h2> <a href=\"./completeRegistration.jsp\"> try again!</a> </body>");

		}
		else {
			boolean updated = UserService.getIstance().insertPassword(id, pass);
			if(updated) {
				request.setAttribute("id", idS);
				response.getWriter().append("<body> <h2>You have made it!</h2> <a href=\"./login.jsp\"> login here</a> </body>");
			}
		}
	}

}

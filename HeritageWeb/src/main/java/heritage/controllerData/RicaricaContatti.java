package heritage.controllerData;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import heritage.model.Contacts;
import heritage.model.User;

/**
 * Servlet implementation class RicaricaContatti
 */
@WebServlet("/ricaricaContatti")
public class RicaricaContatti extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RicaricaContatti() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Ricarica contatti da Profilo.jsp
		// session = asked
		int id = Integer.parseInt(request.getParameter("id"));
		List<User> contatti = Contacts.readAcceptedUsers(id);

		// Restituisce un json nella servlet
		ObjectMapper mapper = new ObjectMapper();
		String jsonResult = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(contatti);
		response.getWriter().append(jsonResult);
		response.setContentType("application/json");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

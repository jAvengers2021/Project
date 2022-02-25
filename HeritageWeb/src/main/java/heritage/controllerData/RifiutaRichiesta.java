package heritage.controllerData;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import heritage.model.Contacts;

/**
 * Servlet implementation class RifiutaRichiesta
 */
@WebServlet("/rejectRequest")
public class RifiutaRichiesta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RifiutaRichiesta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Rifiuta richiesta da Profilo.jsp
		// session = asked
		int asker = Integer.parseInt(request.getParameter("asker"));
		int session = Integer.parseInt(request.getParameter("session"));		
		Contacts.rejectRequest(asker, session);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

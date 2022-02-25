package heritage.controllerData;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import heritage.model.Contacts;

/**
 * Servlet implementation class MandaRichiestaAmiciziaServlet
 */
@WebServlet("/sendRequest")
public class InviaRichiesta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InviaRichiesta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Invia richiesta da VisualizzaCommentatore.jsp
		// session = asker
		int session = Integer.parseInt(request.getParameter("session"));
		int asked = Integer.parseInt(request.getParameter("asked"));
		Contacts.sendRequest(session, asked);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

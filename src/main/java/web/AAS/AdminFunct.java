package web.AAS;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/AdminFunct")
public class AdminFunct extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    
    public AdminFunct() {
        super();
    }

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("delete") != null && !request.getParameter("delete").isEmpty()) {
			String userName = request.getParameter("delete");
	        MemberController memberCtrl = new MemberController();
	        try {
				memberCtrl.deleteUser(userName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(request.getParameter("adminer") != null && !request.getParameter("adminer").isEmpty()) {
			String userName = request.getParameter("adminer");
	        MemberController memberCtrl = new MemberController();
	        try {
				memberCtrl.makeAdmin(userName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(request.getParameter("message") != null && !request.getParameter("message").isEmpty()) {
			String userName = request.getParameter("message");
			
            HttpSession session = request.getSession();
            session.setAttribute("getMessage", userName);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin2.jsp");
            dispatcher.forward(request, response);
		}
		
	}
}

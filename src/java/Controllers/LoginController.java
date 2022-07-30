/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Database.Database;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginController extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String operation = request.getParameter("operation");
		String url = "login.jsp";
		
		if (operation.equals("login")) {
			String user = request.getParameter("user"), pass = request.getParameter("password");
			int x = -1;
			try {				
				String query = "SELECT d.IdDocente, d.nombre, d.apellidos FROM docente d WHERE d.DNI = '%s' AND d.password = '%s'";
				ResultSet rs = Database.query(query, user, pass);
				if (rs.next()) {
                                    do {
                                        request.getSession().setAttribute("loggedIn", rs.getInt("IdDocente"));
                                        String nombreCompleto = rs.getString("nombre") + " " + rs.getString("apellidos");
                                        request.getSession().setAttribute("nombreUsuario", nombreCompleto);
                                        url = "estudiantes";
                                    } while(rs.next()); //repita mientras existan más datos
				} else {
					url = "login.jsp?error=1";
				}
				System.out.println(x);
			} catch (SQLException ex) {
                            System.out.println(ex);
                            //Logger.getLogger(Estudiante.class.getName()).log(Level.SEVERE, null, ex);
			}
		} else if (operation.equals("logout")) {
			request.getSession().invalidate();
			url = "login.jsp";
		}
		response.sendRedirect(url);
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}

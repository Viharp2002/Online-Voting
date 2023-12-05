import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class check extends HttpServlet {
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String voterid = request.getParameter("Voter_id");
            String Password = request.getParameter("password");
            String role = request.getParameter("Role");

            int check = 0;

            try 
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/voting","root","");
                PreparedStatement pt = con.prepareCall("select * from voting1");
                ResultSet rs = pt.executeQuery();

                if (!rs.next()) {
                    out.println("<html><head></head><body onload=\"alert('Database is Empty')\"></body></html>");
                    RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                    rd.include(request, response);
                    
                } 
                else 
                {
                    PreparedStatement ptt = con.prepareCall("select * from voting1");
                    ResultSet rs1 = ptt.executeQuery();
                    while (rs1.next())
                    {
                        String v = rs1.getString("voterid");
                        String p = rs1.getString("password");
                        String r = rs1.getString("role");

                        if (voterid.equals(v) && p.equals(Password) && r.equals("1")) 
                        {
                             HttpSession session=request.getSession();  
                             session.setAttribute("voterid",v);
                             response.sendRedirect("Vote.jsp");
                             check = 1;
                        }
                        
                        if (voterid.equals(v) && p.equals(Password) && r.equals("0")) 
                        {
                            HttpSession session=request.getSession();  
                            session.setAttribute("voterid",v);
                            response.sendRedirect("AdminHome.html");
                            check = 1;
                        }
                    }
                    rs1.close();
                    if (check == 0) {
                        out.println("<html><head></head><body onload=\"alert('Wrong Details')\"></body></html>");
                        RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                        rd.include(request, response);
                    }
                }
                rs.close();
                con.close();

            } catch (Exception e) {
                out.println(e);
            }
        }
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

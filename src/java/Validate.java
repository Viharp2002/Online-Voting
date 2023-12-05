import java.io.*;
import jakarta.servlet.ServletException;
import java.sql.*;
import jakarta.servlet.http.*;
 
public class Validate extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
             
            String name = request.getParameter("Username");
            String voterid = request.getParameter("voterid");
            String password=request.getParameter("Upassword");
            String address = request.getParameter("Address");
            String role = request.getParameter("rolevalue");
            int Voted=0;
            
        
            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/voting","root","");
               PreparedStatement pt = con.prepareCall("insert into voting1 values(?,?,?,?,?,?)");
               pt.setString(1,voterid);
               pt.setString(2,name);
                pt.setString(3,password);
                 pt.setString(4, address);
                  pt.setString(5,role);
                   pt.setInt(6,Voted);
                   int ii = pt.executeUpdate();
                   
                   
                   if(ii==1)
                   {
                     response.sendRedirect("Login.jsp");    
                   }
                     
               
            }
            catch(Exception e)
            {
                out.println(e);
            }
            
    
//            Cookie Voterid = new Cookie("id",request.getParameter("voterid"));
//            Cookie Password = new Cookie("password",request.getParameter("Upassword"));
//            Cookie Role = new Cookie("Role",request.getParameter("rolevalue"));
//            response.addCookie(Voterid);
//            response.addCookie(Password);
//            response.addCookie(Role);
            
             
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

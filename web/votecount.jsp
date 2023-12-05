<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@page import="java.io.*" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>
<%@page import="java.sql.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vote Counter</title>
    </head>
    <body>
        <%!
            Statement st = null;//to update vote status of respective user

            Statement st1 = null;//to update votes of respective party


        %>
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/voting","root","");

//      ========================          Changing State of user to voted       ===========================================
            st = con.createStatement();
            String vid = (String) session.getAttribute("voterid");
            String sql = "update voting1 " + "set voted=1 WHERE voterid=" + vid;

            int c = st.executeUpdate(sql);

            if (c == 1) {
                
            } else {
                out.println("<html><head></head><body onload=\"alert('Invalid...Please try again')\"></body></html>");
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.include(request, response);
            }

//      ========================          Incrementing vote       ===========================================
            int v=0;
            String pname = request.getParameter("votebuttons");// to know which parties button is pressed

            ResultSet rs = st.executeQuery("select votes,partyname from party1");
            st1 = con.createStatement();
            while (rs.next()) {
                String n = rs.getString("partyname");

                if (pname.equals(n)) {
                    v = rs.getInt("votes");
                    break;
                }
            }
             
            System.out.println("Votes =======>>>>>>> "+v);
            System.out.println("party name =======>>>>>>> "+pname);
            String sql1="update party1 set votes="+(v+1)+" where partyname='"+pname+"'";
            int c1 = st1.executeUpdate(sql1);
            if (c1 == 1) {
                out.println("<html><head></head><body onload=\"alert('Votes of your selected party has been incremented by 1 Successfully')\"></body></html>");
                RequestDispatcher rd = request.getRequestDispatcher("Vote.jsp");
                rd.include(request, response);
            } else {
                out.println("<html><head></head><body onload=\"alert('Something Went Wrong Please try again vote note incremented')\"></body></html>");
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.include(request, response);
            }

            st.close();
            st1.close();
        %>



    </body>
</html>

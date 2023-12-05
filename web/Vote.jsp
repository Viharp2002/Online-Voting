<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Profile</title>
        <link rel="stylesheet" href="stylesheet.css">
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/voting" user="root" password="" scope="session" />
    </head>
    <body>


        <%! 
            // parameters to be fetched            
            String uname = null;
            String Address = null;
            String voterid = null;
            String r;
            String status ;
        %>




        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/voting","root","");
            PreparedStatement pt = con.prepareCall("select * from voting1");
            ResultSet rs = pt.executeQuery();
            voterid =  (String)session.getAttribute("voterid");

            while (rs.next()) {
                String v = rs.getString("voterid");

                if (voterid.equals(v)) {
                    uname = rs.getString("name");
                    Address = rs.getString("address");
                    r = rs.getString("role");
                    status = rs.getString("Voted");

                    break;
                }
            }

        %>

        <!-- ========================================= HTML for User Detials is Written Below ========================================================================= -->
        <div class="grid-container">
            <div class="card">
                <img class="photo" src="img.png" alt="Profile Photo">
                <br>           
                <span class="attribute">Name :</span>
                <span class="value"><%=uname%></span>
                <br>
                <span class="attribute">Address :</span>
                <span class="value"><%=Address%></span>
                <br>
                <%
                    if (status.equals("0")) {
                %>
                <br>
                <span class="attribute">Status :</span> <strong style="color: red">Note Voted - Please Vote</strong>
                <br>
                <%
                    }
                %>

                <%
                    if (status.equals("1")) {
                %>
                <br>
                <span class="attribute">Status :</span><strong style="color: green">You have Voted Successfully</strong>  
                <br><br>
                 <span class="attribute">IMPORTANT :</span><strong style="color: red">Before giving your precious vote, kindly check the correct Partyname, Party Leader and PartyLogo</strong>
                <%
                    }
                %>            
            </div>

            <!-- ========================================= User Detials is Over ========================================================================= -->

            <!-- Getting Parties Data -->


            <div class="party">
                <sql:query dataSource="${db}" var="rs">  
                    SELECT * from party1;
                </sql:query> 

                <table border="2" width="100%">  
                    <tr>  
                        <th>Election Party Name</th>  
                        <th>Election Leader Name</th>  
                        <th>Identification Logo</th>
                        <th>Vote</th>
                    </tr>  
                    <c:forEach var="table" items="${rs.rows}">  
                        <tr>  
                            <td><c:out value="${table.partyname}"/></td>  
                            <td><c:out value="${table.leaderName}"/></td>  
                            <td> <img src="PhotoServlet?partyname=${table.partyname}" width="50px" height="50px" />
                            </td>  
                            <td>
                                <form action="votecount.jsp">
                                    <%
                                        if (status.equals("1")) 
                                        {
                                    %>
                                    <input type="submit" name="votebuttons" value="${table.partyname}" disabled>
                                    <%
                                        } 
                                        else 
                                        {
                                    %>
                                    <input type="submit" name="votebuttons" value="${table.partyname}">
                                    <%
                                        }
                                    %>
                                </form>
                            </td>
                        </tr>  
                    </c:forEach>  
                </table>
            </div>
        </div>
    </body>
</html>

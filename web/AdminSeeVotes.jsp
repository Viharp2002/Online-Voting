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
        <title>Admin Vote Seeing Page</title>
        <link rel="stylesheet" href="stylesheet.css">
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/voting" user="root" password="" scope="session" />
    </head>
    <body>
        <sql:query dataSource="${db}" var="rs">  
            SELECT * from party1;
        </sql:query> 


        <table border="2" width="100%">  
            <tr>  
                <th>Party Name</th>  
                <th>Leader Name</th> 
                <th>Party Votes</th> 
                <th>Party Logo</th>   
            </tr>  
            <c:forEach var="table" items="${rs.rows}">  
                <tr>  
                    <td><c:out value="${table.partyname}"/></td>  
                    <td><c:out value="${table.leaderName}"/></td>  
                    <td><c:out value="${table.votes}"/></td>  
                    <td> <img src="PhotoServlet?partyname=${table.partyname}" width="50px" height="50px" />
                        
                    </td>  
                </tr>  
            </c:forEach>  
        </table>

    </body>
</html>

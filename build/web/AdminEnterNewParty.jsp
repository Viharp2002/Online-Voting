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
        <title>New Party Entering Page</title>
    </head>
    <body>
        <form action="PartyEntering" method="post">
            <table>
                <tr>
                <td>
                    Enter Name of Party :
                </td>
                <td>
                    <input type="text" name="partyname">
                </td>
                </tr>
                <tr>
                <td>
                    Enter Name of Party Leader :
                </td>
                <td>
                    <input type="text" name="leadername">
                </td>
                </tr>
                <tr>
                <td>
                    Select Party logo :
                </td>
                <td>
                    <input type="file" name="partylogo" enctype="mul">
                </td>
                <td>
                    <input type="submit" value="submit">
                </td>
                </tr>
                
            </table>
            
            
        </form>
        
        <%
      
%>
    </body>
</html>

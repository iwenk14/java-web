<%-- 
    Document   : success
    Created on : Jan 21, 2011, 11:44:08 PM
    Author     : Gusti Ardias Riantono
--%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<html>
    <head>
        <title>Successfully Login by JSP</title>
    </head>

    <body>
        Successfully login by JSP<br />
        Session Value<br />
        <%
        if (session.getAttribute("username")!= null){
                    out.print("UserName :" + session.getAttribute("username") + "<br>");
        %>


        <a href= "logout.jsp"><b>Logout</b></a>
        <%
        }else {
            response.sendRedirect("index.jsp");
            }
        %>
<br/>
    </body>
</html>
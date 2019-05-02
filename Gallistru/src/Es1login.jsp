<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page import = "java.io.*,java.util.*, java.sql.*" %>

<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <title>XFactor</title>
        <style>
            body {
               margin:15px;
            }
        </style>
    </head>
    <body>
    <% try {
            String connURL = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor.joshua;user=gallistru.mattia;password=xxx123#";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection = DriverManager.getConnection(connURL);
                    
            int utenti = 0;
            String username = request.getParameter("username"); 
            String password = request.getParameter("password");
            
            String sqlUsers = "SELECT COUNT(ID) as eventi FROM Cittadino WHERE username = ? AND password = ?";
            PreparedStatement stmtUsers = connection.prepareStatement(sqlUsers);
            stmtUsers.setString(1, username);
            stmtUsers.setString(2, password);
            ResultSet rsUsers = stmtUsers.executeQuery();
            while (rsUsers.next()) {
                utenti = rsUsers.getInt("eventi");
            }
            %>
            <input type="text" name="evento">
            <input type="submit" value="submit">
            <%
            rsUsers.close();
            if (utenti == 0) { %>
            <script type="text/javascript">
                alert('Credenziali Errate.\nRiprova il login o registrati');
            </script>
            <% } else {
              response.sendRedirect("src/Es1login.html");
            }
            connection.close();
        } catch (Exception e) {
            out.println(e);
        } %>
    </body>
</html>
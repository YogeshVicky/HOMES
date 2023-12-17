<%-- 
    Document   : jsppage1
    Created on : 3 Dec, 2023, 10:16:27 PM
    Author     : Dillibabus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOMES</title>
        <link rel="icon" href="BULB.png" type="image/png">
    </head>
    <body style="background-image: url('images/bg image.jpg'); background-size: 1400px">

        <%
         try{
           
          String uname = request.getParameter("text1");
          String pass = request.getParameter("text2");
          
                    
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/homes", "root", "");

          String query = "SELECT * FROM signup WHERE name=? AND password=?";
          PreparedStatement pst = con.prepareStatement(query);
          pst.setString(1, uname);
          pst.setString(2, pass);

          ResultSet rs = pst.executeQuery();

          boolean status = rs.next();
                     
          if (status) 
          {
             response.sendRedirect("booking.html");
          }             
          else 
          {
           out.println("<center><h1 style='color:red;'>Invalid user or password</h1></center>");
           out.println("<center><a href='index.html'>Back</a></center>");
          }
          con.close();            
      } 
      catch (SQLException ex) {
          out.println(ex.getMessage());
      }
      catch (ClassNotFoundException ex) {
          out.println(ex.getMessage());
      }
        %>
    </body>
</html>

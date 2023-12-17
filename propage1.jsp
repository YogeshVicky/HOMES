<%-- 
    Document   : propage1
    Created on : 6 Dec, 2023, 5:53:08 PM
    Author     : Dillibabus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOMES</title>
        <link rel="icon" href="BULB.png" type="image/png">
    </head>
    <style>
        .container{
            margin-top: 20%;

        }
    </style>
    <body style="background-image: url('images/bg image1.jpg'); background-size: 1650px">
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

          if (uname.equals("Malepro")&& pass.equals("pro123")) 
          { %>
        <form action="male.jsp" method="post">
            <center>
                <div class="container">

                    <h2>Enter Date</h2><br>
                    <table>
                        <tr><td><input type="date" name="date" style="width: 170px;  "/></td>
                            <td> <input type="submit" value="showbooking" name="showbooking"/></td></tr>
                    </table>
                </div>
            </center>
        </form>  

        <%} 
         
        else if (uname.equals("Femalepro")&& pass.equals("pro123")) 

        { %>
        <form action="female.jsp" method="post">
            <center>
                <div class="container">

                    <h2>Enter Date</h2><br>
                    <table>
                        <tr><td><input type="date" name="date" style="width: 170px;  "/></td>
                            <td> <input type="submit" value="showbooking" name="showbooking"/></td></tr>
                    </table>
                </div>
            </center>
        </form> 

        <% }
          else{ %>
    <center><h1 style='color:red;'>Invalid user or password</h1></center>
        <% }
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

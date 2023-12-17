<%-- 
    Document   : jsppage2
    Created on : 3 Dec, 2023, 8:44:22 PM
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
    <body style="background-image: url('images/bg image.jpg'); background-size: 1400px">
        <%
         try{
                
                String name = request.getParameter("text1");
                session.setAttribute("uname",name);
                String pass = request.getParameter("text2");
                /*String email = request.getParameter("text3");
                String phone = request.getParameter("text4");
                String address = request.getParameter("text5");
                String city = request.getParameter("text6");
                String landmark = request.getParameter("text7");
                String pincode = request.getParameter("text8");*/
                      
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/homes", "root", "");
                String ckquery = "select * from signup where name=?";
               // String ckquery1 = "select * from customersignup where phone=?";
                
                PreparedStatement ckpst = con.prepareStatement(ckquery);
               // PreparedStatement ckpst1 = con.prepareStatement(ckquery1);
                
                ckpst.setString(1,name);
               // ckpst1.setString(1,phone);
                ResultSet rs = ckpst.executeQuery();
               // ResultSet rs1 = ckpst1.executeQuery();
               
                if(rs.next())
                {
                   out.println("<center><h2 style='color:red';>!!! user name or phone already taken please try someother !!!</h2></center>");
                }
               
                else{
                String query = "insert into signup (name, password) values(?,?);" ;
                PreparedStatement pst = con.prepareStatement(query);
               
                pst.setString(1,name);
                pst.setString(2, pass); 
                           
                pst.executeUpdate();
               
                out.println("<center><h1>Registration successful</h1></center>");
                out.println("<center><a href='index.html' style='text-decoration:none'>Login</a></center>");
            }
                con.close();
   
             }
            
          catch (SQLException ex) 
             {
               out.println(ex.getMessage());
             } 
          catch (ClassNotFoundException ex) 
             {
               out.println(ex.getMessage());
             } 
          catch (Exception ex) 
             {
              out.println(ex.getMessage());
             }
 
        %>
    </body>
</html>

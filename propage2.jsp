<%-- 
    Document   : propage2
    Created on : 6 Dec, 2023, 5:53:19 PM
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
                String pass = request.getParameter("text2");
                String email = request.getParameter("text3");
                String phone = request.getParameter("text4");
                String idproof = request.getParameter("text5");
                String address = request.getParameter("text6");
                String city = request.getParameter("text7");
                String landmark = request.getParameter("text8");
                String pincode = request.getParameter("text9");
                String gender = request.getParameter("gender");
   
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/homes", "root", "");
                String ckquery1 = "select * from prosignup where name=?";
                String ckquery2 = "select * from prosignup where phone=?";
                String ckquery3 = "select * from prosignup where idproof=?";
                
                PreparedStatement ckpst1 = con.prepareStatement(ckquery1);
                PreparedStatement ckpst2 = con.prepareStatement(ckquery2);
                PreparedStatement ckpst3 = con.prepareStatement(ckquery3);
                
                ckpst1.setString(1,name);
                ckpst2.setString(1,phone);
                ckpst3.setString(1,idproof);
                
                ResultSet rs1 = ckpst1.executeQuery();
                 ResultSet rs2 = ckpst2.executeQuery();
                  ResultSet rs3 = ckpst3.executeQuery();
               
                if(rs1.next() || rs2.next() || rs3.next())
                {
                   out.println("<center><h2 style='color:red';>!!! user name, phone, id already taken please try someother !!!</h2></center>");
                }
               
                else{
                String query = "insert into prosignup (name, password, email, phone,idproof, address, city, landmark, pincode,gender) values(?,?,?,?,?,?,?,?,?,?);" ;
                PreparedStatement pst = con.prepareStatement(query);
               
                pst.setString(1, name);
                pst.setString(2, pass); 
                pst.setString(3, email);
                pst.setString(4, phone);
                pst.setString(5, idproof);
                pst.setString(6, address);
                pst.setString(7, city);
                pst.setString(8, landmark);
                pst.setString(9, pincode);
                pst.setString(10,gender);
                pst.executeUpdate();
               
                out.println("<center><h1>Registration successful</h1></center>");
                out.println("<center><a href='prologin.html' style='text-decoration:none'>Login</a></center>");
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
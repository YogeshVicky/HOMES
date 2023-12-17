<%-- 
    Document   : booking
    Created on : 12 Dec, 2023, 10:45:16 PM
    Author     : Dillibabus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!int amt1=0,amt2=0,amt3=0,amt4=0,amt5=0,amt6=0,amt7=0,amt8=0,amt9=0,amt10=0,amt11=0,amt12=0,amt13=0,amt14=0;%>
        <%
         try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/homes", "root", "");
                String query = "INSERT into booking (uname,contact,address,socket,swtich,regulator,plug,cfan,tfan,bfan,efan,cfl,led,splight,wire5,wire10,wirelong,amount,bookdate,gender) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
                PreparedStatement pst = con.prepareStatement(query);
                                  
                String name = request.getParameter("text1");
                session.setAttribute("uname",name);
               // response.sendRedirect("mybooking.jsp");
                
                String phone = request.getParameter("text2");
                String address = request.getParameter("text3");
                
                String date = request.getParameter("date");
                session.setAttribute("bookdate",date);
                
                String gender = request.getParameter("gender");
                pst.setString(1,name);
                pst.setString(2,phone);
                pst.setString(3,address);
                pst.setString(19,date);
                pst.setString(20,gender);
                                               
                int total=0;
                
                int socket=0,swit=0,regul=0,plug=0,cfan=0,tfan=0,bfan=0,efan=0,cfl=0,led=0,splight=0,wire5=0,wire10=0,wirelong=0;
           
            if(socket>=0)
            {
            socket = Integer.parseInt(request.getParameter("socket"));
            session.setAttribute("count1",socket);
            amt1=socket*150;
            pst.setInt(4,socket);
            }
            
            if(swit>=0)
            {
            swit = Integer.parseInt(request.getParameter("switch"));
            session.setAttribute("count2",swit);
            amt2=swit*200;
            pst.setInt(5,swit);
            }
            
            if(regul>=0)
            {
            regul = Integer.parseInt(request.getParameter("regulator"));
            session.setAttribute("count3",regul);
            amt3=regul*150;
            pst.setInt(6,regul);
            }
            
            if(plug>=0)
            {
            plug = Integer.parseInt(request.getParameter("plug"));
            session.setAttribute("count4",plug);
            amt4=plug*100;
            pst.setInt(7,plug);
            }
            
            if(cfan>=0)
            {
            cfan = Integer.parseInt(request.getParameter("cfan"));
            session.setAttribute("count5",cfan);
            amt5=cfan*250;
            pst.setInt(8,cfan);
            }
            
            if(tfan>=0)
            {
            tfan = Integer.parseInt(request.getParameter("tfan"));
            session.setAttribute("count6",tfan);
            amt6=tfan*200;
            pst.setInt(9,tfan);
            }
            
            if(bfan>=0)
            {
            bfan = Integer.parseInt(request.getParameter("bfan"));
            session.setAttribute("count7",bfan);
            amt7=bfan*350;
            pst.setInt(10,bfan);
            }
            
            if(efan>=0)
            {
            efan = Integer.parseInt(request.getParameter("efan"));
            session.setAttribute("count8",efan);
            amt8=efan*175;
            pst.setInt(11,efan);
            }
            
            if(cfl>=0)
            {
            cfl = Integer.parseInt(request.getParameter("cfl"));
            session.setAttribute("count9",cfl);
            amt9=cfl*150;
            pst.setInt(12,cfl);
            }
            
            if(led>=0)
            {
            led = Integer.parseInt(request.getParameter("led"));
            session.setAttribute("count10",led);
            amt10=led*175;
            pst.setInt(13,led);
            }
            
            if(splight>=0)
            {
            splight = Integer.parseInt(request.getParameter("splight"));
            session.setAttribute("count11",splight);
            amt11=splight*250;
            pst.setInt(14,splight);

            }
            
            if(wire5>=0)
            {
            wire5 = Integer.parseInt(request.getParameter("wire5"));
            session.setAttribute("count12",wire5);
            amt12=wire5*350;
            pst.setInt(15,wire5);
            }
            
            if(wire10>=0)
            {
            wire10 = Integer.parseInt(request.getParameter("wire10"));
            session.setAttribute("count13",wire10);
            amt13=wire10*550;
            pst.setInt(16,wire10);
            }
            
            if(wirelong>=0)
            {
            wirelong = Integer.parseInt(request.getParameter("wirelong"));
            session.setAttribute("count14",wirelong);
            amt14=wirelong*550;
            pst.setInt(17,wirelong);
            } 
            
            total= amt1+amt2+amt3+amt4+amt5+amt6+amt7+amt8+amt9+amt10+amt11+amt12+amt13+amt14;
            pst.setInt(18,total);
            session.setAttribute("amount",total);
            pst.executeUpdate();
             
            response.sendRedirect("invoice.jsp");
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

<%-- 
    Document   : invoice
    Created on : 14 Dec, 2023, 10:10:06 PM
    Author     : Dillibabus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>   

    <style>
        table {

            text-align: center;
            margin-left: 488px;
            backdrop-filter: blur(20px);
        }
        .inv td{
            margin-top: 50px;
            background-color: black;
            color: cyan;
        }

        header{
            background-color: black;
            color:yellow;
            overflow:hidden;
            width: 100%;
            border-radius: 30px;

        }
        .navi h1,ul,li,h3 {
            display: inline-flex;
        }
        .navi h1{
            margin-left: 20px;

        }
        .navi ul li{
            margin-left: 415px;
        }
        .navi h3{
            margin-top: 20px;
            margin-left: 380px ;
        }

        header{
            color: cyan;
        }
        .tks{
            background-color:black;
            color: cyan;
            text-align: center;
            padding: 30px;
            margin-top: 70px;
            font-size: 18px;
        }
        body {
            margin: 0;
            padding: 0;
            background-image: url('images/tool.jpg');
            background-size: cover;
            backdrop-filter: blur(15px);

        }
        .proceed input{
        background-color: black;
        border: none;
        color: cyan;
        padding: 16px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        transition-duration: 0.4s;
        cursor: pointer;
        border-radius: 10px;
        width: 150px;
        margin-top: 40px;
        
    }
    .proceed input:hover{
        background-color: green;
        color: white;
    }

    .mybooking input[type="button"]{

        height: 30px;
        width: 120px;
        margin-top: 20px;
        margin-left: 89%;
    }
    </style>

    <body style=background-size: 1600px;">
        <%         
            try{   
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/homes", "root", "");
                   PreparedStatement pst1 = con.prepareStatement("SELECT MAX(bookid) FROM booking WHERE uname=?;");
                   String name = (String)session.getAttribute("uname");
                   String bookdate = (String)session.getAttribute("bookdate");
                   pst1.setString(1,name);
                   ResultSet rs1 = pst1.executeQuery();
            
                   int count1=0,count2=0,count3=0,count4=0,count5=0,count6=0,count7=0,
                       count8=0,count9=0,count10=0,count11=0,count12=0,count13=0,count14=0;
                   int bookid=0;     
                           
                    count1 =(Integer)session.getAttribute("count1");  
                    count2 =(Integer)session.getAttribute("count2");
                    count3 =(Integer)session.getAttribute("count3");
                    count4 =(Integer)session.getAttribute("count4");
                    count5 =(Integer)session.getAttribute("count5");
                    count6 =(Integer)session.getAttribute("count6");
                    count7 =(Integer)session.getAttribute("count7");
                    count8 =(Integer)session.getAttribute("count8");
                    count9 =(Integer)session.getAttribute("count9");
                    count10=(Integer)session.getAttribute("count10");
                    count11=(Integer)session.getAttribute("count11");
                    count12=(Integer)session.getAttribute("count12");
                    count13=(Integer)session.getAttribute("count13");
                    count14=(Integer)session.getAttribute("count14");
                    
        %>
        <header>
            <div class="navi">
                <nav>
                    <h1>HOM&#9889;ES</h1> 
                    <ul>
                        <li>
                            <h1>INVOICE</h1>
                            <h3> <%= "Booking date: "%><%=bookdate %> </h3>
                        </li>
                    </ul>
                </nav>
            </div>                    
        </header>

        <% while(rs1.next()){
         bookid = rs1.getInt(1);
          }
        %>

    <center>
        <h2 style="color:cyan; margin-bottom: 30px; margin-top: 30px; background-color: black; display: inline-block;padding: 15px;border-radius: 30px">&#128515; Booking Successful &#128515;</h2>
    </center>
    <div class="inv"> <table border="3" >
            <tr><td width="170" height="50"><b><span style="margin-right: 10px;">NAME:</span></b><b><%=name%></b></td>
                <td width="170" height="50"><b><span style="margin-right: 10px">BOOKING ID:</span></b><b><%=bookid%></b></td></tr>
        </table>
        <div class="ser"><table border="3" ><tr><b><th width="170" style="background-color: black; color: cyan;height: 50px">Services</th></b>
                <b><th width="170" style="background-color: black; color: cyan;">Qty</th></b></tr></table>
        </div>

        <%                      
      if(count1>0)
          {%>
        <table border="3">
            <tr><td style="background-color: black; color: cyan; " width="170">Socket</td>
                <td style="background-color: black; color: cyan;" width="170"><%= count1 %></td></tr>
        </table>

        <%}    
        if(count2>0)
        {%>
        <table border="3">
            <tr><td style="background-color: black; color: cyan;" width="170">Switch</td>
                <td style="background-color: black; color: cyan;" width="170"><%= count2 %></td></tr>
        </table>

        <%}    
        if(count3>0)
        {%>
        <table border="3">
            <tr><td style="background-color: black; color: cyan;" width="170">Regulator</td>
                <td style="background-color: black; color: cyan;" width="170"><%= count3 %></td></tr>
        </table>

        <%}   
        if(count4>0)
        {%>
        <table border="3">
            <tr><td style="background-color: black; color: cyan;" width="170">Plug</td>
                <td style="background-color: black; color: cyan;" width="170"><%= count4 %></td></tr>
        </table>

        <%}    
        if(count5>0)
        {%>
        <table border="3">
            <tr><td style="background-color: black; color: cyan;" width="170">Ceiling Fan</td>
                <td style="background-color: black; color: cyan;" width="170"><%= count5 %></td></tr>
        </table>

        <%}
        if(count6>0)
        {%>
        <table border="3">
            <tr><td style="background-color: black; color: cyan;" width="170">Table Fan</td>
                <td style="background-color: black; color: cyan;" width="170"><%= count6 %></td></tr>
        </table>

        <%}   
        if(count7>0)
        {%>
        <table border="3">
            <tr><td style="background-color: black; color: cyan;" width="170">BLDC Fan</td>
                <td style="background-color: black; color: cyan;" width="170"><%= count7 %></td></tr>
        </table>

        <%}   
        if(count8>0)
        {%>
        <table border="3">
            <tr><td style="background-color: black; color: cyan;" width="170">Exhaust Fan</td>
                <td style="background-color: black; color: cyan;" width="170"><%= count8 %></td></tr>
        </table>

        <%}    
        if(count9>0)
        {%>
        <table border="3">
            <tr><td style="background-color: black; color: cyan;" width="170">CFL</td>
                <td style="background-color: black; color: cyan;" width="170"><%= count9 %></td></tr>
        </table>

        <%}   
        if(count10>0)
        {%>
        <table border="3">
            <tr><td style="background-color: black; color: cyan;" width="170";>LED LIGHT</td>
                <td style="background-color: black; color: cyan;" width="170"><%= count10 %></td></tr>
        </table>

        <%}
        if(count11>0)
        {%>
        <table border="3">
            <tr><td style="background-color: black; color: cyan;" width="170">Spot Light</td>
                <td style="background-color: black; color: cyan;" width="170"><%= count11 %></td></tr>
        </table>

        <%}  
        if(count12>0)
        {%>
        <table border="3">
            <tr><td style="background-color: black; color: cyan;" width="170">Wire 5mts</td>
                <td style="background-color: black; color: cyan;" width="170"><%= count12 %></td></tr>
        </table>

        <%}   
        if(count13>0)
        {%>
        <table border="3">
            <tr><td style="background-color: black; color: cyan;" width="170">Wire 10mts</td>
                <td style="background-color: black; color: cyan;" width="170"><%= count13 %></td></tr>
        </table>

        <%}  
        if(count14>0)
        {%>
        <table border="3">
            <tr><td style="background-color: black; color: cyan;" width="170">Wire 10+</td>
                <td style="background-color: black; color: cyan;" width="170"><%= count14 %></td></tr>
        </table>

        <%}
         
            }

                  catch (SQLException ex) 
                  {
                    out.println(ex.getMessage());
                  }
                  catch (ClassNotFoundException ex) 
                  {
                    out.println(ex.getMessage());
                  }

            int amount= (Integer) session.getAttribute("amount");
        %>
        <table border="3">
            <tr><td width="170" style="background-color: black; color: cyan; height: 50px"><b>Total Cost</b></td>
                <td width="170" style="background-color: black; color: cyan;"><b><%= amount %></b></td></tr>
        </table> 
    </div>
    
    <div class="proceed">
                <center>
                    <input type="button" value="Back" onclick="redirectToIndex()" />
                </center>
            </div>

            <script>
                function redirectToIndex() {
                    window.location.href = 'booking.html';
                }
            </script>
    
    
    
    <div class="tks">
        &#128522;
        <p>Thank you for choosing  HOM&#9889;ES!  We appreciate your interest. 
            Our  HOM&#9889;ES  professional team will be in touch with you soon to assist with any inquiries or services you may require. 
            We look forward to serving you!</p>
    </div>
</body>
</html>
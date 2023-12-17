<%-- 
    Document   : admin
    Created on : 13 Dec, 2023, 8:57:22 PM
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
        table th,tr{
            font-size: 15px;

            color: black;
            border-color: black;

        }
        table{
            backdrop-filter: blur(40px)
        }
        h1,li,ul{
            display: inline-flex;
        }
        header{
            width: 100%;
            overflow: hidden;
            background-color: black;
            margin-bottom: 60px;
            border-radius: 30px;
        }
        .navi{
            width :100%;
        }
        li{
            margin-left: 430px;
        }

        h1{
            margin-left: 20px;
        }
        h3{
            margin-left: 390px;
        }
        header{
            color: cyan;
        }
        table th,td{
            background-color: black;
            color: cyan;
        }
    </style>



    <body style="background-image: url('images/yel.jpg'); background-size: 1600px; backdrop-filter: blur(8px);">
        <header>
            <div class="navi">
                <nav>
                    <h1>HOM&#9889;ES</h1> 
                    <ul>
                        <li>
                            <h1>Admin</h1>
                            <h3 id="datetime"></h3>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
        <script>
            var now = new Date();
            var datetime = now.toLocaleString();
            document.getElementById("datetime").innerHTML = datetime;
        </script>
        <%
                   try{
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/homes", "root", "");
                  // String selectdate = request.getParameter("date");
                   PreparedStatement pst1 = con.prepareStatement("select*from booking;") ;
                   ResultSet rs1 = pst1.executeQuery();
                   
        %> 


        <table border="4" height="70" width="100%" margin-left="auto" margin-right="auto">
            <tr>
                <th width="50">Booking ID</th>
                <th width="104">Customer Name</th>
                <th width="98">Contact</th>
                <th width="100">Address</th>
                <th width="40">SOC</th>
                <th width="40">SWT</th>
                <th width="40">REG</th>
                <th width="40">PLG</th>
                <th width="40">CFN</th>
                <th width="40">TFN</th>
                <th width="40">BFN</th>
                <th width="40">EFN</th>
                <th width="40">CFL</th>
                <th width="40">LED</th>
                <th width="40">SLT</th>
                <th width="40">W5</th>
                <th width="40">W10</th>
                <th width="40">W+</th>
                <th width="60">Rs.</th>
                <th width="90">DATE</th>
                <th width="58">GEN</th>

            </tr> 
        </table>

        <%
        while(rs1.next()){
        int bookid = rs1.getInt("bookid");
        String name = rs1.getString("uname");
        String contact = rs1.getString("contact");
        String address = rs1.getString("address");
        int socket = rs1.getInt("socket");
        int swtich = rs1.getInt("swtich");
        int regulator = rs1.getInt("regulator");
        int plug = rs1.getInt("plug");
        int cfan = rs1.getInt("cfan");
        int tfan = rs1.getInt("tfan");
        int bfan = rs1.getInt("bfan");
        int efan = rs1.getInt("efan");
        int cfl = rs1.getInt("cfl");
        int led = rs1.getInt("led");
        int splight = rs1.getInt("splight");
        int wire5 = rs1.getInt("wire5");
        int wire10 = rs1.getInt("wire10");
        int wirelong= rs1.getInt("wirelong");                   
        int amount= rs1.getInt("amount");                   
        String bookdate= rs1.getString("bookdate");                   
        String gender= rs1.getString("gender");                   
        %>
        <table border="4" width="100%">
            <tr>
                <td width="50"><center><%=bookid%></center></td>
        <td width="106"><center><%=name%></center></td>
    <td width="98"><center><%=contact%></center></td>
<td width="100"><center><%=address%></center></td>
<td width="40"><center><%=socket%></center></td>
<td width="40"><center><%=swtich%></center></td>
<td width="40"><center><%=regulator%></center></td>
<td width="40"><center><%=plug%></center></td>
<td width="40"><center><%=cfan%></center></td>
<td width="40"><center><%=tfan%></center></td>
<td width="40"><center><%=bfan%></center></td>
<td width="40"><center><%=efan%></center></td>
<td width="40"><center><%=cfl%></center></td>
<td width="40"><center><%=led%></center></td>
<td width="40"><center><%=splight%></center></td>
<td width="40"><center><%=wire5%></center></td>
<td width="40"><center><%=wire10%></center></td>
<td width="40"><center><%=wirelong%></center></td>
<td width="60"><center><%=amount%></center></td>
<td width="90"><center><%=bookdate%></center></td>
<td width="58"><center><%=gender%></center></td>
</tr>

</table>



<%}
                      
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
                  
            
%>
</body>
</html>

<%-- 
    Document   : task5
    Created on : May 14, 2021, 7:11:29 PM
    Author     : DELL
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <h1 align="center"><font><b id="bb">Delete Appointments </b></font> </h1> <br>
<table align="center" cellpadding="5" cellspacing="5" border="1"> 
<tr> 
 
</tr> 
<tr bgcolor="#D3D3D3"> 
    <td style="height:50px;width:100px"><b>ApptID</b></td>
<td style="width:100px"><b>PatID</b></th>
<td style="width:100px"><b>ApptDate</b></th>
<td style="width:100px"><b>Amount</b></th>
<td style="width:100px"><b>Delete</b></th>
</tr> <% try{

     Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            String url="jdbc:mysql://localhost:3306/task1?autoReconnect=true&useSSL=false";
            String username="root";
            String password="root";
            Connection con=DriverManager.getConnection(url,username,password);
            if(con.isClosed()){
                System.out.println("Connection Closed");
            }else{
                System.out.println("Connection Created...");
            }
            String q="select apptid,patid,apptdate,amount from appointmentinfo where amount<50";
            Statement pstmt=con.createStatement();
            
            
            
            ResultSet set=pstmt.executeQuery(q);
            while(set.next()){ 
%> 
<tr bgcolor="#ffffff"> 
 
<td><%=set.getInt(1) %></td>
<td><%=set.getInt(2) %></td> 
<td><%=set.getString(3) %></td>
<td><%=set.getFloat(4) %></td>
<td><a href="DelAppt.jsp?apptid=<%=set.getString(1)%>"><b style="color:blueviolet">Delete</b></a></td>
</tr>
 
<%  } 
 } catch (Exception e) { 
e.printStackTrace(); 
} 
%> 
</table> 
    </body>
</html>

<%-- 
    Document   : task1
    Created on : May 14, 2021, 6:42:46 PM
    Author     : DELL
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task #1</title>
    </head>
    <body>
      <h1 align="center"><font><b id="bb">Number of Appointments by a Clinic</b></font> </h1> <br>
<table align="center" cellpadding="5" cellspacing="5" border="1"> 
<tr> 
 
</tr> 
<tr bgcolor="#D3D3D3"> 
<td style="height:50px;width:100px"><b>Clinic ID</b></td> 
<td style="width:100px"><b>No. of Appointment</b></td> 
<td style="width:100px"><b>Year</b></td>  
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
            String q="select clinicid,count(*),SUBSTRING(apptdate,7) as Year from appointmentinfo group by clinicid,SUBSTRING(apptdate,7)";
            Statement pstmt=con.createStatement();
            
            
            
            ResultSet set=pstmt.executeQuery(q);
            while(set.next()){ 
%> 
<tr bgcolor="#ffffff"> 
 
<td><%=set.getInt(1) %></td> 
<td><%=set.getInt(2) %></td> 
<td><%=set.getString(3)  %></td> 
</tr> 
 
<%  } 
 } catch (Exception e) { 
e.printStackTrace(); 
} 
%> 
</table> 
    </body>
</html>

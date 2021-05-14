<%-- 
    Document   : #2
    Created on : May 14, 2021, 10:27:39 AM
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
        <title>Task #2</title>
    </head>
    <body>
        <h1 align="center"><font><b id="bb">Future Appointment</b></font> </h1> <br>
        <table align="center" cellpadding="5" cellspacing="5" border="1"> 
<tr> 
 
</tr> 
<tr bgcolor="#D3D3D3"> 
<td><b>PatID</b></td> 
<td><b>practiceid</b></td> 
<td><b>lastname</b></td>
<td><b>firstname</b></td> 
<td><b>city</b></td> 
<td><b>state</b></td>
<td><b>gender</b></td> 
<td><b>patientagegroup</b></td> 
<td><b>birthdate</b></td>
<td><b>age</b></td>
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
            String q="select * from patientinfo where patientinfo.PatID NOT IN(SELECT appointmentinfo.patid FROM appointmentinfo)";
            Statement pstmt=con.createStatement();
            
            
            
            ResultSet set=pstmt.executeQuery(q);
            while(set.next()){ 
%> 
<tr bgcolor="#ffffff"> 
 
<td><%=set.getInt(1) %></td> 
<td><%=set.getInt(2) %></td> 
<td><%=set.getString(3) %></td> 
<td><%=set.getString(4) %></td> 
<td><%=set.getString(5) %></td> 
<td><%=set.getString(6) %></td> 
<td><%=set.getString(7) %></td> 
<td><%=set.getString(8) %></td> 
<td><%=set.getString(9) %></td> 
<td><%=set.getInt(10) %></td> 

</tr> 
 
<%  } 
 } catch (Exception e) { 
e.printStackTrace(); 
} 
%> 
</table> 


    </body>
</html>

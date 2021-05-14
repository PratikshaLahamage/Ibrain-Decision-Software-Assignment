<%-- 
    Document   : task4
    Created on : May 14, 2021, 6:34:45 PM
    Author     : DELL
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task #4</title>
    </head>
    <body>
        <br><br><br>   
<table align="center" cellpadding="5" cellspacing="5" border="1"> 
<tr> 
 
</tr> 
<tr bgcolor="#D3D3D3"> 
<td style="height:50px"><b>Procedure Type</b></td> 
<td><b>Clinic Name</b></td> 
<td style="width:100px"><b>Provider</b></td> 
<td style="width:100px"><b>Year</b></td> 
<td style="width:100px"><b>Month</b></td> 
<td style="width:100px"><b>Amounts</b></td> 
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
            String q="select transactioninfo.proceduretype,clinicinfo.clinicname,transactioninfo.prov,SUBSTRING(transactioninfo.proceduredate,-4) as Year, count(DISTINCT  SUBSTRING(transactioninfo.proceduredate,4)) as Month,sum(transactioninfo.amount)as Amount from transactioninfo,clinicinfo where transactioninfo.clinicid=clinicinfo.clinicid group by transactioninfo.proceduretype,transactioninfo.prov,transactioninfo.clinicid,SUBSTRING(transactioninfo.proceduredate,-4)";
            Statement pstmt=con.createStatement();
            
            
            
            ResultSet set=pstmt.executeQuery(q);
            while(set.next()){ 
%> 
<tr bgcolor="#ffffff"> 
 <td><%=set.getString(1) %></td> 
 <td><%=set.getString(2) %></td> 
<td><%=set.getInt(3) %></td> 
<td><%=set.getString(4) %></td> 
<td><%=set.getInt(5) %></td> 
<td><%=set.getFloat(6) %></td> 
</tr> 
 
<%  } 
 } catch (Exception e) { 
e.printStackTrace(); 
} 
%> 
</table> 
    </body>
</html>

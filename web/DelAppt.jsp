<%-- 
    Document   : DelAppt
    Created on : May 13, 2021, 3:22:31 PM
    Author     : DELL
--%>

<%@page import="java.sql.PreparedStatement"%>
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
        
        
        <%
String ApptID=request.getParameter("apptid");
try
{
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            String url="jdbc:mysql://localhost:3306/task1?autoReconnect=true&useSSL=false";
            
            String username="root";
            String password="root";
            Connection con=DriverManager.getConnection(url,username,password);  
String sql="DELETE FROM appointmentinfo WHERE apptid="+ "'" +ApptID+ "'";
PreparedStatement ps = con.prepareStatement(sql);
int i = ps.executeUpdate();

if(i>0){
   out.println("Appointment Deleted Successfully!!!");
   %>
   <h2>Remaining Appointment</h2><br>
   <a href="task5.jsp"><font style="border:grey; border-width:10px; border-style:outset; padding: 10px; margin-left: 30px;font-size: 20px;" onMouseOver="this.style.color='#FF000F'"> Show</font></a>
   <%
}
else{
  out.println("Something Went To Wrong!");
  
}
}
catch(Exception e)
{
System.out.print(e);
out.print("error");
e.printStackTrace();
}
%>



    </body>
</html>

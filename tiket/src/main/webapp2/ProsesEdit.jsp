<!-- TI D - M3119085 - Tri tWulandari -->
/*<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sistem Informasi Pemesanan Tiket Kereta Api</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tiket","root","");
	//Statement ps=con.createStatement();
	String id=request.getParameter("id");
	out.print(id);
	String nama_ka=request.getParameter("nama_ka");	
	String asal=request.getParameter("asal");	
	String tujuan=request.getParameter("tujuan");
	String jamberangkat=request.getParameter("jamberangkat");
	String jamdatang=request.getParameter("jamdatang");
	
	String sql="Update jadwal set nama_ka=?,asal=?,tujuan=?,jamberangkat=?,jamdatang=? where id_jadwal="+id;
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, nama_ka);
	ps.setString(2, asal);
	ps.setString(3, tujuan);
	ps.setString(4, jamberangkat);
	ps.setString(5, jamdatang);
	int i = ps.executeUpdate();
	if(i > 0)
	{
	out.print("Record Updated Successfully");
	}
	else
	{
	out.print("There is a problem in updating Record.");
	}
	
}
catch(Exception e)
{
	out.println("Error : "+e);	
}
%>
</body>
</html>
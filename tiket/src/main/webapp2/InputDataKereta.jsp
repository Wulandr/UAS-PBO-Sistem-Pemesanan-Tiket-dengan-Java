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
	Statement st=con.createStatement();
	
	String nama_KA=request.getParameter("nama_KA");	
	String kelas=request.getParameter("kelas");	
	String status=request.getParameter("status");
	String jumlahkursi=request.getParameter("jumlahkursi");
	
	String qry = "insert into jadwal values(null,'"+nama_KA+"','"+kelas+"','"+status+"','"+jumlahkursi+"')";
	st.executeUpdate(qry);
	out.println("Data inseted successfully");
	String tampil = "select * from data_ka";
	st.executeUpdate(tampil);
	
}
catch(Exception e)
{
	out.println("Error : "+e);	
}
%>
</body>
</html>
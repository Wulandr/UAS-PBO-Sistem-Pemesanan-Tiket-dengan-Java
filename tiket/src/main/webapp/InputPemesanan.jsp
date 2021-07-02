<!-- TI D - Salsha-->
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
	
	String nik=request.getParameter("nik");	
	String nama=request.getParameter("nama");	
	String email=request.getParameter("email");
	String alamat=request.getParameter("alamat");
	String tanggal=request.getParameter("tanggal");
	String nama_ka=request.getParameter("nama_ka");
	
	String qry = "insert into pemesanan values(null,'"+nik+"','"+nama+"','"+email+"','"+alamat+"','"+tanggal+"','"+nama_ka+"')";
	st.executeUpdate(qry);
	out.println("Data inseted successfully");
	
	String tampil = "select * from pemesanan";
	st.executeUpdate(tampil);
	
}
catch(Exception e)
{
	out.println("Error : "+e);	
}
%>
</body>
</html>
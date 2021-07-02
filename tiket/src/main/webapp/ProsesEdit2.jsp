<!-- TI D - Raka -->
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
	String nama_KA=request.getParameter("nama_KA");	
	String kelas=request.getParameter("kelas");	
	String status=request.getParameter("status");
	String jumlahkursi=request.getParameter("jumlahkursi");
	String keterangan=request.getParameter("keterangan");
	
	String sql="Update data_ka set nama_KA=?,kelas=?,status=?,jumlahkursi=?,keterangan=? where id_KA="+id;
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, nama_KA);
	ps.setString(2, kelas);
	ps.setString(3, status);
	ps.setString(4, jumlahkursi);
	ps.setString(5, keterangan);
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
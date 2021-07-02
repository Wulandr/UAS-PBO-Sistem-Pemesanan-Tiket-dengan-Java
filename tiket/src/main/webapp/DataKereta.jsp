<!-- TI D - M3119082 - Sari Eka Nur Marifah -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.util.*"%>
    <%@ page import="com.example.tiket.*"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

    <title>Sistem Informasi Pemesanan Tiket Kereta Api</title>
  </head>
  <body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<div class="container mt-5">
  <%@ include file="Navbar.html" %>
  </br></br>  </br></br>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Nama Kereta</th>
      <th scope="col">Kelas</th>
      <th scope="col">Status</th>
      <th scope="col">Jumlah Kursi</th>
    </tr>
  </thead>
  <tbody>
    <%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tiket","root","");
Statement st=con.createStatement();
String data = "select * from data_KA";
ResultSet res = st.executeQuery(data);
while(res.next()){
	%>
	<tr>
	<td><%=res.getString("nama_KA") %></td>
	<td><%=res.getString("kelas") %></td>
	<td><%=res.getString("status") %></td>
	<td><%=res.getString("jumlahkursi") %></td>
	<!--  <form action="Hapus.jsp" method="POST">
	<input type="hidden" id="id" name="id" value="<%=res.getString("id_KA")%>"></input>
	</form>-->
	<td><a href="Hapus_dataka.jsp?id=<%=res.getString("id_KA")%>"><button type="button" class="btn btn-danger">hapus</button></a></td><td>
	<a href="edit_dataka.jsp?id=<%=res.getString("id_KA")%>"><button type="button" class="btn btn-warning">edit</button></a></td><td>
	<a href="detail.jsp?id=<%=res.getString("id_KA")%>"><button type="button" class="btn btn-info">detail</button></a></td>
	</tr>
	<%
}
%>
  </tbody>
</table>
</div>
</br></br></br></br>
</br></br></br></br>
<div class="container mt-34">
 <%@ include file="Footer.html" %></div>

</html>
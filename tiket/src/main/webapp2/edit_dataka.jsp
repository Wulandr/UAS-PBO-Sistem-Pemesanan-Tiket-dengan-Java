<!-- TI D - Raka Surya -->

<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
  <% 
  Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tiket","root","");
  Statement st=con.createStatement();
  String data = "select * from data_ka where id_KA="+id;
  ResultSet res = st.executeQuery(data);
  while(res.next()){
%>
  
<dir class="container mt-5">
<%@ include file="Navbar.html" %>
 <label for="data_ka" class="form-label"><b>Edit Data KA</b></label>
<form name="data_ka" action="ProsesEdit2.jsp" method="post">

<input type="hidden" name="id" value="<%=res.getString("id_KA") %>">

<div class="mb-3">
    <label for="nama_KA" class="form-label">Nama Kereta Api</label>
    <input type="text" class="form-control" name="nama_KA" value="<%=res.getString("nama_KA") %>" aria-describedby="nama_KA">
  </div>
  
<!--  Nama Kereta : <input type="text" name="nama_ka" />
<br/><br/>-->

<div class="mb-3">
    <label for="kelas" class="form-label">Kelas</label>
    <input type="text" class="form-control" name="kelas" value="<%=res.getString("kelas") %>" aria-describedby="kelas">
  </div>
<!--Asal : <input type="text" name="asal" />  -->

<div class="mb-3">
    <label for="status" class="form-label">Status</label>
    <input type="text" class="form-control" name="status" value="<%=res.getString("status") %>" aria-describedby="status">
  </div>
<!-- Tujuan : <input type="text" name="tujuan" />-->

<div class="mb-3">
    <label for="jumlahkursi" class="form-label">Jumlah Kursi</label>
    <input type="text" class="form-control" name="jumlahkursi" value="<%=res.getString("jumlahkursi") %>" aria-describedby="jumlahkursi">
  </div>
<!-- Jam Berangkat : <input type="text" name="jamberangkat" /> -->

<div class="mb-3">
    <label for="keterangan" class="form-label">Keterangan</label>
    <input type="text" class="form-control" name="keterangan" value="<%=res.getString("keterangan") %>" aria-describedby="keterangan">
  </div>
<!--  Jam Datang : <input type="text" name="jamdatang" />-->


<input type="submit" value="submit" />
</form>
<%
}
%>
</div>
</body>
</html>



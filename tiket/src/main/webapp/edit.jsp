<!-- TI D - M3119085 - Tri Wulandari -->

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
<!-- <%= id %> -->  
  <% 
  Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tiket","root","");
  Statement st=con.createStatement();
  String data = "select * from jadwal where id_jadwal="+id;
  ResultSet res = st.executeQuery(data);
  while(res.next()){
%>
  
<dir class="container mt-5">
<%@ include file="Navbar.html" %>
 <label for="jadwal" class="form-label"><b>Edit Jadwal Kereta</b></label>
<form name="jadwal" action="ProsesEdit.jsp" method="post">

<input type="hidden" name="id" value="<%=res.getString("id_jadwal") %>">

<div class="mb-3">
    <label for="nama_ka" class="form-label">Nama Kereta</label>
    <input type="text" class="form-control" name="nama_ka" value="<%=res.getString("nama_ka") %>" aria-describedby="nama_ka">
  </div>
  
<!--  Nama Kereta : <input type="text" name="nama_ka" />
<br/><br/>-->

<div class="mb-3">
    <label for="asal" class="form-label">Asal</label>
    <input type="text" class="form-control" name="asal" value="<%=res.getString("asal") %>" aria-describedby="asal">
  </div>
<!--Asal : <input type="text" name="asal" />  -->

<div class="mb-3">
    <label for="tujuan" class="form-label">Tujuan</label>
    <input type="text" class="form-control" name="tujuan" value="<%=res.getString("tujuan") %>" aria-describedby="tujuan">
  </div>
<!-- Tujuan : <input type="text" name="tujuan" />-->

<div class="mb-3">
    <label for="jamberangkat" class="form-label">Jam Berangkat</label>
    <input type="text" class="form-control" name="jamberangkat" value="<%=res.getString("jamberangkat") %>" aria-describedby="jamberangkat">
  </div>
<!-- Jam Berangkat : <input type="text" name="jamberangkat" /> -->

<div class="mb-3">
    <label for="jamdatang" class="form-label">Jam Datang</label>
    <input type="text" class="form-control" name="jamdatang" value="<%=res.getString("jamdatang") %>" aria-describedby="jamdatang">
  </div>
<!--  Jam Datang : <input type="text" name="jamdatang" />-->


<input type="submit" value="submit" />
</form>
<%
}
%>
</dir>
</body>
</html>



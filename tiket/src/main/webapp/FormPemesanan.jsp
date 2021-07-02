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

 <label for="pemesanan" class="form-label"><b>Formulir Pemesanan Tiket KA</b></label>
<form name="pemesanan" action="InputPemesanan.jsp" method="post">
<div class="mb-3">
    <label for="nik" class="form-label">NIK</label>
    <input type="text" class="form-control" name="nik" aria-describedby="nik">
  </div>
  
<!--  NIK : <input type="text" name="nik" />
<br/><br/>-->

<div class="mb-3">
    <label for="nama" class="form-label">Nama</label>
    <input type="text" class="form-control" name="nama" aria-describedby="nama">
  </div>
<!--Asal : <input type="text" name="nama" />  -->

<div class="mb-3">
    <label for="email" class="form-label">Email</label>
    <input type="email" class="form-control" name="email" aria-describedby="email">
  </div>
<!-- Tujuan : <input type="text" name="email" />-->

<div class="mb-3">
    <label for="alamat" class="form-label">Alamat</label>
    <input type="textarea" class="form-control" name="alamat" aria-describedby="alamat">
  </div>
<!-- Jam Berangkat : <input type="text" name="alamat" /> -->

<div class="mb-3">
    <label for="tanggal" class="form-label">Tanggal</label>
    <input type="date" class="form-control" name="tanggal" aria-describedby="tanggal">
  </div>
<!--  Jam Datang : <input type="text" name="tanggal" />-->

<div class="mb-3">
    <label for="nama_ka" class="form-label">Nama Kereta Api</label>
    <input type="text" class="form-control" name="nama_ka" aria-describedby="nama_ka">
  </div>
<!--  Jam Datang : <input type="text" name="nama_ka" />-->


<input type="submit" value="submit" />
</form>
</div>
</br></br></br></br>
</br></br></br></br>
<div class="container mt-34">
 <%@ include file="Footer.html" %></div>

</body>
</html>
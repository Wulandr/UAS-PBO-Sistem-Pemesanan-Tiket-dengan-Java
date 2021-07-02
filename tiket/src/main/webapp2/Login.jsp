

<!-- Button trigger modal -->
<%
  if (session.getAttribute("name") == null) {
%>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#loginModal">
  Login
</button>
<%
  } else {
%>
<a href="Logout" class="btn btn-danger" role="button" aria-pressed="true">
  Logout
</a>
<%
  }
%>
<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <h2 class="text-center mb-4">Login</h2>
        <form method="POST" action="Login">
          <div class="mb-3">
            <label for="loginEmail" class="form-label">Alamat Email</label>
            <input name="email" type="email" class="form-control" id="loginEmail" aria-describedby="emailHelp">
            <div id="loginEmailHelp" class="form-text">Masukkan e-mail yang Anda gunakan untuk login.</div>
          </div>
          <div class="mb-3">
            <label for="loginPassword" class="form-label">Kata Sandi</label>
            <input name="password" type="password" class="form-control" id="loginPassword">
          </div>
          <div class="d-grid gap-2">
            <button type="submit" class="btn btn-primary">Login</button>
          </div>
        </form>
        <div class="w-100 text-center mt-2">
          Belum punya akun? <a href="#" data-bs-toggle="modal" data-bs-target="#registerModal" data-bs-dismiss="modal">Daftar</a>
        </div>
      </div>
      </div>
    </div>
  </div>

<!-- Modal -->
<div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <h2 class="text-center mb-4">Login</h2>
        <form method="POST" action="Register">
          <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Alamat Email</label>
            <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            <div id="emailHelp" class="form-text">Masukkan e-mail yang Anda gunakan untuk login.</div>
          </div>
          <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Kata Sandi</label>
            <input name="password" type="password" class="form-control" id="exampleInputPassword1">
          </div>
          <div class="mb-3">
            <label for="nama" class="form-label">Nama</label>
            <input name="nama" type="text" class="form-control" id="nama">
          </div>
          <div class="mb-3">
            <label for="nik" class="form-label">NIK</label>
            <input name="nik" type="text" class="form-control" id="nik">
          </div>
          <div class="mb-3">
            <label for="alamat" class="form-label">Alamat</label>
            <input name="alamat" type="text" class="form-control" id="alamat">
          </div>
          <div class="d-grid gap-2">
            <button type="submit" class="btn btn-primary">Register</button>
          </div>
        </form>
        <div class="w-100 text-center mt-2">
          Sudah punya akun? <a href="#" data-bs-toggle="modal" data-bs-target="#loginModal" data-bs-dismiss="modal">Login</a>
        </div>
      </div>
    </div>
  </div>
</div>
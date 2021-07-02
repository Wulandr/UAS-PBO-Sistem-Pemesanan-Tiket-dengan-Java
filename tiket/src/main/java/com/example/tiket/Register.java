/* codingwill */
package com.example.tiket;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import com.example.tiket.Database;

@WebServlet(name = "Register", value = "/Register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        writer.println("INI PAGE REGISTER");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //declaration of vars and objects
        PrintWriter writer = response.getWriter();
        PasswordEncryption enkripsi = new PasswordEncryption();

        //get data from http request
        Database db = new Database("tiket");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String nama = request.getParameter("nama");
        String nik = request.getParameter("nik");
        String alamat = request.getParameter("alamat");
        byte[] salt = null;

        try {
            salt = enkripsi.getSalt();
        } catch (NoSuchAlgorithmException err) {
            err.printStackTrace();
        }

        String securePassword = enkripsi.hashPassword(password, salt);

        //pake base64
        String saltString = Base64.getEncoder().encodeToString(salt);
        System.out.println("Salt Register: " + saltString);

        String query = "INSERT INTO user " +
                "(nik, username, password, salt, role, nama, email, tanggal_lahir, alamat) " +
                "VALUES ('" + nik + "', '" + email + "', '" + securePassword + "', '" + saltString + "', '" + "user" +
                "', '" + nama + "', '" + email + "', '" + "2000-01-01" + "', '" + alamat + "');";
        System.out.println(query);
        if(db.setData(query)) {
            System.out.println("Berhasil input data.");
            writer.println("<h1>Registrasi Berhasil!</h1><hr>");
            writer.println("Klik link untuk kembali ke menu utama.");
        } else {
            System.out.println("Gagal input data.");
            writer.println("<h1>Registrasi Gagal!</h1><hr>");
            writer.println("Email/username sudah terdaftar.");
        };

    }
}

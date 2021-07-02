/* codingwill */
package com.example.tiket;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //declaration of vars and objects
        PrintWriter writer = response.getWriter();
        PasswordEncryption enkripsi = new PasswordEncryption();
        ResultSet rows = null;
        String storedPassword = null;
        String securePassword = null;
        String storedSalt = null;
        String role = "guest";
        String nama = "guest";
        byte[] salt = new byte[16];
        HttpSession session = request.getSession();

        //get data from http request
        Database db = new Database("tiket");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String query = "SELECT email, salt, password, role, nama " +
                "FROM user " +
                "WHERE email = '" + email + "';";
        System.out.println(query);
        rows = db.getData(query);
        boolean dataExist = db.isDataExist(query);

        System.out.println("Is rows empty: " + rows == null);

        //retrieve stored password and salt
        try {
            while (rows.next()) {
                storedPassword = rows.getString("password");
                role = rows.getString("role");
                nama = rows.getString("nama");
                storedSalt = rows.getString("salt");
                salt = Base64.getDecoder().decode(storedSalt);
                System.out.println("Salt login: " + storedSalt);
            }
        } catch (SQLException err) {
            err.printStackTrace();
        }

        try {
            securePassword = enkripsi.hashPassword(password, salt);

            //authentication
            if (securePassword.equals(storedPassword)) {
                session.setAttribute("role", role);
                session.setAttribute("name", nama);
                System.out.println("You have successfully logged in! " + session.getAttribute("name"));
                writer.println("<h1>Login Berhasil, " + session.getAttribute("name") + "!</h1><hr>");
                writer.println("Klik <a href=\"index.jsp\">link</a> untuk kembali ke menu utama.");
            } else {
                System.out.println("You entered the wrong credential.");
                writer.println("<h1>Login Gagal!</h1><hr>");
                writer.println("Password yang Anda masukkan salah.");
                writer.println("Klik link untuk kembali ke menu utama.");
            }

            System.out.println("Berhasil mengambil data.");
        } catch (NullPointerException err) {
            err.printStackTrace();
            writer.println("<h1>Login Gagal!</h1><hr>");
            writer.println("Akun belum pernah registrasi.");
            writer.println("Klik link untuk kembali ke menu utama.");
            System.out.println("Tidak ada data.");
        };

    }
}

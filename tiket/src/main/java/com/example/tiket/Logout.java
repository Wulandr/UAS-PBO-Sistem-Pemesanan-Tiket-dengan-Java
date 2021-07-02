package com.example.tiket;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Logout", value = "/Logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        PrintWriter writer = response.getWriter();

        System.out.println("You have successfully logged out! " + session.getAttribute("name"));
        writer.println("<h1>Logout berhasil, " + session.getAttribute("name") + "!</h1><hr>");
        writer.println("Klik <a href=\"index.jsp\">link</a> untuk kembali ke menu utama.");
        session.removeAttribute("name");
        session.removeAttribute("role");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

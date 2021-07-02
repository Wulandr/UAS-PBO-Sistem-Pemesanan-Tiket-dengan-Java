/* codingwill */

package com.example.tiket;

import com.mysql.jdbc.*;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

import javax.swing.plaf.nimbus.State;
import java.sql.*;
import java.util.ArrayList;

public class Database {
    Connection con;
    Statement st;
    ResultSet result;

    public Database(String database) {
        try {
            String server = "jdbc:mysql://127.0.0.1/" + database + "?user=root&password=";
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection(server);
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    //ambil dari database
    public ResultSet getData(String command) {
        try {
            st = (Statement) con.createStatement();
            result = (ResultSet) st.executeQuery(command);
        } catch (SQLException err) {
            err.printStackTrace();
        }

        return result;
    }

    //cek ada data atau engga
    public boolean isDataExist(String command) {
        boolean isExist = false;
        try {
            st = (Statement) con.createStatement();
            isExist = st.execute(command);
        } catch (SQLException err) {
            err.printStackTrace();
        }

        return isExist;
    }

    //nulis ke database, return boolean buat ngecek berhasil atau enggaknya
    public boolean setData(String command) {
        try {
            st = (Statement) con.createStatement();
            st.execute(command);
        } catch (SQLException err) {
            err.printStackTrace();
            return false;
        }

        return true;
    }
}

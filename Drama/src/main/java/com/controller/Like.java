package com.controller;

import java.io.IOException;

import java.io.IOException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Like")
public class Like extends HttpServlet {
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = (String) request.getSession().getAttribute("email");
        int filmNum = Integer.parseInt(request.getParameter("filmNum"));

        try {
            Context initContext = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource)envContext.lookup("jdbc/YourDB");
            Connection conn = ds.getConnection();

            String query = "SELECT * FROM TB_FILM_LIKE WHERE EMAIL = ? AND F_NUM = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setInt(2, filmNum);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                query = "DELETE FROM TB_FILM_LIKE WHERE EMAIL = ? AND F_NUM = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, email);
                pstmt.setInt(2, filmNum);
                pstmt.executeUpdate();
            } else {
                query = "INSERT INTO TB_FILM_LIKE (EMAIL, F_NUM, F_LIKE_DATE) VALUES (?, ?, NOW())";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, email);
                pstmt.setInt(2, filmNum);
                pstmt.executeUpdate();
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("YourJSPPage.jsp?filmNum=" + filmNum);
    }
}

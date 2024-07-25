package com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SearchService")
public class SearchService extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String USER_AGENT = "Mozilla/5.0";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int searchType = Integer.parseInt(request.getParameter("category"));
        String searchWord = request.getParameter("search");

        // Flask 서버로 요청을 보낼 URL을 구성합니다
        String url = "http://localhost:8082/search.jsp?q=" + searchWord + "&type=" + searchType;
        System.out.println("Request URL: " + url);  // 디버깅 메시지 추가

        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection(); // HttpURLConnection을 사용합니다.

        con.setRequestMethod("GET");
        con.setRequestProperty("User-Agent", USER_AGENT);

        int responseCode = con.getResponseCode();
        System.out.println("GET Response Code :: " + responseCode);  // 디버깅 메시지 추가

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer responseBuffer = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                responseBuffer.append(inputLine);
            }
            in.close();

            // JSON 데이터를 JSP 페이지로 전달
            request.setAttribute("searchResults", responseBuffer.toString());
            request.getRequestDispatcher("/search.jsp").forward(request, response);

        } else {
            response.getWriter().write("{\"error\": \"GET request failed\"}");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
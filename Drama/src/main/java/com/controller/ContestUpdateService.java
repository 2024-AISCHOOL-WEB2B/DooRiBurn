package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContestUpdateService")
public class ContestUpdateService extends HttpServlet { 

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    	
    	// 수정 필요@@@@@@@@@@@@@
        request.setCharacterEncoding("EUC-KR");
        
        // 폼 데이터 수신
        String c_num = request.getParameter("c_num");
        String contestTitle = request.getParameter("contestTitle");
        String contestContent = request.getParameter("contestContent");
        // 이미지 파일 처리는 별도로 진행해야 함
        
        // 데이터 처리 로직 추가
        
        // 예시: 데이터를 콘솔에 출력
        System.out.println("c_num: " + c_num);
        System.out.println("contestTitle: " + contestTitle);
        System.out.println("contestContent: " + contestContent);
        
        // 데이터 처리 완료 후 원하는 페이지로 리다이렉트 혹은 포워딩
        response.sendRedirect("contestView.jsp?"+c_num); 
    }
}
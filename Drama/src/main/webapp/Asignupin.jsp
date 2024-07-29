<%@page import="dooriburn.com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Asignupin</title>
 
<link rel="stylesheet" href="css/Asignupin.css">

</head>
<body>

   <%
   MemberDTO info = (MemberDTO) session.getAttribute("info");
   String error = (String) session.getAttribute("error");
   %>

   <script>
      function validateForm() {
         var email = document.getElementById("login-email").value;
         var password = document.getElementById("login-password").value;

         if (email == "") {
            alert("이메일 칸을 입력해 주세요.");
            return false;
         }

         if (password == "") {
            alert("비밀번호 칸을 입력해 주세요.");
            return false;
         }

         if (email == "" || password == "") {
            alert("모든 필드를 입력해 주세요.");
            return false;
         }
         return true;
      }
   </script>

   <script>
      function validateForm1() {
         var email = document.getElementById("signup-email").value;
         var password = document.getElementById("signup-password").value;
         var nick = document.getElementById("signup-nick").value;
         var name = document.getElementById("signup-name").value;
         var phone = document.getElementById("signup-phone").value;
         var addr = document.getElementById("signup-addr").value;

         if (email == "" || password == "" || nick == "" || name == ""
               || phone == "" || addr == "") {
            alert("모든 필드를 입력해 주세요.");
            return false;
         }
         return true;
      }
   </script>

   <!-- <a href="https://front.codes/" class="logo" target="_blank"> <img
      src="https://assets.codepen.io/1462889/fcy.png" alt="">
   </a> -->

   <div class="section">
      <div class="container">
         <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
               <div class="section pb-5 pt-5 pt-sm-2 text-center">
                  <!-- <h6 class="mb-0 pb-3">
                     
                  </h6> -->
                  <input class="checkbox" type="checkbox" id="reg-log"
                     name="reg-log" /> <label for="reg-log"></label>

                  <div class="card-3d-wrap mx-auto">
                     <div class="card-3d-wrapper">
                        <div class="card-front">
                           <div class="center-wrap">
                              <div class="section text-center">
                                 <h4 class="mb-4pb-3">로그인</h4>
                                 <form action="LoginService" method="post" name="JoinForm" onsubmit="return validateForm()">
                                    <div class="form-group">
                                       <input type="email" name="email" id="login-email"
                                          class="form-style" placeholder="이메일" autocomplete="off">
                                       <i class="input-icon uil uil-at"></i>
                                    </div>
                                    <div class="form-group mt-2">
                                       <input type="password" name="pw" class="form-style"
                                          placeholder="비밀번호" id="login-password" autocomplete="off">
                                       <i class="input-icon uil uil-lock-alt"></i>
                                    </div>
                                    <%
                                    if (error != null) {
                                    %>
                                    <div class="form-group mt-2">
                                       <span><%=error%></span>
                                    </div>
                                    <%
                                    }
                                    %>
                                    <br>
                                    <div class="btn mt-4">
                                       <input type="submit" id="submit" value="로그인"
                                          style="background-color: transparent; border: none; color: inherit; font-size: inherit; cursor: pointer;">
                                    </div>
                                    <!-- <a href="Realindex.jsp" class="btn mt-4">submit</a> -->
   <!--                                  <p class="mb-0 mt-4 text-center">
                                       <a href="#0" class="link">Forgot your password?</a>
                                    </p> -->
                                 </form>
                              </div>
                           </div>
                        </div>



                        <!-- 회원가입 -->

                        <div class="card-back">
                           <div class="center-wrap">
                              <div class="section text-center">
                                 <h4 class="mb-4pb-3">회원가입</h4>
                                 <form action="JoinService" method="post" name="SignupForm"
                                    onsubmit="return validateForm1()">

                                    <div class="form-group">

                                       <input type="email" name="email" class="form-style"
                                          placeholder="아이디 (이메일)" id="signup-email" autocomplete="off">
                                       <i class="input-icon uil uil-user"></i>
                                    </div>
                                    <div class="form-group mt-2">
                                       <input type="password" name="pw" class="form-style"
                                          placeholder="비밀번호" id="signup-password" autocomplete="off">
                                       <i class="input-icon uil uil-lock-alt"></i>
                                    </div>
                                    <div class="form-group mt-2">
                                       <input type="text" name="name" class="form-style"
                                          placeholder="이름" id="signup-name" autocomplete="off"> <i
                                          class="input-icon uil uil-lock-alt"></i>
                                    </div>
                                    <div class="form-group mt-2">
                                       <input type="text" name="nick" class="form-style"
                                          placeholder="닉네임" id="signup-nick" autocomplete="off"> <i
                                          class="input-icon uil uil-lock-alt"></i>
                                    </div>
                                    <div class="form-group mt-2">
                                       <input type="text" name="phone" class="form-style"
                                          placeholder="전화번호" id="signup-phone" autocomplete="off">
                                       <i class="input-icon uil uil-lock-alt"></i>
                                    </div>
                                    <div class="form-group mt-2">
                                       <input type="text" name="addr" class="form-style"
                                          placeholder="주소" id="signup-addr" autocomplete="off"> <i
                                          class="input-icon uil uil-lock-alt"></i>
                                    </div>
                                    <br>
                                    <div class="btn mt-4">
                                       <input type="submit" id="submit" value="회원가입"
                                          style="background-color: transparent; border: none; color: inherit; font-size: inherit; cursor: pointer;">
                                    </div>
                                 </form>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>


</body>
</html>


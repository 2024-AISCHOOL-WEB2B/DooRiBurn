<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kakao Login</title>
</head>
<body>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script>
      Kakao.init('c1cac00685a32d9d2daf6b4bdb4fc80e'); // 카카오 JavaScript 키 입력
      console.log(Kakao.isInitialized()); // SDK 초기화 확인

      document.addEventListener('DOMContentLoaded', function() {
        document.querySelector('#kakao-login-btn').addEventListener('click', function() {
          Kakao.Auth.login({
            success: function(authObj) {
              getUserInfo(authObj);
            },
            fail: function(err) {
              alert(JSON.stringify(err));
            }
          });
        });
      });

      function getUserInfo(authObj) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function(response) {
            const nickname = response.properties.nickname;
            const id = response.id;

            fetch('KakaoLoginService', {
              method: 'POST',
              headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
              },
              body: new URLSearchParams({
                nickname: nickname,
                id: id
              })
            })
            .then(response => response.text())
            .then(data => {
              document.open();
              document.write(data);
              document.close();
            })
            .catch(error => console.error('Error:', error));
          },
          fail: function(error) {
            console.log(error);
          }
        });
      }
    </script>
</head>
<body>
<a id="kakao-login-btn" href="javascript:void(0)">
  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    alt="카카오 로그인 버튼" />
</a>
<p id="token-result"></p>
<button class="api-btn" onclick="requestUserInfo()" style="visibility:hidden">사용자 정보 가져오기</button>
</body>
</html>

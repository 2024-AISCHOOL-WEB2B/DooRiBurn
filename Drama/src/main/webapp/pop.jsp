<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">

<!-- CSS ���� ���� -->
<link rel="stylesheet" href="css/Realstyle.css">

<style>
.background {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.3);
  z-index: 1000;
}

.window {
  position: relative;
  width: 100%;
  height: 100%;
}

.popup {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #ffffff;
  box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
  
  /* �ӽ� ���� */
  width: 90%;
  height: 70%;
}

.background {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.3);
  z-index: 1000;
  
  /* ����� */
  z-index: -1;
  opacity: 0;
}

.show {
  opacity: 1;
  z-index: 1000;
  transition: all .5s;
}

.popup {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #ffffff;
  box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
  
  /* �ӽ� ���� */
  width: 500px;
  height: 500px;
  
  /* �ʱ⿡ �ణ �Ʒ��� ��ġ */
  transform: translate(-50%, -40%);
}

.show .popup {
  transform: translate(-50%, -50%);
  transition: all .5s;
}
</style>



<style>
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 2em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
</style>
</head>
<body>
	
	<button id="show">�˾�����</button>
    <div class="background">
      <div class="window">
        <div class="popup">
	        <div align="right">
				<button id="close">�˾��ݱ�</button>
        	</div>
        	<div style="margin: auto;">
        		<form class="mb-3" name="myform" id="myform" method="post">
					<fieldset style="display: inline-block ; direction: rtl ; border:0 ;">
						<span class="text-bold">������ �������ּ���</span>
						<input type="radio" name="reviewStar" value="5" id="rate1"><label
							for="rate1">��</label>
						<input type="radio" name="reviewStar" value="4" id="rate2"><label
							for="rate2">��</label>
						<input type="radio" name="reviewStar" value="3" id="rate3"><label
							for="rate3">��</label>
						<input type="radio" name="reviewStar" value="2" id="rate4"><label
							for="rate4">��</label>
						<input type="radio" name="reviewStar" value="1" id="rate5"><label
							for="rate5">��</label>
					</fieldset>
					<div>
						<textarea class="col-auto form-control" type="text" id="reviewContents"
						placeholder="���� ������ �����ֽø� ū ���� �˴ϴ�!"></textarea>
					</div>
				</form>	
        	</div>
        </div>
        <div>
          <div></div>
        </div>
      </div>
    </div>
	
	 <script>
      function show() {
        document.querySelector(".background").className = "background show";
      }

      function close() {
        document.querySelector(".background").className = "background";
      }

      document.querySelector("#show").addEventListener("click", show);
      document.querySelector("#close").addEventListener("click", close);
    </script>
</body>
</html>
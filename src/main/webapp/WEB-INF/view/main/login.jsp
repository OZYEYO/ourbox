<%@page import="ourbox.common.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>

  <title>ourbox</title>
  <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>


<style>
	
	
/* 	#id, #pass{ */
/* 		width: 300px; */
/* 		height: 30px; */
/* 	} */

	body{
		background: linear-gradient(90deg, white 70%, #E4E4E4 30%);
	}

	#loginbtn{
		width: 65px;
		height: 60px;
		text-align: center;
		margin: 5px;
		padding: 10px;
		background:#F6F6F6;
		border: 1px solid #D5D5D5; 
		border-radius: 5px;
	}
	
	#box{
		margin: 10px;
	}
	
	#login{
		text-align: center; 
		float: right;
/* 		padding: 10px; */
		margin-left : 10px;
		width: 600px;
	}
	
	label {
	   width: 80px;
	   margin-top : 5px;
	   text-align:left;
	}	
	
	#tt1{
	margin: 10px;
	}
	
	
	#kakao-login-btn{
		width: 43%;
	}
	
	#naver_id_login{
		width: 100%;
	}
	
	#div1{
		float: left;
		width: 800px;
		padding: 10px;
	}
	
	#img1{
		width: 1200px;
	}
	
	#sum{
		width:60%;
		padding: 10px;
		position: absolute;
		top: 10%;
		left: 45%;
		margin-left: -800px;
		overflow: hidden;
	}
	#findidinput{
		float: left;
	}
	#findidbtn, #findpwbtn{
		float:right;
		margin-top: 14px;
	}
	.modal-title2{
		font-size: 1.5em;
	}
	#findpwinput{
		float: left;
	}
	#myModal{
		height: auto;
	}
	#right{
		float: right;
	}
	#left{
		float: left;	
	}
	#logo{
		width: 250px;
	}
	.input{
		width: 260px;
		border : 1px solid #8C8C8C;
		border-radius: 6px; 
	}
	#inputleft{
		float: left;
 		margin-left: 10px; 
		box-sizing: content-box;
	}
	#inputright{
		float: right;
		box-sizing: content-box;
	}
	#find{
/* 		display : inline-block; */
		margin-left : 180px;
/*  		padding-right: 10px; */
/* 		width: 300px;	 */
 		float: center; 
	}
	#apilogin{
		float: center;
		margin-left : 50px;
	}
	
	
	.modal-title2{
		font-weight: bold;
		padding-left: 20px;
	}
	
	.sinput{
		width: 400px;
		margin-top: 10px;
		border-right: 10px;
		border: 1px solid #A6A6A6;
	}
	
	#findpwbtn, #pwchk{
		height: 100px;
		margin-right: 3px;
		vertical-align: top;
	}
	
	.simg{
		width: 30px;
		height: 30px;
		margin-right: 5px;
	}
	
</style>



</head>
<body>

<div id="sum">
	<section id="left">
	
		<div id="div1">
		
			<img id="img1" src="/ourbox/images/ourbox_main2.PNG">
		
		</div>	
	</section>
</div>
<div id = "rightdiv">

	<section id = "right" style="margin-top: 250px;">
	
		<div style="margin-left: 210px;">
			<img id = "logo" src="/images/ourbox_logo.png">
		</div>
		<br>
		<br>
	
		<div id="box">
			<form id="login"  action="${cp }/ourbox/loginVali" method ="post">
				<section id = "inputleft" style="width: 60%">
					<label for = "id">아이디</label>
					<label><input class="input" type="text" name="id" id="id" value=""></label><br>
					<label for = "pass">비밀번호</label>
					<label><input class="input" type="password" name="pass" id="pass" value=""></label><br>
				</section>
				<section id = "inputright" style="width: 23%; text-align:left;">
					<input id="loginbtn" type="submit" value="로그인">
				</section>
				<span id="find">
					<a class="but" type="button" data-toggle="modal" data-target="#myModal">아이디/비밀번호 찾기</a>/
				    <a href="#">회원가입</a><br><br>
				</span>
				<div id="apilogin">
					<a id="kakao-login-btn"></a><a href="http://developers.kakao.com/logout"></a>
					<div id="naver_id_login"></div>
				</div>
				
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<hr>
	  	 	</form>
		</div>
	</section>
</div>


<br>
<script type="text/javascript"
		src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
		charset="utf-8"></script>

<script type="text/javascript">
		var clientId = "3udZJwol20KH8gry66Js";
		var callbackUrl = "http://localhost/ourbox/WEB-INF/view/login.jsp";
		var naver_id_login = new naver_id_login(clientId, callbackUrl);
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 5, 50);
		naver_id_login.setDomain("http://localhost/ourbox/login.jsp");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
</script>
  
<script type='text/javascript'>
    //<![CDATA[
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('887db1fa6578c8bc01cbc3fbcbe2fdc3');
   
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
     container: '#kakao-login-btn',
     success: function(authObj) {
    alert(JSON.stringify(authObj));
     },
     fail: function(err) {
     alert(JSON.stringify(err));
     }
   });
    //
</script>
  
<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog" >
    	<div class="modal-dialog">
    
		<!-- Modal content-->
			<div class="modal-content" style="height:480px;">
			    	<div class="modal-header">
			        	<button type="button" class="close" data-dismiss="modal">&times;</button>
							<span class="modal-title2"><img class='simg' alt="수정시비번확인아이콘.png" src="/ourbox/images/수정시비번확인아이콘.png">아이디 찾기</span>
					</div>
				<div class="modal-body">
					<section id="findidinput">
						<label for="name">이름</label>
						<input class='sinput' type="text" id="name" name="name"><br>
						<label for="tel">휴대폰 번호</label>
						<input class='sinput' type="text" id="tel" name="tel">
					</section>
					<section id="findidbtn">
						<button style="height : 55px;" style  type="button" class="btn btn-default btn-lg" id="chk">찾기</button>
					</section>
					<br>
					<br>
					<br>
					<br>
					<div id="result1">
						<span id ="idchkspan"></span><br>
					</div>
				</div>
				<hr>
				<h4 class="modal-title2" style="margin: 10px;"><img class='simg' alt="수정시비번확인아이콘.png" src="/ourbox/images/수정시비번확인아이콘.png">비밀번호 찾기</h4>
				<hr>
				<div class="modal-body2" style="margin: 10px; height:80px;">
					<section id = "findpwinput">
						<label for="email">이메일  </label>
						<input class='sinput' type="text" id="email" name="email"><br> 
						<label  for="name2">이름 </label>
						<input class='sinput' type="text" id="name2" name="name2"><br> 
						<label for="tel2">휴대폰 번호 </label> 
						<input class='sinput' type="text" id="tel2" name="tel2">
					</section>
					<section id = "findpwbtn">
						<button type="button" class="btn btn-default btn-lg" id="pwchk">찾기</button><br>
						<!-- <button type="button" class="btn btn-default btn-lg" id="changepw" data-toggle="modal" data-target="#pwModal">변경</button> -->
					</section>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
			  		<div id="result2"></div><br><br>
				</div>
			</div>
    	</div>
    </div>
    
    
    
    
    
    
<!--       비밀번호 변경Modal -->
	<div class="modal fade" id="pwModal" role="dialog">
		<div class="modal-dialog">
    
<!--  Modal content -->
			<div class="modal-content" ">
				<div class="modal-header" style="padding:35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-lock"></span> 비밀번호 변경</h4>
				</div>
				<div class="modal-body" style="padding:40px 50px;">
					<form role="form">
						<div class="form-group">
							<label for="usrname"><span class="glyphicon glyphicon-user"></span>이메일</label>
								<input type="text" class="form-control" id="email" name="email">
						</div>
            
						<div class="form-group">
							<label for="psw"><span class="glyphicon glyphicon-eye-open"></span>새 비밀번호</label>
								<input type="text" class="form-control" id="newpw" name="newpw">
						</div>
            
						<div class="form-group">
							<label for="psw"><span class="glyphicon glyphicon-eye-open"></span>새 비밀번호 확인</label>
								<input type="text" class="form-control" id="newpwchk" name="newpwchk">
									<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
										<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
						</div>
						<button id="changepw2" type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>변경</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
				</div>
			</div>
		</div>
  </div>
    



</body>
</html>
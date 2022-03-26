<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>login.jsp</title>
		<style type="text/css">
			body {
				padding: 0;
				margin: 0;
			}
			* {
				box-sizing: border-box;
				/*直接决定向你内扩展,在默认情况下是不改变宽度,让元素膨胀变大*/
			}
			/*容器一般百分百*/
			
			a {
				text-decoration: none;
			}
			
			.pages_agile_info_w3l {
				background: url("./image/login.jpg");
				background-size: cover;
				position: absolute;
				top: 0;
				bottom: 0;
				width: 100%;
			}
			
			.over_lay_agile_pages_w3ls {
				background: url(./image/login.jpg) repeat;
				padding: 11em 2em 5.5em 2em;
				height: 100%;
				width: 100%;
			}
			/*这个根据内容决定的高度多少,*/
			/*文字居中，自身水平居中垂直大小，样式*/
			
			.signin-form.profile {
				background: #FAFAFA;
				text-align: center;
				margin: 0 auto;
				width: 25%;
				padding: 3em 2em;
				/*没有改变自身位置,改变内容位置
				 因此需要找到外套的容器给予合适padding达到效果*/
			}
			/*标题黑色字体强调，文字间距，粗细，大小，以及位置*/
			
			.signin-form.profile h2 {
				font-size: 1.4em;
				font-weight: 700;
				margin: .5em 0 1.5em 0;
				letter-spacing: 5px;
			}
			/*输入框怎么样优化,加合适填充,外边距效果好很多*/
			
			.signin-form.profile form>input {
				width: 100%;
				/*给了box-size:border-box,这里内容,填充太多,挤到无法左右边距对齐，上右优先级高*/
				padding: 1em;
				margin: 1em 0;
				text-align: center;
				outline: none;
				/*聚焦时外边框不太好看*/
				letter-spacing: 1px;
				font-weight: 300;
				color: #666666;
			}
			/*此外文字居中,*/
			/*确认按钮,去掉外边框，和聚焦，*/
			
			.signin-form.profile form input[type=submit] {
				width: 100%;
				margin-top: 1rem;
				padding: 1rem;
				font-size: 1.2rem;
				font-weight: 500;
				outline: none;
				border: none;
				/*必须去掉外边框,真的非常丑*/
				background: #e53238;
				/*还有变成白色字体*/
				color: #FFFFFF;
				letter-spacing: 5px;
				-webkit-transition: .5s all;
				transition: .5s all;
			}
			
			.signin-form.profile form input[type=submit]:hover {
				background: #007ee5;
			}
			
			.signin-form.profile p a {
				font-size: 0.9em;
				color: #10364a;
				letter-spacing: 2px;
				font-weight: 600;
			}
			/*max-width从大往小放，尽量放在样式最后，因为是依次生效*/
			
			@media (max-width: 1280px) {
				.pages_agile_info_w3l {
					min-height: 698px;
				}
				.signin-form.profile {
					padding: 3em 2em;
					width: 35%;
				}
				.over_lay_agile_pages_w3ls {
					padding: 8em 3em 5.5em 3em;
				}
			}
			
			@media (max-width: 1080px) {
				.signin-form.profile {
					padding: 3em 2em;
					width: 45%;
				}
				.pages_agile_info_w3l {
					min-height: 653px;
				}
			}
			
			@media (max-width: 991px) {
				.signin-form.profile {
					padding: 3em 2em;
					width: 48%;
				}
			}
			
			@media (max-width: 800px) {
				.signin-form.profile {
					padding: 3em 2em;
					width: 64%;
				}
			}
			
			@media (max-width: 600px) {
				.signin-form.profile {
					width: 72%;
				}
			}
			
			@media (max-width: 480px) {
				.signin-form.profile {
					width: 78%;
				}
			}
			
			@media (max-width: 414px) {
				.signin-form.profile {
					width: 95%;
				}
			}
			
			@media (max-width: 375px) {
				.signin-form.profile {
					padding: 2em 1.5em;
					width: 100%;
				}
			}
		</style>
	</head>
 
	<body>
		<div class="pages_agile_info_w3l">
			<div class="over_lay_agile_pages_w3ls">
				<div class="registration">
					<div class="signin-form profile">
						<h2>请登录</h2>
						<div class="login-form">
							<form action="loginServlet" method="post">
								<input type="text" name="name" placeholder="Your username"/>
								<input type="password" name="pwd" placeholder="Your password"/>
								<div class="tp">
									<input type="submit" value="登录">
								</div>
							</form>
						</div>
						<p>
							<a href="register.jsp"> 没有账号?注册</a>
						</p>
					</div>
				</div>
				<div class="copyrights_agile">
 
				</div>
			</div>
		</div>
	</body>
 
</html>
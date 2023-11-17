<template>
			<div class="footer">
				<div class="top">
					<div class="footer__left">
						<p class="logo__foter">Mi<span>rage</span></p>
						<p class="foter__description footer__padding">560 N Riverview D Ste 658</p>
						<p  class="foter__description">North Carolina DA 598745 USA</p>
						<p  class="foter__description footer__follow">Follow us on</p>
						<div class="footer__sociable">
							<div class="sociable__box">
								<img src="./img/instagram.png" alt="instagram" class="sociable__icon">
							</div>
							<div class="sociable__box">
								<img src="./img/twitter.png" alt="instagram" class="sociable__icon">
							</div>
							<div class="sociable__box">
								<img src="./img/youtube.png" alt="instagram" class="sociable__icon">
							</div>
							<div class="sociable__box">
								<img src="./img/facebook.png" alt="instagram" class="sociable__icon">
							</div>
						</div>
					</div>
					<div class="footer__right">
						<div class="footer__box-right">
							<p class="footer__main-text">Resouces</p>
							<p class="foterr__text-right footer__padding">Revisions</p>
							<p class="foterr__text-right ">Sheets</p>
							<p class="foterr__text-right ">Quiz</p>
							<p class="foterr__text-right ">Drill</p>
						</div>
						<div class="footer__box-right">
							<p class="footer__main-text">About</p>
							<p class="foterr__text-right footer__padding">About us</p>
							<p class="foterr__text-right ">Partners</p>
							<p class="foterr__text-right ">Contact us</p>
							<p class="foterr__text-right ">Careers</p>
						</div>
						<div class="footer__box-right">
							<p class="footer__main-text">Helpful link</p>
							<p class="foterr__text-right footer__padding">Mirage</p>
							<p class="foterr__text-right ">Solutions</p>
							<p class="foterr__text-right ">Industries</p>
							<p class="foterr__text-right ">Services</p>
						</div>
					</div>
				</div>
				<div class="down">
					<p>© All Rights Reserved By Mirage 2020</p>
					<div class="down__box">
						<img src="./img/ls_web.png" alt="web" class="down__web">
						<select class="qw" name="#">
							<option class="op" value="1">Eng</option>
							<option class="op" value="2">UK</option>
							<option class="op" value="3">Ru</option>
						</select>
					</div>
				</div>
			</div>
</template>


<script>

</script>


<style>
.footer{
	width: 100%;
	height: 450px;
	margin-top: 160px;
	.top{
		width: 100%;
		height: 90%;
	background-repeat: no-repeat;
	background-position: top  center;
	background-size: cover;
	display: flex;
	padding: 0 135px;
	.footer__left{
		width: 45%;
		height: 100%;
		padding-top: 100px;
		.logo__foter{
			font-family: 'Josefin Sans';
			font-style: normal;
			font-weight: 700;
			font-size: 30px;
			line-height: 30px;
			letter-spacing: 0.02em;
			color: #F087B1;
			span{
				color: rgba(86, 89, 122, 1);
			}
		}
		.foter__description{
			font-family: 'Poppins', sans-serif;
			font-style: normal;
			font-weight: 400;
			font-size: 20px;
			color: #919299;

		}
		.footer__follow{
			font-weight: 700;
			margin-top: 38px;
		}
		.footer__padding{
			margin-top: 38px;
		}
		.footer__sociable{
			width: 197px;
			height: 41px;
			display: flex;
			align-items: center;
			justify-content: space-between;
			margin-top: 10px;
			.sociable__box{
				width: 41px;
				height: 41px;
				background: #FFFFFF;
				margin-top: 16px;
				display: flex;
				align-items: center;
				justify-content: center;
				border-radius: 50%;
				cursor: pointer;
			}
		}
	}
	.footer__right{
		width: 55%;
		height: 100%;
		display: flex;
		padding-top: 100px;
		justify-content: space-between;
		.footer__box-right{
			width: 160px;
			height: 272px;
			.footer__main-text{
				font-family: 'Montserrat', sans-serif;		
				font-style: normal;
				font-weight: 500;
				font-size: 24px;
				line-height: 32px;
				letter-spacing: 0.02em;
				color: #56597A;
			}
			.foterr__text-right{
			font-family: 'Poppins', sans-serif;
				font-style: normal;
				font-weight: 400;
				font-size: 20px;
				line-height: 32px;
				letter-spacing: 0.02em;
				color: #919299;
				margin-top: 25px;
			}
			.footer__padding{
				margin-top: 37px;
			}
		}
	}
	}
	.down{
		width: 100%;
		height: 10%;
		background: #F78CB6;
		padding: 0 135px;
		display: flex;
		align-items: center;
		justify-content: space-between;
		font-family: 'Montserrat', sans-serif;		
		font-style: normal;
		font-weight: 450;
		font-size: 14px;
		line-height: 30px;
		letter-spacing: 0.02em;
		color: #FFFFFF;
		.down__box{
			display: flex;
			align-items: center;
			.down__web{
				margin-right: 3px;
			}
			.qw{
				font-family: 'Montserrat', sans-serif;		
font-style: normal;
font-weight: 450;
font-size: 14px;
line-height: 24px;
letter-spacing: 0.02em;
outline: none;
background-color: transparent;
border: none;
color: #FCFCFC;
cursor: pointer;
			}
.op {
    background-color: transparent;
    outline: none;
    border: none;
    background-color: rgba(101, 100, 100, 1);
    color: #fff;
		font-family: 'Montserrat', sans-serif;	
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
}
		}
		
	}
}
</style>
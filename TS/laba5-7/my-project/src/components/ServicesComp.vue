<template>
			<div class="Paje3" id="Paje3">
				<p class="Paje3__text-small">Our Services</p>
				<h2>Why People Choose Us</h2>
				<boxbig>
                <div class="Paje3__box-bigger">
					<div class="Paje3__box-left">
						<div class="Paje3__card">
							<img src="./img/3d-kub.png" alt="kub" class="Paje3__kub">
							<p class="card__titel">Design</p>
							<p class="card__description">a plan or drawing produced to show the look and function</p>
						</div>
						<div class="Paje3__card">
							<img src="./img/icon.png" alt="kub"  class="Paje3__kub">
							<p class="card__titel">Development</p>
							<p class="card__description">Development is defined as the process of growth or new </p>
						</div>
					</div>
					<div class="Paje3__box-right">
						<div class="Paje3__card">
							<img src="./img/paje2-portgolio.png" alt="kub"  class="Paje3__kub">
							<p class="card__titel">Branding</p>
							<p class="card__description">The marketing practice of creating a name, symbol or </p>
						</div>
						<div class="Paje3__card">
							<img src="./img/paje2=layers.png" alt="kub"  class="Paje3__kub">
							<p class="card__titel">Illustration</p>
							<p class="card__description">An illustration is a decoration, interpretation or visual</p>
						</div>
					</div>
				</div>
                </boxbig>
			</div>
</template>


export default {
  // Ваш JavaScript код здесь
}


<style>
.Paje3__box-bigger {
  display: flex;
  gap:45px;
}

.Paje3__box-left,
.Paje3__box-right {
  display: flex;
  gap:45px;
}

.Paje3__card{
  border-left: 10px transparent;
  border-right: 10px transparent;
}

.Pjae-ilustation{
	width: 100%;
	height: auto;
	margin-top: 200px;
	padding: 0 135px;
	display: flex;
	.left-box{
		width: 50%;
		height: auto;
	}
	.right-box{
		width: 50%;
		height: auto;
		padding-left: 40px;
		.main__text-small{
			display: flex;
			font-family: 'Poppins', sans-serif;
			font-style: normal;
			font-weight: 500;
			font-size: 28px;
			line-height: 40px;
			color: #F78CB6;
			p{
				position: relative;
				bottom: 23px;
				margin-left: 7px;
			}
			.main__line{
				width: 36px;
				height: 3px;
				background: #F78CB6;
			}
		}
		h3{
			margin-top: 5px;
			font-family: 'Poppins', sans-serif;
			font-style: normal;
			font-weight: 700;
			font-size: 48px;
			line-height: 74px;
			color: #56597A;

		}
		.main__description{
			font-family: 'Montserrat', sans-serif;
			font-style: normal;
			font-weight: 400;
			font-size: 20px;
			line-height: 32px;
			letter-spacing: 0.02em;
			color: #919299;
			margin-top: 20px;
		}
		.main__btn{
			width: 216px;
			height: 66px;
			background: #F78BB6;
			border-radius: 4px;
			margin-top: 40px;
			display: flex;
			align-items: center;
			justify-content: space-between;
			padding-right: 17px;
			padding-left: 22px;
			font-style: normal;
			font-weight: 500;
			font-size: 20px;
			line-height: 30px;
			letter-spacing: 0.02em;
			color: #FFFFFF;
			font-family: 'Montserrat', sans-serif;
			border: none;
			cursor: pointer;
			transition: 1s;
		}
		.main__btn:hover{
			background: #000000;
			transition: 0.4s;
		}

	}
	}
	.Paje-boolbs{
		width: 100%;
		height: 50px;
		display: flex;
		align-items: center;
		justify-content: flex-end;
		margin-top: 100px;
		.bloobs2{
			position: relative;
			left: 160px;
		}
	}

	.Paje3 h2 {
    font-family: 'Poppins', sans-serif;
    font-style: normal;
    font-weight: 700;
    font-size: 36px;
    line-height: 72px;
    color: #56597A;
}

.Paje3__box-right {
    width: 50%;
    height: 307px;
    display: flex;
    justify-content: space-between;
}

.Paje3__box-left {
    width: 50%;
    height: 307px;
    display: flex;
    justify-content: space-between;
}

.Paje3 {
    width: 100%;
    height: auto;
    padding-top: 120px;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 0 135px;
}

.Paje3__card {
    width: 270px;
    height: 307px;
    background: #FFF1F9;
    border-radius: 8px;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding-top: 56px;
    padding-right: 15px;
    padding-left: 15px;
    cursor: pointer;
    transition: 1s;
}

.card__description {
    font-family: 'Montserrat', sans-serif;
    font-style: normal;
    font-weight: 400;
    font-size: 16px;
    line-height: 24px;
    text-align: center;
    color: #919299;
}

.card__titel {
    font-family: 'Poppins', sans-serif;
    font-style: normal;
    font-weight: 500;
    font-size: 24px;
    line-height: 72px;
    color: #56597A;
    margin-top: 30px;
}

.Paje3 .Paje3__text-small {
    font-family: 'Poppins', sans-serif;
    font-style: normal;
    font-weight: 500;
    font-size: 28px;
    line-height: 40px;
    color: #F78CB6;
}
</style>
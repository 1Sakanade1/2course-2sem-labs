<template>
    <!-- Paj1 start -->
    <div class="Paje1" id="Pjae1">
      <div class="header" id="header">
        <headerlogo>
            <div class="logo">
                <p>Mi<span>rage</span></p>
            </div>
        </headerlogo>
        <servis>
            <div class="servis">
                <a href="#Paje1">
                <p class="servises__home">Home</p>
                </a>
                <a href="#Paje3">
                    About
            </a>
            <a href="#product">
                Product
            </a>
            <a href="#Paje4">
                Pricing
            </a>
            </div>
        </servis>
        <burger>
            <div class="burger">
                <img src="./img/Menu.png" alt="burger" class="header__burger">
            </div>
        </burger>
      </div>
      <div class="main" id="maininfo">
        <mainleft>
            <div class="main__left">
                <div class="main__text-small">
                    <div class="main__line"></div>
                    <p>Creative Agency</p>
                </div>
                <h1>We Deliver The Best
                    Product for You</h1>
                    <p class="main__description">Design is the creation of a plan or convention for the construction of an object or a system as in architectural blueprints, engineering drawings, business processes,</p>
                    <div class="main__btn">
                    <p>	Get started </p>
                        <img src="./img/paje1__btn-img.png" alt="btn-img" class="Paje1__btn-img">
                    </div>
            </div>
        </mainleft>
        <mainright>
            <div class="main__right">
                <img src="./img/main__img.png" alt="main-img" class="main__img-big">
        </div>
        </mainright>
      </div>
    </div>
    <!-- Paje1 finish -->
  </template>
  
  <script>
  export default {
    // Component logic here
  }
  </script>
  
  <style>

@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;500;600;700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Poppins:wght@300;400;500;600;700&display=swap');

.Paje1 .main .main__left {
    width: 50%;
    padding-left: 135px;
    padding-top: 130px;
}


  .Paje1 {
    width: 100%;
    height: 750px;
    background-image: url(./img/paje1__bacgroung.png);
    background-repeat: no-repeat;
    background-position: top right;
  }
  
  .Paje1 .header {
    width: 100%;
    height: 100px;
    padding: 0 135px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  
  .Paje1 .header .logo {
    width: auto;
    height: auto;
    font-family: 'Josefin Sans';
    font-style: normal;
    font-weight: 700;
    font-size: 30px;
    line-height: 30px;
    letter-spacing: 0.02em;
    color: #F087B1;
  }
  
  .Paje1 .header .logo p span {
    color: rgba(86, 89, 122, 1);
  }
  
  .Paje1 .header .servis {
    width: auto;
    height: 100%;
    display: flex;
    align-items: center;
    padding-left: 500px;
  }
  
  .Paje1 .header .servis .servises__home {
    color: #56597A;
  }
  
  .Paje1 .header .servis a {
    text-decoration: none;
    margin: 40px;
    font-family: 'Poppins', sans-serif;
    font-style: normal;
    font-weight: 500;
    font-size: 20px;
    line-height: 30px;
    color: #AAAAAB;
    display: inline-block;
    position: relative;
    margin-block: 2px;
    animation-name: textinda;
  }
  
  .Paje1 .header .servis a::after {
    content: '';
    width: 100%;
    height: 2px;
    background-color: rgba(86, 89, 122, 1);
    border-radius: 4px;
    position: absolute;
    left: 0;
    bottom: 0;
    transform: scaleX(0);
    transform-origin: left;
    transition: transform 0.25s ease;
  }
  
  .Paje1 .header .servis a:hover::after {
    transform: scaleX(1);
  }
  
  .Paje1 .header .header__burger {
    cursor: pointer;
  }
  
  .Paje1 .main {
    width: 100%;
    display: flex;
  }
  
  .main__left {
    width: 50%;
    padding-left: 135px;
    padding-top: 130px;
  }
  
  .main__text-small {
    display: flex;
    font-family: 'Poppins', sans-serif;
    font-style: normal;
    font-weight: 500;
    font-size: 28px;
    line-height: 40px;
    color: #F78CB6;
  }
  
  .main__text-small p {
    position: relative;
    bottom: 23px;
    margin-left: 7px;
    width: 400px;
    white-space: nowrap;
  }
  
  .main__line {
    width: 36px;
    height: 3px;
    background: #F78CB6;
  }
  
  .main__left h1 {
    margin-top: 5px;
    font-family: 'Poppins', sans-serif;
    font-style: normal;
    font-weight: 700;
    font-size: 48px;
    line-height: 74px;
    width:500px;
    color: #56597A;
  }
  
  .main__description {
    font-family: 'Montserrat', sans-serif;
    font-style: normal;
    font-weight: 400;
    font-size: 20px;
    line-height: 32px;
    letter-spacing: 0.02em;
    color: #919299;
    margin-top: 20px;
    width:500px;
  }
  
  .main__button {
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
  
  .Paje1 .main .main__left .main__btn:hover {
    background: #000000;
    transition: 0.4s;
  }
  
  .Paje1 .main .main__right {
    width: 50%;
    height: auto;
  }
  
  .Paje1 .main .main__right .main__img-big {
    width: 507px;
    height: 507px;
    margin-left: 20px;
    margin-top: 40px;
  }
  </style>
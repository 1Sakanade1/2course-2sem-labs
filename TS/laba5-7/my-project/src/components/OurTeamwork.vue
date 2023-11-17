<template>
  <div class="Pjae-ilustation2">
    <div class="left-box">
      <div class="main__text-small">
        <p>Our Teamwork</p>
      </div>
      <h4>We Believe Success Lies On Teamwork</h4>
      <p class="main__description">Good teamwork means a synergistic way of working with each person committed and working towards a shared goal. ... It is therefore a necessity that leaders facilitate and build the teamwork skills of their people if they are </p>
      <div class="main__btn">
        <p>Learn more</p>
        <img src="./img/paje1__btn-img.png" alt="btn-img" class="Pajeilustratin-btn-img">
      </div>
    </div>
    <div class="right-box">
      <img class="paje5-img Paje__Ilustration2-img" src="./img/paje5-img.png" alt="img">
    </div>
  </div>
</template>


<script>
</script>   


<style>
.Pjae-ilustation2 {
  width: 100%;
  height: auto;
  margin-top: 200px;
  padding: 0 135px;
  display: flex;
}

.Pjae-ilustation2 .left-box {
  width: 50%;
  height: auto;
}

.Pjae-ilustation2 .left-box .main__text-small,
.Pjae-ilustation2 .left-box .main__text-small p {
  display: flex;
  font-family: 'Poppins', sans-serif;
  font-style: normal;
  font-weight: 500;
  font-size: 28px;
  line-height: 40px;
  color: #F78CB6;
}

.Pjae-ilustation2 .left-box .main__text-small p {
  position: relative;
  bottom: 23px;
  margin-left: 7px;
}

.Pjae-ilustation2 .left-box .main__line {
  width: 36px;
  height: 3px;
  background: #F78CB6;
}

.Pjae-ilustation2 .left-box h4 {
  margin-top: 5px;
  font-family: 'Poppins', sans-serif;
  font-style: normal;
  font-weight: 700;
  font-size: 48px;
  line-height: 74px;
  color: #56597A;
}

.Pjae-ilustation2 .left-box .main__description {
  font-family: 'Montserrat', sans-serif;
  font-style: normal;
  font-weight: 400;
  font-size: 20px;
  line-height: 32px;
  letter-spacing: 0.02em;
  color: #919299;
  margin-top: 20px;
}

.Pjae-ilustation2 .left-box .main__btn {
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

.Pjae-ilustation2 .left-box .main__btn:hover {
  background: #000000;
  transition: 0.4s;
}

.Pjae-ilustation2 .right-box {
  width: 50%;
  height: auto;
  padding-left: 30px;
}

.Pjae-ilustation2 .right-box .paje5-img {
  position: relative;
  bottom: 80px;
}
</style>
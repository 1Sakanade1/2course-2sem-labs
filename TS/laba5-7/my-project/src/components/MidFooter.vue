<template>
  <div class="Paje8">
    <div class="Paje8__left">
      <img src="./img/paje8.png" alt="img">
    </div>
    <div class="Paje8__uppprostred">
      <h5>Subscribe To Our Blog</h5>
      <p class="Paje8__description">A newsletter is a tool used to communicate regularly with your subscribers, delivering the information</p>
      <div class="Paje8__email">
        <img src="./img/Mail.png" alt="email" class="Paje8_img-email">
        <input type="text" placeholder="Type Your Email Address" id="emailInput">
        <div class="Paje8__btn" @click="validateEmail">
          <p>Send now</p>
          <img src="./img/paje8--email.png" alt="">
        </div>
      </div>
    </div>
    <div class="Paje8__right">
      <img src="./img/paje7-boolbs.png" alt="blobs" class="Paje8__blobs">
    </div>
    <transition name="fade">
      <div v-if="showPopup" class="popup">
        <p class="popup-message">{{ popupMessage }}</p>
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  props: {
    emails: {
      type: Array,
      required: true
    }
  },
  data() {
    return {
      showPopup: false,
      popupMessage: ''
    };
  },
  methods: {
    validateEmail() {
      const emailInput = document.getElementById('emailInput');
      const email = emailInput.value.trim();
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  const emailExists = this.emails.some(item => item.email === email);

  if (emailRegex.test(email)) {
    if (emailExists) {
      this.showPopup = true;
      this.popupMessage = 'Email already subscribed!';
    } else {
      this.showPopup = true;
      this.popupMessage = 'Confirm subscription in message on your email';
      this.$emit('add-email', {id:this.emails.length, email:emailInput.value.trim() });
    }
  } else {
    this.showPopup = true;
    this.popupMessage = 'Incorrect email! Please check your address.';
  }

      setTimeout(() => {
        this.showPopup = false;
        this.popupMessage = '';
      }, 2000);
    }
  }
}
</script>


<style>
.Paje8 {
  width: 100%;
  height: auto;
  display: flex;
  margin-top: 120px;
}

.Paje8__left {
  width: 20%;
  height: 300px;
  padding-left: 30px;
}

.Paje8__uppprostred {
  width: 60%;
  height: 300px;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding-top: 23px;
}

.Paje8__uppprostred h5 {
  font-family: 'Montserrat', sans-serif;
  font-style: normal;
  font-weight: 700;
  font-size: 36px;
  line-height: 72px;
  color: #56597A;
}

.Paje8__uppprostred .Paje8__description {
  font-family: 'Poppins', sans-serif;
  font-style: normal;
  font-weight: 400;
  font-size: 20px;
  line-height: 32px;
  text-align: center;
  color: #919299;
  margin-top: 18px;
  padding: 0 85px;
}

.Paje8__uppprostred .Paje8__email {
  width: 706px;
  height: 82px;
  background: #FFFFFF;
  border-radius: 4px;
  margin-top: 15px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding-left: 27px;
  padding-right: 13px;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.13);
}

.Paje8__uppprostred .Paje8__email input {
  width: 300px;
  height: 100%;
  font-family: 'Montserrat', sans-serif;
  font-style: normal;
  font-weight: 400;
  font-size: 18px;
  line-height: 32px;
  color: #D2D2D2;
  outline: none;
  border: none;
  background-color: transparent;
  margin-right: 80px;
}

.Paje8__uppprostred .Paje8__email .Paje8__btn {
  width: 180px;
  height: 54px;
  background: #F78CB6;
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding-right: 13px;
  padding-left: 17px;
  font-family: 'Montserrat', sans-serif;
  font-style: normal;
  font-weight: 450;
font-size: 18px;
  line-height: 30px;
  letter-spacing: 0.02em;
  color: #FFFFFF;
  transition: 1s;
  cursor: pointer;
}

.Paje8__uppprostred .Paje8__email .Paje8__btn:hover {
  background-color: #000000;
  transition: 0.4s;
}

.Paje8__right {
  width: 20%;
  height: 300px;
  display: flex;
  align-items: center;
  justify-content: flex-end;
}

.Paje8__right .Paje8__blobs {
  position: relative;
  left: 200px;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease-in-out;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}

.popup {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  padding: 10px;
  background-color: #fff;
  border-radius: 4px;
  color: #56597A;
  font-family: 'Montserrat', sans-serif;
  font-style: normal;
  font-weight: 700;
  font-size: 36px;
  line-height: 72px;
  text-align: center;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
}
</style>
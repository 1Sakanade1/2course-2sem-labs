<template>
  <TopOfPage></TopOfPage>
  <TopAndServicesDivider></TopAndServicesDivider>
  <ServicesComp></ServicesComp>
  <DesignThings></DesignThings>
  <OurTeamwork></OurTeamwork>
  <TeamworkTestiDiv></TeamworkTestiDiv>
  <TestimonialComp></TestimonialComp>
  <UpperFooter></UpperFooter>
  <MidFooter :emails="emailList" @add-email="addEmail"></MidFooter>
  <LowerFooter></LowerFooter>
</template>

<script>
import TopOfPage from './components/TopOfPage.vue'
import TopAndServicesDivider from './components/TopAndServicesDivider.vue'
import ServicesComp from './components/ServicesComp.vue'
import DesignThings from './components/DesignThings'
import OurTeamwork from './components/OurTeamwork.vue'
import TeamworkTestiDiv from './components/TeamworkTestimonalDivider.vue'
import TestimonialComp from './components/TestimonialComp.vue'
import UpperFooter from './components/UpperFooter.vue'
import MidFooter from './components/MidFooter.vue'
import LowerFooter from './components/LowerFooter.vue'

export default {
  name: 'App',
  components: {
    TopOfPage,
    TopAndServicesDivider,
    ServicesComp,
    DesignThings,
    OurTeamwork,
    TeamworkTestiDiv,
    TestimonialComp,
    UpperFooter,
    MidFooter,
    LowerFooter
  },
  data() {
    return {
      emailList: [
        { id: 1, email: 'email1@example.com' },
        { id: 2, email: 'email2@example.com' },
        { id: 3, email: 'email3@example.com' },
        { id: 4, email: 'email4@example.com' },
        { id: 5, email: 'email5@example.com' }
      ]
    };
  },
    methods: {
    addEmail(newEmail) {
      this.emailList.push(newEmail);
	console.log(123);
    }
  }
}
</script>

<style>
*{
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}
body{
	overflow-x: hidden;
	scroll-behavior: smooth;
}
.wrap{
	width: 100%;
  min-height: 100vh;
  display: flex;
  justify-content: center;
	background-color: #FCFCFC;
}
.conteiner{
	max-width:  1600px;
	min-height: 300px;
  min-height: 100vh;
	background-color: #FCFCFC;
	overflow-x: hidden;
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

		h3{
			margin-top: 5px;
			font-family: 'Poppins', sans-serif;
			font-style: normal;
			font-weight: 700;
			font-size: 48px;
			line-height: 74px;
			color: #56597A;

		}
</style>

<template>
  <div>
    <!-- HTML-разметка компонента -->
    <h1>{{ title }}</h1>
    <p>{{ message }}</p>
    <button @click="handleClick">Нажми меня</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      title: 'Привет, Vue!',
      message: 'Это мой первый компонент Vue.js'
    };
  },
  methods: {
    handleClick() {
      alert('Вы нажали кнопку!');
    }
  }
};
</script>

<style scoped>
/* Стили компонента */
h1 {
  color: blue;
}
p {
  font-size: 18px;
}
button {
  background-color: #ff0000;
  color: #fff;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}
</style>
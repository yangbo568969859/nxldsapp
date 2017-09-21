<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'app'
}
</script>

<style>
  *{
    padding:0;
    margin:0;
    list-style: none;
    text-decoration:none;
    box-sizing: border-box;
  }
  body{
    font-family: Arial,helvetica,微软雅黑,Microsoft Yahei,sans-serif;
    font-size: .14rem;
    background: #F2F2F2;
  }
  input,button{
    border: none;
    font-size: .14rem;
    outline: none;
    outline: medium;
    text-transform: none;
  }
</style>

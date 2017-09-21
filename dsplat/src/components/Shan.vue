<template>
  <div>
    <div class="box">
      <div class="download"><a href="">点击下载APP</a></div>
      <div class="continue"><a href="#/home">继续浏览 > </a></div>
    </div>

  </div>
</template>

<script>
export default {
  name: 'hello',
  data () {
    return {

    }
  }
}
</script>

<style scoped>
  .box{
    text-align: center;
  }
  .download{
    width:1.8rem;
    height:.4rem;
    background: #FE4070;
    border-radius: 0.45rem;
    font-size:0.14rem;
    line-height:0.45rem;
    text-align: center;
    margin:0 auto;
    margin-top:3rem;
  }
  .download a{
    color: #fff;
  }
  .continue{
    font-size:0.14rem;
    margin-top:.2rem;
  }
  .continue a{
    font-family:'宋体';
    color: #666;
  }
</style>

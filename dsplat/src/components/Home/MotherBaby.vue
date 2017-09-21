<template>
    <div>
        <app-header :id="id"></app-header>
        <div class="content">
            <div class="cont-title">
                <ul>
                    <li>
                        <a href="">
                            <img src="../../assets/img/fenlei-title1.png" alt="">
                            <div class="cont-title-text">正品无误</div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="../../assets/img/fenlei-title1.png" alt="">
                            <div class="cont-title-text">正品无误</div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="../../assets/img/fenlei-title1.png" alt="">
                            <div class="cont-title-text">健康品牌</div>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="../../assets/img/fenlei-title1.png" alt="">
                            <div class="cont-title-text">轻松退货</div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="con-main">
                <div class="main-header">
                    <span class="main-header-bg">
                        <img src="../../assets/img/gezi.png" alt="">
                    </span>
                    <span>今日团购，每天10点上新</span>
                </div>
                <section class="list" v-for="v in muying" :key="v.id">
                    <router-link :to="{name:'storeone',query:{sid:v.id}}">
                        <div class="main">
                            <div class="main-image">
                                <img :src="v.pic" alt="">
                                <div class="discount">
                                    <p>特价+促销+包邮</p>
                                </div>
                            </div>
                            <div class="main-information">
                                <div class="info-right">
                                    <img :src="v.logo_pic" alt="">
                                </div>
                                <div class="info-left">
                                    <p class="left-title">{{v.info}}</p>
                                    <p class="left-bottom">
                                        剩余
                                        <span>02天</span>
                                        <span>12时</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </router-link>
                </section>
            </div>
        </div>
        <app-footer :footid="footid"></app-footer>
    </div>
</template>

<script>
    import Header from '../Header.vue'
    import Footer from '../Footer.vue'
    export default {
        name: 'homepage',
        data () {
            return {
                id:3,
                footid:1,
                muying:{},
            }
        },
        mounted(){
            fetch('/api/get_store_by_fenlei_id?fenlei_id=3')
                .then(res=>res.json())
                .then(data=>this.muying=data);
        },
        components:{
            'app-header':Header,
            'app-footer':Footer,
        }
    }
</script>

<style scoped>
    .content{
        margin-bottom: .08rem;
    }
    .cont-title ul{
        padding:.16rem 0;
        background: #fff;
    }
    .cont-title ul li{
        width:24%;
        display: inline-block;
        text-align: center;
        position: relative;
    }
    .cont-title ul li img{
        width:52%;
        margin:0 auto;
        display: block;
    }
    .cont-title-text{
        width: 100%;
        color: #666;
        margin-top: .1rem;
        text-align: center;
        font-size: .12rem;
    }
    .con-main{
        margin-top:.08rem;
        background: #fff;
    }
    .main-header{
        text-align: center;
        font-size: .14rem;
        line-height:.4rem;
    }
    .main-header-bg{
        display: inline-block;
        width:.16rem;
        height:.16rem;
        position: relative;
        vertical-align: middle;
    }
    .main-header-bg img{
        width:100%;
        display: block;
    }
    .main{
        overflow: hidden;
        background: #fff;
    }
    .main-image{
        height:1.84rem;
        overflow: hidden;
        position: relative;
    }
    .main-image img{
        width:100%;
    }
    .discount{
        position: absolute;
        left:0;
        bottom:.2rem;
        background: #000;
        height:.18rem;
        line-height: .18rem;
    }
    .discount p{
        color: #fff;
        font-size:.11rem;
        padding:0 .03rem;
    }
    .main-information{

    }
    .info-right{
        float: right;
        width:.90rem;
        height:.47rem;
        padding-right:.18rem;
        padding-top:.12rem;
    }
    .info-right img{
        width:100%;
    }
    .info-left{
        float: left;
        padding:.15rem;
    }
    .left-title{
        color: #333;
    }
    .left-bottom{
        color: #999;
    }
</style>
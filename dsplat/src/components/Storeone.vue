<template>
    <div>
        <!--<header>-->
            <!--<div class="header">-->
                <!--<a href="" class="head-left"><span class="iconfont icon-iconfontjiantouzuo"></span></a>-->
                <!--<div class="head-tit">{{storeinfo.info}}</div>-->
                <!--<a href="" class="head-right"><span class="iconfont icon-home"></span></a>-->
            <!--</div>-->
        <!--</header>-->
        <div class="shop-logo">
            <div class="shop-logo-img">
                <img src="../assets/img/nvlogo1.jpg" alt="">
            </div>
            <div class="shop-logn-contain">
                <div class="contain-left">
                    <div class="logo">
                        <img src="../assets/img/57ac228b0e52a_320_320.jpg" alt="">
                    </div>
                    <div class="shop-name">
                        <h3>{{storeinfo.name}}</h3>
                    </div>
                </div>
                <div class="contain-right">收藏</div>
                <div class="contain-bottom">
                    <span>1.4万</span>人已收藏
                </div>
            </div>
        </div>
        <div class="content">
            <ul class="cont-list">
                <li v-for="v in allgoods" :key="v.id">
                    <router-link :to="{name:'goodsdetail',query:{id:v.id,sid:$route.query.sid}}" class="zc-link">
                        <div class="li-cont">
                            <div class="produce-img">
                                <img src="../assets/img/tianshigege2.jpg" alt="">
                            </div>
                            <div class="produce-name">
                                <span>自营</span>
                                {{v.info}}
                            </div>
                            <div class="produce-text">
                                <span>带防伪码</span>
                            </div>
                            <div class="produce-info">
                                <span>
                                    <span class="nowprice">¥{{v.now_price}}</span>
                                    <span class="oriprice">¥{{v.original_price}}</span>
                                    <i>赠</i>
                                </span>
                            </div>
                        </div>
                    </router-link>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                storeinfo:{},
                allgoods:{},
            }
        },
        methods: {

        },
        mounted(){
            fetch('/api/get_storeinfo_by_id?id='+this.$route.query.sid)
                .then(res=>res.json())
                .then(data=>this.storeinfo=data[0])
            fetch('/api/get_goods_bysid?sid='+this.$route.query.sid)
                .then(res=>res.json())
                .then(data=>this.allgoods=data)
        }
    }
</script>

<style scoped>
    header{
        position: relative;
        background: #fff;
    }
    span{
        color: #333;
    }
    .header{
        display: flex;
        height:.45rem;
        border-bottom: 1px solid #eee;
        text-align: center;
        position: relative;
    }
    .header a{
        display: block;
    }
    .header .head-left{
        position: absolute;
        left: .1rem;
        top: .16rem;
        width: .15rem;
        height: .075rem;
        background-size: contain;
    }
    .head-tit{
        display: block;
        text-align: center;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        font-size: .16rem;
        color: #333;
        width:100%;
        line-height:.45rem;
    }
    .header .head-right{
        position: absolute;
        right: .2rem;
        top: .08rem;
        width: .15rem;
        height: .075rem;
        background-size: contain;
    }
    .icon-home{
        font-size:.28rem;
    }

    .shop-logo{
        /*background: url('../assets/img/57ac228575beb_1024_304.jpg') left top / 100% no-repeat;*/
        transform-origin: 0px 0px 0px;
        opacity: 1;
        width:100%;
        height:1.11rem;
        position:relative;
        overflow: hidden;
    }
    .shop-logo-img{
        position: absolute;
        left:50%;
        transform:translateX(-50%);
        width:100%;
        height:auto;
    }
    .shop-logo-img img{
        width:100%;
    }
    .shop-logn-contain{
        width: 100%;
        height: 1.11rem;
        background: rgba(0,0,0,.6);
        padding: .28rem .17rem 0 .17rem;
        box-sizing: border-box;
        position: relative;
    }
    .contain-left{

    }
    .logo{
        width:.58rem;
        height:.58rem;
        margin-right:.12rem;
        float: left;
    }
    .logo img{
        width:100%;
        border-radius: 50%;
    }
    .shop-name{
        float: left;
        margin-top:.11rem;
    }
    .shop-name h3{
        font-size:.14rem;
        color: #fff;
    }
    .contain-right{
        width: .75rem;
        height: .25rem;
        color: #fff;
        background: #fe4070;
        font-size: .13rem;
        text-align: center;
        line-height: .25rem;
        float: right;
        border-radius: 2.5rem;
        margin-top:.11rem;
    }
    .contain-bottom{
        position: absolute;
        right:.14rem;
        top:.75rem;
        color:#fff;
        font-size:.12rem;
    }
    .title{
        width:100%;
    }
    .title a{
        width:25%;
        float: left;
        border-bottom: 1px solid #eee;
        height: .42rem;
        line-height: .42rem;
        background: #fff;
        text-align: center;
        font-size: .14rem;
        color: #666;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
    }


    .cont-list{
        padding: 0.02rem .05rem;
        overflow: hidden;
    }
    .cont-list li{
        width: 1.8rem;
        vertical-align: top;
        float: left;
        margin-bottom: .05rem;
        position: relative;
        border-radius: .04rem;
        background: #fff;
    }
    .cont-list li:nth-child(2n+1){
        margin-right:.05rem;
    }
    .zc-link{
        display: block;
    }
    .li-cont{
        position: relative;
        background: #fff;
    }
    .produce-img{
        margin-bottom: .09rem;
        height:2.40rem;
    }
    .produce-img img{
        width:100%;
    }
    .produce-name{
        padding:0 .11rem;
        color: #333;
        line-height:.18rem;
        font-size:.14rem;
        word-break: break-all;
        word-wrap: break-word;
        overflow: hidden;
        text-align: left;
        height:.36rem;
    }
    .produce-name span{
        font-size: .12rem;
        padding: 0 .02rem;
        line-height: .14rem;
        height: .14rem;
        border-radius: .02rem;
        display: inline-block;
        color: #fff;
        background: #fe4070;
        margin-right: .125rem;
    }
    .produce-text{
        padding:.04rem .08rem;
        height:.24rem;
        font-size:.12rem;
        overflow: hidden;
        color: #999;
        text-align: left;
    }
    .produce-info{
        padding: 0 .09rem;
        font-size: .12rem;
        margin-bottom: .1rem;
    }
    .produce-info>span{
        height:.2rem;
        overflow: hidden;
        display: block;
    }
    .produce-info>span>i{
        font-size:.1rem;
        line-height:.1rem;
        color: #fe4070;
        border:1px solid #fe4070;
        box-sizing: border-box;
        border-radius: 50%;
        padding:.02rem;
        float: left;
        font-style: normal;
        margin: .02rem .02rem 0 .02rem;
    }
    .nowprice{
        color: #fe4070;
        float: left;
        font-size:.18rem;
    }
    .oriprice{
        margin:0 .05rem;
        color: #999;
        font-size: .14rem;
        line-height: .18rem;
        height: .18rem;
        text-decoration: line-through;
        float: left;
    }
</style>
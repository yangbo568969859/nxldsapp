<template>
    <div class="warper">
        <header>
            <div class="header">
                <a href="" class="head-left"><span class="iconfont icon-iconfontjiantouzuo"></span></a>
                <div class="head-tit">我的订单</div>
                <a href="" class="head-right"><span class="iconfont icon-home"></span></a>
            </div>
        </header>
        <div class="order">
            <div class="order-title">
                <div class="title">
                    <a @click="tabs(1)">
                        <div>全部</div>
                        <div :class="{active:active==1}"></div>
                    </a>
                    <a @click="tabs(2)">
                        <div>待付款</div>
                        <div :class="{active:active==2}"></div>
                    </a>
                    <a @click="tabs(3)">
                        <div>待发货</div>
                        <div :class="{active:active==3}"></div>
                    </a>
                    <a @click="tabs(4)">
                        <div>待收货</div>
                        <div :class="{active:active==4}"></div>
                    </a>
                    <a @click="tabs(5)">
                        <div>待评价</div>
                        <div :class="{active:active==5}"></div>
                    </a>
                </div>
            </div>
        </div>
        <div class="all-order" v-if="active==1">
            <div class="order-empty">
                <img src="../assets/img/order-empty.2736d44.png" alt="">
            </div>
            <div class="order-list">
                <div class="order-list-all">
                    <div class="list-tit">
                        <span>订单号21121432432</span>
                        <span>已过期</span>
                    </div>
                    <div class="list-content">
                        <div class="list-cont1">
                            <img src="" alt="">
                        </div>
                        <div class="list-cont2">
                            <div class="cont2-tit">中国台湾•我的心机花漾美颜黑膜礼盒组21片</div>
                            <div class="cont2-bot">型号:23ml x 21片</div>
                        </div>
                        <div class="list-cont3">
                            <div class="cont3-tit">¥59.9</div>
                            <div class="cont3-bot">x 3</div>
                        </div>
                    </div>
                    <div class="list-status">
                        <div class="status-cont">
                            该商品团购7月30日 14:39:18截止
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="wait-pay" v-if="active==2">
            <div class="order-empty">
                <img src="../assets/img/order-empty.2736d44.png" alt="">
            </div>
        </div>
        <div class="wait-send" v-if="active==3">
            <div class="order-empty">
                <img src="../assets/img/order-empty.2736d44.png" alt="">
            </div>
        </div>
        <div class="wait-confire" v-if="active==4">
            <div class="order-empty">
                <img src="../assets/img/order-empty.2736d44.png" alt="">
            </div>
        </div>
        <div class="wait-rate" v-if="active==5">
            <div class="order-empty">
                <img src="../assets/img/order-empty.2736d44.png" alt="">
            </div>
        </div>

    </div>
</template>

<script>
    export default {
        data(){
            return {
                active:1,
            }
        },
        methods:{
            tabs:function (i) {
                this.active=i;
            }
        }
    }
</script>

<style scoped>
    .warper{
        background: #fff;
        position: absolute;
        left: 0;
        top: 0;
        right: 0;
        bottom: 0;
    }
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
    .title{
        width:100%;
    }
    .title a{
        width:20%;
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
    .active{
        background: #fe4070;
        width: 100%;
        height:2px;
        margin: 0 auto;
    }
    .order-empty{
        background: #fff;
        position: fixed;
        left: 0;
        top: .89rem;
        right: 0;
        width: 100%;
        bottom: 0;
        z-index: 100;
    }
    .order-empty img {
        margin: 1rem auto 0;
        width: 1.34rem;
        height: 1.21rem;
        display: block;
    }
    .order-list{
        position: absolute;
        left: 0;
        top: .89rem;
        right: 0;
        bottom: 0;
        z-index: 90;
    }
    .order-list-all{
        border-bottom: 1px solid #eee;
        border-top: 1px solid #f5f5f5;
        color: #333;
        background: #fff;
    }
    .list-tit{
        display: flex;
        justify-content:space-between;
        align-items:center;
    }
    .list-tit span{
        font-size: .12rem;
        line-height: .36rem;
        height: .36rem;
        color: #999;
        padding-left: .2rem;
        padding-right:.2rem;
    }
    .list-content{
        border-top: 1px solid #eee;
        display: flex;
        padding: .1rem .2rem;
    }
    .list-cont1{
        flex: 1;
    }
    .list-cont1 img{
        width:.7rem;
        height:.7rem;
        display: block;
    }
    .list-cont2{
        flex: 6;
        max-width: 2.2rem;
    }
    .cont2-tit{
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        padding-left: .05rem;
    }
    .cont2-bot{
        font-size: .12rem;
        color: #999;
        margin-top: .02rem;
        vertical-align: bottom;
    }
    .list-cont3{
        flex: 1;
        text-align: right;
    }
    .cont3-bot{
        font-size: .12rem;
        color: #999;
        margin-top: .02rem;
        vertical-align: bottom;
    }
    .list-status{
        height:.35rem;
        border-top: 1px solid #eee;
        display: flex;
        align-items:center;
        justify-content: flex-end;
        padding-right:.2rem;
    }
    .status-cont{
        color: rgb(153, 153, 153);
        font-size: 0.12rem;
        text-align: left;

    }

</style>
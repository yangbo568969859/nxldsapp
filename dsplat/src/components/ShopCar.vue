<template>
    <div>
        <header>
            <div class="header">
                <a href="" class="head-left"><span class="iconfont icon-iconfontjiantouzuo"></span></a>
                <div class="head-tit">购物车</div>
                <a href="" class="head-right"><span class="iconfont icon-home"></span></a>
            </div>
        </header>
        <div class="car-main">
            <div class="car-tit">
                <div class="timeimg"></div>
                <div class="timeword">00:15:00</div>
                <div class="time-cont">结算时间结束后，商品可能被抢空，请尽快结算</div>
            </div>
            <div class="car-content">
                <div class="group-header">
                    <span></span>
                    <div class="group-head-word">
                        聚美优品发货
                    </div>
                </div>
                <div class="group-cont">
                    <div class="item" v-for="v in shopcar">
                        <span class="check-box"></span>
                        <div class="item-content">
                            <div class="item-cont-cont">
                                <div class="item-img">
                                    <img src="../assets/img/3365132_200_200.jpg" alt="">
                                </div>
                                <div class="item-text">
                                    <span class="title">
                                        <span>[极速免税]</span>{{v.name}}
                                    </span>
                                    <div class="guige" v-if="tabs==1">
                                        <span>120ml*2</span>
                                        <span>×{{v.num}}</span>
                                    </div>
                                    <div class="jisuan" v-if="tabs==2">
                                        <span class="min" @click="min(v)">-</span>
                                        <span class="number">{{v.num}}</span>
                                        <span class="add" @click="add(v)">+</span>
                                    </div>
                                    <div class="price">
                                        <span class="one">¥{{v.num*v.now_price}}</span>
                                        <span class="two" @click="edit(2)">编辑</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="submit">
            <div class="sub-info">
                <span class="check-box-checked"></span>
                <span class="check-box-text">全选</span>
                <div class="summary">
                    <span class="total">合计</span>
                    <span class="money">¥{{total}}</span>
                </div>
            </div>
            <div class="sub-btn" @click="submit">
                去结算(5)
            </div>
        </div>
        <app-footer :footid="footid"></app-footer>
    </div>
</template>

<script>
    import Footer from './Footer.vue'
    export default {
        data () {
            return {
                footid:2,
                tabs:1,
                shopcar:localStorage.logoods?JSON.parse(localStorage.logoods):[],
            }
        },
        methods:{
            submit:function () {
                if(localStorage.user){
                    location.href='#/jiesuan'
                    localStorage.logoods=JSON.stringify(this.shopcar);
                }else {
                    location.href='#/login'
                }
            },
            edit:function (v) {
                this.tabs=v;
            },
            min:function (v) {
                if(v.num<=0){
                    return;
                }
                v.num-=1;
            },
            add:function (v) {
                v.num+=1;
            }
        },
        computed:{
            total:function () {
                let t=0;
                this.shopcar.forEach(v=>{
                     t+=v.num*v.now_price;
                })
                return t;
            },
        },
        components:{
            'app-footer':Footer,
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
    .car-tit{
        padding:0 .08rem;
        height:.3rem;
        color: #999;
        background: #fff;
        display: flex;
        align-items: center;
    }
    .timeimg{
        background: url("../assets/img/time.png");
        width:.15rem;
        height:.15rem;
        background-size: 100% 100%;
    }
    .timeword{
        width: 20%;
        margin-left: .05rem;
        font-size: .14rem;
        color: #fe4070;
    }
    .time-cont{
        flex: 1;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        font-size:.12rem;
    }
    .car-content{
        margin-top:.08rem;
    }
    .group-header{
        height:.4rem;
        background: #fff;
        padding-left:.08rem;
        border-bottom: 1px solid #eee;
        display: flex;
        align-items: center;
    }
    .group-header span{
        width:.2rem;
        height:.2rem;
        background:url("../assets/img/colorduihao.png");
        background-size: 100% 100%;
        display: block;
    }
    .group-head-word{
        margin-left:.08rem;
    }
    .group-cont{

    }
    .item{
        padding:0 .08rem;
        display: flex;
        background: #fff;
    }
    .check-box{
        display: block;
        width:.2rem;
        height:.2rem;
        margin-top:.45rem;
        background: url("../assets/img/colorduihao.png") ;
        background-size: 100% 100% ;
    }
    .item-content{
        flex: 1;
    }
    .item-cont-cont{
        display: flex;
    }
    .item-img{
        width:.84rem;
        height:.84rem;
        margin-top:.1rem;
        position: relative;
    }
    .item-img img{
        width:100%;
        height:100%;
    }
    .item-text{
        flex: 1;
        display: flex;
        flex-direction: column;
        margin-top:.1rem;
        margin-left:.1rem;
    }
    .title{
        text-overflow: ellipsis;
        word-break: break-all;
        font-size:.12rem;
        color: #333;
    }
    .title span{
        color: #fe4070;
    }
    .guige{
        margin-top:.04rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: .12rem;
        line-height:.12rem;
        font-size:.12rem;

    }
    .guige span{
        color: #999;
    }
    .jisuan{
        margin:.1rem 0;
        height:.23rem;
        display: flex;
        align-items:center;
    }
    .min,.add{
        width:.22rem;
        height:.22rem;
        line-height:.22rem;
        text-align: center;
        display: block;
        font-size:.18rem;
        border-radius: 50%;
        border:1px solid #999;
        color: #999;
    }
    .number{
        width:.4rem;
        height:.22rem;
        color: #999;
        display: block;
        line-height:.22rem;
        text-align: center;
    }


    .price{
        margin-top:.04rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
        height:.22rem;
        margin-bottom: .1rem;
    }
    .price span.one{
        color: #fe4070;
        font-size:.16rem;
    }
    .price span.two{
        color: #333;
        font-size:.12rem;
    }

    .submit{
        position: fixed;
        display: flex;
        left:0;
        bottom: .45rem;
        width:100%;
        height:.5rem;
        box-shadow: 0 0 0.15625rem #eee;
        justify-content: space-between;
        align-items: center;
        padding:0 .08rem 0 .08rem;
        background: #fff;
    }
    .sub-info{
        display: flex;
        align-items: center;
    }
    .check-box-checked{
        background: url("../assets/img/colorduihao.png");
        background-size: 100% 100%;
        width:.2rem;
        height:.2rem;
    }
    .check-box-text{
        margin-left:.2rem;
    }
    .total{
        margin-left: .1rem;
        font-size:.1rem;
        color: #999;
    }
    .money{
        color: #fe4070;
        font-size:.14rem;
    }
    .sub-btn{
        background: #fe4070;
        width:1.25rem;
        height:.36rem;
        border-radius: .36rem;
        font-size:.14rem;
        color: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
    }

</style>
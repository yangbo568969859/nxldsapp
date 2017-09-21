<template>
    <div class="per-con">
        <div class="per-title" v-if="active">
            <div class="pertitle-top">
                <img src="" alt="">
            </div>
            <div class="pertitle-bottom">
                <a href="#/login">登录</a>
                <div class="line"></div>
                <a href="#/login/register">注册</a>
            </div>
        </div>
        <div class="per-title-login" v-else>
            <div class="pertitle-top-login">
                <img src="" alt="">
                <div class="info">
                    <span class="name">{{tel}}</span>
                    <span class="vip">普通会员</span>
                </div>
            </div>
        </div>
        <div class="myorder">
            <div class="order-tit">
                <span class="iconfont iconqian icon-dingdan"></span>
                我的订单
                <a href="#/order">
                    <span>查看我的全部订单</span>
                    <span class="iconfont icon-right icon-arrow-left"></span>
                </a>
            </div>
            <div class="order-content">
                <a href="">
                    <span class="iconfont icon icon-daifukuan"></span>
                    <span>待付款</span>
                </a>
                <a href="">
                    <span class="iconfont icon icon-shouhuo"></span>
                    <span>待收货</span>
                </a>
                <a href="">
                    <span class="iconfont icon icon-daipingjia"></span>
                    <span>待评价</span>
                </a>
                <a href="">
                    <span class="iconfont icon icon-tuikuan"></span>
                    <span>退货/退款</span>
                </a>
            </div>
        </div>
        <section class="myasset">
            <div class="asset-tit">
                <span class="iconfont iconqian icon-qiandai"></span>
                我的资产
            </div>
            <div class="order-content">
                <a href="">
                    <span>现金券</span>
                </a>
                <a href="">
                    <span>红包</span>
                </a>
                <a href="">
                    <span>聚美余额</span>
                </a>
                <a href="">
                    <span>礼品卡</span>
                </a>
            </div>
        </section>
        <section class="myasset">
            <a href="" class="asseta">
                <span class="iconfont iconxia icon-shouhoufuwu"></span>
                <span>售后服务</span>
                <span class="iconfont iconright icon-arrow-left"></span>
            </a>
            <a href="" class="asseta">
                <span class="iconfont iconxia icon-yijianfankui"></span>
                <span>意见反馈</span>
                <span class="iconfont iconright icon-arrow-left"></span>
            </a>
            <a href="" class="asseta">
                <span class="iconfont iconxia icon-daishouhuo"></span>
                <span>收货地址</span>
                <span class="iconfont iconright icon-arrow-left"></span>
            </a>
            <a href="" class="asseta">
                <span class="iconfont iconxia icon-tuichudenglu"></span>
                <span>退出登录</span>
                <span class="iconfont iconright icon-arrow-left"></span>
            </a>
            <a href="" class="asseta">
                <span class="iconfont iconxia icon-dianhua"></span>
                <span>电话服务</span>
                <span class="iconfont iconright icon-arrow-left"></span>
            </a>
        </section>
        <div class="foot">
            客服热线400-123-8888 (8:00-22:00)<br>
            拨打前请记录您的UID  0
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                uid:localStorage.user,
                active:true,
                user:{},
            }
        },
        methods: {

        },
        mounted(){
            if(localStorage.user){
                this.active=false;
            }else {
                this.active=true;
            }
            fetch('/api/get_c_user_account?id='+this.uid)
                .then(res=>res.json())
                .then(r=>this.user=r[0]);
        },
        computed:{
            tel:function () {
                if(this.user.account){
                    return this.user.account.slice(0,3)+'****'+this.user.account.slice(-4)
                }
            }
        }
    }
</script>

<style scoped>
    .per-title-login{
        position: relative;
        width: 100%;
        height: 1.58rem;
        background-image: linear-gradient(-204deg,#FD465F 0,#FC5E9F 100%);
    }
    .per-title-login img{
        width: .64rem;
        height: .64rem;
        display: block;
        border-radius: 50%;
        position: absolute;
        left: .32rem;
        top: .72rem;
        z-index: 10;
    }
    .info{
        font-size: .14rem;
        color: #fff;
        position: absolute;
        left: 1.42rem;
        bottom: .4rem;
    }
    .info span.name{
        display: block;
        margin-bottom:.1rem;
    }
    .info span.vip{
        background: rgba(255,255,255,.2);
        border-radius: 1rem;
        line-height: .18rem;
        padding: .03rem .05rem;
    }
    .per-con{
        position: absolute;
        top:0;
        width:100%;
    }
    .per-title{
        padding-top:.45rem;
        height:1.5rem;
        width:100%;
        background-image: linear-gradient(-204deg,#FD465F 0,#FC5E9F 100%);
    }
    .pertitle-top{
        width:.6rem;
        height:.6rem;
        margin: auto;
    }
    .pertitle-top img{
        width:.6rem;
        height:.6rem;
    }
    .pertitle-bottom{
        padding: .1rem;
        width:60%;
        margin: auto;
    }
    .pertitle-bottom a{
        line-height: .25rem;
        color: #fff;
        font-weight: 700;
        font-size: .18rem;
        text-decoration: none;
        display: inline-block;
        text-align: center;
        width: 47%;
    }
    .line{
        background: #fff;
        width: 1px;
        display: inline-block;
        height: .15rem;
        vertical-align: middle;
    }
    .myorder{
        margin-top:.14rem;
        background: #fff;
    }
    .order-tit{
        padding-left: .08rem;
        border-bottom: 1px solid #eaeaea;
        height: .36rem;
        line-height: .36rem;
        font-size: .14rem;
    }
    .order-tit a{
        float: right;
        color: #999;
    }
    .iconfont{
        vertical-align: middle;
        color: #999;
    }
    .iconqian{
        font-size: .2rem;
        margin-right: .1rem;
    }
    .icon-right{
        margin-right: .1rem;
    }
    .iconxia{
        display: inline-block;
        vertical-align: middle;
        background-size: 20px;
        margin-right: 10px;
        font-size:.24rem;
    }
    .iconright{
        float: right;
        margin-right: .1rem;
    }
    .order-content{
        display: flex;
        width:100%;
    }
    .order-content a{
        color: #666;
        font-size:.14rem;
        padding:.15rem 0;
        width:25%;
        text-align: center;
        display: inline-block;
    }
    .icon{
        display: block;
        font-size:.24rem;
        width: .24rem;
        height: .24rem;
        margin: .05rem auto;
        background-size: .24rem;
    }
    .myasset{
        background: #fff;
        margin-top: 12px;
    }
    .asset-tit{
        padding-left: 8px;
        border-bottom: 1px solid #eaeaea;
        height: 34px;
        line-height: 34px;
        font-size: 13px;
    }
    .asseta{
        display: block;
        text-decoration: none;
        color: #333;
        padding-left: 8px;
        border-bottom: 1px solid #eaeaea;
        height: 36px;
        line-height: 36px;
        font-size: 13px;
    }
    .foot{
        color: #999;
        font-size: 12px;
        margin: 15px;
        line-height: 15px;
    }
</style>
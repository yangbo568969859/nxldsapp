<template>
    <div>
        <header>
            <div class="header">
                <a href="" class="head-left"><span class="iconfont icon-iconfontjiantouzuo"></span></a>
                <div class="head-tit">结算中心</div>
                <a href="" class="head-right"><span class="iconfont icon-home"></span></a>
            </div>
        </header>
        <div class="address" v-if="!address">
            <div class="noadd-img"></div>
            <div class="noadd-text">
                还没有收货地址，
                <a href="#/address">去添加</a>
            </div>
        </div>
        <div class="showaddress" v-else>
            <div class="show-cont" @click="goaddresslist">
                <span class="add-icon"></span>
                <div class="add-cont">
                    <div class="add-cont-tit">
                        <span>收货人:{{address.name}}</span>
                        <span>{{address.phone}}</span>
                    </div>
                    <div class="add-cont-cont">
                        {{address.address}}
                    </div>
                </div>
                <span class="iconfont icon-arrow-left"></span>
            </div>
        </div>
        <div class="time-select">
            <span class="iconfont icon-gouwudai1"></span>
            <span class="select">工作日/双休/节假日均可收货</span>
            <span class="iconfont icon-arrow-left"></span>
        </div>
        <div class="order-list">
            <div class="order-head">
                <span class="iconfont icon-dianpu"></span>
                <span class="fahuo">发货中心</span>
            </div>
            <div class="order-content">
                <div class="item-content">
                    <div class="item-cont-cont" v-for="v in orderlist" :key="v.id">
                        <div class="item-img">
                            <img src="../assets/img/3365132_200_200.jpg" alt="">
                        </div>
                        <div class="item-text">
                                    <span class="title">
                                        <span>[极速免税]</span>{{v.info}}
                                    </span>
                            <div class="guige">
                                <span>120ml*{{v.num}}</span>
                                <span>×{{v.num}}</span>
                            </div>
                            <div class="price">
                                <span class="one">¥{{v.now_price*v.num}}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="order-bottom">
                <div class="bot-nav">
                    <div>运费</div>
                    <div class="yun-info">
                        <div class="yun-info1">快递：¥0</div>
                        <div class="yun-info2">享新用户满39元包邮，已减免¥5</div>
                    </div>
                </div>
                <div class="bot-nav">
                    <div class="nav-left">
                        <span>现金券</span>
                        <span class="juan">0张可用</span>
                    </div>
                    <div class="nav-right">
                        <span>使用现金劵</span>
                        <span class="iconfont icon-arrow-left"></span>
                    </div>
                </div>
                <div class="bot-nav">
                    <div class="nav-left">
                        <span>红包</span>
                        <span class="juan">0张可用</span>
                    </div>
                    <div class="nav-right">
                        <span>使用红包</span>
                        <span class="iconfont icon-arrow-left"></span>
                    </div>
                </div>
                <div class="bot-nav">
                    <div class="nav-left">
                        <span>小计</span>
                    </div>
                    <div class="jiesuan">¥{{total}}</div>
                </div>
            </div>
        </div>
        <div class="fapiao">
            <div class="order-head">
                <span class="spanfapiao">发票</span>
            </div>
            <div class="bot-nav">
                <div class="nav-left">
                    <span>索要发票</span>
                    <span class="notall">部分商品不支持开具发票</span>
                </div>
                <div class="nav-ok">
                    
                </div>
            </div>
        </div>
        <footer>
            <div class="submit">
                <div class="sub-info">
                    <div class="summary">
                        <span class="total">合计</span>
                        <span class="money">¥{{total}}</span>
                    </div>
                </div>
                <div class="sub-btn" @click="submit">
                    提交订单
                </div>
            </div>
        </footer>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                address:null,
                orderlist:JSON.parse(localStorage.logoods),
            }
        },
        methods:{
            goaddresslist:function () {
                location.href='#/address/addresslist'
            },
            submit:function () {
//                this.orderlist.forEach(v=>{
//                    let sid=v.sid;
//                    let goods=this.orderlist.filter(g=>{
//                        return g.sid=sid;
//                    })
//                    let orderlist={
//                        uid:localStorage.user,
//                        sid:sid,
//                        address_id:this.address.id,
//                        goods:goods,
//                    }
//                    console.log(orderlist);
//                })
                let orderlist={
                    uid:localStorage.user,
                    sid:this.goods.sid,
                    address_id:this.address.id,
                    goods:this.orderlist,
                };
                fetch('/api/send_order',{
                    method:'POST',
                    headers:{'Content-Type':'application'},
                    body:JSON.stringify(orderlist)
                })
                    .then(res=>res.json())
                    .then(data=>{
                        if(data.code==2){

                        }
                    })

            },
        },
        mounted:function () {
            fetch('/api/show_address_jiesuan?uid='+localStorage.user)
                .then(res=>res.json())
                .then(data=>this.address=data[0]);
        },
        computed:{
            total:function () {
                let t=0;
                this.orderlist.forEach(v=>{
                    t+=v.num*v.now_price;
                })
                return t;
            }
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
        font-size:.28rem!important;
    }

    .address{
        display: flex;
        height:1.00rem;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        background: #fff;
    }
    .noadd-img{
        width:.6rem;
        height:.64rem;
        background: url("../assets/img/noaddress.png");
        background-size: 100% 100%;
    }
    .noadd-text{
        margin-top:.06rem;
        font-size:.12rem;
    }
    .noadd-text a{
        color: #fe4070;
        text-decoration: none;
    }

    .showaddress{
        background:#fff url("../assets/img/hualine.png") no-repeat bottom;
        background-size: 100% .05rem;
    }
    .show-cont{
        padding: .14rem .12rem;
        display: flex;
        justify-content: space-between;
        align-items:center;
    }
    .add-icon{
        width:.12rem;
        height:.16rem;
        background: url("../assets/img/address.png") no-repeat 50%;
        background-size: 100% 100%;
        display: block;
    }
    .add-cont{
        margin-left:.1rem;
        width:3.15rem;
        font-size:.12rem;
    }
    .add-cont-tit{
        line-height:.16rem;
    }
    .add-cont-cont{
        margin-top: .1rem;
        font-size:.14rem;
    }
    
    .time-select{
        margin-top:.08rem;
        background: #fff;
        padding:.14rem .12rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size:.12rem;
    }
    .select{
        display: block;
        width:3rem;
        height:100%;
    }
    .iconfont{
        font-size:.20rem;
        color: #999;
    }
    .icon-arrow-left{
        font-size:.14rem;
    }

    .order-list{

    }
    .fahuo{
        font-size:.12rem;
        margin-left:.07rem;
        color: #999;
    }
    .order-head{
        margin-top:.08rem;
        background: #fff;
        padding:.10rem .12rem;
        display: flex;
        align-items:center;
        vertical-align: middle;
        border-bottom: 1px solid #eee;
    }

    .order-content{
        background: #fff;
    }
    .item-content{
        flex: 1;
        margin:0 .12rem;
        background: #fff;
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
        margin-top:.1rem;
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
    .price{
        margin-top:.1rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
        height:.22rem;
    }
    .price span.one{
        color: #fe4070;
        font-size:.16rem;
    }
    .order-bottom{
        background: #fff;
    }
    .bot-nav{
        height:.45rem;
        padding:0 .12rem;
        border-top: 1px solid #eee;
        display: flex;
        align-items: center;
        justify-content: space-between;
        font-size:.12rem;
        color: #333;
    }
    .yun-info{
        text-align: right;
    }
    .yun-info1{
        line-height: .15rem;
    }
    .yun-info2{
        line-height:.12rem;
        margin-top: .04rem;
        color: #999;
    }
    .nav-left{
        display: flex;
        align-items: center;
        font-size:.12rem;
        color: #333;
    }
    .juan{
        padding:.02rem .07rem;
        border: 1px solid #fe4070;
        color: #fe4070;
        font-size:.12rem;
        margin-left:.1rem;
        border-radius: .08rem;
    }
    .jiesuan{
        color: #fe4070;
        font-size:.15rem;
    }
    .fapiao{
        background: #fff;
    }
    .spanfapiao{
        color: #999;
        font-size:.12rem;
    }
    .notall{
        color: #999;
        margin-left:.1rem;
    }
    .nav-ok{
        width:.2rem;
        height:.2rem;
        background: url("../assets/img/colorduihao.png");
        background-size: 100% 100%;
    }

    .submit{
        position: fixed;
        display: flex;
        left:0;
        bottom: 0rem;
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
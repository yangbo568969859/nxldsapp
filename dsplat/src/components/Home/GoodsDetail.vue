<template>
    <div >
        <div class="good_detail">
            <header>
                <div class="header">
                    <a href="#/home" class="head-left"><span class="iconfont icon-iconfontjiantouzuo"></span></a>
                    <div class="head-tit">{{goods.name}}</div>
                    <a href="#/" class="head-right"><span class="iconfont icon-v1"></span></a>
                </div>
            </header>
            <div class="goods_content" v-for="g in goods">
                <div class="goods-pic">
                    <img src="../../assets/img/3874872_1000_1000.jpg" alt="">
                </div>
                <div class="goods-list">
                    <div class="list-tit">
                        <span class="tit-one">￥{{g.original_price}}</span>
                        <span class="tit-two">￥{{g.now_price}}</span>
                        <span class="tit-three">套餐价格详情</span>
                    </div>
                    <div class="list-middle">该商品最多可享12期分期购买福利</div>
                    <div class="list-bottom">
                        <span>还剩19:45:54</span>
                        <strong>121人已买</strong>
                    </div>
                </div>
                <div class="goods-info">
                    <span>[ 聚美自营 ]</span>
                    {{g.detail_info}}
                </div>
                <div class="yunfei">
                    <a href="" class="yun-money">
                        <div class="postage-tit">运费</div>
                        <div class="postage-con">
                            <span>本商品满299或2件包邮</span>
                            <span class="iconfont icon-arrow-left"></span>
                        </div>
                    </a>
                    <div class="introduce" v-if="active==1">
                        <div class="int">
                            <div class="postage-tit">说明</div>
                            <div class="postage-con">
                                <span>可详细阅读以下商品的说明</span>
                                <span class="iconfont icon-arrow-left" @click="xiala(2)"></span>
                            </div>
                        </div>
                        <div class="content">
                            <a href="">
                                <p class="int-con-tit">
                                    <span class="int-con-icon"></span>
                                    <span class="int-con-text">自营保税仓发货</span>
                                    <span class="int-con-content">本商品由聚美自营保税仓发货</span>
                                </p>
                            </a>
                            <a href="">
                                <p class="int-con-tit">
                                    <span class="int-con-icon"></span>
                                    <span class="int-con-text">12小时内发货</span>
                                    <span class="int-con-content">12小时内发货，最快24小时到货</span>
                                </p>
                            </a>
                            <a href="">
                                <p class="int-con-tit">
                                    <span class="int-con-icon"></span>
                                    <span class="int-con-text">7天拆封无条件退货</span>
                                    <span class="int-con-content">本商品支持7天内拆封无条件退货</span>
                                </p>
                            </a>
                        </div>
                    </div>
                    <div class="introduce" v-if="active==2">
                        <div class="int">
                            <div class="postage-tit">说明</div>
                            <div class="postage-con postage-con1">
                                <p class="int-con-tit1">
                                    <span class="int-con-icon"></span>
                                    <span class="int-con-text">自营保税仓发货</span>
                                </p>
                                <p class="int-con-tit1">
                                    <span class="int-con-icon"></span>
                                    <span class="int-con-text">12小时内发货</span>
                                </p>
                                <p class="int-con-tit1">
                                    <span class="int-con-icon"></span>
                                    <span class="int-con-text">7天拆封无条件退货</span>
                                </p>
                                <span class="iconfont icon-arrow-left" @click="xiala(1)"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="javascript:;" @click="enterstore" class="shop">
                <!--<router-link :to="{name:'store',query:goods.sid}" class="shop">-->
                    <div class="shop">
                        <div class="shop-top-left">
                            <img src="../../assets/img/57ac228b0e52a_320_320.jpg" alt="">
                        </div>
                        <div class="shop-top-right">
                            <div class="shop-info">
                                <div class="pword">{{store.name}}</div>
                                <span>自营</span>
                            </div>
                            <div class="shop-label">
                                {{store.info}}
                            </div>
                        </div>
                    </div>
                    <div class="shop-botton">
                        <div class="button">
                            进入店铺
                            <span class="iconfont icon-arrow-left"></span>
                        </div>
                    </div>
                <!--</router-link>-->
                </a>
            </div>
        </div>
        <div class="footer" v-for="n in goods">
            <div class="foot-icon">
                <a href="" class="foot-shop">
                    <span class="iconfont icon-dianpu"></span>
                    <span class="word">店铺</span>
                </a>
                <a href="#/shopcar" class="foot-car">
                    <span class="iconfont icon-gouwudai1"></span>
                    <span class="word">购物车</span>
                    <span class="number">{{n.num}}</span>
                </a>
            </div>
            <div class="foot-button">
                <a href="javascript:;" @click="add(n)" class="joincar">加入购物车</a>
                <a href="javascript:;" class="intmai" @click="gooder">立即购买</a>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return {
                goods:'',
                logoods:localStorage.logoods?JSON.parse(localStorage.logoods):[],
                active:1,
                tabs:1,
                store:{},
            }
        },
        methods:{
            enterstore:function () {
                location.href='#/store?sid='+this.$route.query.sid;
            },
            xiala:function (v) {
                return this.active=v;
            },
            add:function (t) {
                t.num+=1;
                var flag = true;
                this.logoods.forEach(v=>{
                    if(t.id==v.id){
                        flag = false;
                        v.num=t.num;
                    }
                })
                if(flag){
                    this.logoods.push(t);
                }
            },
            gooder:function () {
                localStorage.logoods=JSON.stringify(this.logoods);
                if(localStorage.user){
                    location.href='#/shopcar'
                }else {
                    location.href='#/login'
                }
            }
        },
        mounted(){
            fetch('/api/get_goods_byid?id='+this.$route.query.id)
                .then(res=>res.json())
//                .then(data=>this.goods=data[0]);
                .then(data=>{
                    this.goods=data.map(v=>{
                        v.num=0;
                        return v;
                    })
                })
            fetch('/api/get_store_by_goodsid?id='+this.$route.query.sid)
                .then(res=>res.json())
                .then(data=>this.store=data[0])
        }
    }
</script>

<style scoped>
    .good_detail{
        margin-bottom: .5rem;
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
        top: .1rem;
        width: .15rem;
        height: .075rem;
        background-size: contain;
    }
    .index-search{
        color: #999;
        background: #f5f5f5;
        width:78%;
        height:0.32rem;
        display: block;
        border-radius: .32rem;
        text-align: center;
        line-height:.32rem;
        margin:.1rem .55rem .1rem .22rem
    }
    .icon-v1{
        font-size:.24rem;
        color: #999;
    }
    .goods_content{

    }
    .goods-pic{
        width:100%;
        background: #fff;
    }
    .goods-pic img{
        width:100%;
    }
    .goods-list{
        padding:.1rem .12rem;
        background: #fff;
    }
    .list-tit{
        overflow: hidden;
        width: 100%;
        height: .28rem;
    }
    .tit-one{
        float: left;
        color: #f33873;
        font-size: 28px;
        line-height: .28rem;
    }
    .tit-two{
        float: left;
        font-size:13px;
        line-height:.28rem;
        color: #666;
        text-decoration: line-through;
        margin-left: .1rem;
        margin-top: .04rem;
    }
    .tit-three{
        float: left;
        font-size:13px;
        line-height:.28rem;
        color: #333;
        margin-left: .1rem;
        margin-top: .04rem;
    }
    .list-middle{
        font-size: 13px;
        color: #f33873;
        margin-top:.12rem;
    }
    .list-bottom{
        margin-top:.12rem;
        height:.14rem;
        color: #333;
        font-size:13px;
    }
    .list-bottom span{
        float: left;
        width: 50%;
        text-align: left;
    }
    .list-bottom strong{
        float: right;
        width: 50%;
        text-align: right;
        font-weight: 400;
    }
    .goods-info{
        padding:.1rem .12rem;
        line-height:.18rem;
        font-size:14px;
        color: #666;
        border-top: 1px solid #f5f5f5;
        background: #fff;
    }
    .goods-info span{
        color: #f33873;
        margin-right: 4px;
        line-height: .16rem;
    }
    .yunfei{
        padding:0rem .12rem;
        border-top: 1px solid #f5f5f5;
        background: #fff;
    }
    .yunfei a{
        display: block;
        overflow: hidden;
        color:#999;
    }
    .yun-money{
        margin:0 .12rem;
        border-bottom: 1px solid #eee;
    }
    .introduce{
        margin:0 .12rem;
    }
    .int{
        overflow: hidden;
    }
    .postage-tit{
        float: left;
        padding:0.12rem 0;
        width:17%;
        color: #666;
    }
    .postage-con{
        float: left;
        text-align: left;
        padding:0.12rem 0;
        width:83%;
        position: relative;
    }
    .postage-con1{
        padding:0 0 .1rem 0;
    }
    .icon-arrow-left{
        color: #999;
        float: right;
    }
    .introduce{
        overflow: hidden;
    }
    .int-con-tit{
        border-bottom: 1px solid #eee;
        padding-top:.12rem;
        padding-left:17%;
    }
    .int-con-icon{
        width: 12px;
        height: 12px;
        background: url('../../assets/img/ok.png') no-repeat;
        background-size: contain;
        display: inline-block;
        vertical-align: top;
        position: relative;
        top: 2px;
    }
    .int-con-text{
        color: #333;
        font-size: 13px;
        line-height: 13px;
    }
    .int-con-content{
        padding: .1rem 0;
        padding-left:.16rem;
        line-height: 16px;
        font-size: 12px;
        color: #999;
        display: block;
    }
    .int-con-tit1{
        padding-top:.12rem;
        padding-right:.1rem;
        display: inline-block;
    }
    .shop{
        width:100%;
        padding: .12rem .11rem;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        background: #fff;
        margin: .1rem auto;
        display: block;
        overflow: hidden;
    }
    .shop-top{
        overflow: hidden;
    }
    .shop-top-left{
        float: left;
        width: .42rem;
        height: .42rem;
        border: 1px solid #eee;
    }
    .shop-top-left img{
        width:100%;
        height:100%;
    }
    .shop-top-right{
        float: left;
        margin-left: .1rem;
        padding-top: .04rem;
    }
    .shop-info{
        line-height: .16rem;
        font-size: .14rem;
        color: #333;
        overflow: hidden;
    }
    .shop-info .pword{
        /*width:1rem;*/
        text-overflow: ellipsis;
        float: left;
    }
    .shop-info span{
        font-size: .10rem;
        float: left;
        padding: .01rem .04rem;
        background: #fe4070;
        color: #fff;
        border-radius: .04rem;
        margin-left: .04rem;
        line-height: .14rem;
        box-sizing: border-box;
    }
    .shop-label{
        font-size: .11rem;
        color: #999;
        margin-top: .06rem;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        width: 2rem;
    }
    .shop-botton{
        color: #666;
        position: relative;
        margin: 0 auto;
    }
    .button{
        text-align: center;
        width:1.48rem;
        height:.38rem;
        line-height:.38rem;
        border-radius: .24rem;
        margin-top:.12rem;
        border: 1px solid #ddd;
        margin:0 auto;
    }
    .button>.icon-arrow-left{
        position: absolute;
    }

    .footer{
        position: fixed;
        width:100%;
        height:.5rem;
        border-top: 1px solid #eee;
        bottom:-0.01rem;
        background: #fff;
    }
    .foot-icon{
        width:30%;
        height:100%;
        text-align: center;
        float: left;
    }
    .iconfont{
        font-size:.22rem;
    }
    .word{
        display:block;
        color: #979797;
        font-size:.12rem;
    }
    .foot-shop{
        width:50%;
        display:block;
        border-right: 1px solid #eee;
        float: left;
        padding:.05rem;
    }
    .foot-car{
        width:50%;
        display:block;
        border-right: 1px solid #eee;
        float: left;
        padding:.05rem;
        position: relative;
    }
    .number{
        background: #fe4070;
        display: block;
        position: absolute;
        font-size: .12rem;
        line-height: .12rem;
        padding: .02rem .04rem;
        left: .28rem;
        top: .04rem;
        border-radius: .2rem;
        color: #fff;
    }
    .foot-button{
        width:70%;
        height:100%;
        text-align: center;
        float: left;
    }
    .joincar{
        width:50%;
        display: block;
        background: linear-gradient(210deg,#ffcfdf,#fff1f6 98%);
        color: #fe4070;
        line-height:.5rem;
        float: left;
    }
    .intmai{
        width:50%;
        display: block;
        background: linear-gradient(142deg,#ff5593,#fe4070);
        color: #fff;
        line-height:.5rem;
        float: left;
    }

</style>
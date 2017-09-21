<template>
    <div>
        <div class="header">

        </div>
        <div class="content">
            <ul class="cont-list">
                <li v-for="v in allgoods" :key="v.id">
                    <router-link :to="{name:'goodsdetail',query:{id:v.id,sid:$route.query.sid}}" class="zc-link">
                        <div class="li-cont">
                            <div class="produce-img">
                                <img src="../../assets/img/3217997_350_350.jpg" alt="">
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
                                    <span class="nowprice">¥{{v.original_price}}</span>
                                    <span class="oriprice">¥{{v.now_price}}</span>
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
        data(){
            return{
                allgoods:{},
            }
        },
        methods:{
            show:function () {
                fetch('/api/get_goods_byid?id=')
                    .then(res=>res.json())
                    .then(data=>{

                    })
            }
        },
        mounted(){
            fetch('/api/get_goods_bysid?sid='+this.$route.query.sid)
                .then(res=>res.json())
                .then(data=>this.allgoods=data)
        }
    }
</script>

<style scoped>
    .header{
        width:100%;
        background: #fff;
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
        margin: 0 .09rem .04rem .09rem;
        padding-top: .09rem;
        height:1.66rem;
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
        margin-bottom: .2rem;
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
<template>
    <div>
        <div class="shop-logo">
            <div class="shop-logn-contain">
                <div class="contain-left">
                    <div class="logo">
                        <img src="../assets/img/57ac228b0e52a_320_320.jpg" alt="">
                    </div>
                    <div class="shop-name">
                        <h3>{{store.name}}</h3>
                    </div>
                </div>
                <div class="contain-right">收藏</div>
                <div class="contain-bottom">
                    <span>1.4万</span>人已收藏
                </div>
            </div>
        </div>
        <div class="title">
            <a @click="tabs(1)">
                <div>首页</div>
                <div :class="{active:active==1}"></div>
            </a>
            <a @click="tabs(2)">
                <div>全部商品</div>
                <div :class="{active:active==2}"></div>
            </a>
            <a @click="tabs(3)">
                <div>上新</div>
                <div :class="{active:active==3}"></div>
            </a>
            <a @click="tabs(4)">
                <div>店铺活动</div>
                <div :class="{active:active==4}"></div>
            </a>
        </div>
        <firstpage v-if="active==1"></firstpage>
        <allgoods v-if="active==2"></allgoods>
    </div>
</template>

<script>
    import AllGoods from '../components/Store/allgoods.vue'
    import FirstPage from '../components/Store/firstpage.vue'
    export default {
        data(){
            return {
                active:1,
                store:{},
            }
        },
        methods:{
            tabs:function (i) {
                this.active=i;
            },
        },
        mounted(){
            fetch('/api/get_store?id='+this.$route.query.sid)
                .then(res=>res.json())
                .then(data=>this.store=data[0]);
        },
        components:{
            'firstpage':FirstPage,
            'allgoods':AllGoods,
        }
    }
</script>

<style scoped>
    .shop-logo{
        background: url('../assets/img/57ac228575beb_1024_304.jpg') left top / 100% no-repeat;
        transform-origin: 0px 0px 0px;
        opacity: 1;
        width:100%;
        height:1.11rem;
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
    .active{
        background: #fe4070;
        width: 60%;
        height:2px;
        margin: 0 auto;
    }
</style>
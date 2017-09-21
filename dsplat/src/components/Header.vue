<template>
    <div>
        <header>
            <div class="header">
                <a href="#/home" class="head-left"><span class="iconfont icon-iconfontjiantouzuo"></span></a>
                <div class="head-tit">免税店</div>
                <!--<div class="head-tit" v-if="$route.query.name=='motherbaby'">母婴</div>-->
                <!--<div class="head-tit" v-if="$route.query.name=='luxury'">轻奢</div>-->
                <!--<div class="head-tit" v-if="$route.query.name=='mingpin'">名品特卖</div>-->
                <a href="" class="head-right"><span class="iconfont icon-home"></span></a>
            </div>
        </header>
        <div id="search">
            <div>
                <a href="" class="index-search"><span>搜索商品 分类 功效</span></a>
                <span class="span-search"><img src="../assets/img/search_list2.png" alt=""></span>
            </div>
        </div>
        <div class="head-nav">
            <div class="head-list">
                <!--v-if="$route.name=='homepage'"-->
                <p :class="{'head-p':id==1}">
                    <router-link :to="{name:'homepage'}"><span>首页</span><span class="header-nav-line"></span></router-link>
                </p>
                <p :class="{'head-p':id==2}">
                    <router-link :to="{name:'jisu'}"><span>化妆品</span><span class="header-nav-line"></span></router-link>
                </p>
                <p :class="{'head-p':id==3}">
                    <router-link :to="{name:'motherbaby'}"><span>母婴产品</span><span class="header-nav-line"></span></router-link>
                </p>
                <p :class="{'head-p':id==4}">
                    <router-link :to="{name:'luxury'}"><span>女装分类</span><span class="header-nav-line"></span></router-link>
                </p>
                <p :class="{'head-p':id==5}">
                    <router-link :to="{name:'mingpin'}"><span>名品特卖</span><span class="header-nav-line"></span></router-link>
                </p>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props:['id'],
        data(){
            return{
//                active:1
            }
        },
        methods:{

        }
    }
</script>

<style scoped>
    #search{
        margin: 0;
        padding: 0;
        overflow: hidden;
        font-size: 14px;
        background: #fff;
    }
    #search>div{
        position: relative;
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
    .icon-home{
        font-size:.28rem;
    }
    .span-search{
        width: .24rem;
        height: .18rem;
        position: absolute;
        right:.2rem;
        bottom: .08rem;
        z-index: 12;
    }
    .span-search img{
        width:100%;
    }
    .head-nav{
        height:.44rem;
        width:100%;
        background: #fff;
        border-bottom: 1px solid #eee;
        overflow-x: auto;
    }
    .head-list{
        width:4.5rem;
        height:100%;
    }
    .head-list p{
        float: left;
        height:100%;
        position: relative;
        width: auto;
        padding: 0 .1rem;
        text-align: center;
    }
    .head-list p a{
        padding: 0 .08rem;
        height: .44rem;
        line-height: .44rem;
        display: block;
        width: auto;
        font-size:.14rem;
        color: #666;
        text-decoration: none;
        position: relative;
        -webkit-tap-highlight-color: transparent;
    }
    .head-nav::-webkit-scrollbar {
        display: none;
    }
    .head-p span{
        color: #fe4070;
    }
    .head-p .header-nav-line{
        background: #fe4070;
        height: .03rem;
        border-radius: .02rem .02rem 0 0;
        display: block;
        position: absolute;
        bottom: 0;
        width: 100%;
        left: -.0325rem;
    }
</style>
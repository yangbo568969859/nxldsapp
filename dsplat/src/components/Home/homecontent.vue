<template>
    <div>
        <section>
            <div class="homepage-tit">
                <span :class="{tit:true,lab:active==1}" @click="tabs(1)">今日10点上新</span>
                <span :class="{tit:true,lab:active==2}" @click="tabs(2)">明日10点预告</span>
            </div>
        </section>
        <div class="today" v-if="active==1">
            <section class="store-list">
                <div class="store">
                    <section class="good-list" v-for="v in today_goods" :key="v.id">
                        <router-link class="alist" :to="{name:'goodsdetail',query:{id:v.id,sid:v.sid}}">
                            <div class="alist-cont">
                                <div class="cont-img">
                                    <img src="../../assets/img/3874872_dx_1154_400.jpg" alt="">
                                </div>
                                <div class="cont-cont">
                                    <div class="cont-tit">
                                        {{v.info}}
                                    </div>
                                    <div class="cont-bottom">
                                    <span class="original-money">
                                        ¥
                                        <span>{{v.original_price}}</span>
                                    </span>
                                        <span class="now-money">¥{{v.now_price}}</span>
                                    </div>
                                </div>
                            </div>
                        </router-link>
                    </section>
                </div>
            </section>
        </div>
        <div class="tomorrow" v-if="active==2">
            <section class="store-list">
                <div class="store">
                    <section class="goods-list" v-for="s in tomorrow_goods" :key="s.id">
                        <router-link class="alist" :to="{name:'storeone',query:{sid:s.id}}">
                            <div class="alist-cont">
                                <div class="cont-img">
                                    <img :src="s.pic" alt="">
                                </div>
                            </div>
                        </router-link>
                    </section>
                </div>
            </section>
        </div>
    </div>
</template>
<script>
    export default {
        data(){
            return{
                active:1,
                today_goods:{},
                tomorrow_goods:{},
            }
        },
        methods:{
            tabs:function (v) {
                this.active=v
            }
        },
        mounted(){
            fetch('/api/get_goods_by_cid?cid=1')
                .then(res=>res.json())
                .then(data=>this.today_goods=data);
            //获取明天上新产品店列表
            fetch('/api/get_store_by_fenlei_id?fenlei_id=1')
                .then(res=>res.json())
                .then(data=>this.tomorrow_goods=data)
        },
    }
</script>
<style scoped>
    .homepage-tit{
        color: #666;
        height:.44rem;
        background: #fff;
        display: flex;
        justify-content: space-between;
        align-items:center;
    }
    .tit{
        width:50%;
        height:100%;
        display: inline-block;
        text-align: center;
        line-height: .44rem;
    }
    .lab{
        color: #fe4070;
    }
    .alist{
        margin-bottom: 8px;
        display: block;
        color: #333;
    }
    .store{
        margin-bottom: .48rem;
    }
    .alist-cont{
        height:1.3rem;
        position: relative;
        overflow: hidden;
        background: #fff;
    }
    .cont-img{
        position: relative;
        width:100%;
        height:100%;
    }
    .cont-img img{
        height:100%;
    }
    .cont-cont{
        position: absolute;
        top:0;
        left:0;
        margin-right: .14rem;
        margin-left:1.6rem;
        height: 100%;
    }
    .cont-tit{
        margin-top:.14rem;
        margin-bottom: .05rem;
        font-size:.13rem;
        line-height:.17rem;
        color: #333;
        overflow: hidden;
        max-height:.51rem;
    }
    .cont-bottom{
        position: absolute;
        bottom:.2rem;
    }
    .original-money{
        color: #fe4070;
        font-size: .12rem;
    }
    .original-money span{
        font-size: .20rem;
        margin: 0 2px;
    }
    .now-money{
        color: #999;
        font-size: .12rem;
        text-decoration: line-through;
    }
    .tomorrow{
        margin-bottom:.45rem;
    }
</style>
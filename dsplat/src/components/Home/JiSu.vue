<template>
    <div>
        <app-header :id="id"></app-header>
        <div class="today" >
            <section class="store-list">
                <div class="store">
                    <section class="good-list" v-for="v in today_goods" :key="v.id">
                        <router-link class="alist" :to="{name:'goodsdetail',query:{id:v.id,sid:v.sid}}">
                            <div class="alist-cont">
                                <div class="cont-img">
                                    <img :src="v.pic" alt="">
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
        <app-footer :footid="footid"></app-footer>
    </div>
</template>

<script>
    import Header from '../Header.vue'
    import Footer from '../Footer.vue'
    export default {
        name: 'homepage',
        data () {
            return {
                id:2,
                footid:1,
                today_goods:{},
            }
        },
        mounted:function () {
            fetch('/api/get_goods_by_cid?cid=2')
                .then(res=>res.json())
                .then(data=>this.today_goods=data);

        },
        components:{
            'app-header':Header,
            'app-footer':Footer,
        }
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
    .store{
        margin-bottom: .45rem;
    }
    .alist{
        display: block;
        background: #fff;
    }
    .alist-cont{
        position: relative;
        overflow: hidden;
        background: #fff;
        padding:.12rem 0;
        margin:0 .12rem;
        border-bottom: 1px solid #eee;
    }
    .cont-img{
        position: relative;
        width:1rem;
        height:1rem;
    }
    .cont-img img{
        height:100%;
    }
    .cont-cont{
        position: absolute;
        top:0;
        left:0;
        margin-right: .10rem;
        margin-left:1.2rem;
        height: 1rem;
    }
    .cont-tit{
        margin-top:.14rem;
        margin-bottom:.1rem;
        font-size:.14rem;
        line-height:.2rem;
        color: #333;
        display: -webkit-box;
        word-break: break-all;
        word-wrap: break-word;
        overflow: hidden;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }
    .cont-bottom{
        margin-top:.2rem;
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
</style>
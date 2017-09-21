<template>
    <div>
        <app-header :id="id"></app-header>
        <div class="girlcloth">
            <section class="list" v-for="v in girlcloths" :key="v.id">
                <router-link :to="{name:'storeone',query:{sid:v.id}}">
                    <div class="main">
                        <div class="main-image">
                            <img :src="v.pic" alt="">
                            <div class="discount">
                                <p>特价+促销+包邮</p>
                            </div>
                        </div>
                        <div class="main-information">
                            <div class="info-right">
                                <img :src="v.logo_pic" alt="">
                            </div>
                            <div class="info-left">
                                <p class="left-title">{{v.info}}</p>
                                <p class="left-bottom">
                                    剩余
                                    <span>02天</span>
                                    <span>12时</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </router-link>
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
                id:4,
                footid:1,
                girlcloths:{},
            }
        },
        mounted(){
            fetch('/api/get_store_by_fenlei_id?fenlei_id=4')
                .then(res=>res.json())
                .then(data=>this.girlcloths=data);
        },
        components:{
            'app-header':Header,
            'app-footer':Footer,
        }
    }
</script>

<style scoped>
    .girlcloth{
        width:100%;
    }
    .main{
        overflow: hidden;
        background: #fff;
    }
    .main-image{
        height:1.84rem;
        overflow: hidden;
        position: relative;
    }
    .main-image img{
        width:100%;
    }
    .discount{
        position: absolute;
        left:0;
        bottom:.2rem;
        background: #000;
        height:.18rem;
        line-height: .18rem;
    }
    .discount p{
        color: #fff;
        font-size:.11rem;
        padding:0 .03rem;
    }
    .main-information{
        
    }
    .info-right{
        float: right;
        width:.90rem;
        height:.47rem;
        padding-right:.18rem;
        padding-top:.12rem;
    }
    .info-right img{
        width:100%;
    }
    .info-left{
        float: left;
        padding:.15rem;
    }
    .left-title{
        color: #333;
    }
    .left-bottom{
        color: #999;
    }
</style>
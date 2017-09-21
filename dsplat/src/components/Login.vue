<template>
    <div>
        <header>
            <div class="header">
                <a href="" class="head-left"><span class="iconfont icon-iconfontjiantouzuo"></span></a>
                <div class="head-tit" v-if="$route.name=='loginin'">登录</div>
                <div class="head-tit" v-if="$route.name=='register'">注册</div>
                <router-link :to="{name:'loginin'}" class="head-right" v-if="$route.name=='register'">登录</router-link>
                <router-link :to="{name:'register'}" class="head-right"  v-if="$route.name=='loginin'">注册</router-link>
            </div>
        </header>
        <router-view></router-view>
    </div>
</template>

<script>
    export default {
        data() {
            return {

            }
        },
        methods: {

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
        line-height: 45px;
        right: 10px;
        top: 0px;
        color: #333;
        font-size: 15px;
    }

</style>
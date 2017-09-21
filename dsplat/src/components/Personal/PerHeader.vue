<template>
    <div>
        <header>
            <div class="header">
                <a href="" class="head-left"><span class="iconfont icon-iconfontjiantouzuo"></span></a>
                <div class="head-tit">个人中心</div>
                <a href="" class="head-right"><span class="iconfont icon-home"></span></a>
            </div>
        </header>
    </div>
</template>

<script>
    export default {
        data(){
            return {

            }
        },
        methods:{

        }
    }
</script>

<style scoped>
    header{
        position: relative;
        z-index:100;
    }
    span{
        color: #333;
    }
    .header{
        display: flex;
        height:.45rem;
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
        color: #fff;
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
        font-size:.28rem;
        color: #fff;
    }
    .icon-iconfontjiantouzuo{
        font-weight: bold;
        color: #fff;
    }
</style>
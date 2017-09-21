<template>
    <div>
        <footer>
            <ul>
                <li :class="{'showcol':footid==1}">
                    <a href="#/home">
                        <span class="icon iconfont icon-v1"></span>
                        <span>首页</span>
                    </a>
                </li>
                <li :class="{'showcol':footid==2}">
                    <a href="#/shopcar">
                        <span class="icon iconfont icon-gouwudai"></span>
                        <span>购物车</span>
                    </a>
                </li>
                <li :class="{'showcol':footid==3}">
                    <a href="#/personal">
                        <span class="icon iconfont icon-gerenzhongxin"></span>
                        <span>个人中心</span>
                    </a>
                </li>
            </ul>
        </footer>
    </div>
</template>

<script>
    export default {
        props:['footid'],
        data(){
            return{

            }
        }
    }
</script>

<style>
    footer{
        border-top: 1px solid rgb(238, 238, 238);
        position: fixed;
        left:0;
        bottom:0;
        width:100%;
        height:0.45rem;
        background: #fff;
    }
    footer ul{
        height:100%;
    }
    footer ul li{
        width:33.3%;
        height:100%;
        float: left;
        text-align: center;
    }
    footer ul li a{
        display: block;
        color: #666;
        height:100%;
        font-size: .12rem;
    }
    .showcol span{
        color:rgb(254, 64, 112);
    }
    .icon{
        display: block;
        margin-top:.02rem;
        font-size:.2rem;
    }

</style>
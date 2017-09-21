<template>
    <div>
        <header>
            <div class="header">
                <a href="#/jiesuan" class="head-left"><span class="iconfont icon-iconfontjiantouzuo"></span></a>
                <div class="head-tit">地址列表</div>
                <a href="" class="head-right"><span class="iconfont icon-home"></span></a>
            </div>
        </header>
        <div class="address">
            <div class="list-item" v-for="v in address" :key="v.id">
                <div class="left">
                    <span class="okimg" v-if="v.is_default==1"></span>
                    <span class="okimg2" v-else></span>
                </div>
                <div class="info" @click="setdefault(v.id)">
                    <div class="name-phone">
                        <div class="name">{{v.name}}</div>
                        <div class="phone">{{v.phone}}</div>
                    </div>
                    <div class="add">
                        {{v.address}}
                    </div>
                </div>
                <div class="right" @click="edit">
                    <span></span>
                </div>
            </div>
        </div>
        <div class="tips">
            最多保存10个地址
        </div>
        <div class="btns" @click="addaddress">
            <button>新增地址</button>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                address:{},
            }
        },
        methods: {
            addaddress:function () {
                location.href='#/address'
            },
            edit:function () {
                location.href='#/address/addressedit'
            },
            setdefault:function (id) {
                fetch('/api/set_default?uid='+localStorage.user+'&id='+id)
                    .then(res=>res.json())
                    .then(data=>{
                        if(data.code==2){
                            location.href='#/jiesuan'
                        }
                    })
            }
        },
        mounted:function () {
            fetch('/api/get_address?uid='+localStorage.user)
                .then(res=>res.json())
                .then(data=>this.address=data.data);
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
        right: .2rem;
        top: .08rem;
        width: .15rem;
        height: .075rem;
        background-size: contain;
    }
    .icon-home{
        font-size:.28rem;
    }
    .address{
        margin-bottom:.12rem;
        background: #fff;
    }
    .list-item{
        padding:.12rem;
        border-bottom: 1px solid #eee;
        display: flex;
    }
    .left{
        width:.32rem;
        display: flex;
        align-items: center;
    }
    .left span.okimg{
        width:.2rem;
        height:.2rem;
        background: url("../../assets/img/colorduihao.png");
        background-size: 100% 100%;
        display: block;
    }
    .left span.okimg2{
        width:.2rem;
        height:.2rem;
        background: url("../../assets/img/circle.png");
        background-size: 100% 100%;
        display: block;
    }
    .info{
        flex: 1;
    }
    .name-phone{
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size:.14rem;
        color: #333;
    }
    .name{
        width:1.2rem;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
    }
    .phone{
        flex: 1;
    }
    .add{
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: #777;
        font-size:.12rem;
    }
    .right{
        display: flex;
        justify-content: flex-end;
        width:.32rem;
        align-items: center;
    }
    .right span{
        background:url("../../assets/img/bianji.png");
        width:.2rem;
        height:.2rem;
        background-size: 100% 100% ;
        display: block;
    }
    .tips{
        color: #999;
        padding:0 .14rem .3rem .14rem;
        font-size:.12rem;
    }

    .btns{
        position: fixed;
        bottom: 0;
        margin-top:.4rem;
        padding-bottom:.4rem;
        text-align: center;
        display: flex;
        justify-content: center;
        width:100%;
    }
    .btns button{
        width:2rem;
        height:.35rem;
        margin: 0 auto ;
        background: #fe4070;
        color: #fff;
        border-radius: .35rem;
    }
</style>
<template>
    <div>
        <header>
            <div class="header">
                <a href="" class="head-left"><span class="iconfont icon-iconfontjiantouzuo"></span></a>
                <div class="head-tit">地址编辑</div>
                <a href="" class="head-right"><span class="iconfont icon-home"></span></a>
            </div>
        </header>
        <form>
            <div class="cuser">
                <label>收货人</label>
                <input type="text" v-model="address.name" placeholder="请输入收货人的姓名">
            </div>
            <div class="cuser">
                <label>手机号码</label>
                <input type="text" v-model="address.phone" placeholder="请输入收货人的手机号码">
            </div>
            <div class="cuser">
                <label>详细地址</label>
                <input type="text" v-model="address.address" placeholder="请输入收货人的详细地址">
            </div>
        </form>
        <div class="btns" @click="submit">
            <button>保存地址</button>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return {
                address:{
                    name:'',
                    phone:'',
                    address:'',
                    uid:localStorage.user,
                }
            }
        },
        methods:{
            submit:function () {
                fetch('/api/submit_address?uid='+localStorage.user,{
                    method:'POST',
                    headers:{'Content-Type':'application/json'},
                    body:JSON.stringify(this.address),
                })
                    .then(res=>res.json())
                    .then(data=>{
                        location.href='#/address/addresslist'
                    })
            }
        }
    }
</script>

<style>
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

    form{
        margin-bottom: .05rem;
        padding:0 .12rem;
        background: #fff;
    }
    .cuser{
        display: flex;
        border-bottom: 1px solid #eee;
        align-items: center;
    }
    .cuser label{
        line-height: .44rem;
        flex: 0 0 .89rem;
        color: #999;
    }
    .cuser input {
        height:.22rem;
        padding:.11rem 0;
        flex: 1;
        display: block;
        color: #999;
    }
    .btns{
        margin-top:.4rem;
        padding-bottom:.4rem;
        text-align: center;
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
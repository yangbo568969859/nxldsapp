<template>
    <div id="warper">
        <div class="mobel" v-show="show==1">
            <form>
                <div class="login">
                    <div class="other-login">
                        <span>使用手机登录</span>
                    </div>
                </div>
                <div class="telephone tel">
                    <input type="text" v-model="form1.account" placeholder="请输入11位手机号码" required maxlength="11">
                </div>
                <div class="telephone che">
                    <input type="text" @keyup="checkma" v-model="form1.check" placeholder="请输入验证码" required  maxlength="8">
                    <div class="check">
                        <a href="">验证</a>
                    </div>
                </div>
                <div class="telephone mian">
                    <a href="javascript:;" @click="qiehuan(2)">使用账号登录</a>
                    <div>30天内自动登录</div>
                </div>
                <div class="but">
                    <button @click="submitphone" :class="{hover:active}">登录</button>
                </div>

            </form>
        </div>
        <div class="admin" v-show="show==2">
            <form>
                <div class="login">
                    <div class="other-login">
                        <span>使用帐号登录</span>
                    </div>
                </div>
                <div class="telephone tel">
                    <input type="text" placeholder="请输入11位手机号码" maxlength="11" required>
                </div>
                <div class="telephone pass">
                    <input type="password" placeholder="使用6-16位密码登录">
                </div>
                <div class="telephone mian">
                    <a href="javascript:;" @click="qiehuan(1)">使用手机验证登录</a>
                    <!--<a href="">使用手机验证登录</a>-->
                    <div>忘记密码?</div>
                </div>
                <div class="but">
                    <button >登录</button>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                active:false,
                show:1,
                form1:{
                    account:'',
                    check:'',
                },
            }
        },
        methods: {
            qiehuan:function (i) {
                return this.show=i;
            },
            submitphone:function () {
                fetch('/api/get_c_user_login',{
                    method:'POST',
                    headers:{'Content-Type':'application/json'},
                    body:JSON.stringify(this.form1)
                }).then(res=>res.json())
                    .then(r=>{
                        if(r.code==2){
                            localStorage.user=r.data;
                            location.href='#/personal'
                        }
                    })
            },
            checkma:function () {
                if(this.form1.account.length==11&&this.form1.check.length==6){
                    this.active=true;
                }else {
                    this.active=false;
                }
            },
        }
    }
</script>

<style scoped>
    #warper{
        position: relative;
        top: 0px;
        left: 0px;
        width: 100%;
        z-index: 1;
        background: #fff;
        padding-bottom: 80px;
    }
    form{
        margin:0 12%;
    }
    .login{
        padding:0 10%;
    }
    .other-login{
        position: relative;
        height: .58rem;
        line-height: .58rem;
        text-align: center;
    }
    .other-login span{
        padding:0 5px;
        background: #fff;
        color: #999;
    }
    .other-login span:before{
        content: '';
        font-size: 0px;
        border-bottom: solid 1px #f5f5f5;
        position: absolute;
        top: 29px;
        left: 0px;
        width: 100%;
        z-index: -1;
    }
    .telephone{
        width:100%;
        display: flex;
        justify-content: space-between;
    }
    .telephone input{
        background: #f5f5f5;
        border-radius: .20rem;
        width: 100%;
        height: .36rem;
        font-size: .14rem;
        color: #999999;
        text-align: left;
        text-indent: .21rem;
    }
    .che{
        margin-top:.2rem;
        display: flex;
        justify-content:space-between;
    }
    .che input{
        width:66%;
    }
    .pass input{
        margin-top:.2rem;
        width:100%;
    }
    .check {
        width:30%;
    }
    .check a{
        background: #ffffff;
        border: 1px solid #feb2c5;
        border-radius: 20px;
        width: 97%;
        height: 35px;
        font-size: 14px;
        color: #feb2c5;
        line-height: 35px;
        text-align: center;
        display: block;
    }
    .mian{
        margin-top:.2rem;
        color: #999;
    }
    .mian a{
        padding-left:.05rem;
        color: #fe4070;
    }
    .but button{
        background: #feb2c5!important;
        border-radius: 20px;
        width: 100%;
        height: 36px;
        font-size: 14px;
        color: #ffffff;
        line-height: 14px;
        text-align: center;
        margin: 18px auto 0 auto;
        display: block;
    }
    .copy{
        font-size: 12px;
        color: #999999;
        height: 36px;
        line-height: 36px;
        text-align: center;
    }
    .copy a{
        color: #808080;
    }
    .but .hover{
        background: #fe4070!important;
    }

</style>